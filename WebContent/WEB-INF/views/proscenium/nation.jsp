<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信考网-国家开放大学</title>
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
                <a class="navbar-brand" href="home.html">ä¿¡èç½</a>
            </div>


            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <a href="home.html">é¦é¡µ</a>
                    </li>
                    <li>
                        <a href="help.html">å¸®å©ä¸­å¿</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row clearfix" style="margin: 20px;">
            <form role="form">
                <div class="form-group">
                    <label for="name">å§å</label>
                    <input type="text" class="form-control" id="name" />
                </div>
                <div class="form-group">
                    <label for="id-card">èº«ä»½è¯å·ç </label>
                    <input type="text" class="form-control" id="id-card" />
                </div>
                <div class="form-group">
                    <label for="phone">ææºå·ç </label>
                    <input type="text" class="form-control" id="phone" />
                </div>
                <div class="form-group">
                    <label for="school">æ¥èé¢æ ¡</label>
                    <input type="text" class="form-control" id="school" />
                </div>
                <div class="form-group">
                    <label for="profession">ä¸ä¸</label>
                    <input type="text" class="form-control" id="profession" />
                </div>
                <div class="form-group">
                    <label for="level">å±æ¬¡</label>
                    <input type="text" class="form-control" id="level" />
                </div>
                <button type="submit" class="btn btn-primary btn-lg" >æäº¤</button>
            </form>
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
                    <h4>å°åï¼<span>æ±è¥¿çèµ£å·å¸ç« è´¡åºxxè¡xxåºxxæ¥¼</span></h4>


                </div>
                <div class="col-xs-6 column">
                    <p>
                        <img alt="140x140" src="<%=path%>/static/proscenium/images/ewm2.png" style="width: 90%;margin-bottom: 20px;" />
                    </p>
                    <h4>åæé¾æ¥</h4>
                    <h4><a href="http://www.chsi.com.cn/">å­¦ä¿¡ç½</a> | <a href="http://www.kuaiji.com/">ä¼è®¡ç½</a></h4>
                    <h4><a href="http://www.yk211.com/">èºèç½</a> | <a href="http://chengkao.eol.cn/">æèç½</a></h4>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=path%>/static/proscenium/js/jquery.min.js"></script>
<script src="<%=path%>/static/proscenium/js/bootstrap.min.js"></script>
</body>
</html>