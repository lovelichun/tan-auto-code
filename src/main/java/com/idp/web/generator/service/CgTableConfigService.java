package com.idp.web.generator.service;

import com.idp.common.persistence.Page;
import com.idp.web.generator.entity.CgTableConfig;

public interface CgTableConfigService {

	public Page<CgTableConfig> findByPage(CgTableConfig tableConfig,Page<CgTableConfig> page);
	
	public CgTableConfig getById(String id);
	
	public void add(CgTableConfig tableConfig) throws Exception;
	
	public void update(CgTableConfig tableConfig) throws Exception;
	
	public void delete(String id) throws Exception;
}
