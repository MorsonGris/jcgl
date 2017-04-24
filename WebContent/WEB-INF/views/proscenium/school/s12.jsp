<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>招生管理公共平台-学院简介</title>
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" />
	<link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
	<link href="${path }/static/proscenium/css/style.css" rel="stylesheet">

</head>
<body>
<div class="wrapper">
    <jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
    <div class="container">
	    <div class="row">
			<div class="col-md-12">
	    		<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/12/school.jpg">
                    <h3>井冈山大学</h3>
                    <p style="text-indent: 20px;">井冈山大学是一所全日制多科性普通高等本科学校。学校位于革命摇篮井冈山所在地——江西省吉安市中心城区，占地面积2554亩，校舍建筑面积52.74万平方米。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		井冈山大学是一所全日制多科性普通高等本科学校。学校位于革命摇篮井冈山所在地——江西省吉安市中心城区，占地面积2554亩，校舍建筑面积52.74万平方米。教学科研设备总值9036.81万元，图书馆藏书130余万册，拥有外文数据库、光盘数据库、试用数据库等各类数据库17个，拥有电子图书28.45万册。现有全日制在校本专科学生1.7万余人，其中本科生9000余人，外国留学生193人，各类成人教育学生1万余人。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/12/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/12/byz.jpg">
                </div>
			</div>
		</div>
	</div>
    <jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
    
</div>
<!--	*******************************************************  -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
</body>
</html>