<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String path =request.getContextPath(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信考网-学生报名</title>
    <link href="<%=path%>/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/static/proscenium/css/style.css" rel="stylesheet">
</head>
<body>
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
                <a class="navbar-brand" href="home.html">信考网</a>
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
    <div class="container">
        <div class="row clearfix" style="text-align: center;margin-top: 20px; color: #d58512;">
            <div class="col-xs-4 column">
                <a href="adult">
                    <img alt="80x80" src="<%=path%>/static/proscenium/phoneIcon/clock.png" class="img-circle apply-ico" />
                    <h4>成人教育报名</h4>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="accountant">
                    <img alt="80x80" src="<%=path%>/static/proscenium/phoneIcon/compose.png" class="img-circle apply-ico" />
                    <h4>会计培训报名</h4>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="profession">
                    <img alt="80x80" src="<%=path%>/static/proscenium/phoneIcon/document.png" class="img-circle apply-ico" />
                    <h4>职业培训报名</h4>
                </a>
            </div>
        </div>
        <div class="row clearfix" style="text-align: center;margin-top: 20px;">
            <div class="col-xs-4 column">
                <a href="nation">
                    <img alt="80x80" src="<%=path%>/static/proscenium/phoneIcon/flame.png" class="img-circle apply-ico" />
                    <h4>国家开放报名</h4>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="art">
                    <img alt="80x80" src="<%=path%>/static/proscenium/phoneIcon/phone.png" class="img-circle apply-ico" />
                    <h4>艺考培训报名</h4>
                </a>
            </div>
            <div class="col-xs-4 column">
                <a href="teacher">
                    <img alt="140x140" src="<%=path%>/static/proscenium/phoneIcon/hotair.png" class="img-circle apply-ico" />
                    <h4>教师资格证报名</h4>
                </a>
            </div>
        </div>
    </div>
    <div style="background-color: #2e6da4;">
        <div class="container">
            <div class="row" style="margin-top: 20px;text-align: center">
                <div class="col-xs-6 column">
                    <p>
                        <img alt="140x140" src="<%=path%>/static/proscenium/images/ewm.png" style="width: 90%;margin-bottom: 10px;" />
                    </p>
                    <h4><img src="<%=path%>/static/proscenium/images/phone5.png" style="width: 30%"><span>800-8580990</span></h4>
                    <h4>地址：<span>江西省赣州市章贡区xx街xx区xx楼</span></h4>


                </div>
                <div class="col-xs-6 column">
                    <p>
                        <img alt="140x140" src="<%=path%>/static/proscenium/images/ewm2.png" style="width: 90%;margin-bottom: 20px;" />
                    </p>
                    <h4>友情链接</h4>
                    <h4><a href="http://www.chsi.com.cn/">学信网</a> | <a href="http://www.kuaiji.com/">会计网</a></h4>
                    <h4><a href="http://www.yk211.com/">艺考网</a> | <a href="http://chengkao.eol.cn/">成考网</a></h4>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=path%>/static/proscenium/js/jquery.min.js"></script>
<script src="<%=path%>/static/proscenium/js/bootstrap.min.js"></script>
</body>
</html>