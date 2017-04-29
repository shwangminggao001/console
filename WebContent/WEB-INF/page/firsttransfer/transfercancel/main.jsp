<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/page/common/public.jsp"%>
<title>直通车转让-国诚金融后台管理系统</title>
</head>
<body>
	<form id="queryForm" action="" method="post" >
		<div style="margin-left:20px;line-height:50px;">
			直通车标题：<input type="text" id="name" name="name" class="input1"/>
			&nbsp;		
			 转让人：<input type="text" id="transferUserName" name="transferUserName" class="input1"/>
			
			<br/>
			转让发布日期：
			<input type="text"
				name="beginTime" id="beginTime" onclick="WdatePicker()"
				class="Wdate" />
			至
			<input type="text"
				name="endTime" id="endTime" onclick="WdatePicker()"
				class="Wdate" />
			<br/>
			转让撤销日期：
			<input type="text"
				name="transferCanclbeginTime" id="transferCanclbeginTime" onclick="WdatePicker()"
				class="Wdate" />
			至
			<input type="text"
				name="transferCanclendTime" id="transferCanclendTime" onclick="WdatePicker()"
				class="Wdate" />
			&nbsp;					
			<input type="button"
					onclick="javascript:query();" name="selectBtn"
					id="selectBtn" class="b_buts" value="查询" />
		</div>
	</form>
	<table id="dataTable" class="fulltable" style="width: 100%;">
		<thead>
			<tr>
				<th>直通车标题</th>
				<th>债权转让人</th>
				<th>转让价格</th>
				<th>发布时间</th>
				<th>转让撤销时间</th>
				<th>状态</th>
				<th>操作人</th>
				<th>备注</th>
			</tr>
		</thead>
	</table>
</body>
<script type="text/javascript">
	$(function() {
		pageGo(1);
	});

	/**
	*翻页功能
	*/
	function pageGo(pageNo) {
		var _load = parentLayer.load('处理中..');
		var urlPath = '${path}/firsttransfer/transfercancel/list/' + pageNo + '.html';
		$("#queryForm").ajaxSubmit ({
			url : urlPath,
			type : 'post',
			dataType : 'html',
			success : function(result) {
				$('#dataTable tbody').remove();
				$('#dataTable').append(result);
				parentLayer.close(_load);
			},
			error : function(data) {
				parentLayer.close(_load);
				layer.msg('网络连接异常，请刷新页面或稍后重试！', 1, 5);
			}
		});
	}

	/**
	*查询功能
	*/
	function query(){
		pageGo(1);
	}
</script>
</html>