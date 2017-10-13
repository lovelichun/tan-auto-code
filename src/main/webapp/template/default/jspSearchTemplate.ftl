<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="col-md-12">
	<div class="panel-search">
	  <form class="form-inline" action="/${className?uncap_first}/list">
	  	<#list columns as po>
	  		<#if po.isQuery == 'Y'>
	  			<#if po.queryModel == 'single'>
          	<#if po.showType == 'date'>
      <div class="form-group">
          <label for="${po.fieldName}" class="control-label">${po.description}：</label>
          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
						<input type="text" name="${po.fieldName}" class="form-control" readonly style="width:100px;"/>
						<span class="input-group-btn">
							<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
						</span>
					</div>
      </div>
           	<#elseif po.showType == 'radio' || po.showType == 'checkbox' || po.showType == 'select'>
      <div class="form-group">
          <label for="${po.fieldName}" class="control-label">${po.description}：</label>
          <select name="${po.fieldName}" class="form-control">
          	<option value="">全部</option>
          	<option value="1">Option 1</option>
						<option value="2">Option 2</option>
          </select>
      </div>
       			<#else>
      <div class="form-group">
          <label for="${po.fieldName}" class="control-label">${po.description}：</label>
          <input type="text" name="${po.fieldName}" class="form-control" />
      </div>
         		</#if>
      		<#else>
         		<#if po.showType == 'date'>
      <div class="form-group">
          <label for="${po.fieldName}" class="control-label">${po.description}：</label>
          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
						<input type="text" name="${po.fieldName}Start" class="form-control" readonly style="width:100px;"/>
						<span class="input-group-btn">
							<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
						</span>
					</div>
           -
          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
						<input type="text" name="${po.fieldName}End" class="form-control" readonly style="width:100px;"/>
						<span class="input-group-btn">
							<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
						</span>
					</div>
      </div>
      			<#else>
      <div class="form-group">
          <label for="${po.fieldName}" class="control-label">${po.description}：</label>
          <input type="text" name="${po.fieldName}Start" class="form-control" style="width:100px;"/> -
          <input type="text" name="${po.fieldName}End" class="form-control" style="width:100px;"/>
      </div>
           	</#if>
       		</#if>
	    	</#if>
	    </#list>
	  </form>
	  <div class="btn-div">
			<div class="div-left">
				<button type="button" class="btn btn-warning" onclick="add('/${className?uncap_first}/${className?uncap_first}')">
					<i class="fa fa-plus"></i> <spring:message code="btn.add"></spring:message>
				</button>
			</div>
			<div class="div-right">
				<button type="button" class="btn btn-primary" onclick="search()">
					<i class="fa fa-search"></i> <spring:message code="btn.search"></spring:message>
				</button>
		    <button type="button" class="btn btn-default" onclick="reset()">
		    	<i class="fa fa-repeat"></i> <spring:message code="btn.reset"></spring:message>	
		    </button>
			</div>
		</div>
	</div>
	<div class="panel-content"></div>
</div>
<script type="text/javascript" src="<c:url value="/static/custom/datepicker-util.js"></c:url>"></script>
<script type="text/javascript">
	$(function(){
		search();
	});
</script>