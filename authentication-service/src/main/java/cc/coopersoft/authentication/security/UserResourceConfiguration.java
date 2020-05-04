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
        http.requestMatchers().antMatchers("/admin/**").and()
                .authorizeRequests()
                .antMatchers("/admin/trust/**").hasAuthority("Master")
                .antMatchers( "/admin/hr/**").access("hasAuthority('Master') and hasAuthority('HR') ")
                .antMatchers("/admin/ts/**").hasAuthority("Trust")
                .anyRequest().authenticated();

    }
}
