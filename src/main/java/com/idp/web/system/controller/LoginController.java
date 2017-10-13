package com.idp.web.system.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.idp.common.base.BaseController;
import com.idp.common.constant.SessionAttr;
import com.idp.common.util.CacheUtil;
import com.idp.common.util.DesUtil;
import com.idp.common.util.MenuUtils;
import com.idp.web.system.entity.SysMenu;
import com.idp.web.system.entity.SysUser;
import com.idp.web.system.service.SysMenuService;
import com.idp.web.system.service.SysUserService;

import net.sf.json.JSONObject;

@Controller 
@RequestMapping("/login")
public class LoginController extends BaseController {

	private Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysMenuService sysMenuService;
	
	/**
	 * 验证用户
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/checkUser")
	@ResponseBody
	public String checkUser(SysUser user,HttpServletRequest request){
		JSONObject json = new JSONObject();
		
		try {
			
			SysUser u = sysUserService.findByUsername(user);
			
			if(u != null){
				
				HttpSession session = request.getSession();
				session.setAttribute(SessionAttr.USER_LOGIN.getValue(), u);
				List<String> userMenus = sysUserService.findMenuIdByUserId(u.getId());
				List<SysMenu> menuList = sysMenuService.getByParentId("0");
				session.setAttribute(SessionAttr.USER_MENUS.getValue(), MenuUtils.getMenu(menuList, userMenus));
				
				logger.info("login success");
				json.put("result", "login_success");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	/**
	 * 登出
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		session.removeAttribute(SessionAttr.USER_LOGIN.getValue());
		session.removeAttribute(SessionAttr.USER_ROLES.getValue());
		session.removeAttribute(SessionAttr.USER_MENUS.getValue());
		
		return "login/login";
	}
	
	/**
	 * 登录(移动端访问接口)
	 * @param user
	 * @param reuqest
	 * @return
	 */
	@RequestMapping("/appLogin")
	@ResponseBody
	public String appLogin(SysUser user,HttpServletRequest reuqest){
		
		JSONObject json = new JSONObject();
		
		try {
			
			SysUser u = sysUserService.findByUsername(user);
			
			if(u != null){
				
				String dateTime = String.valueOf(new Date().getTime());
				String token = new DesUtil("test").encrypt(dateTime);
				
				CacheUtil.putCache(token, u);
				
				json.put("token", token);
				json.put("result", true);
			}
			else{
				
				json.put("result", false);
			}
			
		} catch (Exception e) {
			
			json.put("result", false);
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	/**
	 * 登录(移动端访问接口)
	 * @param user
	 * @param reuqest
	 * @return
	 */
	@RequestMapping("/appLogout")
	@ResponseBody
	public String appLogout(String token,HttpServletRequest reuqest){
		
		JSONObject json = new JSONObject();
		
		try {
			
			CacheUtil.removeCache(token);
			json.put("result", true);
		} catch (Exception e) {
			
			json.put("result", false);
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	/**
	 * 移动端测试接口
	 * @param reuqest
	 * @return
	 */
	@RequestMapping("/test")
	@ResponseBody
	public String test(HttpServletRequest reuqest){
		
		JSONObject json = new JSONObject();
		
		try {
			
			json.put("result", true);
			json.put("msg", "Hello World");
			
		} catch (Exception e) {
			
			json.put("result", false);
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
}
