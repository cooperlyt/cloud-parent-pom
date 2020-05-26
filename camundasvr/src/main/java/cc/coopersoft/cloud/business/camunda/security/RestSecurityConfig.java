package cc.coopersoft.cloud.business.camunda.security;

import cc.coopersoft.cloud.business.camunda.security.filter.rest.StatelessUserAuthenticationFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

//@Configuration
//@Order(1)
public class RestSecurityConfig extends ResourceServerConfigurerAdapter {

//    @Override
//    public void configure(HttpSecurity http) throws Exception {
//        http.requestMatchers().antMatchers("/rest/**", "/adapter/**")
//                .and()
//                .authorizeRequests();
////                .and()
////                .csrf().disable()
////                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
////                .and()
////                .httpBasic(); // this is just an example, use any auth mechanism you like
//
//    }
//
//    @Bean
//    public FilterRegistrationBean statelessUserAuthenticationFilter(){
//        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
//        filterRegistration.setFilter(new StatelessUserAuthenticationFilter());
//        filterRegistration.setOrder(102); // make sure the filter is registered after the Spring Security Filter Chain
//        filterRegistration.addUrlPatterns("/rest/*","/adapter/*");
//        return filterRegistration;
//    }

}