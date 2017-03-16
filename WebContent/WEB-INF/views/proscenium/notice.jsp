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
	<div class="row" style="margin-bottom: 20px;">
		<div class="col-xs-12">
			<table id="noticeTable" data-toggle="table"
			       data-url="queryBypages"
			       data-pagination="true"
			       data-locale="zh-CN"
			       data-side-pagination="server"
			       
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
			    	<th data-field="ntitle" data-align="left" data-sortable="false" >标题</th>
			    	<th data-field="ndate" data-align="center" data-formatter="dateFormatter" data-sortable="false" >时间</th>
			    	<th data-field="nid" data-align="center"  data-formatter="actionFormatter" data-events="actionEvents" data-sortable="false">操作</th>
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
<script type="text/javascript">
function actionFormatter(value, row, index) {
    return [
        '<a class="open ml10" href="javascript:void(0)" title="查看">',
        '<i class="glyphicon glyphicon-eye-open"></i>',
        '</a>'
    ].join('');
}
function dateFormatter(value) {
	var date = value.split("-")[0]+"/"+value.split("-")[1]+"/"+(value.split("-")[2]).split(" ")[0];
    return date
}
window.actionEvents = {
	'click .open': function (e, value, row, index) {
		window.location="${path}/notice/selectById?id="+value;
    }
}
</script>
</body>
</html>