<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="col-md-12">
	<div class="panel-search">
	  <form class="form-inline" action="/demoTest/list">
      <div class="form-group">
          <label for="name" class="control-label">姓名：</label>
          <input type="text" name="name" class="form-control" />
      </div>
      <div class="form-group">
          <label for="age" class="control-label">年龄：</label>
          <input type="text" name="ageStart" class="form-control" style="width:100px;"/> -
          <input type="text" name="ageEnd" class="form-control" style="width:100px;"/>
      </div>
      <div class="form-group">
          <label for="birthday" class="control-label">生日：</label>
          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
						<input type="text" name="birthdayStart" class="form-control" readonly style="width:100px;"/>
						<span class="input-group-btn">
							<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
						</span>
					</div>
           -
          <div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
						<input type="text" name="birthdayEnd" class="form-control" readonly style="width:100px;"/>
						<span class="input-group-btn">
							<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
						</span>
					</div>
      </div>
      <div class="form-group">
          <label for="deptId" class="control-label">部门：</label>
          <select name="deptId" class="form-control">
          	<option value="">全部</option>
          	<option value="1">Option 1</option>
						<option value="2">Option 2</option>
          </select>
      </div>
	  </form>
	  <div class="btn-div">
			<div class="div-left">
				<button type="button" class="btn btn-warning" onclick="add('/demoTest/demoTest')">
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