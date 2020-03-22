package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.entity.UserInfo;
import cc.coopersoft.authentication.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "attach")
public class AttachManagerController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/developer/add", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void addDeveloperRoot(UserInfo userInfo){
        userService.addDeveloperRoot(userInfo);
    }

}
