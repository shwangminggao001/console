<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/taglib.jsp"%>
<%@ include file="/WEB-INF/page/common/public.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>国诚金融—借款终审</title>
</head>
<body style="background: #f9f9f9;">
	<form id="queryForm" action="" method="post" >
		<div id="loginLogCard" style="margin-left:20px;line-height:50px;">
			标名称：<input id="name" class="input1" name="name"
				value="${borrowCnd.name}" />
			&nbsp;
			用户名：<input id="userName" class="input1" name="userName"
				value="${borrowCnd.userName}" />
			&nbsp;
			借款标类型 ：
				  <select id="borrowtype" name="borrowtype"
					value="${borrowCnd.borrowType}"
					class="bigselect" style="width:130px;">
				  		<option value="">--请选择--</option>
				  		<option value="1">信用标</option>
	                    <option value="2">抵押标</option>
	                    <option value="3">净值标</option>
	                    <option value="5">担保标</option>
				  </select>
		    &nbsp;
	           借款总额 ：
	        <select    name="accountStyle"
					class="bigselect" style="width:130px;">
	                    <option value="2" selected="selected">≥20万</option>       
				  		<option value="1" >&lt;20万</option>
				  		<option value="" >全部</option>
				  </select>
	 	  
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
					onclick="javascript:query();" type="button" name="Submit1"
					id="subbtn" class="b_buts" value="查   询" />
			 
			<br />  
		</div>
	</form>

	<div id="loginLogList" class="main_cent"></div>

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
		$("#queryForm").ajaxSubmit ({
			url : '${path}//borrow/handleFirst/list/' + pageNo + '.html',
			type : 'post',
			dataType : 'html',
			success : function(result) {
				$("#loginLogList").html(result);
				parentLayer.close(_load);
			},
			error : function(data) {
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
	function validateHandleFirstTender(){
		if(confirm("确认要手动直通车投标吗？")){
			 
			return true;
		}else{
			return false;
		}
	}
	function handleFirstTender(id){
		if(!validateHandleFirstTender()){
			return false;
		} 
		var _load = parentLayer.load('处理中..');
		$.ajax({
			url : '${path}/borrow/handleFirst/handleFirstTender.html',
			data : {
				'borrowId' :id
			},
			type : 'post',
			dataType : 'json',
			success : function(result) {
				parentLayer.close(_load);
				if (result.code == '0') {
					layer.msg(result.message,1,1);
					location.href=location.href;
				} else  {
					layer.msg(result.message, 1, 5);
				}
			},
			error : function(result) {
				layer.msg('网络连接超时,请您稍后重试.', 1, 5);
				parentLayer.close(_load);
		    }
		});
	}
	 
	  
</script>
</html>