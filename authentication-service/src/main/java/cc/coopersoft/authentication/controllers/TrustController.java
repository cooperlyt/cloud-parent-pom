package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.services.TrustUserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


// need Trust type mgr , org  id role eg. Trust,  M.0001, T.0001
@RestController
@RequestMapping(value = "/admin/ts")
public class TrustController {

    private final TrustUserService trustUserService;

    public TrustController(TrustUserService trustUserService) {
        this.trustUserService = trustUserService;
    }

    @RequestMapping(value = "/add/{type}" , method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public String addUser(@PathVariable("type") String type,  @Valid @RequestBody User user){
        return trustUserService.addUser(type,user).getUsername();
    }


}
