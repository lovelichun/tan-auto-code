<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="table-scrollable">
	<table class="table table-striped table-hover table-success">
		<thead>
			<tr>
				<th>#</th>
				<th>分组编码</th>
				<th>分组名称</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result}" var="sysDictionary" varStatus="vs">
			<tr>
				<td>${vs.count + page.offset}</td>
				<td>${sysDictionary.code}</td>
				<td>${sysDictionary.name}</td>
				<td>
					<a href="javascript:;" class="btn btn-sm blue" onclick="update('/sysDictionary/sysDictionary?id=${sysDictionary.id}')">
						<i class="fa fa-edit"></i>编辑
					</a>
					<a href="javascript:;" class="btn btn-sm red" onclick="del('/sysDictionary/delete?id=${sysDictionary.id}')">
						<i class="fa fa-trash"></i>删除
					</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageination-panel">${page}</div>