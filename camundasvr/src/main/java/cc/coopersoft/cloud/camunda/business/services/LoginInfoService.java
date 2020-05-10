package cc.coopersoft.cloud.camunda.business.services;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

public interface LoginInfoService {

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    class LoginInfo{
        private String id;
        private String name;
    }

    LoginInfo loginInfo();
}
