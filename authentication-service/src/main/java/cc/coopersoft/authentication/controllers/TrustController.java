package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.services.TrustUserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


@RestController
@RequestMapping(value = "/admin/ts")
public class TrustController {

    private final TrustUserService trustUserService;

    public TrustController(TrustUserService trustUserService) {
        this.trustUserService = trustUserService;
    }

    @RequestMapping(value = "{org}/add/{username}" , method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.CREATED)
    public String joinUser(@PathVariable("org") String org,@PathVariable("username") String username){
        trustUserService.addTrustOrgRole(username,org);
        return username;
    }

    @RequestMapping(value = "{org}/mgr/add/{username}" , method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.CREATED)
    public String joinMgr(@PathVariable("org") String org,@PathVariable("username") String username){
        trustUserService.addTrustOrgMgrRole(username,org);
        return username;
    }

    @RequestMapping(value = "{org}/remove/{username}" , method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.CREATED)
    public String removeUser(@PathVariable("org") String org,@PathVariable("username") String username){
        trustUserService.removeTrustOrgRole(username,org);
        return username;
    }

    @RequestMapping(value = "{org}/mgr/remove/{username}" , method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.CREATED)
    public String removeMgr(@PathVariable("org") String org,@PathVariable("username") String username){
        trustUserService.removeTrustOrgMgrRole(username,org);
        return username;
    }
}
