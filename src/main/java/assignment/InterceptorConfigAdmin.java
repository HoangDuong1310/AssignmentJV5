package assignment;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import assignment.interceptors.AuthencateInterceptorAdmin;
import assignment.interceptors.AuthenticateInterceptor;

@Configuration
public class InterceptorConfigAdmin implements WebMvcConfigurer {
	@Autowired
	AuthencateInterceptorAdmin adminInter;
	@Autowired
	HttpServletRequest httpServletRequest;

	@Override
	public void addInterceptors(org.springframework.web.servlet.config.annotation.InterceptorRegistry registry) {
		registry.addInterceptor(adminInter).addPathPatterns("/user/**").excludePathPatterns("/admin/**");
	}

}
