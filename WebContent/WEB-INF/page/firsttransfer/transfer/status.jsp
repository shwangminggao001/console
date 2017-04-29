<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/page/common/public.jsp"%>
<title>直通车转让-国诚金融后台管理系统</title>
</head>
<body>
<form id="transferForm" name="transferForm" method="post">
	<input type="hidden" id="firstTransferId" name="firstTransferId" value="${firstTransferApproved.firstTransferId}" />
	<input type="hidden" id="status" name="status" value="${firstTransferApproved.status}" />
	
	<table style="margin-left:10px;margin-top:5px;">
		<tr>
			<td>审核意见</td>
		</tr>
		<tr>
			<td >
				<textarea id="verifyRemark" name="verifyRemark" style="width:350px;height:200px;">${firstTransferApproved.verifyRemark}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="pass" name="pass" onclick="save(3);" value="初审核通过" />
				&nbsp;
				<input type="button" id="nopass" name="nopass" onclick="save(2);" value="初审核不通过" />
			</td>
		</tr>
	</table>
</form>
</body>
<script type="text/javascript">

function save(statu) {
	$('#pass').attr("onclick", "");
	$('#nopass').attr("onclick", "");
	
	if ($.trim($("#verifyRemark").val()) == "") {
		layer.msg('请输入审核意见。', 1, 5);
		$("#verifyRemark").focus();
		$('#pass').attr("onclick", "save(3);");
		$('#nopass').attr("onclick", "save(2);");
		return;
	}
	
	$('#pass').attr("onclick", "save(3);");
	$('#nopass').attr("onclick", "save(2);");
	$('#status').val(statu);
	var _load = layer.load('处理中..');
	$("#transferForm").ajaxSubmit({
		url : '${path}/firsttransfer/transfer/save.html',
		type : 'post',
		success : function(result) {
			if (result.code == '0') {
				layer.msg(result.message, 1, 1, function() {
					window.parent.location.href = window.parent.location.href;
				});
			} else {
				layer.msg(result.message, 1, 5);
			}
		},
		error : function(result) {
			layer.msg('网络连接超时,请您稍后重试.', 1, 5);
	    }
	});
}
</script>
</html>