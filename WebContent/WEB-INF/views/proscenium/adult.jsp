<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信考网-成人教育</title>
    <link rel="shortcut icon" href="<%=path %>/static/proscenium/logo/favicon2.ico" /> 
    <link href="<%=path%>/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
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
                        <a href="help.html">帮助中心</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row clearfix" style="margin: 20px;">
            <form role="form"  id="adultEnroll">
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" class="form-control" id="name" name="name" />
                </div>
                <div class="form-group">
                    <label for="id-card">身份证号码</label>
                    <input type="text" class="form-control" id="id-card" name="id_card" />
                </div>
                <div class="form-group">
                    <label for="phone">手机号码</label>
                    <input type="text" class="form-control" id="phone"  name="phone" />
                </div>
                <div class="form-group">
                    <label for="school">报考院校</label>
                    <input type="text" class="form-control" id="school"  name="school" />
                </div>
                <div class="form-group">
                    <label for="profession">专业</label>
                    <input type="text" class="form-control" id="profession"  name="profession" />
                </div>
                <div class="form-group">
                    <label for="level">层次</label>
                    <input type="text" class="form-control" id="level"  name="level"/>
                </div>
                <button type="submit" class="btn btn-primary btn-lg" >提交</button>
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
<script src="<%=path%>/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js" ></script>
<script type="text/javascript">
jQuery(document).ready(function() {
	$('#adultEnroll').bootstrapValidator({
		message: 'This value is not valid',
	    live: 'disabled',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    submitHandler: function(validator, form, submitButton) {
			 $.post("price/addPrice.do",form.serialize(),function(data){
				  if(data.result=="success")
					{	
						
					}else if(data.result=="添加失败"){ 
						
					}else if(data.result=="exist"){
						
					}
			  },'JSON');
	    },
	    fields: {
				name: {
				  validators: {
				   notEmpty: {
				    message: '姓名不能为空'
				   }
				  }
				},
				id_card: {
				   validators: {
					   callback: {
					        message: 'sorry,编号无效请重新填写',
					        callback: function(value, validator) {
					            var flag = false;
					            if(value===18 & value===15){
					            	flag=true;
					            }
					            return flag;
					        }
					    }
				   }
				 },
				phone: {
				  validators: {
				   notEmpty: {
				    message: '手机号码不能为空'
				   }
				  }
				},
				school: {
				  validators: {
				   notEmpty: {
				    message: '学校不能为空'
				   }
				  }
				},
				profession: {
				  validators: {
				   notEmpty: {
				    message: '专业不能为空'
				   }
				  }
				},
				level: {
				  validators: {
				   notEmpty: {
				    message: '层次不能为空'
				   }
				  }
				}
	    }
	});
})
</script>
</body>
</html>