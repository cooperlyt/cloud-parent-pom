package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.UserDao;
import cc.coopersoft.authentication.entity.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrustUserService {

    private final UserDao userRepository;

    private final RoleService roleService;

    private final PasswordEncoder passwordEncoder;

    public TrustUserService(UserDao userRepository, RoleService roleService, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional
    public User addUser(String type, String org, User user, boolean manager){
        if (userRepository.existsById(user.getUsername())){
            throw new IllegalArgumentException("use is exists");
        }
        if (!roleService.hasTrustMasterManager(type)){
            throw new IllegalArgumentException("not  manager role for type:" + type);
        }

        user.getAuthorities().addAll(roleService.getTrustRoles(type,org,manager));

        return userRepository.save(user);

    }

    @Transactional
    public User addUser(String type, String org, User user){
       if (userRepository.existsById(user.getUsername())){
           throw new IllegalArgumentException("use is exists");
       }

       if (!roleService.hasTrustManager(type,org)){
           throw new IllegalArgumentException("not trust manager role for:" + org);
       }

       user.getAuthorities().addAll(roleService.getTrustRoles(type,org,false));

       return userRepository.save(user);
    }

    private User editUser(String type, String org, String username){
        if (!roleService.hasTrustMasterManager(type) && !roleService.hasTrustManager(type,org)){
            throw new IllegalArgumentException("not  manager role for type:" + type);
        }
        return userRepository.findById(username).orElseGet(() -> {throw new IllegalArgumentException("user not found !" + username);});
    }

    @Transactional
    public void upTrustManager(String type, String org, String username){

        User user = editUser(type,org,username);
        if (roleService.upTrust(type,org,user.getAuthorities())){
            userRepository.save(user);
        }
    }

    @Transactional
    public void downTrustManager(String type, String org, String username){
        User user = editUser(type,org,username);
        if (roleService.downTrust(type,org,user.getAuthorities())){
            userRepository.save(user);
        }
    }

    @Transactional
    public void del(String type,String org, String username){
        User user = editUser(type,org,username);
        if (roleService.delTrust(type,org,user.getAuthorities())){
            if (user.getAuthorities().isEmpty()){
                userRepository.delete(user);
            }else{
                userRepository.save(user);
            }
        }
    }

    @Transactional
    public void resetPassword(String type, String org, String username){
        User user = editUser(type,org,username);
        user.setPassword(passwordEncoder.encode(user.getPhone()));
    }

}
