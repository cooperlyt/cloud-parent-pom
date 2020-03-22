package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.RoleDao;
import cc.coopersoft.authentication.dto.UserDao;
import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.entity.UserInfo;
import cc.coopersoft.authentication.exception.PasswordErrorException;
import cc.coopersoft.authentication.exception.UserExistsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDao userRepository;

    @Autowired
    private RoleDao roleRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> _user = userRepository.findByUsername(username);
        if (_user.isPresent()){
            return _user.get();
        }else{
            throw new UsernameNotFoundException("user not found by :" + username);
        }
    }

    public User findUser(String userName){
        Optional<User> _user = userRepository.findByUsername(userName);
        if (_user.isEmpty()){
            throw new IllegalArgumentException();
        }
        return _user.get();
    }

    public void changePassword(String oldPassword, String newPassword){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        Optional<User> user = userRepository.findByUsername(userName);
        if (user.isEmpty()){
            throw new AssertionError();
        }
        if (!user.get().getPassword().equals(passwordEncoder.encode(oldPassword))){
            throw new PasswordErrorException();
        }
        user.get().setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user.get());
    }


    @Transactional
    public void addDeveloperRoot(UserInfo user){
        if (userIsExists(user)){
            throw new UserExistsException("用户已经存在");
        }

        User developerUser = new User(user);
        developerUser.setPassword(passwordEncoder.encode(user.getPassword()));
        developerUser.getAuthorities().add(roleRepository.findById("DEVELOPER").get());
        developerUser.getAuthorities().add(roleRepository.findById("ATTACH_ROOT").get());

        userRepository.save(developerUser);
    }

    public boolean userIsExists(UserInfo user){
        return userRepository.existsByUsernameOrPhone(user.getUsername(),user.getPhone());
    }

}
