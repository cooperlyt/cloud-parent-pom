package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.entity.User;
import cc.coopersoft.authentication.services.TrustUserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;


// need has Master,  Trust type eg: JOIN_CORP
@RestController
@RequestMapping(value = "/admin/trust")
public class TrustMgrController {

    private final TrustUserService trustUserService;

    public TrustMgrController(TrustUserService trustUserService) {
        this.trustUserService = trustUserService;
    }

    @RequestMapping(value = "/add/{org}" , method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.CREATED)
    public String addUser(@PathVariable("org") String org, @RequestBody Map<String,String> user){
        return trustUserService.addRootUser(org,user.get("name"),user.get("phone"),user.get("username")).getUsername();
    }

    @RequestMapping(value = "/reset/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String resetPassword( @PathVariable("username") String username){
        trustUserService.resetPassword(username);
        return username;
    }

    @RequestMapping(value = "/enabled/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String enabled(@PathVariable("username") String username){
        trustUserService.userEnabled(username,true);
        return username;
    }

    @RequestMapping(value = "/disabled/{username}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public String disabled( @PathVariable("username") String username){
        trustUserService.userEnabled(username,false);
        return username;
    }
}
