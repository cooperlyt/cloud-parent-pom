package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.services.TrustUserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


// need has Master,  Trust type eg: JOIN_CORP
@RestController
@RequestMapping(value = "/admin/trust")
public class TrustMgrController {

    private final TrustUserService trustUserService;

    public TrustMgrController(TrustUserService trustUserService) {
        this.trustUserService = trustUserService;
    }

    @RequestMapping(value = "/add/{type}" , method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public String addUser(@PathVariable("type") String type,  @Valid @RequestBody User user){
        return trustUserService.addUser(type,user).getUsername();
    }

    @RequestMapping(value = "/reset/{type}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String resetPassword(@PathVariable("type") String type,  @PathVariable("username") String username){
        trustUserService.resetPassword(type,username);
        return username;
    }

    @RequestMapping(value = "/enabled/{type}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String enabled(@PathVariable("type") String type,  @PathVariable("username") String username){
        trustUserService.userEnabled(type,username,true);
        return username;
    }

    @RequestMapping(value = "/disabled/{type}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String disabled(@PathVariable("type") String type,  @PathVariable("username") String username){
        trustUserService.userEnabled(type,username,false);
        return username;
    }
}
