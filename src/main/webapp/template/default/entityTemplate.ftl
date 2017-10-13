<#if packageStyle == "service">
package ${sourceBasePackage}.${entityPackage}.entity;
<#else>
package ${sourceBasePackage}.entity.${entityPackage};
</#if>
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.idp.common.base.BaseEntity;

/**
 * 
 * ${description}实体类.
 * 
 * <pre>
 * 	历史记录：
 * 	${createDate} ${author}
 * 	新建文件
 * </pre>
 * 
 * @author 
 * <pre>
 * SD
 * 	${author}
 * PG
 *	${author}
 * UT
 *
 * MA
 * </pre>
 * @version $Rev$
 *
 * <p/> $Id$
 *
 */
public class ${className} extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	<#list columns as po>
	/**${po.description}*/
	private ${po.fieldType} ${po.fieldName};
	</#list>
	
	<#list columns as po>
	<#if po.queryModel == 'group'>
	/**${po.description}开始*/
	private ${po.fieldType} ${po.fieldName}Start;
	/**${po.description}结束*/
	private ${po.fieldType} ${po.fieldName}End;
	</#if>
	</#list>
	
	<#list columns as po>
	/**
	 *方法: 取得${po.fieldType}
	 *@return: ${po.fieldType}  ${po.description}
	 */
	public ${po.fieldType} get${po.fieldName?cap_first}(){
		return this.${po.fieldName};
	}

	/**
	 *方法: 设置${po.fieldType}
	 *@param: ${po.fieldType}  ${po.description}
	 */
	public void set${po.fieldName?cap_first}(${po.fieldType} ${po.fieldName}){
		this.${po.fieldName} = ${po.fieldName};
	}
	
	</#list>
	
	<#list columns as po>
	<#if po.queryModel == 'group'>
	/**
	 *方法: 取得${po.fieldType}
	 *@return: ${po.fieldType}  ${po.description}开始
	 */
	public ${po.fieldType} get${po.fieldName?cap_first}Start(){
		return this.${po.fieldName}Start;
	}

	/**
	 *方法: 设置${po.fieldType}
	 *@param: ${po.fieldType}  ${po.description}开始
	 */
	public void set${po.fieldName?cap_first}Start(${po.fieldType} ${po.fieldName}Start){
		this.${po.fieldName}Start = ${po.fieldName}Start;
	}
	
	/**
	 *方法: 取得${po.fieldType}
	 *@return: ${po.fieldType}  ${po.description}结束
	 */
	public ${po.fieldType} get${po.fieldName?cap_first}End(){
		return this.${po.fieldName}End;
	}

	/**
	 *方法: 设置${po.fieldType}
	 *@param: ${po.fieldType}  ${po.description}结束
	 */
	public void set${po.fieldName?cap_first}End(${po.fieldType} ${po.fieldName}End){
		this.${po.fieldName}End = ${po.fieldName}End;
	}
	
	</#if>
	</#list>
}
