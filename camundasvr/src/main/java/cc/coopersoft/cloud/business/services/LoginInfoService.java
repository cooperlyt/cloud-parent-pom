package cc.coopersoft.cloud.business.services;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
