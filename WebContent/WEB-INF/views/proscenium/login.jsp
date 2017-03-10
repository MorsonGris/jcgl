<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" /> 
    <link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
<title>聚成教育-登录</title>
</head>
<body>
<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
<div class="container">
	<div class="row" style="margin: 20px;">
		<div class="col-xs-12">
			<form role="form">
				<div class="form-group">
					 <input type="email" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					 <input type="password" class="form-control" id="exampleInputPassword1" />
				</div>
				
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</div>
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js"></script>
</body>
</html>