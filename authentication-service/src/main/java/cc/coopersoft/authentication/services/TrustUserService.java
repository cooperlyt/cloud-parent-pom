package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.UserDao;
import cc.coopersoft.authentication.entity.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.stream.Collectors;

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


    private boolean hasTypeRole(String type){
        org.springframework.security.core.Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        return authentication.getAuthorities().stream()
                .map(res -> res.getAuthority())
                .map(res -> {if (res.startsWith("ROLE_"))  return res.substring(5);  else return res; })
                .collect(Collectors.toSet()).contains(type);
    }

    @Transactional
    public User addUser(String type, User user){
        if (!hasTypeRole(type)){
            throw new IllegalArgumentException("no role");
        }


        if (userRepository.existsById(user.getUsername())){
            throw new IllegalArgumentException("use is exists");
        }
        user.getAuthorities().add(roleService.getTrustRole());
        user.getAuthorities().add(roleService.getRole(type));
        return userRepository.save(user);

    }

    @Transactional
    public User resetPassword(String type, String username){
        if (!hasTypeRole(type)){
            throw new IllegalArgumentException("no role");
        }
        User user = userRepository.findByUsername(username).orElseThrow();
        user.setPassword(passwordEncoder.encode(user.getPhone()));
        return userRepository.save(user);
    }

    @Transactional
    public User userEnabled(String type, String username, boolean enabled){
        if (!hasTypeRole(type)){
            throw new IllegalArgumentException("no role");
        }
        User user = userRepository.findByUsername(username).orElseThrow();

        user.setEnabled(enabled);
        return userRepository.save(user);
    }

}
