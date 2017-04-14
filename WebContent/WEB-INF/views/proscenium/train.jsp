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
    <link href="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
<title>招生管理公共平台-职业培训</title>
</head>
<body>
	<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
	<div>
		<img alt="" src="${path }/static/proscenium/images/640.jpg" width="100%">
	</div>
	<div class="container">
		<div class="row clearfix" style="text-align: center;margin-top: 20px;margin-bottom:10px; color: #d58512;">
			<div class="col-xs-4">
				<a href="accountingcost">
					<img alt="" style="width: 100%;" src="${path }/static/proscenium/icon/rulertriangle.png">
					<br>
					<span>会计缴费</span>
				</a>
				</div>
				<div class="col-xs-4">
				<a href="certificationcost">
					<img alt="" style="width: 100%;" src="${path }/static/proscenium/icon/hotair.png">
					<br>
					<span>资格证缴费</span>
				</a>
				</div>
				<div class="col-xs-4">
				<a href="artcost">
					<img alt="" style="width: 100%;" src="${path }/static/proscenium/icon/trophy.png">
					<br>
					<span>艺考缴费</span>
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
	<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!-- **************************************** -->
<script src="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.js"></script>
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#captcha").click(function() {
	    var $this = $(this);
	    var url = $this.data("src") + new Date().getTime();
	    $this.attr("src", url);
	});
	
	var url = (window.location.href.split("?")[1]).split("&")[0];
	var id = url.split("=")[1];
	if(id != null && id != ''){
		$("#id").val(id);
	}
	$('#adultEnroll').bootstrapValidator({
		message: 'This value is not valid',
	    live: 'disabled',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    submitHandler: function(validator, form, submitButton) {
			 $.post("${path }/Artexam/add",form.serialize(),function(data){
				  if(data.success == true){
					  swal(
					      '添加成功!',
					      data.msg,
					      'success'
						);
						$("#adultEnroll").bootstrapValidator('resetForm');
						$("#name").val("");
						$("#id-card").val("");
						$("#phone").val("");
						$("#content").val("");
						$(".swal2-styled").click(function(){
							window.location="${path }/index";
						});
					}else if(data.success == false){ 
						swal(
							      '',
							      data.msg,
							      'error'
						)
					}else if(data.result=="exist"){
						
					}
			  },'JSON');
	    },
	    fields: {
	    	sName: {
			  validators: {
			   notEmpty: {
			    message: '姓名不能为空'
			   }
			  }
			},
			 sPhone: {
                validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '手机号码格式不正确'
                    },
                    threshold :11 ,
                    remote: {
                        url: '${path }/Artexam/validatorp',
                        message: '手机号码已存在',
                        delay :  2000,
                        type: 'POST',
                    	   data: function(validator) {
                           return {
                         	 sPhone: $('#phone').val(),
                           };
                        }
                    }
                }
			},
			scode: {
			  validators: {
			   notEmpty: {
			    message: '短信验证不能为空'
			   }
			  }
			},
			captcha: {
				  validators: {
				   notEmpty: {
				    message: '验证码不能为空'
				   }
				}
			},
			sContent: {
			  validators: {
			   notEmpty: {
			    message: '报考职业不能为空'
			   }
			  }
			}
	    }
	})
})

var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码
var codeLength = 6;//验证码长度
function sendMessage() {
	var name = $("#name").val();
	var phone = $("#phone").val();
	var stype = $("#stype").val();
	var yz = /^1[3-8]+\d{9}$/.test(phone);
	if(phone != null && phone!=''){
		if(yz) {
			curCount = count;
			//产生验证码
			for (var i = 0; i < codeLength; i++) {
				code += parseInt(Math.random() * 9).toString();
			}
			$("#code").val(code);
			//设置button效果，开始计时
			$("#btnSendCode").attr("disabled", "true");
			$("#btnSendCode").val( + curCount + "秒再获取");
			InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
			//向后台发送处理数据
			$.ajax({
				type: "POST", //用POST方式传输
				dataType: "text", //数据格式:JSON
				url: '${path}/Security/security', //目标地址
				data: "name=" + name +"&phone="+ phone +"&stype="+ stype + "&type=2" +"&code=" + code,
				error: function (XMLHttpRequest, textStatus, errorThrown) {},
				success: function (msg){}
				});
			}else {
				swal(
					      '请输入正确的手机号码!',
					      '',
					      'error'
					)
			}
		
		}else{
			swal(
			      '手机号码不能为空!',
			      '',
			      'error'
			)
		}
	}
//timer处理函数
function SetRemainTime() {
	if (curCount == 0) {                
		window.clearInterval(InterValObj);//停止计时器
		$("#btnSendCode").removeAttr("disabled");//启用按钮
		$("#btnSendCode").val("重新发送验证码");
		code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
	}
	else {
		curCount--;
		$("#btnSendCode").val( + curCount + "秒再获取");
	}
}
</script>
</body>
</html>