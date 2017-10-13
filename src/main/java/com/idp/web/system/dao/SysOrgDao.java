package com.idp.web.system.dao;

import java.util.List;

import com.idp.common.base.BaseDao;
import com.idp.web.system.entity.SysOrg;

public interface SysOrgDao extends BaseDao<SysOrg, String> {

	public List<SysOrg> findForTreeTable(String parentId);
	
	public void deleteByParentId(String parentId);
	
	public String getMaxCode(String parentId);
}
