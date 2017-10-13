<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<#if packageStyle == "service">
<mapper namespace="${sourceBasePackage}.${entityPackage}.dao.${className}Dao">
<#else>
<mapper namespace="${sourceBasePackage}.dao.${entityPackage}.${className}Dao">
</#if>

	<#if packageStyle == "service">
	<parameterMap id="parameterMap" type="${sourceBasePackage}.${entityPackage}.entity.${className}"></parameterMap>
	<resultMap id="resultMap" type="${sourceBasePackage}.${entityPackage}.entity.${className}">
		<#list columns as po>
		<result property="${po.fieldName}" column="${po.columnName}"/>
		</#list>
	</resultMap>
  <#else>
	<parameterMap id="parameterMap" type="${sourceBasePackage}.entity.${entityPackage}.${className}"></parameterMap>
	<resultMap id="resultMap" type="${sourceBasePackage}.entity.${entityPackage}.${className}">
		<#list columns as po>
		<result property="${po.fieldName}" column="${po.columnName}"/>
		</#list>
	</resultMap>
  </#if>
	
	<sql id="columnSql">
		<trim suffixOverrides=",">
		<#list columns as po>
			t.${po.columnName},
		</#list>
	 	</trim>
	</sql>
	
	<select id="find" parameterMap="parameterMap" resultMap="resultMap">
		select
			<include refid="columnSql"></include>
		from ${tableName} t
		<where>
			<#list columns as po>
				<#if po.isQuery == 'Y'>
					<#if po.queryModel == 'single'>
			<if test="${po.fieldName} != null and ${po.fieldName} != ''">
						<#if po.queryType == 'like'>
				and t.${po.columnName} like concat('%',${'#'}{${po.fieldName}},'%')
						<#else>
				and t.${po.columnName} ${po.queryType} ${'#'}{${po.fieldName}}			
						</#if>
			</if>
					<#else>
			<if test="${po.fieldName}Start != null and ${po.fieldName}Start != ''">
				and t.${po.columnName} >= ${'#'}{${po.fieldName}Start}
			</if>
			<if test="${po.fieldName}End != null and ${po.fieldName}End != ''">
				and t.${po.columnName} <![CDATA[<]]> ${'#'}{${po.fieldName}End} 
			</if>
					</#if>
				</#if>
			</#list>
		</where>
	</select>
	
	<select id="getById" parameterType="java.lang.${pkType}" resultMap="resultMap">
		select
			<include refid="columnSql"></include>
		from ${tableName} t
		where t.${pkColumn} = ${'#'}{value}
	</select>
	
	<insert id="add" parameterMap="parameterMap">
		insert into ${tableName}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list columns as po>
			${po.columnName},
			</#list>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
			<#list columns as po>
			${'#'}{${po.fieldName}},
			</#list>
		</trim>
	</insert>
	
	<insert id="batchAdd" parameterType="java.util.List">
		insert into ${tableName}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list columns as po>
			${po.columnName},
			</#list>
		</trim>
		values
		<foreach collection="list" item="item" separator=",">
			<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list columns as po>
				${'#'}{item.${po.fieldName}},
			</#list>
			</trim>
		</foreach>
	</insert>
	
	<update id="update" parameterMap="parameterMap">
		update ${tableName}
		<set>
			<#list columns as po>
			<#if po.isKey == 'N'>
			${po.columnName} = ${'#'}{${po.fieldName}},
			</#if>
			</#list>
		</set>
		where ${pkColumn} = ${'#'}{${pkField}}
	</update>
	
	<update id="updateNotNull" parameterMap="parameterMap">
		update ${tableName}
		<set>
			<#list columns as po>
			<#if po.isKey == 'N'>
			<if test="${po.fieldName} != null">
			${po.columnName} = ${'#'}{${po.fieldName}},
			</if>
			</#if>
			</#list>
		</set>
		where ${pkColumn} = ${'#'}{${pkField}}
	</update>
	
	<delete id="delete" parameterType="java.lang.${pkType}">
		delete from ${tableName} where ${pkColumn} = ${'#'}{value}
	</delete>
	
	<delete id="batchDelete" parameterType="java.util.List">
		delete from ${tableName} where ${pkColumn} in
		<foreach collection="list" item="item" open="(" close=")" separator=",">
			${'#'}{item}
		</foreach>
	</delete>
	
</mapper>