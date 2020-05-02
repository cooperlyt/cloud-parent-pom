package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.services.UserService;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(value = "hr")
public class ManagerController {

    private final UserService userService;

    public ManagerController(UserService userService) {
        this.userService = userService;
    }


//    @RequestMapping(value = "/list/users", method = RequestMethod.GET)
//    public List<User> getUserList(){
//        //return userService.
//    }



}
