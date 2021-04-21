package pl.coderslab.charity.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import pl.coderslab.charity.handlers.CustomAuthenticationSuccessHandler;
import pl.coderslab.charity.services.SpringDataUserDetailsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/contact").permitAll()
                .antMatchers("/user/**").authenticated()
                .antMatchers("/donation/**").authenticated()
                .antMatchers("/institution/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUPER_ADMIN")
                .antMatchers("/admin/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUPER_ADMIN")

                .and()
                .formLogin()
                .loginPage("/login")
                .usernameParameter("email")
                .successHandler(CustomAuthenticationSuccessHandler())
                .failureHandler(new AuthenticationFailureHandler() {
                    @Override
                    public void onAuthenticationFailure(HttpServletRequest httpServletRequest,
                                                        HttpServletResponse response, AuthenticationException exception
                    ) throws IOException, ServletException {
                        if (exception.getMessage().equals("banned")) {
                            response.sendRedirect("/login?error=userIsBanned");
                        } else {
                            response.sendRedirect("/login?error=invalidUserOrPassword");
                        }
                    }
                })

                .and()
                .exceptionHandling()
                .accessDeniedPage("/access-denied")

                .and()
                .logout()
                .logoutSuccessUrl("/logout")
                .permitAll();
    }

    @Bean
    public AuthenticationSuccessHandler CustomAuthenticationSuccessHandler() {
        return new CustomAuthenticationSuccessHandler();
    }

    @Bean
    public SpringDataUserDetailsService customUserDetailsService() {
        return new SpringDataUserDetailsService();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
