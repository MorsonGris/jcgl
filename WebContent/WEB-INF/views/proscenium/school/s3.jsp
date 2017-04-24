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
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/3/school.jpg">
                    <h3>东华理工大学</h3>
                    <p style="text-indent: 20px;">涵盖法学 、行政管理 、会计学 、英语 、汉语言文学 、体育教育 、艺术设计学 、市场营销 、电子信息工程 、计算机科学与技术 、通信工程 、自动化 、资源勘查工程 、土木工程 、测绘工程广告学</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 东华理工大学位于著名的“才子之乡”——江西省抚州市，是江西省人民政府与工业和信息化部国防科技工业局（原国防科工委）共建的一所具有地学和核科学特色，以理工为主，文、管、经、法、教兼备的综合性大学。
					</p>
					<p style="text-indent: 20px;">	
						学校现有在校生29000余人（含留学生），是全国首批学士学位和第四批硕士学位授权单位。现有57个本科专业，其中11个国防军工专业、1个国防重点专业、1个国防紧缺专业、3个国家级特色专业、14个江西省品牌专业、8个省级特色专业，14个省部级重点学科，65个硕士点，有4个专业合作培养博士生，有10个领域的工程硕士学位授予权，具有在职人员以同等学历申请硕士学位授权资格。

                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/3/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/3/byz.jpg">
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