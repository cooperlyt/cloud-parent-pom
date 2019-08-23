package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "mgr")
public class ManagerController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/change/{pwd}", method = RequestMethod.POST)
    public String changePassword(@PathVariable("pwd")String oldPassword,
                                 @RequestBody String newPassword){
        if (userService.changePassword(new BCryptPasswordEncoder().encode(oldPassword),
                new BCryptPasswordEncoder().encode(newPassword))){
            return  "{\"result\":\"ok\"}";
        }else{
            return  "{\"result\":\"fail\"}";
        }
    }

//    @RequestMapping(value = "/list/users", method = RequestMethod.GET)
//    public List<User> getUserList(){
//        //return userService.
//    }



}
