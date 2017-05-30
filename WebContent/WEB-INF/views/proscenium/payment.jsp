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
    <link rel="stylesheet" href="${path }/static/proscenium/plugin/bootstrap-tables/bootstrap-table.min.css" />
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
<title>招生管理公共平台-缴费查询</title>
</head>
<body>
	<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
	<div class="container" style="height:640px;margin-bottom: 10px;">
	<div class="row">
		<div class="col-xs-12">
			<div id="prints" class="col-xs-12" style="font-size: 14px;">
				<table id="noticeTable" data-toggle="table"
					   data-url="${path}/finance/financepage?stuno=${stu.studentNo}&teaid=${user.id}"
				       data-pagination="true"
				       data-locale="zh-CN"
				       data-side-pagination="server"
				       data-page-number="1"
				       data-page-size="5"
				       data-page-list="[5, 10, 15, 20, 25, 30]"
				       data-toolbar="#toolbar"
				       data-show-refresh="true"
				       data-show-toggle="false"
				       data-show-columns="true"
				       data-show-export="true" 
				       data-minimum-count-columns="2" 
				       data-id-field="f_id" 
				       data-show-footer="true"
				       data-row-style="rowStyle">
				    <thead>
				    <tr>
				    	<th data-field="student.sname" data-align="left" data-footer-formatter="汇总" data-sortable="false" >姓名</th>
				    	<th data-field="student.idNumber" data-align="left" data-sortable="false" >身份证号</th>
				    	<th data-field="student.academyId" data-align="left" data-sortable="false" >报考学校</th>
				    	<th data-field="student.scontent" data-align="left" data-sortable="false" >专业</th>
				    	<th data-field="student.sgradations" data-align="left" data-sortable="false" >层次</th>
				    	<th data-field="student.ssystme" data-align="left" data-sortable="false" >学制</th>
				    	<th data-field="fobligate" data-align="left" data-footer-formatter="sumFormatter" data-sortable="false" >学期</th>
				    	<th data-field="practicalMoney" data-align="left" data-footer-formatter="sumFormatter" data-sortable="false" >金额</th>
				    	<th data-field="user.name" data-align="left" data-sortable="false" >班主任</th>
				    	<th data-field="fdate" data-align="center" data-formatter="dateFormatter" data-sortable="false" >缴费时间</th>
				    </tr>
				    </thead>
				</table>
			</div>
			<div>
				<!-- <span>总金额:2342</span> -->
				<button type="submit" class="btn btn-primary btn-sm" onclick="windowprint();">
				<span class="glyphicon glyphicon-print"></span>
				打印</button>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
	<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>

	<script src="${path }/static/proscenium/js/jquery.min.js"></script>
	<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
	<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js"></script>
	<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
	<script src="${path }/static/proscenium/js/app.js"></script>
	<script src="${path }/static/proscenium/plugin/bootstrap-tables/bootstrap-table.min.js"></script>
	<script src="${path }/static/proscenium/plugin/bootstrap-tables/bootstrap-table-zh-CN.min.js"></script>
<script>
function sumFormatter(data) {
    field = this.field;
    return data.reduce(function(sum, row) { 
        return sum + (+row[field]);
    }, 0);
}
function dateFormatter(value) {
	if(value!=null){
		var date = value.split("-")[0]+"/"+value.split("-")[1]+"/"+(value.split("-")[2]).split(" ")[0];
	    return date
	}
} 

function windowprint() {
	var headstr = "<html><head><title></title></head><body>";  
	var footstr = "</body>";
	var printDatad = document.getElementById("prints").innerHTML; 
	var oldstr = document.body.innerHTML;  
	document.body.innerHTML = headstr+printDatad+footstr; 
	window.print();  
	document.body.innerHTML = oldstr; 
	return false;
	
	/* var f = document.getElementById('print').innerHTML;
	window.print();
	location.reload([true]); */
}
</script>
</body>
</html>