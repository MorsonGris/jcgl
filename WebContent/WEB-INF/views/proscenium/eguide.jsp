<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" /> 
    <link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
<title>聚成教育-招生简章</title>
</head>
<body>
<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>

<img alt="" src="${path }/static/proscenium/images/eguide.jpg" style="width: 100%;">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-680011">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-about" data-toggle="tab">关于我们</a>
					</li>
					<li>
						 <a href="#panel-friends" data-toggle="tab">合作院校</a>
					</li>
					
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-about" style="margin-top: 20px;">
						<p style="text-indent: 20px;">
							赣州聚成教育以打造学历培训等全方位教育服务类网站为中心，
							为广大学员提供更专业、更贴心、更灵活、更高效、更优秀的学
							习与培训指导。聚成教育是以学业规划、成人教育、职业培训为
							主的民办教育机构，经过多年的摸索和努力，学校把“厚于德，诚
							于信，敏于行”作为学校校训，秉承“打造国内优秀教育品牌，用心
							服务好每位学生”的办学服务理念。
						</p>
						<p style="text-indent: 20px;">
							本校以成人高考、自学考试、远程教育、在职研究生及职业资格证
							书为办学主体，多年来深得当地教育主管部门、各合作高校以及社
							会各界的一致好评，连续多年被评为“先进集体”、“优秀单位”、“先
							进函授站”等荣誉称号。
						</p>
						<p style="text-indent: 20px;">
							目前，在赣州聚成教育顺利毕业的学生已达4千多人，上万余学员
							选择赣州聚成教育就读，我们的学员分布于社会各个阶层，针对不
							同需求的学员，制定全面客观的具体学习方案，提供优质、便捷的
							学习服务平台，解决学员在学习过程中的疑点、难点问题，真正让
							学员顺利稳定地学习、深造和提升学历，轻松实现找工作、升职、
							加薪、出国留学、评职称、考公务员、晋级和考研等愿望。
						</p>
					</div>
					<div class="tab-pane" id="panel-friends" style="margin-top: 20px;">
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s1">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s1.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s2">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s2.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s3">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s3.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s4">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s4.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s5">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s5.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s6">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s6.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s7">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s7.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s8">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s8.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s9">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s9.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s10">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s10.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s11">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s11.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s12">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s12.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s13">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s13.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s14">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s14.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s15">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s15.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s16">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s16.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s17">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s17.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s18">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s18.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="s19">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s19.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="s20">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s20.png">
							</a>
							</div>
							<div class="col-xs-4">
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
<jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>

<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!--	***********************************************  -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
</body>
</html>