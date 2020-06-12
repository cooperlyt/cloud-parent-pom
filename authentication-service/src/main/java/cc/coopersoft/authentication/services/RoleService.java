package cc.coopersoft.authentication.services;

import cc.coopersoft.authentication.dto.RoleDao;
import cc.coopersoft.authentication.entity.Role;
import cc.coopersoft.authentication.entity.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;


@Service
public class RoleService {

//    private static final String SYSTEM_ROLE_PREFIX = "S_";


    // full trust user role eg. Trust , S_T_(M_|U_){TYPE} , S_T_(M_|U_){TYPE}_{ORG}
    // full master trust manger role eg. MASTER, {TYPE}
//    private static final String TRUST_ROLE_PREFIX = SYSTEM_ROLE_PREFIX + "T_U_";
//    private static final String TRUST_MANAGER_PREFIX = SYSTEM_ROLE_PREFIX + "T_M_";


    //   三个角色  Trust  , T_{ORG} , T_M_{ORG}

    public static final String TRUST_ROLE = "Trust";
    public static final String MASTER_ROLE = "Master";

    private final RoleDao roleRepository;

    public RoleService(RoleDao roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Set<String> roleSet(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toSet());
    }



//    public boolean hasTrustManager(String type, String org){
//       return  roleSet().contains(TRUST_MANAGER_PREFIX + type + "_" + org);
//    }
//
//    public boolean hasTrustMasterManager(String type){
//        return roleSet().contains(type);
//    }

//    private String trustTypePrefix(String type, boolean manager){
//        return  (manager ? TRUST_MANAGER_PREFIX : TRUST_ROLE_PREFIX) + type;
//    }

//    private String trustOrgPrefix(String type, String org, boolean manager){
//        return trustTypePrefix(type,manager) + "_" + org;
//    }
//
//    private Role trustTypeRole(String type, boolean manager){
//        String name = trustTypePrefix(type,manager);
//        return roleRepository.findById(name).orElseGet(()-> createSystemRole(name));
//    }

//    private Role trustOrgRole(String type ,String org ,boolean manager){
//        String name = trustOrgPrefix(type,org,manager);
//        return roleRepository.findById(name).orElseGet(() -> createSystemRole(name));
//    }

    private Role createSystemRole(String name){
        Role result = new Role();
        result.setSystem(true);
        result.setName(name);
        result.setAuthority(name);
        return result;
    }

    public Role getMasterRole(){
        return roleRepository.findById(MASTER_ROLE).orElseGet(() -> createSystemRole(MASTER_ROLE));
    }

    public Role getTrustRole(){
        return roleRepository.findById(TRUST_ROLE).orElseGet(() -> createSystemRole(TRUST_ROLE));
    }

    public Role getSystemRole(String name){
        return roleRepository.findById(name).orElseGet(() -> createSystemRole(name));
    }

    public Role getRole(String name){
        return roleRepository.findById(name).orElseThrow();
    }

//    public List<Role> getTrustRoles(String type, String org, boolean manager){
//        List<Role> result = new ArrayList<>(3);
//        result.add(getTrustRole());
//        result.add(trustTypeRole(type,false));
//        result.add(trustOrgRole(type,org,false));
//        if (manager){
//            result.add(trustTypeRole(type, true));
//            result.add(trustOrgRole(type,org,true));
//        }
//        return result;
//    }

//
//    public boolean upTrust(String type, String org, Collection<Role> roles){
//
//        Set<String> rs = roles.stream().map(Role::getAuthority).collect(Collectors.toSet());
//        if (!rs.contains(trustOrgPrefix(type,org,true))){
//            roles.add(trustOrgRole(type,org,true));
//            if (!rs.contains(trustTypePrefix(type,true))){
//                roles.add(trustTypeRole(type,true));
//                if (!rs.contains(TRUST_ROLE)){
//                    roles.add(getTrustRole());
//                }
//            }
//            return true;
//        }
//        return false;
//    }

//    public boolean downTrust(String type, String org,Collection<Role> roles){
//
//        String orgPrefix = trustOrgPrefix(type,org,true);
//        if (roles.removeAll(roles.stream().filter(r -> r.getAuthority().equals(orgPrefix)).collect(Collectors.toSet()))){
//            String typePrefix = trustTypePrefix(type,true);
//            if (!roles.stream().anyMatch(r -> r.getAuthority().startsWith(typePrefix) && !r.getAuthority().equals(typePrefix))){
//                roles.removeAll(roles.stream().filter(r -> r.getAuthority().equals(typePrefix)).collect(Collectors.toSet()));
//            }
//            return true;
//        }
//        return false;
//
//    }
//
//    public boolean delTrust(String type, String org, Collection<Role> roles){
//        if (roles.removeAll(roles.stream().filter(r -> r.getAuthority().equals(trustOrgPrefix(type,org,true)) || r.getAuthority().equals(trustOrgPrefix(type,org,false))).collect(Collectors.toSet()))){
//            String typePrefix = trustTypePrefix(type,true);
//
//            String typeMgrPrefix = trustTypePrefix(type,false);
//
//            if (!roles.stream().anyMatch(r -> (r.getAuthority().startsWith(typePrefix) && !r.getAuthority().equals(typePrefix)) ||
//                    (r.getAuthority().startsWith(typeMgrPrefix) && !r.getAuthority().equals(typeMgrPrefix)) )){
//                if (roles.removeAll(roles.stream().filter(r -> r.getAuthority().equals(typePrefix) ||
//                        r.getAuthority().equals(typeMgrPrefix) ).collect(Collectors.toSet()))){
//                    if (!roles.stream().anyMatch(r -> r.getAuthority().startsWith(TRUST_ROLE_PREFIX) || r.getAuthority().startsWith(TRUST_MANAGER_PREFIX))){
//                        roles.removeAll(roles.stream().filter(r -> r.getAuthority().equals(TRUST_ROLE)).collect(Collectors.toSet()));
//                    }
//                }
//
//            }
//            return true;
//        }
//        return false;
//    }



    public List<Role> listMasterRole(){
       return roleRepository.findBySystemIsFalse();
    }

    public Optional<Role> getRoleByName(String name){
        return roleRepository.findById(name);
    }

}
