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
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/5/school.jpg">
                    <h3>赣南医学院</h3>
                    <p style="text-indent: 20px;">赣南医学院是江西省唯一独立设置的普通高等本科医学院，坐落在江西南部、京九铁路线上的历史文化名城---赣州市内。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 江西省唯一独立设置的普通高等本科医学院，坐落在江西南部、京九铁路线上的历史文化名城---赣州市内。中国科学院院士韩济生教授担任名誉院长。学校创办于1941年，先后经历了江西省赣县高级助产职业学校、江西省赣县高级医事职业学校、江西省赣州护士助产学校、江西省赣州卫生学校等时期；1958年8月建立赣南医学专科学校，1988年4月升格为赣南医学院并开始招收本科生。1997年通过教育部本科教学工作合格评估，2007年获教育部普通高等学校本科教学工作水平评估优良成绩。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/5/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/5/byz.jpg">
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