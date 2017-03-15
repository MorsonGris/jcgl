<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-聚成学习中心</title>
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" />
	<link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
	<link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
</head>
<body id="home">
<div class="wrapper">
	<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
	<header class="page-heading">
        <div class="carousel slide" id="carousel-133287" data-ride="carousel">
            <ol class="carousel-indicators">
                <li class="active" data-slide-to="0" data-target="#carousel-133287">
                </li>
                <li data-slide-to="1" data-target="#carousel-133287">
                </li>
                <li data-slide-to="2" data-target="#carousel-133287">
                </li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="" src="${path }/static/proscenium/images/banner.jpg" />
                    <div class="carousel-caption">
                            <h3>学历国家承认,网上可查</h3>
                    </div>
                </div>
                <div class="item">
                    <img alt="" src="${path }/static/proscenium/images/banner2.jpg" />
                    <div class="carousel-caption">
                        <h3>
                            在职大专，本科学历
                        </h3>
                    </div>
                </div>
                <div class="item">
                    <img alt="" src="${path }/static/proscenium/images/banner3.jpg" />
                    <div class="carousel-caption">
                        <h3>
                            名额有限，早报早录取
                        </h3>
                    </div>
                </div>
            </div> <a class="left carousel-control" href="#carousel-133287" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-133287" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
    </header>
    <div class="container">
        <div class="row clearfix" style="text-align: center;margin-top: 20px; color: #d58512;">
            <div class="col-xs-4">
                <a href="index/apply">
                    <img alt="80x80" src="${path }/static/proscenium/icon/flame.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">学生报名</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="home.html">
                    <img alt="80x80" src="${path }/static/proscenium/icon/compose.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">缴费查询</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="http://112.74.115.92/">
                    <img alt="80x80" src="${path }/static/proscenium/icon/briefcase.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">学籍查询</span>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px;">
            <div class="col-xs-4 column">
                <a href="http://www.jxck168.com/courseAction!listcatalog.action">
                    <img alt="80x80" src="${path }/static/proscenium/icon/computer.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">网上学习</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="https://www.baidu.com">
                    <img alt="80x80" src="${path }/static/proscenium/icon/arrow-up.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">上传文件</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="home.html">
                    <img alt="80x80" src="${path }/static/proscenium/icon/bookshelf.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">培训管理</span>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px;">
            <div class="col-xs-4 column">
                <a href="http://www.jxck168.com/web/newsAction!listMulti.action?msgTypeId=117">
                    <img alt="140x140" src="${path }/static/proscenium/icon/clipboard.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">招生简章</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="index/helper">
                    <img alt="80x80" src="${path }/static/proscenium/icon/clock.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">工作助手</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href = "JavaScript:void(0)" id="contact">
                    <img alt="80x80" src="${path }/static/proscenium/icon/phone.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">联系我们</span>
                </a>
            </div>
        </div>
        <div class="row" style="text-align: left;margin-top: 20px;margin-bottom: 20px;">
            <div class="col-xs-12 column">
                <div style="border-bottom: 1px solid #e0e0e0;">
                    <h3>最新动态<span style="margin-left: 35%"><a href="${path}/notice/selectMore">查看更多</a></span></h3>
                </div>
                <table class="table">
                    <tbody>
	                    <c:forEach items="${noticelist}" var="notice" varStatus="status">
	                    <tr>
	                        <td>
	                        	<a href="${path}/notice/selectById?id=${notice.NId}">${notice.NTitle }</a>
	                        </td>
                       		<td>
                          		<fmt:formatDate value="${notice.NDate }" pattern="yyyy/MM/dd"/>
                       		</td>
                    	</tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row" style="text-align: left;margin-bottom: 20px;">
            <div class="col-xs-12 column">
                <div style="border-bottom: 1px solid #e0e0e0; margin-bottom: 10px;">
                    <h3>热门专业</h3>
                </div>
                <c:forEach var="major" items="${major}">
                	 <div class="col-md-6">
                        <div class="thumbnail">
                            <img alt="300x200" style="width:" src="${path }/static/proscenium/images/${major.hmPicture}" />
                            <div class="caption">
                                <h4>
                                   	<b>${major.hmTitle}</b>
                                </h4>
                                <p>
                                	&nbsp;&nbsp;&nbsp;&nbsp;${major.hmContent}
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
     </div>
     <!--  -->
     <jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
</div>
<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!--	**************************************************  -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
<script type="text/javascript">
//防止页面后退
history.pushState(null, null, document.URL);
window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL);
});
</script>
</body>
</html>