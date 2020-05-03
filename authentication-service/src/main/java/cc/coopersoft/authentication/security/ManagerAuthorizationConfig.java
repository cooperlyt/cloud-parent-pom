package cc.coopersoft.authentication.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@Order(1)
public class ManagerAuthorizationConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.antMatcher("/auth/**").requestMatchers().antMatchers("/encode/bcrypt/**")
                .and().authorizeRequests()
                .antMatchers("/encode/bcrypt/**","/auth/encode/bcrypt/**").permitAll();



//
//        http
//                .authorizeRequests()
//                    .antMatchers("/attach/**").hasAuthority("ATTACH_CORP")
//                    .antMatchers("/hr/**").hasAuthority("HR")
//                    .anyRequest().authenticated();
    }

}
