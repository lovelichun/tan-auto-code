package com.idp.web.system.entity;
import java.io.Serializable;

import com.idp.common.base.BaseEntity;

/**
 * 
 * 用户角色实体类.
 * 
 * <pre>
 * 	历史记录：
 * 	2016-08-02 22:43 King
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
public class SysUserRole extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	/**userId*/
	private String userId;
	/**roleId*/
	private String roleId;
	
	/**
	 *方法: 取得String
	 *@return: String  userId
	 */
	public String getUserId(){
		return this.userId;
	}

	/**
	 *方法: 设置String
	 *@param: String  userId
	 */
	public void setUserId(String userId){
		this.userId = userId;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  roleId
	 */
	public String getRoleId(){
		return this.roleId;
	}

	/**
	 *方法: 设置String
	 *@param: String  roleId
	 */
	public void setRoleId(String roleId){
		this.roleId = roleId;
	}
	
}
