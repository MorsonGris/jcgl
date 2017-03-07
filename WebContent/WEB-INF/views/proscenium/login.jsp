<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path =request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="<%=path %>/static/proscenium/logo/favicon2.ico" /> 
    <link href="<%=path %>/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path %>/static/proscenium/css/style.css" rel="stylesheet">
<title>聚成教育-登录</title>
</head>
<body>
<div class="container">
	<div class="row">
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
<script src="<%=path %>/static/proscenium/js/jquery.min.js"></script>
<script src="<%=path %>/static/proscenium/js/bootstrap.min.js"></script>
</body>
</html>