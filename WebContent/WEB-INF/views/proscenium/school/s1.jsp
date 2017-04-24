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
	    		<div>
					<div id="s1" style="margin-top: 20px;margin-bottom: 10px;">
						<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/1/school.jpg">
	                    <h3>北京外国语大学</h3>
	                    <p style="text-indent: 20px;">北京外国语大学，简称北外，由中华人民共和国教育部直属，位列国家首批“211工程”，入选“985工程优势学科创新平台”、“2011计划”</p>
	                </div>
	                <div style="margin-bottom: 40px;">
	                    <h3>学校简介</h3>
	                    <p style="text-indent: 20px;">
	                   		 北京外国语大学（Beijing Foreign Studies University），简称北外，由中华人民共和国教育部直属，位列国家首批“211工程”，入选“985工程优势学科创新平台”、“2011计划”，为财政部6所“小规模试点高校“之一，国际大学翻译学院联合会成员，设有研究生院，是中国外国语类高等院校中历史悠久、教授语种最多、办学层次齐全的全国重点大学，被誉为“共和国外交官摇篮”。
	    				</p>
	    				<p style="text-indent: 20px;">
	    					北京外国语大学前身是1941年成立于延安的中国人民抗日军事政治大学三分校俄文大队，后发展为延安外国语学校，建校始隶属于中国共产党领导。新中国成立后，学校归外交部领导。1954年，更名为北京外国语学院；1959年，与北京俄语学院合并组建新的北京外国语学院。1980年后直属国家教育部领导。1994年，正式更名为北京外国语大学。
	
	                    </p>
	                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/1/zy.png">
	                	
	                </div>
	                <div style="margin-bottom: 20px;">
	                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
	                    <h4>毕业证样本：</h4>
	                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/1/byz.jpg">
	                </div>
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