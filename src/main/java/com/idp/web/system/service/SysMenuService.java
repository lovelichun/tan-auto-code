package com.idp.web.system.service;

import java.util.List;

import com.idp.web.system.entity.SysMenu;

public interface SysMenuService {
	
	public List<SysMenu> find(SysMenu menu);
	
	public List<SysMenu> getByParentId(String parentId);
	
	public SysMenu getById(String id);
	
	public void add(SysMenu menu);
	
	public void update(SysMenu menu);
	
	public void delete(String id);
	
	public List<SysMenu> findForTreeTable(String parentId);
	
}
