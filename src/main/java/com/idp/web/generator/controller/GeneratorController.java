package com.idp.web.generator.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.idp.common.base.BaseController;
import com.idp.web.generator.entity.BuildCodeConfig;
import com.idp.web.generator.entity.CgColumnConfig;
import com.idp.web.generator.entity.CgDataSource;
import com.idp.web.generator.entity.CgTableConfig;
import com.idp.web.generator.service.CgDataSourceService;
import com.idp.web.generator.service.CgTableConfigService;
import com.idp.web.generator.util.CodeGenerateUtils;
import com.idp.web.generator.util.FieldUtils;
import com.idp.web.generator.util.ReadTableUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/generator")
public class GeneratorController extends BaseController {

	private static Logger logger = Logger.getLogger(GeneratorController.class);
	
	@Resource
	private CgDataSourceService cgDataSourceService;
	@Resource
	private CgTableConfigService cgTableConfigService;
	
	@RequestMapping("/buildConfig")
	@ResponseBody
	public String buildConfig(String dataSourceId,String tableName){
		JSONObject json = new JSONObject();
		
		try {
			
			CgTableConfig table = new CgTableConfig();
			table.setTableName(tableName);
			table.setClassName(FieldUtils.formatFieldCapital(tableName));
			table.setIsCheckbox("N");
			table.setIsPage("Y");
			table.setIsTree("N");
			table.setCreateUser(getCurrentUser().getId());
			table.setCreateDate(new Date());
			
			CgDataSource dataSource = cgDataSourceService.getById(dataSourceId);
			List<CgColumnConfig> columns =  new ReadTableUtils().readTableColumn(dataSource, tableName);
			table.setColumns(columns);
			cgTableConfigService.add(table);
			json.put("result", "build_config_success");
		} catch (Exception e) {
			json.put("result", "error");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	@RequestMapping("/goBuild")
	public String goBuild(String id,HttpServletRequest request){
		
		try {
			
			CgTableConfig tableConfig = cgTableConfigService.getById(id);
			request.setAttribute("tableConfig", tableConfig);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "generator/table/buildCode";
	}
	
	
	@RequestMapping("/buildCode")
	@ResponseBody
	public String buildCode(BuildCodeConfig buildCodeConfig){
		JSONObject json = new JSONObject();
		
		try {
			
			CgTableConfig tableConfig = cgTableConfigService.getById(buildCodeConfig.getTableId());
			buildCodeConfig.setTableConfig(tableConfig);
			// 生成代码
			CodeGenerateUtils generate = new CodeGenerateUtils(buildCodeConfig);
			generate.generateFile();
			
			json.put("result", "build_code_success");
		} catch (Exception e) {
			json.put("result", "error");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	/**
	 * 返回子目录json
	 * @param parentNode
	 * @return
	 */
	@RequestMapping("/doExpandFileTree")
	@ResponseBody
	public String doExpandFileTree(String parentNode){
		JSONArray json = new JSONArray();
		
		try{
			
			if(StringUtils.isEmpty(parentNode)){
				//返回磁盘驱动器根目录
				File[] roots = File.listRoots();
				for(File r:roots){
					
					JSONObject item = new JSONObject();
					item.put("id", r.getAbsolutePath());
					item.put("name", r.getPath());
					item.put("isParent", hasDirs(r));
					json.add(item);
				}
			}else{
				//返回子目录集
				File parent = new File(parentNode);
				File[] chs = parent.listFiles();
				if(chs != null){
					for(File r:chs){
						JSONObject item = new JSONObject();
						if(r.isDirectory()){
							item.put("id", r.getAbsolutePath());
							item.put("name", r.getName());
							item.put("isParent", hasDirs(r));
							json.add(item);
						}else{
							item.put("id", r.getAbsolutePath());
							item.put("name", r.getName());
							item.put("isParent", false);
							json.add(item);
						}
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("该文件夹不可选择");
		}
		return json.toString();
	}
	
	private boolean hasDirs(File dir){
		
		try{
			
			if(dir.listFiles().length == 0){
				
				return false;
			}else{
				
				return true;
			}
		}catch (Exception e) {
			
			return false;
		}
	}
}
