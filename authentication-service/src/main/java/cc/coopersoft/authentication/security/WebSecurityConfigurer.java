package cc.coopersoft.authentication.security;

import cc.coopersoft.authentication.services.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter {

    private final UserService userService;
    private  final PasswordEncoder passwordEncoder;

    public WebSecurityConfigurer(UserService userService,
                                 PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }



    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        logger.debug("===========================_____________+++++");
//        http.authorizeRequests()
//                .antMatchers("/oauth/**","/encode/bcrypt/**","/auth/encode/bcrypt/**").hasRole("GffOV");
//    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder);
//        auth.inMemoryAuthentication()
//                .withUser("root")
//                .password(passwordEncoder().encode("register@root2019"))
//                .roles("ROOT");
//        auth
//                .inMemoryAuthentication().passwordEncoder(passwordEncoder())
//                .withUser("temp").password(passwordEncoder().encode("password")).roles("USER")
//                .and()
//                .withUser("root").password(passwordEncoder().encode("dgsoft")).roles("USER", "ADMIN");

    }

}
