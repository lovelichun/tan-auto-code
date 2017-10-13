package com.idp.web.demo.entity;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.idp.common.base.BaseEntity;

/**
 * 
 * 测试功能实体类.
 * 
 * <pre>
 * 	历史记录：
 * 	2017-01-19 King
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
public class DemoTest extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	/**主键*/
	private String demoId;
	/**姓名*/
	private String name;
	/**年龄*/
	private Integer age;
	/**生日*/
	private Date birthday;
	/**部门*/
	private String deptId;
	/**性别*/
	private String sex;
	/**爱好*/
	private String hobby;
	/**备注*/
	private String remark;
	
	/**年龄开始*/
	private Integer ageStart;
	/**年龄结束*/
	private Integer ageEnd;
	/**生日开始*/
	private Date birthdayStart;
	/**生日结束*/
	private Date birthdayEnd;
	
	/**
	 *方法: 取得String
	 *@return: String  主键
	 */
	public String getDemoId(){
		return this.demoId;
	}

	/**
	 *方法: 设置String
	 *@param: String  主键
	 */
	public void setDemoId(String demoId){
		this.demoId = demoId;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  姓名
	 */
	public String getName(){
		return this.name;
	}

	/**
	 *方法: 设置String
	 *@param: String  姓名
	 */
	public void setName(String name){
		this.name = name;
	}
	
	/**
	 *方法: 取得Integer
	 *@return: Integer  年龄
	 */
	public Integer getAge(){
		return this.age;
	}

	/**
	 *方法: 设置Integer
	 *@param: Integer  年龄
	 */
	public void setAge(Integer age){
		this.age = age;
	}
	
	/**
	 *方法: 取得Date
	 *@return: Date  生日
	 */
	public Date getBirthday(){
		return this.birthday;
	}

	/**
	 *方法: 设置Date
	 *@param: Date  生日
	 */
	public void setBirthday(Date birthday){
		this.birthday = birthday;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  部门
	 */
	public String getDeptId(){
		return this.deptId;
	}

	/**
	 *方法: 设置String
	 *@param: String  部门
	 */
	public void setDeptId(String deptId){
		this.deptId = deptId;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  性别
	 */
	public String getSex(){
		return this.sex;
	}

	/**
	 *方法: 设置String
	 *@param: String  性别
	 */
	public void setSex(String sex){
		this.sex = sex;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  爱好
	 */
	public String getHobby(){
		return this.hobby;
	}

	/**
	 *方法: 设置String
	 *@param: String  爱好
	 */
	public void setHobby(String hobby){
		this.hobby = hobby;
	}
	
	/**
	 *方法: 取得String
	 *@return: String  备注
	 */
	public String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置String
	 *@param: String  备注
	 */
	public void setRemark(String remark){
		this.remark = remark;
	}
	
	
	/**
	 *方法: 取得Integer
	 *@return: Integer  年龄开始
	 */
	public Integer getAgeStart(){
		return this.ageStart;
	}

	/**
	 *方法: 设置Integer
	 *@param: Integer  年龄开始
	 */
	public void setAgeStart(Integer ageStart){
		this.ageStart = ageStart;
	}
	
	/**
	 *方法: 取得Integer
	 *@return: Integer  年龄结束
	 */
	public Integer getAgeEnd(){
		return this.ageEnd;
	}

	/**
	 *方法: 设置Integer
	 *@param: Integer  年龄结束
	 */
	public void setAgeEnd(Integer ageEnd){
		this.ageEnd = ageEnd;
	}
	
	/**
	 *方法: 取得Date
	 *@return: Date  生日开始
	 */
	public Date getBirthdayStart(){
		return this.birthdayStart;
	}

	/**
	 *方法: 设置Date
	 *@param: Date  生日开始
	 */
	public void setBirthdayStart(Date birthdayStart){
		this.birthdayStart = birthdayStart;
	}
	
	/**
	 *方法: 取得Date
	 *@return: Date  生日结束
	 */
	public Date getBirthdayEnd(){
		return this.birthdayEnd;
	}

	/**
	 *方法: 设置Date
	 *@param: Date  生日结束
	 */
	public void setBirthdayEnd(Date birthdayEnd){
		this.birthdayEnd = birthdayEnd;
	}
	
}
