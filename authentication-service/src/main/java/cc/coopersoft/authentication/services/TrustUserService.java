package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.UserDao;
import cc.coopersoft.authentication.entity.Role;
import cc.coopersoft.authentication.entity.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;
import java.util.stream.Collectors;

@Service
public class TrustUserService {

    private static final String TRUST_ROLE_PREFIX = "T_";
    private static final String TRUST_MGR_ROLE_PREFIX = TRUST_ROLE_PREFIX + "M_";

    private final RoleService roleService;
    private final UserDao userRepository;
    private final PasswordEncoder passwordEncoder;


    private User getTrustUser(String username){
        User user = userRepository.findByUsername(username).orElseThrow();
        Set<String> roleNames = user.getAuthorities().stream().map(Role::getAuthority).collect(Collectors.toSet());
        if (roleNames.contains(RoleService.MASTER_ROLE)){
            throw new IllegalArgumentException("is master user");
        }
        if (!roleNames.contains(RoleService.TRUST_ROLE)){
            throw new IllegalArgumentException("not trust");
        }
        return user;
    }

    public TrustUserService(RoleService roleService, UserDao userRepository, PasswordEncoder passwordEncoder) {
        this.roleService = roleService;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional
    public void addOrgRole(String username, String org){
        User user = userRepository.findByUsername(username).orElseThrow();
        user.getAuthorities().add(roleService.getSystemRole(TRUST_ROLE_PREFIX + org));
        user.getAuthorities().add(roleService.getTrustRole());
        userRepository.save(user);
    }

    @Transactional
    public void addOrgMgrRole(String username, String org){
        User user = userRepository.findByUsername(username).orElseThrow();
        user.getAuthorities().add(roleService.getSystemRole(TRUST_ROLE_PREFIX + org));
        user.getAuthorities().add(roleService.getSystemRole(TRUST_MGR_ROLE_PREFIX + org));
        user.getAuthorities().add(roleService.getTrustRole());
        userRepository.save(user);
    }

    @Transactional
    public void removeOrgRole(String username, String org){
        User user = userRepository.findByUsername(username).orElseThrow();
        user.setAuthorities(user.getAuthorities().stream()
                .filter(role -> !role.getAuthority().equals(TRUST_ROLE_PREFIX + org) && !role.getAuthority().equals(TRUST_MGR_ROLE_PREFIX + org))
                .collect(Collectors.toSet()));
        userRepository.save(user);
    }

    @Transactional
    public void removeOrgMgrRole(String username, String org){
        User user = userRepository.findByUsername(username).orElseThrow();
        user.setAuthorities(user.getAuthorities().stream()
                .filter(role -> !role.getAuthority().equals(TRUST_MGR_ROLE_PREFIX + org))
                .collect(Collectors.toSet()));
        userRepository.save(user);
    }

    @Transactional
    public User resetPassword(String username){
        User user = getTrustUser(username);
        user.setPassword(passwordEncoder.encode(user.getPhone()));
        return userRepository.save(user);
    }

    @Transactional
    public User userEnabled(String username, boolean enabled){
        User user = getTrustUser(username);
        user.setEnabled(enabled);
        return userRepository.save(user);
    }



    @Transactional
    public User addRootUser(String org, String name, String phone, String id){
        String username = id;
        while (userRepository.existsByUsername(username)){
            username = "T" + username;
        }

        User user = new User();
        user.setEnabled(true);
        user.setUsername(username);
        user.setName(name);
        user.setPhone(phone);
        user.setPassword(passwordEncoder.encode(id));

        user.getAuthorities().add(roleService.getSystemRole(TRUST_ROLE_PREFIX + org));
        user.getAuthorities().add(roleService.getSystemRole(TRUST_MGR_ROLE_PREFIX + org));
        user.getAuthorities().add(roleService.getTrustRole());

        return userRepository.save(user);

    }

    // check role by trust

    private boolean hasRole(String role){
        org.springframework.security.core.Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .map(res -> {if (res.startsWith("ROLE_"))  return res.substring(5);  else return res; })
                .collect(Collectors.toSet()).contains(role);
    }

    @Transactional
    public void addTrustOrgRole(String username, String org){
        if (!hasRole(TRUST_MGR_ROLE_PREFIX + org)){
            throw new IllegalArgumentException("no role");
        }
        addOrgRole(username,org);
    }

    @Transactional
    public void addTrustOrgMgrRole(String username, String org){
        if (!hasRole(TRUST_MGR_ROLE_PREFIX + org)){
            throw new IllegalArgumentException("no role");
        }
        addOrgMgrRole(username,org);
    }

    @Transactional
    public void removeTrustOrgRole(String username, String org){
        if (!hasRole(TRUST_MGR_ROLE_PREFIX + org)){
            throw new IllegalArgumentException("no role");
        }
        removeOrgRole(username, org);
    }

    @Transactional
    public void removeTrustOrgMgrRole(String username, String org){
        if (!hasRole(TRUST_MGR_ROLE_PREFIX + org)){
            throw new IllegalArgumentException("no role");
        }
        removeOrgMgrRole(username,org);
    }
}
