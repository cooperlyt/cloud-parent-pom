package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "operation")

public class OperationController {


    @Autowired
    private UserService userService;

    @RequestMapping(value = "/change/{pwd}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void changePassword(@PathVariable("pwd")String oldPassword,
                                 @RequestBody String newPassword){
        userService.changePassword(oldPassword,newPassword);
    }
}
