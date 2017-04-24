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
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/8/school.jpg">
                    <h3>江西广播电视大学</h3>
                    <p style="text-indent: 20px;">创建于1979年1月，是经江西省人民政府批准创办的直属高校，主要运用广播、电视、文字教材、音像教材和计算机课件及网络等多种媒体进行现代远程开放教育的新型高等学校</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 创建于1979年1月，是经江西省人民政府批准创办的直属高校，主要运用广播、电视、文字教材、音像教材和计算机课件及网络等多种媒体进行现代远程开放教育的新型高等学校，自办学以来，学校先后开设了60个科类专业，开设课程340多门。今天，江西广播电视大学已形成了具有中国特色的现代远距离教育系统和模式，截止2012年底，全省各类学历教育在校生111976人，其中开放教育89791人，高职教育4354人，网络教育10332人，自考3379人，成人大专1439人，中专教育2681人。在校生规模和年度招生规模位居全国省级电大前列。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/8/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/8/byz.jpg">
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