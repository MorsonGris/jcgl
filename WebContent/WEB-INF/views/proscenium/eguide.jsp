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
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
<title>招生管理公共平台-招生简章</title>
</head>
<body>
<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-680011">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-friends" data-toggle="tab">合作院校</a>
					</li>
					
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-friends" style="margin-top: 20px;">
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s1">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s1.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s2">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s2.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s3">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s3.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s4">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s4.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s5">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s5.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s6">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s6.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s7">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s7.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s8">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s8.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s9">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s9.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s10">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s10.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s11">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s11.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s12">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s12.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s13">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s13.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s14">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s14.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s15">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s15.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s16">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s16.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s17">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s17.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s18">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s18.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s19">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s19.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s20">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s20.png">
							</a>
							</div>
							<div class="col-xs-4">
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
<jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>

<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!--	***********************************************  -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
</body>
</html>