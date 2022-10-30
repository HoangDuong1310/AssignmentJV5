package assignment.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import assignment.entitys.AccountEntity;
import assignment.entitys.role;

@Component
public class AuthencateInterceptorUser implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		AccountEntity accountEntity = (AccountEntity) session.getAttribute("account");
		if (accountEntity.getRole() == role.USER) {
			response.sendRedirect("/AssignmentJava5/errors");
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
