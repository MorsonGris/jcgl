<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-会计缴费</title>
    <link href="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" /> 
    <link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
	
	<!-- ************2017/3/18********** -->
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/colorA_87eab02.css" /> 
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/bootstrap_6229293.css" /> 
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/brand_3f5ddbf.css" /> 
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/iconfont_0acaebe.css" /> 
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/daymode_ae958b1.css" /> 
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/image_c703bce.css" /> 
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/text_1909920.css" /> 
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/form_0601e68.css" /> 
	<link rel="stylesheet" type="text/css" href="${path }/static/proscenium/css/default_06e7803.css" /> 
	<!-- ******************************* -->
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
    <div class="container"> 
	   <div class="row clearfix"> 
	    <div class="col-md-12"> 
	     <div class="piece form-piece" data-idx="18" style="margin-bottom: 10px;"> 
	      <div class="panel-heading">
			<h4 style="color:#5D5D5D;text-align: center;">会计缴费</h4><hr />
		  </div>
	      <form role="form" id="adultEnroll"> 
	       <div class="form-group"> 
	        <label for="name">姓名</label> 
	        <input type="text" class="form-control" id="name" name="sName" /> 
	       </div> 
	       <div class="form-group">
   		  	 <div class="row"> 
         		<div class="col-xs-6">
         		 	<label for="name">验证码</label> 
         			<input class="form-control" type="text" id="yzm" name="captcha"/>
         		</div>
         		<div class="col-xs-6">
         			<img  style="margin-top:27px;" id="captcha" alt="验证码" src="${path }/captcha.jpg" data-src="${path }/captcha.jpg?t=" style="vertical-align:middle;border-radius:4px;width:100%;height:50px;cursor:pointer;">
         		</div>
        		</div>
           </div>
	       <div class="form-group"> 
	        <label for="phone">手机号码</label> 
	        <input type="text" class="form-control" id="phone" name="sPhone" /> 
	       </div>
	       <div class="form-group">
				<label for="sGradations">短信验证码</label>
				<div class="row">
					<div class="col-xs-6">
						
						<input type="hidden" id="code" name="code">
						<input type="text" id="scode" name="scode" class="form-control"/>
					</div>
					<div class="col-xs-6">
						<input  id="btnSendCode" type="button" value="获取验证码" onClick="sendMessage()" class="btn btn-primary">
					</div>
				</div>
		   </div>
		   <div class="form-group"> 
	        <label for="idNumber">身份证</label> 
	        <input type="text" class="form-control" id="idNumber" name="idNumber" /> 
	       </div>
	       <div class="form-group"> 
	        <label for="major">专业</label> 
	        <input type="text" class="form-control" id="major" name="major" /> 
	       </div>
	       <div class="form-group"> 
	        <label for="">缴费方式</label> 
	        <select id="way" name="way" onclick="selected();" class="form-control" style="width:170px;"> 
				<option value="">---请选择---</option>
				<option value="现金">现金</option>
				<option value="对公转账">对公转账</option>
				<option value="支付宝">支付宝</option>
			</select> 
	       </div> 
	       <input type="hidden" id="stype" name="stype" value="4" /> 
	       <input type="hidden" id="id" name="userId" /> 
	       <button type="submit" class="btn btn-primary btn-lg">提交</button> 
	      </form> 
	     </div> 
	    </div> 
	   </div> 
	  </div>
    <jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
</div>
<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!--	**************************************************  -->
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
	
	/* var url = (window.location.href.split("?")[1]).split("&")[0];
	var id = url.split("=")[1];
	if(id != null && id != ''){
		$("#id").val(id);
	} */
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
			idNumber: {
				   validators: {
					   notEmpty: {
	                       message: '身份证号码不能为空'
	                   },
	                   stringLength: {
	                       min: 18,
	                       max: 18,
	                       message: '身份证号码格式不正确'
	                   },
	                   threshold :18 ,
	                   remote: {
	                       url: '${path }/student/validatori',
	                       message: '身份证号码已存在',
	                       delay :  2000,
	                       type: 'POST',
	                   	   data: function(validator) {
	                          return {
	                        	  idNumber: $('#id-card').val(),
	                          };
	                       }
	                   }
				   }
			},
			major: {
				  validators: {
					   notEmpty: {
					    message: '专业不能为空'
					   }
					}
			},
			way: {
				  validators: {
				   notEmpty: {
				    message: '缴费方式不能为空'
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
			var dealType; //验证方式
			var uid=$("#uid").val();//用户uid
			if ($("#phone").attr("checked") == true) {
				dealType = "phone";
			}
			else {
				dealType = "email";
			}
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
				data: "name=" + name +"&phone="+ phone +"&stype="+ stype + "&type="+ 2 + "&code=" + code,
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

function selected(){
	 var valeu =  $('#way option:selected').val(); //选中的值
	 if(valeu != "请选择"){
		 if(valeu == "对公转账"){ //专达本
			 alert("对公转账");
			// $("#way").val("请选择");
		 }else if(valeu == "支付宝"){ //高达专
			 alert("支付宝");
			 //$("#way").val("请选择"); 
		 }
	 }
}

</script>
</body>
</html>