package egovframework.com.cmm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.config.WebConfig;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
public class CustomInterceptor implements HandlerInterceptor {

	private static final String ALLOWED_ORIGIN = "http://localhost:8080";
//TODO 도메인 통제 인터셉트
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 요청 처리 전에 실행되는 코드
        // 여기서 false를 반환하면 요청 처리가 중단됩니다.
		String originHeader = request.getHeader("Origin"); 
		log.debug(originHeader);
		if (originHeader == null || ALLOWED_ORIGIN.equals(originHeader)) { 
			return true; // 요청 처리 계속 진행 
		} else {
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "Origin Not Allowed");
			return false; // 요청 처리 중단 
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러가 요청을 처리한 후에 실행되는 코드
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 요청 처리가 완전히 끝난 후에 실행되는 코드
	}

}
