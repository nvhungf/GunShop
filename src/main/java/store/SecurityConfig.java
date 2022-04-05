package store;

import java.util.NoSuchElementException;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import store.entity.Account;
import store.service.AccountService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	AccountService AccountService;
	@Autowired
	BCryptPasswordEncoder pe;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(username -> {
			try {
				Account user = AccountService.finfById(username);
				String password = pe.encode(user.getPassword());
				String[] roles = user.getAuthorities().stream().map(er -> er.getRole().getId())
						.collect(Collectors.toList()).toArray(new String[0]);
				return User.withUsername(username).password(password).roles(roles).build();

			} catch (NoSuchElementException e) {
				throw new UsernameNotFoundException(username + "not found !!");
			}
		});
	}

	// phân quyền sử dụng và hình thức login
	@Override
		protected void configure(HttpSecurity http) throws Exception{
			http.csrf().disable();
			
			
			
			//phân quyền sd 
			http.authorizeRequests()
			.antMatchers("/admin/**").hasAnyRole("STAF","DIRE")
			.antMatchers("/rest/authorities").hasRole("DIRE")
			.anyRequest().permitAll();
			
			//dieu khien loi k dung vai tro
//			http.exceptionHandling()
//			.accessDeniedPage("/auth/access/denied");
			//login
			http.formLogin()
			.loginPage("/security/login/form")
			.loginProcessingUrl("/security/login")
			.defaultSuccessUrl("/security/login/success", false)
			.failureUrl("/security/login/error");
//			.usernameParameter("username")
//			.passwordParameter("password");
//			http.rememberMe()
//			.rememberMeParameter("remember");
			
			//remember
			http.rememberMe()
			.tokenValiditySeconds(86400);
			
			//dang nhap nhung vo nham link
			http.exceptionHandling()
			.accessDeniedPage("/security/unauthoried");
			
			//logout
			
			
			http.logout()
			.logoutUrl("/security/logoff")
			.logoutSuccessUrl("/security/logoff/success");
			
			
			//Dang nhạp tu mxh
			http.oauth2Login()
		.loginPage("/auth/login/form")
			.defaultSuccessUrl("/oauth2/login/success", true)
			.failureUrl("/auth/login/error")
			.authorizationEndpoint()
		.baseUri("/oauth2/authorization");
		}

	@Bean
	public BCryptPasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers(HttpMethod.OPTIONS, "/**");
	}
}
