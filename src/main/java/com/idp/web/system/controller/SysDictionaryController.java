package com.idp.web.system.controller;
import com.idp.web.system.entity.SysDictionary;
import com.idp.web.system.service.SysDictionaryService;
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
 * 数据字典controller
 * 
 * <pre>
 * 	历史记录：
 * 	2017-01-07 23:45 King
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
@RequestMapping("/sysDictionary")
public class SysDictionaryController extends BaseController {

	private Logger logger = Logger.getLogger(SysDictionaryController.class);

	@Resource
	private SysDictionaryService sysDictionaryService;
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	初始化查询页面
	 * </pre>
	 * 
	 * @return
	 */
	@RequestMapping("/init")
	public String init(){
		
		return "system/dictionary/sysDictionarySearch";
	}
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	分页查询
	 * </pre>
	 * 
	 * @param sysDictionary
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String list(SysDictionary sysDictionary,Page<SysDictionary> page,HttpServletRequest request){
		
		try {
			
			request.setAttribute("page", sysDictionaryService.findByPage(sysDictionary, page));
		} catch (Exception e) {
		
			logger.error(e.getMessage(), e);
		}
		
		return "system/dictionary/sysDictionaryList";
	}

	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	新增修改页面初始化
	 * </pre>
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/sysDictionary")
	public String sysDictionary(String id,HttpServletRequest request){
		
		try {
			
			if(ValidateUtils.isNotEmpty(id)){
				
				SysDictionary sysDictionary = sysDictionaryService.getById(id);
				request.setAttribute("sysDictionary", sysDictionary);
			}
		} catch (Exception e) {
			
			logger.error(e.getMessage(), e);
		}
		
		return "system/dictionary/sysDictionary";
	}
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	保存
	 * </pre>
	 * 
	 * @param sysDictionary
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String save(SysDictionary sysDictionary){
		
		JSONObject json = new JSONObject();
		
		try {
			
			// 修改
			if(ValidateUtils.isNotEmpty(sysDictionary.getId())){
				
				sysDictionaryService.update(sysDictionary);
			}
			// 新增
			else{
				
				sysDictionaryService.add(sysDictionary);
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
	 * 	2017-01-07 23:45 King
	 * 	删除
	 * </pre>
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(String id){
		
		JSONObject json = new JSONObject();
		
		try {
			
			SysDictionary sysDictionary = sysDictionaryService.getById(id);
			
			sysDictionaryService.delete(sysDictionary);
			
			json.put("result", "delete_success");
		} catch (Exception e) {
			
			logger.error(e.getMessage(), e);
			json.put("result", "delete_fail");
		}
		
		return json.toString();
	}
}
