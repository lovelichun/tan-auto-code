package com.idp.web.system.service;

import java.util.List;

import com.idp.common.persistence.Page;
import com.idp.web.system.entity.SysUser;

public interface SysUserService {

	public SysUser findByUsername(SysUser user);
	
	public Page<SysUser> findByPage(SysUser user,Page<SysUser> page);
	
	public SysUser getById(String id);
	
	public void add(SysUser user);
	
	public void update(SysUser user);
	
	public void delete(String id);
	
	/**
	 * 查询用户的所有角色
	 * @param userId
	 * @return
	 */
	public List<String> findByUserId(String userId);
	
	/**
	 * 获取用户所有有权限的菜单id
	 * @param userId
	 * @return
	 */
	public List<String> findMenuIdByUserId(String userId);
}
