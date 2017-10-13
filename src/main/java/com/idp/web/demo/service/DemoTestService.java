package com.idp.web.demo.service;
import com.idp.web.demo.entity.DemoTest;
import java.util.List;

import com.idp.common.persistence.Page;

/**
 * 
 * 测试功能service接口
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
public interface DemoTestService{
	
 	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	分页查询
	 * </pre>
	 * 
	 * @param demoTest
	 * @param page
	 * @return
	 */
	public Page<DemoTest> findByPage(DemoTest demoTest,Page<DemoTest> page);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	查询
	 * </pre>
	 * 
	 * @param demoTest
	 * @return
	 */
	public List<DemoTest> findBySearch(DemoTest demoTest);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	通过ID查询
	 * </pre>
	 * 
	 * @param DemoTest
	 * @return
	 */
	public DemoTest getById(String demoId);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	新增
	 * </pre>
	 * 
	 * @param demoTest
	 */
	public void add(DemoTest demoTest) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	修改
	 * </pre>
	 * 
	 * @param demoTest
	 */
	public void update(DemoTest demoTest);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-19 King
	 * 	删除
	 * </pre>
	 * 
	 * @param demoId
	 */
	public void delete(String demoId);
}
