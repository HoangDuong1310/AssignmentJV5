package assignment;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import assignment.interceptors.AuthenticateInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	AuthenticateInterceptor authenticateInterceptor;
	@Autowired
	HttpServletRequest httpServletRequest;

	@Override
	public void addInterceptors(org.springframework.web.servlet.config.annotation.InterceptorRegistry registry) {
		registry.addInterceptor(authenticateInterceptor).addPathPatterns("/admin/**", "/user/**", "/cart")
				.excludePathPatterns("/login", "/register");
	}

}
