package com.idp.web.system.service;
import com.idp.web.system.entity.SysRole;
import java.util.List;

import com.idp.common.persistence.Page;

/**
 * 
 * 角色管理service接口
 * 
 * <pre>
 * 	历史记录：
 * 	2016-08-01 22:42 King
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
public interface SysRoleService{
	
 	/**
	 * 
	 * <pre>
	 * 	2016-08-01 22:42 King
	 * 	分页查询
	 * </pre>
	 * 
	 * @param sysRole
	 * @param page
	 * @return
	 */
	public Page<SysRole> findByPage(SysRole sysRole,Page<SysRole> page);
	
	/**
	 * 
	 * <pre>
	 * 	2016-08-01 22:42 King
	 * 	查询
	 * </pre>
	 * 
	 * @param sysRole
	 * @return
	 */
	public List<SysRole> findBySearch(SysRole sysRole);
	
	/**
	 * 
	 * <pre>
	 * 	2016-08-01 22:42 King
	 * 	通过ID查询
	 * </pre>
	 * 
	 * @param SysRole
	 * @return
	 */
	public SysRole getById(String id);
	
	/**
	 * 
	 * <pre>
	 * 	2016-08-01 22:42 King
	 * 	新增
	 * </pre>
	 * 
	 * @param sysRole
	 */
	public void add(SysRole sysRole);
	
	/**
	 * 
	 * <pre>
	 * 	2016-08-01 22:42 King
	 * 	修改
	 * </pre>
	 * 
	 * @param sysRole
	 */
	public void update(SysRole sysRole);
	
	/**
	 * 
	 * <pre>
	 * 	2016-08-01 22:42 King
	 * 	删除
	 * </pre>
	 * 
	 * @param id
	 */
	public void delete(String id);
	
	/**
	 * 根据角色id获取所有菜单权限
	 * @param roleId
	 * @return
	 */
	public List<String> findByRoleId(String roleId);
}
