package com.idp.web.demo.service.impl;
import com.idp.web.demo.service.DemoTestService;
import com.idp.web.demo.dao.DemoTestDao;
import com.idp.web.demo.entity.DemoTest;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.idp.common.persistence.Page;
import com.idp.common.util.ResourceUtils;

/**
 * 
 * 测试功能service实现类
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
@Service("demoTestService")
public class DemoTestServiceImpl implements DemoTestService {

	@Resource
	private DemoTestDao demoTestDao;
	
	@Override
	public Page<DemoTest> findByPage(DemoTest demoTest, Page<DemoTest> page) {

		page.setResult(demoTestDao.find(demoTest, page));
		
		return page;
	}
	
	@Override
	public List<DemoTest> findBySearch(DemoTest demoTest) {

		return demoTestDao.find(demoTest);
	}
	
	@Override
	public DemoTest getById(String demoId) {

		return demoTestDao.getById(demoId);
	}

	@Override
	public void add(DemoTest demoTest) throws Exception {

		demoTest.setDemoId(ResourceUtils.getUUID());
		demoTestDao.add(demoTest);
		
		throw new Exception("异常");
	}
	
	@Override
	public void update(DemoTest demoTest) {

		demoTestDao.update(demoTest);
	}

	@Override
	public void delete(String demoId) {

		demoTestDao.delete(demoId);
	}
 	
}