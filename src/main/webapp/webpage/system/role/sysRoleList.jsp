<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="table-scrollable">
	<table class="table table-striped table-hover table-success">
		<thead>
			<tr>
				<th>#</th>
				<th>角色编码</th>
				<th>角色名称</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result }" var="sysRole" varStatus="vs">
			<tr>
				<td>${vs.count + page.offset}</td>
				<td>${sysRole.roleCode}</td>
				<td>${sysRole.roleName}</td>
				<td>${sysRole.description}</td>
				<td>
					<a href="javascript:;" class="btn btn-sm blue" onclick="update('/sysRole/sysRole?id=${sysRole.id}')">
						<i class="fa fa-edit"></i>编辑
					</a>
					<a href="javascript:;" class="btn btn-sm red" onclick="del('/sysRole/delete?id=${sysRole.id}')">
						<i class="fa fa-trash"></i>删除
					</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageination-panel">${page}</div>