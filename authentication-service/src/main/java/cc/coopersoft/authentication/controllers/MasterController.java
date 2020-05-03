package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.entity.Role;
import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.services.RoleService;
import cc.coopersoft.authentication.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


@RestController
@RequestMapping(value = "/admin/hr")
public class MasterController {

    private final UserService userService;

    private final RoleService roleService;

    public MasterController(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }

    @RequestMapping(value = "/role/list", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public List<Role> allRoles(){
        return roleService.listMasterRole();
    }

    @RequestMapping(value="/user/list", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public List<User> listUsers(){
        return userService.listUsers();
    }

    @RequestMapping(value = "/user/roles/{username}", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public List<Role> ListRoles(@PathVariable("username") String username){
        return userService.listRoles(username);
    }

    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public String addUser(@Valid @RequestBody User user){
        return userService.addUser(user).getUsername();
    }

    @RequestMapping(value = "/user/exists/{username}", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public boolean userIsExists(@PathVariable("username") String username){
        return userService.userIsExists(username);
    }

    @RequestMapping(value = "/user/exists/phone/{phone}", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public boolean phoneIsExists(@PathVariable("phone") String phone){
        return userService.phoneIsExists(phone);
    }

    @RequestMapping(value = "/user/exists/email/{email}", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public boolean emailIsExists(@PathVariable("email") String email){
        return userService.emailIsExists(email);
    }

    @RequestMapping(value = "/user/del/{username}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.ACCEPTED)
    public String delUser(@PathVariable("username") String username){
        userService.delUser(username);
        return username;
    }

    @RequestMapping(value = "/user/enable/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String enableUser(@PathVariable("username")String username){
        userService.enableUser(username,true);
        return username;
    }

    @RequestMapping(value = "/user/disable/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String disableUser(@PathVariable("username")String username){
        userService.enableUser(username, false);
        return username;
    }

    @RequestMapping(value = "/user/{username}/role/add/{role}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String addRole(@PathVariable("username")String username, @PathVariable("role")String role){
        userService.addRole(username, role);
        return username;
    }

    @RequestMapping(value = "/user/{username}/role/remove/{role}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String removeRole(@PathVariable("username")String username, @PathVariable("role")String role){
        userService.removeRole(username, role);
        return username;
    }

    @RequestMapping(value = "/user/pwdreset/{username}", method = RequestMethod.PUT)
    public String resetPassword(@PathVariable("username")String username){
        userService.resetPassword(username);
        return username;
    }

}
