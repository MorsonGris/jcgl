<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-公告内容</title>
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" /> 
    <link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
    <div class="container">
        <!-- <div class="row clearfix" style="margin: 20px;">
           
        </div> -->
        <div class="easyui-layout" data-options="fit:true,border:false">
		<table id="noticelist" class="easyui-datagrid" toolbar="#tb" data-options="
			url:'${path}/notice/dataGrid',
			method:'post', 
			rownumbers:true,
			singleSelect:true,
			autoRowHeight: true,
			pagination:true,
			border:false,
			pageSize:5" style="height:200px;">
			<thead>
				<tr>
					<th field="nid" hidden="学生编号" width="100"></th>
					<th field="ntitle" width="100">标题</th>
					<th field="ndate"  width="130">时间</th>
				</tr>
			</thead>
		</table>
		</div>
    </div>
    <jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
</div>
<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!-- ************************************************* -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js" ></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>