package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.UserDao;
import cc.coopersoft.authentication.entity.Role;
import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.exception.PasswordErrorException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {



    private final PasswordEncoder passwordEncoder;
    private final UserDao userRepository;
    private final RoleService roleService;

    public UserService(PasswordEncoder passwordEncoder, UserDao userRepository, RoleService roleService) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleService = roleService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username).orElseThrow(() ->  new UsernameNotFoundException("user not found by :" + username));
    }

    public List<User> listUsers(){
        return userRepository.findDistinctByAuthoritiesAuthority(RoleService.MASTER_ROLE);
    }

    public boolean userIsExists(String username){
        return userRepository.existsById(username);
    }

    public boolean phoneIsExists(String phone){
        return userRepository.existsByPhone(phone);
    }

    public boolean emailIsExists(String email){
        return userRepository.existsByEmail(email);
    }

    public List<Role> listRoles(String userName){
        return userRepository.findById(userName).map(u -> u.getAuthorities().stream().filter(r -> !r.isSystem()).collect(Collectors.toList())).orElseThrow(() ->  new IllegalArgumentException("user not found!"));
    }

    @Transactional
    public User addUser(User user){
        user.getAuthorities().add(roleService.getMasterRole());
        user.setPassword(passwordEncoder.encode(user.getPhone()));
        return userRepository.save(user);
    }

    @Transactional
    public void delUser(String username){
        userRepository.delete(findUser(username));
    }

    @Transactional
    public void enableUser(String username, boolean enable){
        User u = findUser(username);
        u.setEnabled(enable);
        userRepository.save(u);
    }

    @Transactional
    public void resetPassword(String username){
        User u = findUser(username);
        u.setPassword(passwordEncoder.encode(u.getPhone()));
        userRepository.save(u);
    }

    @Transactional
    public void addRole(String username, String role){
        User u = findUser(username);
        roleService.getRoleByName(role).ifPresentOrElse((r) -> {
            if (r.isSystem()){
                throw new IllegalArgumentException("system role can't grant!");
            }
            u.getAuthorities().add(r);
            userRepository.save(u);
        }, () -> {throw new IllegalArgumentException("role not found");});
    }

    @Transactional
    public void removeRole(String username, String role){
        User u = findUser(username);
        if (u.getAuthorities().removeAll(u.getAuthorities().stream().filter(r -> !r.isSystem() && r.getAuthority().equals(role)).collect(Collectors.toSet()))){
            userRepository.save(u);
        }
    }

    public User findUser(String username){
        return userRepository.findByUsername(username).orElseThrow(() ->  new UsernameNotFoundException("user not found by :" + username));
    }

    @Transactional
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
