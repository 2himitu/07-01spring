package com.sbs.exam.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.sbs.exam.demo.vo.Rq;

@Component
public class NeedAdminInterceptor implements HandlerInterceptor {
	private Rq rq;
	
	public NeedAdminInterceptor( Rq rq ) { this.rq = rq;}
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		if (!rq.isAdmin()) {
			if ( rq.isAjax() ) {
				resp.setContentType("application/json; charset=UTF-8");
				rq.print("{\"resultCode\":\"F-A\",\"msg\":\"권한이 없습니다.\"}");
			}
			else {
				String afterLoginUri = rq.getAfterLoginUri();
				rq.printHistoryBackJs("관리자로 로그인 후 이용해주세요.");
			}
			return false;
		}

		return HandlerInterceptor.super.preHandle(req, resp, handler);
	}
}
