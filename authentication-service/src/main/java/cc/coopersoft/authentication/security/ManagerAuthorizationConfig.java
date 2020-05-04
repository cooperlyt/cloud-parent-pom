package cc.coopersoft.authentication.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

@Configuration
@Order(1)

public class ManagerAuthorizationConfig extends ResourceServerConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {

        http.requestMatchers().antMatchers("/auth/**")
                .and().authorizeRequests()
                .antMatchers("/auth/encode/bcrypt/**","/auth/user").permitAll();



//        http.antMatcher("/admin/**")
//                .authorizeRequests()
//                .antMatchers("/trust/**").hasAuthority("Master")
//                .antMatchers( "/hr/**").access("hasAuthority('Master') and hasAuthority('hr') ")
//                .antMatchers("/ts/**").hasAuthority("Trust")
//                .anyRequest().authenticated();


//
//        http
//                .authorizeRequests()
//                    .antMatchers("/attach/**").hasAuthority("ATTACH_CORP")
//                    .antMatchers("/hr/**").hasAuthority("HR")
//                    .anyRequest().authenticated();
    }

}
