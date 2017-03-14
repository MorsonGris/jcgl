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
<<<<<<< Updated upstream
                <a href="adult">
                    <img alt="80x80" src="${path }/static/proscenium/icon/rocket.png" class="img-circle apply-ico" />
=======
                <a href="adult?id=${user.id }">
                    <img alt="80x80" src="${path }/static/proscenium/icon/clock.png" class="img-circle apply-ico" />
>>>>>>> Stashed changes
                    <br>
                    <span class="home_operation">成人教育<br>报名</span>
                </a>
            </div>
            <div class="col-xs-4 column">
<<<<<<< Updated upstream
                <a href="accountant">
                    <img alt="80x80" src="${path }/static/proscenium/icon/rulertriangle.png" class="img-circle apply-ico" />
=======
                <a href="accountant?id=${user.id }">
                    <img alt="80x80" src="${path }/static/proscenium/icon/compose.png" class="img-circle apply-ico" />
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                <a href="nation">
                    <img alt="80x80" src="${path }/static/proscenium/icon/cloud.png" class="img-circle apply-ico" />
=======
                <a href="nation?id=${user.id }">
                    <img alt="80x80" src="${path }/static/proscenium/icon/flame.png" class="img-circle apply-ico" />
>>>>>>> Stashed changes
                    <br>
                    <span>国家开放<br>报名</span>
                </a>
            </div>
            <div class="col-xs-4 column">
<<<<<<< Updated upstream
                <a href="art">
                    <img alt="80x80" src="${path }/static/proscenium/icon/trophy.png" class="img-circle apply-ico" />
=======
                <a href="art?id=${user.id }">
                    <img alt="80x80" src="${path }/static/proscenium/icon/phone.png" class="img-circle apply-ico" />
>>>>>>> Stashed changes
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
        <div class="row" style="text-align: center;margin-bottom: 20px; margin-top: 20px;">
         <div class="col-xs-12 column">
             <div style="border-bottom: 2px solid #e0e0e0; margin-bottom: 10px;">
                 <h3>聚成教育，助你平步青云！</h3>
             </div>
			<div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="${path }/static/proscenium/images/study.jpg" />
                            <div class="caption">
                                <h4>
          							学习
                                </h4>
                                <p>
                                	“聚成教育”是让各种学生成功就业的学习平台，学历终身可查，
                                	保证学生的就业，月拿高薪不是梦！
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="${path }/static/proscenium/images/test.jpg" />
                            <div class="caption">
                                <h4>
                                    考试
                                </h4>
                                <p>
                                   还在为自己拿不到高的学历而发愁？这里有专业的老师，
                                   对你进行一对一的辅导。让你逢考必过，轻松愉悦高学历！
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="${path }/static/proscenium/images/certificate.jpg" />
                            <div class="caption">
                                <h4>
                                    拿证
                                </h4>
                                <p>
                                    毕业证书国家承认，学信网可查，公司认可。让你职场
                                    上优先坐上好职位！
                                </p>
                            </div>
                        </div>
                    </div>

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