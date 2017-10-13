<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>${description}
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="${className?uncap_first}Form" class="form-horizontal form-bordered" action="/${className?uncap_first}/save" method="post">
  		<#list columns as po>
  		<#if po.isShowForm == 'Y'>
  		<div class="form-group">
        <label class="col-md-3 control-label">${po.description}:</label>
        <div class="col-md-4">
	        <#if po.showType == 'textarea'>
	        <div class="input-icon right">
	        	<i class="fa"></i>
	        	<textarea name="${po.fieldName}" rows="5" class="form-control" maxlength="500" <#if po.formValidType?? && po.formValidType == 'required'>required</#if>>${'$'}{${className?uncap_first}.${po.fieldName}}</textarea>
	        </div>
	        <#elseif po.showType == 'password'>
	        <div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="password" name="${po.fieldName}" class="form-control" value="${'$'}{${className?uncap_first}.${po.fieldName}}" <#if po.formValidType?? && po.formValidType == 'required'>required</#if> maxlength="${po.columnLength?if_exists}"/>
	        </div>
	        <#elseif po.showType == 'date'>
	        <div class="input-icon right">
	        	<i class="fa"></i>
	          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
							<input type="text" class="form-control" name="${po.fieldName}" readonly <#if po.formValidType?? && po.formValidType == 'required'>required</#if>
								value="<fmt:formatDate value="${'$'}{${className?uncap_first}.${po.fieldName}}" pattern="yyyy-MM-dd"/>"  maxlength="11"/>
							<span class="input-group-btn">
							<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
					</div>
					<#elseif po.showType == 'select'>
					<div class="input-icon right">
	        	<i class="fa"></i>
						<select name="${po.fieldName}" class="form-control" <#if po.formValidType?? && po.formValidType == 'required'>required</#if>>
							<option value="">请选择</option>
							<option value="1">Option 1</option>
							<option value="2">Option 2</option>
							<option value="3">Option 3</option>
						</select>
					</div>
					<#elseif po.showType == 'radio'>
					<div class="radio-list">
						<label class="radio-inline">
						<input type="radio" name="${po.fieldName}" value="1" checked> Option 1 </label>
						<label class="radio-inline">
						<input type="radio" name="${po.fieldName}" value="2"> Option 2 </label>
					</div>
					<#elseif po.showType == 'checkbox'>
					<div class="checkbox-list">
						<label class="checkbox-inline">
						<input type="checkbox" name="${po.fieldName}" value="1"> Checkbox 1 </label>
						<label class="checkbox-inline">
						<input type="checkbox" name="${po.fieldName}" value="2"> Checkbox 2 </label>
						<label class="checkbox-inline">
						<input type="checkbox" name="${po.fieldName}" value="3"> Checkbox 3 </label>
					</div>
					<#else>
	          <input type="text" name="${po.fieldName}" class="form-control" value="${'$'}{${className?uncap_first}.${po.fieldName}}" <#if po.formValidType?? && po.formValidType == 'required'>required</#if> maxlength="${po.columnLength?if_exists}"/>
	        </#if>
        </div>
      </div>
      </#if>
      </#list>
      <div class="form-actions">
        <div class="col-md-9 col-md-offset-3">
          <button type="button" class="btn btn-primary" onclick="save(this)">
          	<spring:message code="btn.save"></spring:message>
          </button>
          <button type="reset" class="btn btn-default" onclick="cancel()">
          	<spring:message code="btn.return"></spring:message>
          </button>
        </div>
      </div>
      <input type="hidden" name="${pkField}" value="${'$'}{${className?uncap_first}.${pkField}}">
  	</form>
  </div>
</div>
<script type="text/javascript" src="<c:url value="/static/custom/datepicker-util.js"></c:url>"></script>
<script type="text/javascript">
	$(function(){
		${'$'}('${'#'}${className?uncap_first}Form').validate();
	});
</script>