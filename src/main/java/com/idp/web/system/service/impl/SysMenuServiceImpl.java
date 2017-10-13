package com.idp.web.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.idp.common.util.ResourceUtils;
import com.idp.web.system.dao.SysMenuDao;
import com.idp.web.system.entity.SysMenu;
import com.idp.web.system.service.SysMenuService;

@Service("SysMenuService")
public class SysMenuServiceImpl implements SysMenuService {

	@Resource
	private SysMenuDao sysMenuDao;
	
	@Override
	public List<SysMenu> find(SysMenu menu) {
		
		return sysMenuDao.find(menu);
	}

	@Override
	public List<SysMenu> getByParentId(String parentId){
		
		return sysMenuDao.getByParentId(parentId);
	}
	
	@Override
	public SysMenu getById(String id) {
		
		return sysMenuDao.getById(id);
	}
	
	@Override
	public void add(SysMenu menu) {
		
		menu.setId(ResourceUtils.getUUID());
		sysMenuDao.add(menu);
	}

	@Override
	public void update(SysMenu menu) {
		
		sysMenuDao.update(menu);
	}

	@Override
	public void delete(String id) {
		
		deleteChildren(id);
		sysMenuDao.delete(id);
	}

	public void deleteChildren(String id){
		SysMenu param = new SysMenu();
		param.setParentId(id);
		List<SysMenu> children = sysMenuDao.find(param);
		if(children != null && children.size() > 0){
			for(SysMenu child : children){
				deleteChildren(child.getId());
			}
			sysMenuDao.deleteByParentId(id);
		}
	}

	@Override
	public List<SysMenu> findForTreeTable(String parentId) {
		
		return sysMenuDao.findForTreeTable(parentId);
	}

}
