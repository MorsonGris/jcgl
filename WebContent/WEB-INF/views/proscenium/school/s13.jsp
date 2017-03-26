<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-学院简介</title>
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
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/13/school.jpg">
                    <h3>九江学院</h3>
                    <p style="text-indent: 20px;">九江学院是经国家教育部批准设立的国有公办全日制本科普通高等院校, 办学历史可上溯至1901年由美国基督教卫理公会创办的但福德学校。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
              		 	九江学院是经国家教育部批准设立的国有公办全日制本科普通高等院校, 办学历史可上溯至1901年由美国基督教卫理公会创办的但福德学校。学校位于庐山之麓、鄱阳湖之畔，占地2850多亩，现有五个校区，设有1所直辖“三级甲等”医院。
　　					</p>
					<p style="text-indent: 20px;">
						学校现有专任教师1900余人，副高以上830余人，博士230余人;研究生导师70余人;赣鄱英才555工程3人;国务院特殊津贴和省政府特殊津贴10人;江西省高校学科带头人和青年骨干教师44人;江西省高校名师6人;江西省“百千万人才工程”14人。
　　					</p>
					<p style="text-indent: 20px;">
						学校现有21个二级学院。设有经济学、法学、教育学、文学、理学、工学、农学、医学、管理学等十一大学科门类，涵盖82个本科专业。有35个国家级、省级“质量工程”项目;86个国家级、省级“本科教学工程”项目;10个省级重点学科，并设立了“流域管理与生态保护”博士后科研工作站和杨叔子院士工作站。2015年，学校完成的课题成果获江西省政府自然科学二等奖。
　　					</p>
					<p style="text-indent: 20px;">
						学校建有庐山文化研究中心、鄱阳湖生态经济研究中心、沿江产业开发研究中心、社会系统学研究中心、数控技术研究所等32个科研机构。2015年，学校获得国家自然科学基金和社会科学基金项目27项，各类科研项目经费达3000多万元。
　　					</p>
					<p style="text-indent: 20px;">
						学校现有各类实验教学中心/综合实验室28个。其中，5个省级重点实验室/工程中心，5个省级实验教学示范中心、2个省高校人文社科重点研究基地。有37个中央与地方共建实验室、中央与地方共建特色优势学科实验室。现有教学科研仪器设备总值2.27亿元。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/13/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/13/byz.jpg">
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