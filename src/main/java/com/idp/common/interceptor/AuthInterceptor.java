package com.idp.common.interceptor;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.idp.common.constant.SessionAttr;
import com.idp.common.util.CacheUtil;
import com.idp.common.util.DesUtil;
import com.idp.web.system.entity.SysUser;

/**
 * 权限拦截器 
 * 
 * @author King
 *
 */
public class AuthInterceptor implements HandlerInterceptor {

	private static final Logger logger = Logger.getLogger(AuthInterceptor.class);

	private List<String> excludeUrls;

	public List<String> getExcludeUrls() {

		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {

		this.excludeUrls = excludeUrls;
	}

	/**
	 * 在controller后拦截
	 */
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {

	}

	public void postHandle(	HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在controller前拦截
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Headers","X-Requested-With, Content-Type, Authorization");
		response.setHeader("Access-Control-Allow-Methods","GET, POST");
		
		String requestPath = getRequestPath(request);// 用户访问的资源地址
		HttpSession session = request.getSession();

		logger.info("requestPath:"+requestPath);
		
		String authorization = request.getHeader("Authorization");
		
		logger.info("authorization:"+authorization);
		
		if (excludeUrls.contains(requestPath)) {

			// 如果该请求不在拦截范围内，直接返回true
			return true;
		}
		else if(StringUtils.isNotEmpty(authorization)){
			
			String token = authorization.substring(7);
			
			DesUtil des = new DesUtil("test");
			Date loginDate = new Date(Long.parseLong(des.decrypt(token)));
			Calendar c = Calendar.getInstance();
			c.setTime(loginDate);
			c.add(Calendar.DATE, 7);
			
			if(CacheUtil.getCacheValue(token) != null && c.getTime().after(new Date())){
				
				return true;
			}
			else{
				
				response.setHeader("sessionstatus", "timeout");  
				response.sendError(518, "session timeout.");  
				
				return false;
			}
		}
		else {
			
			SysUser user = (SysUser) session.getAttribute(SessionAttr.USER_LOGIN.getValue());
			
			// 用户已登录
			if(user != null){
				
				return true;
			}
			// 用户未登录，session失效
			else{
				
				// session失效时，ajax请求拦截
				String requestType = request.getHeader("X-Requested-With");
				if(StringUtils.isNotEmpty(requestType) && requestType.equalsIgnoreCase("XMLHttpRequest")){
					
					response.setHeader("sessionstatus", "timeout");  
					response.sendError(518, "session timeout.");  
					
			    }else { 
			    	
			    	// 跳转到登录页面
					request.getRequestDispatcher("/webpage/login/login.jsp").forward(request, response);
			    }
				
				return false;
			}
		}
	}
	
	/**
	 * 截取访问路径
	 * 
	 * @param request
	 * @return
	 */
	public static String getRequestPath(HttpServletRequest request) {

		String requestPath = request.getRequestURI();

		// 去掉其他参数
		if (requestPath.indexOf("&") > -1) {

			requestPath = requestPath.substring(0, requestPath.indexOf("&"));
		}
		// 去掉jsessionid参数
		if(requestPath.indexOf(";") > -1){
			
			requestPath = requestPath.substring(0, requestPath.indexOf(";"));
		}

		// 去掉项目路径
		requestPath = requestPath.substring(request.getContextPath().length() + 1);
		return requestPath;
	}
}
