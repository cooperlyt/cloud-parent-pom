package cc.coopersoft.cloud.camunda;

import org.camunda.bpm.spring.boot.starter.annotation.EnableProcessApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;


@EnableDiscoveryClient
@EnableCircuitBreaker
@SpringBootApplication(scanBasePackages = {"cc.coopersoft.common.cloud","cc.coopersoft.cloud.camunda"})
@EnableEurekaClient
@EnableResourceServer
@EnableProcessApplication
public class Application {
    public static void main(String... args){
        SpringApplication.run(Application.class, args);
    }
}
