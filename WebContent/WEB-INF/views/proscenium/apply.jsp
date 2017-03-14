<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-学生报名</title>
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" />
	<link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
	<link href="${path }/static/proscenium/css/style.css" rel="stylesheet">

</head>
<body>
<div class="wrapper">
    <jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
    <div class="container">
        <div class="row clearfix" style="text-align: center;margin-top: 20px; color: #d58512;">
            <div class="col-xs-4 column">
                <a href="adult">
                    <img alt="80x80" src="${path }/static/proscenium/icon/rocket.png" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">成人教育<br>报名</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="accountant">
                    <img alt="80x80" src="${path }/static/proscenium/icon/rulertriangle.png" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">会计培训<br>报名</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="profession">
                    <img alt="80x80" src="${path }/static/proscenium/icon/document.png" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">职业培训<br>报名</span>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px;">
            <div class="col-xs-4 column">
                <a href="nation">
                    <img alt="80x80" src="${path }/static/proscenium/icon/cloud.png" class="img-circle apply-ico" />
                    <br>
                    <span>国家开放<br>报名</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="art">
                    <img alt="80x80" src="${path }/static/proscenium/icon/trophy.png" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">艺考培训<br>报名</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="teacher">
                    <img alt="140x140" src="${path }/static/proscenium/icon/hotair.png" class="img-circle apply-ico" />
                    <br>
                    <span class="home_operation">教师资格<br>证报名</span>
                </a>
            </div>
        </div>
        <div class="row" style="text-align: center;margin-bottom: 20px;">
         <div class="col-xs-12 column">
             <div style="border-bottom: 1px solid #e0e0e0; margin-bottom: 10px;">
                 <h4>还在为学历低烦恼吗？</h4>
                 <h4>聚成教育，助你平步青云！</h4>
             </div>

         </div>
     </div>
    </div>
    
    <jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include> 
</div>
<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!-- ****************************************** -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
</body>
</html>