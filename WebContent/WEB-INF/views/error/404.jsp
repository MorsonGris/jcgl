<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<% String path= request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-404</title>
    <link rel="shortcut icon" href="<%=path %>/static/proscenium/logo/favicon2.ico" /> 
	<link href="<%=path %>/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path %>/static/style/css/error.css" rel="stylesheet">
</head>
<body>
<div class="container">
<div class="row clearfix">
	<div class="col-md-12">
		<div class="row clearfix">
			<div class="col-md-12">
				<img alt="" src="<%=path %>/static/style/images/snail.jpg" class="img_404">
			</div>
		</div>
		
		<div class="row clearfix">
			<div class="col-xs-4" style="padding: 0;">
				<p class="reason_title">
					<span>可能原因:</span>
				</p>
			</div>
			<div class="col-xs-8" >
				<p class="reason">
					<img src="<%=path %>/static/style/images/bullet-grey.png">
					<span>网络信号差</span>
				</p>
				
				<p class="reason">
					<img src="<%=path %>/static/style/images/bullet-grey.png">
					<span>找不到请求页面</span>
				</p>
				<p class="reason">
					<img src="<%=path %>/static/style/images/bullet-grey.png">
					<span>输入的网址不正确</span>
				</p>
				
			</div>
		</div>
		<p class="error_return">
			<a href="javascript:void(0)" onclick="javascript:window.location.reload();" style="margin-right: 20%;">
				<img src="<%=path %>/static/style/images/refresh.png">刷新
			</a>
			<a href="javascript:void(0)" onclick="javascript:history.back(-1);">
				<img src="<%=path %>/static/style/images/return.png">返回
			</a>
		</p>
	</div>
</div>
</div>    
<script src="<%=path %>/static/proscenium/js/jquery.min.js"></script>
<script src="<%=path %>/static/proscenium/js/bootstrap.min.js"></script>
</body>
</html>