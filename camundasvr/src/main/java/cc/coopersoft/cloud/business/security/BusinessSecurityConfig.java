package cc.coopersoft.cloud.business.security;

import cc.coopersoft.cloud.business.camunda.security.filter.rest.StatelessUserAuthenticationFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

@Configuration
@Order(2)
public class BusinessSecurityConfig extends ResourceServerConfigurerAdapter {


    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()

                .antMatchers("/master/**").hasAuthority("Master")
                .antMatchers("/trust/**").hasAuthority("Trust")
                .antMatchers("/manager/**").hasAuthority("DATA_MGR")
                //.antMatchers("/publish/**", "/app/**", "/lib/**", "/api/**").permitAll()
                .anyRequest().permitAll();
    }


    @Bean
    public FilterRegistrationBean statelessUserAuthenticationFilter(){
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
        filterRegistration.setFilter(new StatelessUserAuthenticationFilter());
        filterRegistration.setOrder(102); // make sure the filter is registered after the Spring Security Filter Chain
        filterRegistration.addUrlPatterns("/rest/*","/adapter/*");
        return filterRegistration;
    }
}
