<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信考网-主页</title>
    <link rel="shortcut icon" href="<%=path %>/static/proscenium/logo/favicon2.ico" /> 
    <link href="<%=path %>/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path %>/static/proscenium/css/style.css" rel="stylesheet">
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
        /*.black_overlay{
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
        }*/
        .white_content {
            display: none;
            position: absolute;
            top: 9%;
            left: 50%;
            width: 40%;
            height: 90%;
            border: 1px solid #999999;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
</head>
<body id="home">
<div class="wrapper">

    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">

                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home.html"  style="padding: 0 0;margin-left: 15px;">
                <img alt=""  src="<%=path %>/static/proscenium/logo/logo2.png" style="width:100%;">
                </a>
            </div>


            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <a href="home.html">首页</a>
                    </li>
                    <li>
                        <a href="help.html">我的账户</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
    <header class="page-heading">

        <div class="carousel slide" id="carousel-133287">
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
                    <img alt="" src="http://ibootstrap-file.b0.upaiyun.com/lorempixel.com/1600/500/sports/1/default.jpg" />
                    <div class="carousel-caption">
                        <h4>
                            第一张
                        </h4>
                    </div>
                </div>
                <div class="item">
                    <img alt="" src="http://ibootstrap-file.b0.upaiyun.com/lorempixel.com/1600/500/sports/2/default.jpg" />
                    <div class="carousel-caption">
                        <h4>
                            第二张
                        </h4>
                    </div>
                </div>
                <div class="item">
                    <img alt="" src="http://ibootstrap-file.b0.upaiyun.com/lorempixel.com/1600/500/sports/3/default.jpg" />
                    <div class="carousel-caption">
                        <h4>
                            第三张
                        </h4>
                    </div>
                </div>
            </div> <a class="left carousel-control" href="#carousel-133287" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-133287" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
    </header>
    <div class="container">
        <div class="row clearfix" style="text-align: center;margin-top: 20px; color: #d58512;">
            <div class="col-xs-3">
                <a href="index/apply">
                    <img alt="80x80" src="<%=path %>/static/proscenium/phoneIcon/blimp.png" class="img-circle home-ico" />
                    <span class="home_operation">学生报名</span>
                </a>
            </div>
            <div class="col-xs-3 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/phoneIcon/compose.png" class="img-circle home-ico" />
                    <span class="home_operation">缴费查询</span>
                </a>
            </div>
            <div class="col-xs-3 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/phoneIcon/gear.png" class="img-circle home-ico" />
                    <span class="home_operation">学籍查询</span>
                </a>
            </div>
            <div class="col-xs-3 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/phoneIcon/speaker.png" class="img-circle home-ico" />
                    <span class="home_operation">网上学习</span>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px;">
            <div class="col-xs-3 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/phoneIcon/flame.png" class="img-circle home-ico" />
                    <span class="home_operation">上传文件</span>
                </a>
            </div>
            <div class="col-xs-3 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/phoneIcon/phone.png" class="img-circle home-ico" />
                    <span class="home_operation">培训管理</span>
                </a>
            </div>
            <div class="col-xs-3 column">
                <a href="eguide">
                    <img alt="140x140" src="<%=path %>/static/proscenium/phoneIcon/image.png" class="img-circle home-ico" />
                    <span class="home_operation">招生简章</span>
                </a>
            </div>
            <div class="col-xs-3 column">
                <a href="home.html">
                    <img alt="80x80" src="<%=path %>/static/proscenium/phoneIcon/present.png" class="img-circle home-ico" />
                    <span class="home_operation">工作助手</span>
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
                    <h3>关于我们</h3>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="http://ibootstrap-file.b0.upaiyun.com/lorempixel.com/600/200/people/default.jpg" />
                            <div class="caption">
                                <h3>
                                    系统介绍
                                </h3>
                                <p>
                                   信考网报名管理系统是用于招生管理，缴费记录管理，日常事务管理和查询工具的网站它
                                    可以给你提供最好的学校，培训机构同时还为你提供证件报考等等...
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="http://ibootstrap-file.b0.upaiyun.com/lorempixel.com/600/200/city/default.jpg" />
                            <div class="caption">
                                <h3>
                                    合作伙伴
                                </h3>
                                <h4>江西理工大学</h4>
                                <p>江西理工大学创办于1958年，原名江西冶金学院，2004年更名为江西理工大学。</p>
                                <h4>赣州技师学院</h4>
                                <p>赣州技师学院是一所优秀的职业院校</p>
                                <h4>赣南师范大学</h4>
                                <p>学校创办于1958年6月，为省属本科师范院校。</p>
                                <h4>江西应用技术职业学院</h4>
                                <p>江西应用技术职业学院是江西省政府主办、省国土资源厅主管的全日制公办高职学院。</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img alt="300x200" src="http://ibootstrap-file.b0.upaiyun.com/lorempixel.com/600/200/sports/default.jpg" />
                            <div class="caption">
                                <h3>
                                    Thumbnail label
                                </h3>
                                <p>
                                    Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    <p>
        <a href = "JavaScript:void(0)" id="phone">
            <img src="<%=path %>/static/proscenium/images/phone2.png" style="width: 50%;">
        </a>
    </p>

    <p>
        <a href="JavaScript:scroll(0,0)" >
            <img src="<%=path %>/static/proscenium/images/gotop.png" style="width: 50%;">
        </a>
    </p>

</div>
<div id="light" class="white_content">
    <div class="phone-head" style="text-align: right;background-color: #2acb6b;">
        <a href = "javascript:void(0)" id="closePhone">
            <img src="<%=path %>/static/proscenium/images/close.png" style="margin-right: 10px;">
        </a>
    </div>
    <div class="phone-body" style="text-align: center;">
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
<!--<div id="fade" class="black_overlay"></div>-->
<script src="<%=path %>/static/proscenium/js/jquery.min.js"></script>
<script src="<%=path %>/static/proscenium/js/bootstrap.min.js"></script>
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
            /*document.getElementById('fade').style.display='block';*/
        });
        $("#closePhone").click(function () {
            document.getElementById('light').style.display='none';
            /*document.getElementById('fade').style.display='none';*/
        })
    });
</script>
</body>
</html>