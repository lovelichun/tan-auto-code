package com.idp.web.demo.controller;
import com.idp.web.demo.entity.DemoTest;
import com.idp.web.demo.service.DemoTestService;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.idp.common.base.BaseController;
import com.idp.common.persistence.Page;
import com.idp.common.util.ValidateUtils;

import net.sf.json.JSONObject;

/**
 * 
 * 测试功能controller
 * 
 * <pre>
 * 	历史记录：
 * 	2017-01-19 King
 * 	新建文件
 * </pre>
 * 
 * @author 
 * <pre>
 * SD
 * 	King
 * PG
 *	King
 * UT
 *
 * MA
 * </pre>
 * @version $Rev$
 *
 * <p/> $Id$
 *
 */
@Controller
@RequestMapping("/demoTest")
public class DemoTestController extends BaseController {

	private Logger logger = Logger.getLogger(DemoTestController.class);

	@Resource
	private DemoTestService demoTestService;
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	初始化查询页面
	 * </pre>
	 * 
	 * @return
	 */
	@RequestMapping("/init")
	public String init(){
		
		return "demo/test/demoTestSearch";
	}
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	分页查询
	 * </pre>
	 * 
	 * @param demoTest
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String list(DemoTest demoTest,Page<DemoTest> page,HttpServletRequest request){
		
		try {
			
			request.setAttribute("page", demoTestService.findByPage(demoTest, page));
		} catch (Exception e) {
		
			logger.error(e.getMessage(), e);
		}
		
		return "demo/test/demoTestList";
	}

	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	新增修改页面初始化
	 * </pre>
	 * 
	 * @param demoId
	 * @param request
	 * @return
	 */
	@RequestMapping("/demoTest")
	public String demoTest(String demoId,HttpServletRequest request){
		
		try {
			
			if(ValidateUtils.isNotEmpty(demoId)){
				
				DemoTest demoTest = demoTestService.getById(demoId);
				request.setAttribute("demoTest", demoTest);
			}
		} catch (Exception e) {
			
			logger.error(e.getMessage(), e);
		}
		
		return "demo/test/demoTest";
	}
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	保存
	 * </pre>
	 * 
	 * @param demoTest
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String save(DemoTest demoTest){
		
		JSONObject json = new JSONObject();
		
		try {
			
			// 修改
			if(ValidateUtils.isNotEmpty(demoTest.getDemoId())){
				
				demoTestService.update(demoTest);
			}
			// 新增
			else{
				
				demoTestService.add(demoTest);
			}
			json.put("result", "save_success");
		} catch (Exception e) {
			
			logger.error(e.getMessage(), e);
			json.put("result", "save_fail");
		}
		
		return json.toString();
	}
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	删除
	 * </pre>
	 * 
	 * @param demoId
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(String demoId){
		
		JSONObject json = new JSONObject();
		
		try {
			
			demoTestService.delete(demoId);
			json.put("result", "delete_success");
		} catch (Exception e) {
			
			logger.error(e.getMessage(), e);
			json.put("result", "delete_fail");
		}
		
		return json.toString();
	}
}
