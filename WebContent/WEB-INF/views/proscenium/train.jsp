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
<title>聚成教育-项目培训</title>
</head>
<body>
	<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
	<div>
		<img alt="" src="${path }/static/proscenium/images/640.jpg" width="100%">
	</div>
	<div class="container">
	<div class="row" style="margin: 10px;font-size: 16px;">
		<div class="col-md-12">
			<p style="text-indent: 20px;">
			职业资格证即职业资格证书，是表明劳动者具有从事某一职业所必备的学识和技能的证明。它是劳动者求职、任职、开业的资格凭证，是用人单位招聘、录用劳动者的主要依据，也是境外就业、对外劳务合作人员办理技能水平公证的有效证件。
			</p>
			<p style="text-indent: 20px;">
			很多职业都要求任职者具备职业资格证，这是对任职者专业基础掌握程度的检验和实践能力证明，确保企事业单位员工的办公能力和对专业知识的掌握层度。
			</p>
			<img alt="" src="${path }/static/proscenium/images/500.jpg" width="100%">
			<p style="text-indent: 20px;">
				2016年12月16日，人力资源和社会保障部公示了国家职业资格目录清单，拟列入职业资格目录清单151项。除此之外，在总理力推下，从2014年至今，国务院部门设置的职业资格许可和认定事项已实现“七连消”，累计占到总数70%以上。
			</p>
			<div style="margin-top: 40px;text-align: center;">
				<p style="color: red;font-size: 18px;">聚成教育培训机构现已开启职业技能培训</p>
				<p style="font-size: 16px;">抓紧报名，考取职业技能培训证书</p>
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
</body>
</html>