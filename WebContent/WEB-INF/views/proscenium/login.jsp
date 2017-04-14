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
    <link href="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.css" rel="stylesheet">
	<link href="${path }/static/proscenium/css/form-elements.css" rel="stylesheet">
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
    
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
	
<title>招生管理公共平台-登录</title>
</head>
<body>
<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
<div class="top-content">   	
    <div class="inner-bg">
        <div class="container">
           
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                	<div class="form-top">
                		<div class="form-top-left">
                			<h3>用户登录</h3>
                		</div>
                		<div class="form-top-right">
                			<i class="fa fa-lock"></i>
                		</div>
                    </div>
                    <div class="form-bottom">
               <form role="form" id="loginForm" method="post" class="login-form">
               	<div class="form-group">
               		<label class="sr-only" for="phone">账户</label>
                   	<input type="text" name="phone" placeholder="用户名/手机号" class="form-username form-control" id="phone">
                   </div>
                   <div class="form-group">
                   	<label class="sr-only" for="password">密码</label>
                   	<input type="password" name="password" placeholder="密码" class="form-password form-control" id="password">
                   </div>
                   <div class="form-group">
                   <div class="row">
                   		<div class="col-xs-6">
                   			<input class="form-control" type="text" id="yzm" name="captcha" placeholder="验证码"/>
                   		</div>
                   		<div class="col-xs-6">
                   			<img id="captcha" alt="验证码" src="${path }/captcha.jpg" data-src="${path }/captcha.jpg?t=" style="vertical-align:middle;border-radius:4px;width:100%;height:50px;cursor:pointer;">
                   		</div>
                   </div>
                   		
                   	
                   		
                   
                   
                   </div>
                   <button type="submit" class="btn">登录</button>
               </form>
              </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js"></script>
<script src="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.js"></script>
<script src="${path }/static/proscenium/js/jquery.backstretch.min.js"></script>
<script src="${path }/static/proscenium/js/scripts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#captcha").click(function() {
	    var $this = $(this);
	    var url = $this.data("src") + new Date().getTime();
	    $this.attr("src", url);
	});
	$(document).keydown(function (e) { 
	    var doPrevent; 
	    if (e.keyCode == 8) { 
	        var d = e.srcElement || e.target; 
	        if (d.tagName.toUpperCase() == 'INPUT' || d.tagName.toUpperCase() == 'TEXTAREA') { 
	            doPrevent = d.readOnly || d.disabled; 
	        }else{
	            doPrevent = true; 
	        }
	    }else{ 
	        doPrevent = false; 
	    }
	    if (doPrevent) 
	    e.preventDefault(); 
	});
	$('#loginForm').bootstrapValidator({
		message: 'This value is not valid',
		live: 'disabled',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		submitHandler: function(validator, form, submitButton) {
			$.post("homeLogin",form.serialize(),function(data){
				console.log("返回数据：", data);
				if(data.result==true){
					window.location.href = '${path }/index';
				}else{
					$("#yzm").val("");
					$("#captcha")[0].click();
					$("#loginForm").bootstrapValidator('resetForm');
					
					swal( '登录失败!',data.result,'error');
				}
			},'JSON');
		},
		fields: {
			phone: {
				validators: {
					notEmpty: {
						message: '手机号码不能为空'
					}
				}
			},
			password: {
				validators: {
					notEmpty: {
						message: '身份证号码不能为空!'
					}		
				}
			},
			captcha: {
				validators: {
					notEmpty: {
						message: '验证码不能为空'
					}
				}
			}
		}
	})
})
function submitForm(){
   $('#loginForm').submit();
}
function clearForm(){
    $('#loginForm').form('clear');
}
//回车登录
function enterlogin(){
    if (event.keyCode == 13){
        event.returnValue=false;
        event.cancel = true;
        $('#loginForm').submit();
    }
}
</script>
</body>
</html>