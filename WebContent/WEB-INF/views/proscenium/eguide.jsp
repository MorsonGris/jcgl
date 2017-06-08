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
							<div class="col-xs-12">
								<c:forEach var="eguidelist" items="${eguidelist}" varStatus="status">
									<p style="float:left;width: 33%;">
										<a href="s1?id=${eguidelist.id}">
											<img alt="" style="width: 90%" src="${path }/static/proscenium/images/${eguidelist.log}">
										</a>
									</p>
								</c:forEach>
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