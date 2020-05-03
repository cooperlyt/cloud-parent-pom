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

    @RequestMapping(value = "/add/{type}/{org}/{manager}" , method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public String addUser(@PathVariable("type") String type, @PathVariable("org") String org, @Valid @RequestBody User user, @PathVariable("manager") boolean manager){
        return trustUserService.addUser(type,org,user,manager).getUsername();
    }

    @RequestMapping(value = "/up/{type}/{org}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String upManager(@PathVariable("type") String type, @PathVariable("org") String org, @PathVariable("username") String username){
        trustUserService.upTrustManager(type,org,username);
        return username;
    }

    @RequestMapping(value = "/down/{type}/{org}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String downManager(@PathVariable("type") String type, @PathVariable("org") String org, @PathVariable("username") String username){
        trustUserService.downTrustManager(type,org,username);
        return username;
    }

    @RequestMapping(value = "/reset/{type}/{org}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String resetPassword(@PathVariable("type") String type, @PathVariable("org") String org, @PathVariable("username") String username){
        trustUserService.resetPassword(type,org,username);
        return username;
    }

    @RequestMapping(value = "/del/{type}/{org}/{username}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public String delUser(@PathVariable("type") String type, @PathVariable("org") String org, @PathVariable("username") String username){
        trustUserService.del(type,org,username);
        return username;
    }
}
