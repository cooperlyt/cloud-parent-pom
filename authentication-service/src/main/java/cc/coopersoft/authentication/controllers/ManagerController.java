package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "hr")
public class ManagerController {

    @Autowired
    private UserService userService;






//    @RequestMapping(value = "/list/users", method = RequestMethod.GET)
//    public List<User> getUserList(){
//        //return userService.
//    }



}
