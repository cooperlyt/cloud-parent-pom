package cc.coopersoft.authentication.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

@Configuration
@Order(2)
public class UserResourceConfiguration extends ResourceServerConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {
        //.access("hasAuthority('Master') and hasAuthority('') ")
        http.antMatcher("/admin/**")
                .authorizeRequests()
                .antMatchers("/trust/**").hasAuthority("Master")
                .antMatchers( "/hr/**").access("hasAuthority('Master') and hasAuthority('hr') ")
                .antMatchers("/ts/**").hasAuthority("Trust")
                .anyRequest().authenticated();

    }
}
