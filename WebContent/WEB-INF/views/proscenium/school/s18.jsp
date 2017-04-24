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
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/18/school.jpg">
                    <h3>西北工业大学</h3>
                    <p style="text-indent: 20px;">西北工业大学，简称“西工大”，位于古都西安，是中华人民共和国工业和信息化部直属的一所航空、航天、航海工程为特色。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 西北工业大学，简称“西工大”，位于古都西安，是中华人民共和国工业和信息化部直属的一所航空、航天、航海工程为特色。工、理为主，管、文、经、法协调发展的研究型、多科性、开放试全国重点大学，是国家“985”、“211工程”重点建设高校，入选“2011计划”、“111计划”、“卓越工程师教育培养计划”，是“卓越大学联盟”、“中俄工科大学联盟”成员，中管副部级建制，设有研究生院。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/18/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/18/byz.jpg">
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