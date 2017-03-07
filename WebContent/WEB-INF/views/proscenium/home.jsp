<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%	String	path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信考网-主页</title>
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" />
   	<!-- main	CSS	start	-->
   		<link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
   	<!-- main	CSS	end	-->
   	<!-- plug-in	CSS	start	-->
   	<!-- plug-in	CSS	end	-->
   	<!-- custom	CSS	start	-->
   		<link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
   	<!-- custom	CSS	end	-->
    
    <style>
       .float{
            width:80px;
            height:160px;
            text-align: right;
            overflow:hidden;
            position:absolute;
            right:0;
            top:80px;
        }
        /* .black_overlay{
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=88);
        } */
        .white_content {
            display: none;
            position: absolute;
            top: 9%;
            left: 5%;
            width: 80%;
            height: 50%;
            border: 1px solid #999999;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
</head>
<body id="home">
<div class="wrapper">

<nav class="navbar navbar-default navbar-fixed-top navbar-top" role="navigation">
        <div class="container">
            <div class="navbar-header">

                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home.html"  style="padding: 0 0;margin-left: 10px;width:60%;">
                <img alt=""  src="${path }/static/proscenium/logo/logo5.png" style="width:100%;">
                </a>
            </div>


            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <a href="index">首页</a>
                    </li>
                    <li>
                        <a href="help.html">我的账户</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
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
                    <img alt="" src="<%=path %>/static/proscenium/images/banner.jpg" />
                    <div class="carousel-caption">
                            <h3>学历国家承认,网上可查</h3>
                    </div>
                </div>
                <div class="item">
                    <img alt="" src="<%=path %>/static/proscenium/images/banner2.jpg" />
                    <div class="carousel-caption">
                        <h3>
                            在职大专，本科学历
                        </h3>
                    </div>
                </div>
                <div class="item">
                    <img alt="" src="<%=path %>/static/proscenium/images/banner3.jpg" />
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
                    <img alt="80x80" src="<%=path %>/static/proscenium/icon/flame.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">学生报名</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/icon/compose.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">缴费查询</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/icon/briefcase.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">学籍查询</span>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px;">
            <div class="col-xs-4 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/icon/computer.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">网上学习</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="https://www.baidu.com">
                    <img alt="80x80" src="<%=path %>/static/proscenium/icon/arrow-up.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">上传文件</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/icon/bookshelf.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">培训管理</span>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px;">
            <div class="col-xs-4 column">
                <a href="eguide">
                    <img alt="140x140" src="<%=path %>/static/proscenium/icon/clipboard.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">招生简章</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/icon/clock.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">工作助手</span>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href = "JavaScript:void(0)" id="phone">
                    <img alt="80x80" src="<%=path %>/static/proscenium/icon/phone.png" class="img-circle home-ico" />
                    <br>
                    <span class="home_operation">联系我们</span>
                </a>
            </div>
        </div>
        <div class="row" style="text-align: left;margin-top: 20px;margin-bottom: 20px;">
            <div class="col-xs-12 column">
                <div style="border-bottom: 1px solid #e0e0e0;">
                    <h3>最新动态<span style="margin-left: 35%"><a href="#">查看更多</a></span></h3>
                </div>
                <table class="table">
                    <tbody>
                    <tr>
                        <td>
                            信考网为江西应用技术职业学院新增1000名同学
                        </td>
                        <td>
                            2017/2/20
                        </td>
                    </tr>
                    <tr>
                        <td>
                            江西应用技术职业学院和信考网确立合作关系
                        </td>
                        <td>
                            2017/2/17
                        </td>
                    </tr>
                    <tr>
                        <td>
                            信考网即时更新，于2月15号重启
                        </td>
                        <td>
                            2017/2/14
                        </td>
                    </tr>
                    <tr>
                        <td>
                            200个同学通过信考网进入自己喜欢的专业
                        </td>
                        <td>
                            2017/2/10
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row" style="text-align: left;margin-bottom: 20px;">
            <div class="col-xs-12 column">
                <div style="border-bottom: 1px solid #e0e0e0; margin-bottom: 10px;">
                    <h3>热门专业<span style="margin-left: 35%"><a href="#">查看更多</a></span></h3>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="<%=path %>/static/proscenium/images/computer.jpg" />
                            <div class="caption">
                                <h4>
                                    软件技术
                                </h4>
                                <p>
                                   本专业培养具有一定的理论知识，掌握至少一种主流软件开发平台，具有较强编程能力的高级实用型专业人才。该专业毕业的学生拥有庞大的就业市场，具有广阔的就业前景。
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="<%=path %>/static/proscenium/images/kj5.jpg" />
                            <div class="caption">
                                <h4>
                                    会计学
                                </h4>
                                <p>
                                   该专业培养具备管理、经济、法律和会计学等方面的知识和能力，能在企、事业单位及政府部门从事会计实务以及教学、科研方面工作的工商管理学科高级专门人才。
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="<%=path %>/static/proscenium/images/qx.jpg" />
                            <div class="caption">
                                <h4>
                                    汽车维修
                                </h4>
                                <p>
                                    汽车维修是适应社会发展的需要，随着中国社会的发展，汽车数量的增加，汽车维修人员的缺乏，需要一批，专业强，素质高的维修人员。汽车维修作为教育部实施的技能紧缺人才培养工程重点之一，全国人才需求量30多万。
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="<%=path %>/static/proscenium/images/ds.jpg" />
                            <div class="caption">
                                <h4>
                                    电子商务
                                </h4>
                                <p>
                                   培养商务、营销等专业技术人才，毕业后从事相关的商务、计算机应用与操作技术或管理工作。如市场预测、业务洽谈、商品验收、推销、展销等。
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="<%=path %>/static/proscenium/images/hkly.jpg" />
                            <div class="caption">
                                <h4>
                                    航空旅游
                                </h4>
                                <p>
                                    培养熟练掌握民航服务理论和基本技能，为客户提供高品位、高质量服务，具有较强公关能力与协调能力、灵活应变能力的航空服务人才。毕业后就业于各大航空公司空乘或地面服务岗位。
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="<%=path %>/static/proscenium/images/wlgl.jpg" />
                            <div class="caption">
                                <h4>
                                    物流管理
                                </h4>
                                <p>
                                    培养从事现代物流业中的信息处理、配送、仓储、多式联运、采购、货代等具有专业及管理的高等技术应用型人才。毕业后在物流部门从事运输调度员、理货员、物质配送、商品储存等方面工作。
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
        <!-- <div class="row" style="text-align: center;margin-bottom: 20px;">
            <div class="col-xs-12 column">
                <div style="border-bottom: 1px solid #e0e0e0; margin-bottom: 10px;">
                    <h4>还在为学历低烦恼吗？</h4>
                    <h4>聚成教育，助你平步青云！</h4>
                </div>

            </div>
        </div> -->
    <div style="background-color: #2e6da4;">
        <div class="container">
            <div class="row" style="margin-top: 20px;text-align: center">
                <div class="col-xs-6 column">
                    <p>
                        <img alt="140x140" src="<%=path %>/static/proscenium/images/ewm.png" style="width: 90%;margin-bottom: 10px;" />
                    </p>
                    <h4><img src="<%=path %>/static/proscenium/images/phone5.png" style="width: 30%"><span>800-8580990</span></h4>
                    <h4>地址：<span>江西省赣州市章贡区xx街xx区xx楼</span></h4>
                </div>
                <div class="col-xs-6 column">
                    <p>
                        <img alt="140x140" src="<%=path %>/static/proscenium/images/ewm2.png" style="width: 90%;margin-bottom: 20px;" />
                    </p>
                    <h4>友情链接</h4>
                    <h4><a href="http://www.chsi.com.cn/">学信网</a> | <a href="http://www.kuaiji.com/">会计网</a></h4>
                    <h4><a href="http://www.yk211.com/">艺考网</a> | <a href="http://chengkao.eol.cn/">成考网</a></h4>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="float">
    <p>
        <a href = "JavaScript:void(0)" id="share">
            <img src="<%=path %>/static/proscenium/images/share1.png" class="img-circle" style="width: 50%;">
        </a>
    </p>
    <%-- <p>
        <a href = "JavaScript:void(0)" id="phone">
            <img src="<%=path %>/static/proscenium/images/phone2.png" style="width: 50%;">
        </a>
    </p> --%>

    <p>
        <a href="JavaScript:scroll(0,0)" >
            <img src="<%=path %>/static/proscenium/images/gotop.png" style="width: 50%;">
        </a>
    </p>

</div>
<div id="light" class="white_content float">
    <div class="phone-head" style="text-align: right;background-color: #2acb6b;">
        <a href = "javascript:void(0)" id="closePhone">
            <img src="<%=path %>/static/proscenium/images/close.png" style="margin-right: 10px;">
        </a>
    </div>
    <div class="phone-body" style="text-align: center;">
    	<div class="container">
    		<div class ="row">
	    		<div class="col-xs-6 column">
	    			<p><span>成考</span></p>
			        <p>
			            <span>李老师： </span>
			            <img src="<%=path %>/static/proscenium/images/qq1.png" style="">
			        </p>
			        <p>
			            <img src="<%=path %>/static/proscenium/images/phone8.png" style="">
			            <span>1889765413</span>
			        </p>
			        <p><span>远程</span></p>
			        <p>
			            <span>张老师： </span>
			            <img src="<%=path %>/static/proscenium/images/qq1.png" style="">
			        </p>
			        <p>
			            <img src="<%=path %>/static/proscenium/images/phone8.png" style="">
			            <span>1889765413</span>
			        </p>
	    		</div>
	    		<div class="col-xs-6 column">
	    			<p><span>财务</span></p>
			        <p>
			            <span>赖老师： </span>
			            <img src="<%=path %>/static/proscenium/images/qq1.png" style="">
			        </p>
			        <p>
			            <img src="<%=path %>/static/proscenium/images/phone8.png" style="">
			            <span>1889765413</span>
			        </p>
			        <p><span>学籍</span></p>
			        <p>
			            <span>王老师： </span>
			            <img src="<%=path %>/static/proscenium/images/qq1.png" style="">
			        </p>
			        <p>
			            <img src="<%=path %>/static/proscenium/images/phone8.png" style="">
			            <span>1889765413</span>
			        </p>
	    		</div>
	    	</div>   
    	</div>
    </div>
</div>
<!-- <div id="fade" class="black_overlay"></div> -->
<!--	**************************************************  -->
<!--	Here is JS file  -->
<!-- main	JS	start	-->
	<script src="${path }/static/proscenium/js/jquery.min.js"></script>
	<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<!-- main	JS	end	-->
<!-- plug-in	JS	start	-->
<!-- plug-in	JS	end	-->
<!-- custom	JS	start	-->
<!-- custom	JS	end	-->
<script>
    $(function(){
        $(document).css({position : "relative"});
        $(".float").css({position : "absolute",top : "40%",right : "0px"});
        $(window).scroll(function(){
            rightScroll();
        });
        function rightScroll(){
            var wH = $(window).height(),
                eH = $(".float").height(),
                sH = $(window).scrollTop();
            $(".float").animate({top : (wH-eH)/2+sH},{ queue: false, duration: 900 });
        }
    });
    $(document).ready(function() {
        $("#phone").click(function () {
            document.getElementById('light').style.display='block';
            /* document.getElementById('fade').style.display='block'; */
        });
        $("#closePhone").click(function () {
            document.getElementById('light').style.display='none';
            /* document.getElementById('fade').style.display='none'; */
        })
    });
</script>
</body>
</html>