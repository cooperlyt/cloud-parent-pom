package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.UserDao;
import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.exception.PasswordErrorException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService implements UserDetailsService {


    private final PasswordEncoder passwordEncoder;
    private final UserDao userRepository;

    public UserService(PasswordEncoder passwordEncoder, UserDao userRepository) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> _user = userRepository.findByUsername(username);

        if (_user.isPresent()){
            return _user.get();
        }else{
            throw new UsernameNotFoundException("user not found by :" + username);
        }
    }

    public boolean userIsExists(String userName){
        return userRepository.existsById(userName);
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


}
