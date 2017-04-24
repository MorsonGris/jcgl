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
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/2/school.jpg">
                    <h3>电子科技大学</h3>
                    <p style="text-indent: 20px;">电子科技大学简称电子科大，坐落于有“天府之国”之称的成都市，由中华人民共和国教育部直属，位列“211工程”、“985工程”，入选国家“2011计划”、“111计划”、“卓越工程师教育培养计划”</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 电子科技大学（University of Electronic Science and Technology of China）简称电子科大，坐落于有“天府之国”之称的成都市，由中华人民共和国教育部直属，位列“211工程”、“985工程”，入选国家“2011计划”、“111计划”、“卓越工程师教育培养计划”，两电一邮成员，设有研究生院，是一所以电子信息科学技术为核心的全国重点大学，被誉为“中国电子类院校的排头兵”。
    				</p>
    				<p style="text-indent: 20px;">
    					电子科技大学原名成都电讯工程学院，是1956年在周恩来总理的亲自部署下，由交通大学（现上海交通大学、西安交通大学）、南京工学院（现东南大学）、华南工学院（现华南理工大学）的电讯工程有关专业合并创建而成。1960年，被中共中央列为全国重点高等学校；1961年，被中共中央确定为七所国防工业院校之一。1988年，更名为电子科技大学。1997年，被确定为国家首批“211工程”建设的重点大学。2000年，由原信息产业部主管划转为教育部主管。2001年，进入国家“985工程”重点建设大学行列。

                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/2/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/2/byz.jpg">
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