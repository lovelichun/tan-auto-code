package com.idp.web.system.entity;
import java.io.Serializable;
import java.util.List;

import com.idp.common.base.BaseEntity;

/**
 * 
 * 数据字典实体类.
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
public class SysDictionary extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	/**id*/
	private String id;
	/**编码*/
	private String code;
	/**名称*/
	private String name;
	/**分组id*/
	private String groupId;
	/**排序*/
	private Integer sort;
	/**子类型集合*/
	private List<SysDictionary> children;
	
	/**
	 *方法: 取得String
	 *@return: String  id
	 */
	public String getId(){
		return this.id;
	}

	/**
	 *方法: 设置String
	 *@param: String  id
	 */
	public void setId(String id){
		this.id = id;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  编码
	 */
	public String getCode(){
		return this.code;
	}

	/**
	 *方法: 设置String
	 *@param: String  编码
	 */
	public void setCode(String code){
		this.code = code;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  名称
	 */
	public String getName(){
		return this.name;
	}

	/**
	 *方法: 设置String
	 *@param: String  名称
	 */
	public void setName(String name){
		this.name = name;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  分组id
	 */
	public String getGroupId(){
		return this.groupId;
	}

	/**
	 *方法: 设置String
	 *@param: String  分组id
	 */
	public void setGroupId(String groupId){
		this.groupId = groupId;
	}
	
	/**
	 *方法: 取得Integer
	 *@return: Integer  排序
	 */
	public Integer getSort(){
		return this.sort;
	}

	/**
	 *方法: 设置Integer
	 *@param: Integer  排序
	 */
	public void setSort(Integer sort){
		this.sort = sort;
	}

	public List<SysDictionary> getChildren() {
		return children;
	}

	public void setChildren(List<SysDictionary> children) {
		this.children = children;
	}
	
}
