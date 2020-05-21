package cc.coopersoft.cloud.business.services;

import cc.coopersoft.common.cloud.security.JWTUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class LoginInfoServiceImpl implements LoginInfoService {

    private static final String JWT_USER_NAME_KEY ="name";
    private final JWTUtils jwtUtils;

    public LoginInfoServiceImpl(JWTUtils jwtUtils) {
        this.jwtUtils = jwtUtils;
    }

    @Override
    public LoginInfo loginInfo() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        String username;

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }

        return new LoginInfo(username,jwtUtils.getDataStr(JWT_USER_NAME_KEY));
    }
}
