<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="table-scrollable">
	<table class="table table-striped table-hover table-success">
		<thead>
			<tr>
				<th>#</th>
				<th>连接名称</th>
				<th>数据库类型</th>
				<th>数据库名</th>
				<th>服务器IP</th>
				<th>端口号</th>
				<th>用户名</th>
				<th>密码</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result }" var="d" varStatus="vs">
			<tr>
				<td>${vs.count + page.offset}</td>
				<td>${d.description }</td>
				<td>${d.databaseType }</td>
				<td>${d.databaseName }</td>
				<td>${d.server }</td>
				<td>${d.port }</td>
				<td>${d.username }</td>
				<td>${d.password }</td>
				<td>
					<a href="javascript:;" class="btn btn-sm blue" onclick="update('/dataSource/dataSource?id=${d.id}')">
						<i class="fa fa-edit"></i>编辑
					</a>
					<a href="javascript:;" class="btn btn-sm red" onclick="del('/dataSource/delete?id=${d.id}')">
						<i class="fa fa-trash"></i>删除
					</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageination-panel">${page}</div>