package demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override //configure users (in memory, database, ...)
    protected void configure(AuthenticationManagerBuilder auth) throws Exception{
        //add users for in memory authentication
        User.UserBuilder user = User.withDefaultPasswordEncoder();

        auth.inMemoryAuthentication()
                .withUser(user.username("john").password("test123").roles("EMPLOYEE"))
                .withUser(user.username("mary").password("test123").roles("MANAGER"))
                .withUser(user.username("peter").password("test123").roles("ADMIN"));
    }

    @Override //Configure security of web paths in application, login, logout,...
    protected void configure(HttpSecurity httpSecurity) throws Exception{
        httpSecurity.authorizeRequests()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/showMyLoginPage")
                .loginProcessingUrl("/authenticateUser")
                .permitAll();
    }
}
