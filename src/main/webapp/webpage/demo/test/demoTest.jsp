<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>测试功能
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="demoTestForm" class="form-horizontal form-bordered" action="/demoTest/save" method="post">
  		<div class="form-group">
        <label class="col-md-3 control-label">姓名:</label>
        <div class="col-md-4">
	          <input type="text" name="name" class="form-control" value="${demoTest.name}" required maxlength="100"/>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">年龄:</label>
        <div class="col-md-4">
	          <input type="text" name="age" class="form-control" value="${demoTest.age}"  maxlength="10"/>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">生日:</label>
        <div class="col-md-4">
	        <div class="input-icon right">
	        	<i class="fa"></i>
	          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
							<input type="text" class="form-control" name="birthday" readonly 
								value="<fmt:formatDate value="${demoTest.birthday}" pattern="yyyy-MM-dd"/>"  maxlength="11"/>
							<span class="input-group-btn">
							<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
					</div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">部门:</label>
        <div class="col-md-4">
					<div class="input-icon right">
	        	<i class="fa"></i>
						<select name="deptId" class="form-control" >
							<option value="">请选择</option>
							<option value="1">Option 1</option>
							<option value="2">Option 2</option>
							<option value="3">Option 3</option>
						</select>
					</div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">性别:</label>
        <div class="col-md-4">
					<div class="radio-list">
						<label class="radio-inline">
						<input type="radio" name="sex" value="1" checked> Option 1 </label>
						<label class="radio-inline">
						<input type="radio" name="sex" value="2"> Option 2 </label>
					</div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">爱好:</label>
        <div class="col-md-4">
					<div class="checkbox-list">
						<label class="checkbox-inline">
						<input type="checkbox" name="hobby" value="1"> Checkbox 1 </label>
						<label class="checkbox-inline">
						<input type="checkbox" name="hobby" value="2"> Checkbox 2 </label>
						<label class="checkbox-inline">
						<input type="checkbox" name="hobby" value="3"> Checkbox 3 </label>
					</div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">备注:</label>
        <div class="col-md-4">
	        <div class="input-icon right">
	        	<i class="fa"></i>
	        	<textarea name="remark" rows="5" class="form-control" maxlength="500" >${demoTest.remark}</textarea>
	        </div>
        </div>
      </div>
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
      <input type="hidden" name="demoId" value="${demoTest.demoId}">
  	</form>
  </div>
</div>
<script type="text/javascript" src="<c:url value="/static/custom/datepicker-util.js"></c:url>"></script>
<script type="text/javascript">
	$(function(){
		$('#demoTestForm').validate();
	});
</script>