package cc.coopersoft.authentication.security;

import cc.coopersoft.authentication.dto.UserServiceDetail;
import cc.coopersoft.authentication.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;

import java.util.HashMap;
import java.util.Map;

public class JWTTokenEnhancer implements TokenEnhancer {

    @Autowired
    private UserServiceDetail userServiceDetail;

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
        Map<String, Object> additionalInfo = new HashMap<>();


        User user = userServiceDetail.getUser(authentication.getName());
        additionalInfo.put("name", user.getName());
        additionalInfo.put("org", user.getOrg());
        additionalInfo.put("orgName",user.getOrgname());

        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
        return accessToken;
    }
}
