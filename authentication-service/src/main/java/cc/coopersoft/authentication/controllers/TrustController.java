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

    @RequestMapping(value = "/add/{org}/{type}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public String addUser(@PathVariable("org") String org, @PathVariable("type") String type, @Valid @RequestBody User user){
        return trustUserService.addUser(type,org,user).getUsername();
    }

    @RequestMapping(value = "/up/{type}/{org}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String upManager(@PathVariable("org") String org, @PathVariable("type") String type, @PathVariable("username") String username){
        trustUserService.upTrustManager(type,org,username);
        return username;
    }

    @RequestMapping(value = "/down/{type}/{org}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String downManager(@PathVariable("org") String org, @PathVariable("type") String type, @PathVariable("username") String username){
        trustUserService.downTrustManager(type,org,username);
        return username;
    }

    @RequestMapping(value = "/reset/{type}/{org}/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String resetPassword(@PathVariable("org") String org, @PathVariable("type") String type, @PathVariable("username") String username){
        trustUserService.resetPassword(type,org,username);
        return username;
    }

    @RequestMapping(value = "/del/{type}/{org}/{username}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public String delUser(@PathVariable("org") String org, @PathVariable("type") String type, @PathVariable("username") String username){
        trustUserService.del(type,org,username);
        return username;
    }

}
