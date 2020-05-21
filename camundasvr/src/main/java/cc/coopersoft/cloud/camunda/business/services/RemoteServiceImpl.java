package cc.coopersoft.cloud.camunda.business.services;

import cc.coopersoft.common.business.define.BusinessDefine;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Service;

@Service
public class RemoteServiceImpl implements RemoteService {

    private final OAuth2RestTemplate oAuth2RestTemplate;

    public RemoteServiceImpl(OAuth2RestTemplate oAuth2RestTemplate) {
        this.oAuth2RestTemplate = oAuth2RestTemplate;
    }

    @Override
    public BusinessDefine getBusinessDefine(String defineId) {
        ResponseEntity<BusinessDefine> restExchange = oAuth2RestTemplate.exchange(
                "http://businessdefinesvr/define/{defineId}",
                HttpMethod.GET, null,BusinessDefine.class,defineId);
        return restExchange.getBody();
    }
}
