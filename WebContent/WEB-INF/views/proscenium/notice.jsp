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
    <link rel="stylesheet" href="${path }/static/proscenium/plugin/bootstrap-tables/bootstrap-table.min.css" />
    <link href="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
<title>聚成教育-公告栏</title>
</head>
<body>
<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
<div class="container">
	<div class="row" style="margin: 20px;">
		<div class="col-xs-12">
			<table id="priceTable" data-toggle="table"
			       data-url="price/queryBypages.do?p_room=${currentUser.u_ck}"
			       data-pagination="true"
			       data-locale="zh-CN"
			       data-side-pagination="server"
			       data-page-list="[5, 10, 20, 50, 100, 200]"
			       data-toolbar="#toolbar"
			       data-search="true"
			       data-show-refresh="true"
			       data-show-toggle="true"
			       data-show-columns="true"
			       data-show-export="true" 
			       data-minimum-count-columns="2" 
			       data-id-field="id" 
			       data-show-footer="false"
			       data-row-style="rowStyle"
			       >
			    <thead>
			    <tr>
			    	<!-- <th data-field="p_id" data-align="center" >编号</th> -->
			        <!-- <th data-field="p_id" data-align="center" data-sortable="true" >编号</th> -->
			        <th data-field="p_room" data-align="center" data-sortable="false" >仓库</th>
			        <th data-field="p_state" data-align="center" data-formatter="stateFormatter" data-sortable="false">状态</th>
			        <th data-field="p_are" data-align="center" data-sortable="false">地区</th>
					<th data-field="p_start" data-align="center" data-sortable="false">起步价(单位:￥)</th>
					<th data-field="p_weight" data-align="center" data-sortable="false">首重(单位:kg)</th>
					<th data-field="p_perc" data-align="center" data-sortable="false">续重价格(单位:￥)</th>
					<th data-field="p_id" data-align="center"  data-formatter="actionFormatter" data-events="actionEvents" data-sortable="false">操作</th>
			    </tr>
			    </thead>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>

<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!--	***********************************************************  -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-tables/bootstrap-table.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-tables/bootstrap-table-zh-CN.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
</body>
</html>