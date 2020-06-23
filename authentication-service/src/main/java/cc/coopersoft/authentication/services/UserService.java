package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.UserDao;
import cc.coopersoft.authentication.entity.Role;
import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.exception.PasswordErrorException;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {



    public static class UserRole{
        private boolean has;
        private Role role;

        public UserRole() {
        }

        public UserRole(boolean has, Role role) {
            this.has = has;
            this.role = role;
        }

        public boolean isHas() {
            return has;
        }

        public void setHas(boolean has) {
            this.has = has;
        }

        public Role getRole() {
            return role;
        }

        public void setRole(Role role) {
            this.role = role;
        }
    }

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

    public List<User> searchUser(String key, boolean onlyEnable){
        Specification<User> specification = (Specification<User>)(root, criteriaQuery, cb) -> {

            List<Predicate> predicates = new LinkedList<>();
            Join<User,Role> roleJoin = root.join("authorities", JoinType.LEFT);
            predicates.add(cb.and(cb.equal(roleJoin.get("authority"),RoleService.MASTER_ROLE)));
            if (onlyEnable){
                predicates.add(cb.and(cb.isTrue(root.get("enabled"))));
            }
            if (StringUtils.isNotBlank(key)){
                List<Predicate> keyPredicate = new LinkedList<>();
                String _k = key + "%";
                keyPredicate.add(cb.equal(root.get("username"), key));
                keyPredicate.add(cb.like(root.get("name"), _k));
                keyPredicate.add(cb.like(root.get("email"), _k));
                keyPredicate.add(cb.like(root.get("phone"),_k));
                predicates.add(cb.or(keyPredicate.toArray(new Predicate[0])));
            }
            return cb.and(predicates.toArray(new Predicate[0]));
        };

        return  userRepository.findAll(specification, Sort.by(Sort.Direction.DESC, "joinTime"));
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

    public List<UserRole> userRoles(String username){
        List<Role> hasRoles = listRoles(username);
        List<UserRole> result = hasRoles.stream().map(r -> new UserRole(true,r)).collect(Collectors.toList());
        result.addAll(roleService.roles().stream().filter(r -> !hasRoles.contains(r)).map(r -> new UserRole(false,r)).collect(Collectors.toList()));
        return result;
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



        if (!passwordEncoder.matches(oldPassword,user.get().getPassword())){

            throw new PasswordErrorException();
        }
        user.get().setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user.get());
    }

    public boolean validUser(User user){
       return !(userIsExists(user.getUsername()) || phoneIsExists(user.getPhone()) || emailIsExists(user.getEmail()));
    }

    @Transactional
    public User registerUser(User user){
        if (!validUser(user)){
            throw new IllegalArgumentException("user is exists!");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }


}
