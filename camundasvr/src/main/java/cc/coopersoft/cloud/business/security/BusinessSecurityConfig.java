package cc.coopersoft.cloud.business.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

@Configuration
@Order(2)
public class BusinessSecurityConfig extends ResourceServerConfigurerAdapter {


    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.requestMatchers().antMatchers("/master/**", "/trust/**","/publish/**").and()
                .authorizeRequests()
                .antMatchers("/publish/**").permitAll()
                .antMatchers("/master/**").hasAuthority("Master")
                .antMatchers("/trust/**").hasAuthority("Trust")
                .antMatchers("/manager/**").hasAuthority("DATA_MGR")
                .anyRequest().authenticated();
    }
}
