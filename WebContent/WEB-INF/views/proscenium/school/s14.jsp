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
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/14/school.jpg">
                    <h3>南昌师范学院</h3>
                    <p style="text-indent: 20px;">省属普通高等师范本科院校，2013年由江西教育学院改制而成。该校是江西省最早举办的八所本科高校之一</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 南昌师范学院属普通高等师范本科院校，2013年由江西教育学院改制而成。该校是江西省最早举办的八所本科高校之一，前身是成立于1952年的江西省中等师资进修学校，1956年更名为南昌师范专科学校，1958年创办江西教育学院，江西省第一任省长邵式平为学院亲笔题写了校名。学院学习环境优美、教学风气优良、学术氛围浓郁、文化品位高雅，现有青山湖、昌北两个校区，各类在籍学生近2万人。61年来，为社会培养、培训各类专门人才16万余人。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/14/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/14/byz.jpg">
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