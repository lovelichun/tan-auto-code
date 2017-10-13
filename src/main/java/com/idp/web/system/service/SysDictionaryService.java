package com.idp.web.system.service;
import com.idp.web.system.entity.SysDictionary;
import java.util.List;

import com.idp.common.persistence.Page;

/**
 * 
 * 数据字典service接口
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
public interface SysDictionaryService{
	
 	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	分页查询
	 * </pre>
	 * 
	 * @param sysDictionary
	 * @param page
	 * @return
	 */
	public Page<SysDictionary> findByPage(SysDictionary sysDictionary,Page<SysDictionary> page);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	查询
	 * </pre>
	 * 
	 * @param sysDictionary
	 * @return
	 */
	public List<SysDictionary> findBySearch(SysDictionary sysDictionary);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	通过ID查询
	 * </pre>
	 * 
	 * @param SysDictionary
	 * @return
	 */
	public SysDictionary getById(String id);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	新增
	 * </pre>
	 * 
	 * @param sysDictionary
	 */
	public void add(SysDictionary sysDictionary);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	修改
	 * </pre>
	 * 
	 * @param sysDictionary
	 */
	public void update(SysDictionary sysDictionary);
	
	/**
	 * 
	 * <pre>
	 * 	2017-01-07 23:45 King
	 * 	删除
	 * </pre>
	 * 
	 * @param id
	 */
	public void delete(SysDictionary sysDictionary);
	
	
	public SysDictionary getByCode(String code);
}
