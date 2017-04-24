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
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/7/school.jpg">
                    <h3>华南师范大学</h3>
                    <p style="text-indent: 20px;">华南师范大学（South China Normal University），简称“华师”，坐落于南方名城广州市，由中华人民共和国教育部和广东省人民政府共建，入选中国首批“211工程”、“卓越教师培养计划”，为广东省省属重点大学、中国100 所首批联入CERNET和INTERNET网的高等院校之一。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 华南师范大学（South China Normal University），简称“华师”，坐落于南方名城广州市，由中华人民共和国教育部和广东省人民政府共建，入选中国首批“211工程”、“卓越教师培养计划”，为广东省省属重点大学、中国100 所首批联入CERNET和INTERNET网的高等院校之一。
					</p>
					<p style="text-indent: 20px;">	
						华南师范大学始建于1933年，前身是当代著名教育家林砺儒先生创建的广东省立勷勤大学师范学院；1982年10月，易名为华南师范大学；2006年，学校通过“十五”“211工程”建设整体验收。2004年，原中共中央总书记、国家主席胡锦涛出席澳门回归五周年庆典期间，称该校是中国数家名牌师范大学之一。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/7/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/7/byz.jpg">
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