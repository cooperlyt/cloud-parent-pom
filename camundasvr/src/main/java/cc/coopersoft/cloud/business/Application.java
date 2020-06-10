package cc.coopersoft.cloud.business;

import cc.coopersoft.cloud.business.camunda.construct.fire.delegate.FireCheckBusinessChannel;
import org.camunda.bpm.spring.boot.starter.annotation.EnableProcessApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;


@SpringCloudApplication
@EnableResourceServer
@EnableProcessApplication
public class Application {
    public static void main(String... args){
        SpringApplication.run(Application.class, args);
    }
}
