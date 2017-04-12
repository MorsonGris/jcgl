<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-网上学习</title>
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" />
	<link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
	<link href="${path }/static/proscenium/css/style.css" rel="stylesheet">

</head>
<body>
<div class="wrapper">
    <jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
    <%-- <div><img src="${path }/static/proscenium/images/learn.jpg" width="100%"></div> --%>
    <div class="container">
        <div class="row clearfix" style="text-align: center;margin-top: 20px; color: #d58512;">
            <div class="col-xs-4 column">
                <a href="http://www.jxck168.com/web/kaochang.jsp">
                    <img alt="80x80" src="${path }/static/proscenium/images/xin.jpg" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">聚成模拟考场</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="http://degree.qingshuxuetang.com/dhlg/Home?schoolCategory=1">
                    <img alt="80x80" src="${path }/static/proscenium/images/sciences.jpg" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">东华理工学习平台 </span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="http://degree.qingshuxuetang.com/gnnu/Majors">
                    <img alt="80x80" src="${path }/static/proscenium/images/Gannan.jpg" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">赣南师范学习平台</span>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px; color: #d58512;">
        	<div class="col-xs-4 column">
                <a href="http://degree.qingshuxuetang.com/jxzyy/">
                    <img alt="80x80" src="${path }/static/proscenium/images/medicine.jpg" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">江西中医药学习平台</span>
                </a>
            </div>
        	<div class="col-xs-4 column">
                <a href="http://degree.qingshuxuetang.com/jxsf/Home">
                    <img alt="80x80" src="${path }/static/proscenium/images/Jiangxi.jpg" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">江西师范学习平台</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="http://degree.qingshuxuetang.com/jxstnu/Home?schoolCategory=1">
                    <img alt="80x80" src="${path }/static/proscenium/images/jxkjsf.jpg" class="img-rounded apply-ico"/>
                    <br>
                    <span class="home_operation">江西科技师范大学</span>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px; color: #d58512;">
        	<div class="col-xs-4 column">
                <a href="http://degree.qingshuxuetang.com/jgs/Home?schoolCategory=1">
                    <img alt="80x80" src="${path }/static/proscenium/images/jgslogo.jpg" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">井冈山大学</span>
                </a>
            </div>
            <div class="col-xs-4 column"></div>
            <div class="col-xs-4 column"></div>
        </div>
    </div>
    <jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
    
</div>
<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!--	*******************************************************  -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
</body>
</html>