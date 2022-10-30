package assignment.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import assignment.entitys.role;

@Component
public class AuthenticateInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			session.setAttribute("error", "Vui Lòng Đăng Nhập");
			response.sendRedirect("/AssignmentJava5/login");
			return false;
		}
		return true;
	}

}
