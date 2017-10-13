<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="table-scrollable">
	<table class="table table-striped table-hover table-success">
		<thead>
			<tr>
				<th>#</th>
								<th>姓名</th>
				<th>年龄</th>
				<th>生日</th>
				<th>部门</th>
				<th>性别</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result}" var="demoTest" varStatus="vs">
			<tr>
				<td>${vs.count + page.offset}</td>
					<td>${demoTest.name}</td>
					<td>${demoTest.age}</td>
					<td><fmt:formatDate value="${demoTest.birthday}" pattern="yyyy-MM-dd"/></td>
					<td>${demoTest.deptId}</td>
					<td>${demoTest.sex}</td>
				<td>
					<a href="javascript:;" class="btn btn-sm blue" onclick="update('/demoTest/demoTest?demoId=${demoTest.demoId}')">
						<i class="fa fa-edit"></i>编辑
					</a>
					<a href="javascript:;" class="btn btn-sm red" onclick="del('/demoTest/delete?demoId=${demoTest.demoId}')">
						<i class="fa fa-trash"></i>删除
					</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageination-panel">${page}</div>