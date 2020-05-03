package cc.coopersoft.authentication.controllers;

import cc.coopersoft.authentication.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "auth")
public class AuthController {


    private final UserService userService;

    private final PasswordEncoder passwordEncoder;

    public AuthController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping(value = "/change/{pwd}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void changePassword(@PathVariable("pwd")String oldPassword,
                                 @RequestBody String newPassword){
        userService.changePassword(oldPassword,newPassword);
    }

    @RequestMapping(value = {"/user"} ,produces = "application/json")
    public Map<String,Object> user(OAuth2Authentication user){
        Map<String,Object> userInfo = new HashMap<>();
        userInfo.put("user",user.getUserAuthentication().getPrincipal());
        userInfo.put("authorities", AuthorityUtils.authorityListToSet(user.getUserAuthentication().getAuthorities()));
        return userInfo;
    }


    @RequestMapping(value = "/encode/bcrypt/{text}",method = RequestMethod.GET)
    public String encodeBCrypt(@PathVariable("text") String text){
        return "{\"code\":\"" + passwordEncoder.encode(text) + "\"}";
    }
}
