package com.idp.web.system.service;

import java.util.List;

import com.idp.web.system.entity.SysOrg;

public interface SysOrgService {

	public List<SysOrg> find(SysOrg org);
	
	public List<SysOrg> findForTreeTable(String parentId);
	
	public SysOrg getById(String id);
	
	public void add(SysOrg org);
	
	public void update(SysOrg org);
	
	public void delete(String id);
}
