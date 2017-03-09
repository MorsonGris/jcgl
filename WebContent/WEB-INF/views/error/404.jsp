<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<% String path= request.getContextPath(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>404-资源未找到</title>
        <link rel="shortcut icon" href="<%=path %>/static/proscenium/logo/favicon2.ico" /> 
	    <link href="<%=path %>/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
	    
	    <link href="<%=path %>/static/style/css/error.css" rel="stylesheet">
    </head>
    <body>
    <div class="container">
    		<div class="row">
    			<img alt="" src="<%=path %>/static/style/images/404png.png" class="img_404">
    			<p class="error">很抱歉 ,未能找到你访问的页面！</p>
    			<p>
    				<a href="index" type="button" class="btn btn-lg btn-warning" >返回首页</a>
    				<button type="button" class="btn btn-lg btn-warning" onclick="javascript:history.back(-1);">返回上一页</button>
    			</p>
    		</div>
    </div>
        
        <script src="<%=path %>/static/proscenium/js/jquery.min.js"></script>
		<script src="<%=path %>/static/proscenium/js/bootstrap.min.js"></script>
    </body>
</html>