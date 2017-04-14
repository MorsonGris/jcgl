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
	<div class="row" style="margin: 10px;font-size: 16px;">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-train">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-course" data-toggle="tab">职业课程</a>
					</li>
					<li>
						 <a href="#panel-sign" data-toggle="tab">我要报名</a>
					</li>
					
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-course" style="margin-top: 20px;">
						<div class="row" style="text-align: center;margin-bottom: 20px;">
							<div class="col-xs-4">
							<a href="p1">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p1.png">
								<br>
								<span>中医师</span>
							</a>
							</div>
							<div class="col-xs-4">
							<a href="p2">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p2.png">
								<br>
								<span>针灸师</span>
							</a>
							</div>
							<div class="col-xs-4">
							<a href="p3">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p3.png">
								<br>
								<span>文饰师</span>
							</a>
							</div>
							
						</div>
						<div class="row" style="text-align: center;margin-bottom: 20px;">
							<div class="col-xs-4">
							<a href="p4">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p4.png">
								<br>
								<span>健康调理师</span>
							</a>
							</div>
							<div class="col-xs-4">
							<a href="p5">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p5.png">
								<br>
								<span>护理师</span>
							</a>
							</div>
							<div class="col-xs-4">
							<a href="p6">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p6.png">
								<br>
								<span>康复理疗师</span>
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;margin-bottom: 20px;">
							<div class="col-xs-4">
							<a href="p7">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p7.png">
								<br>
								<span>养生保健师</span>
							</a>
							</div>
							<div class="col-xs-4">
							<a href="p8">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p8.png">
								<br>
								<span>中医美容师</span>
							</a>
							</div>
							<div class="col-xs-4">
							<a href="p9">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p9.png">
								<br>
								<span>中医调理师</span>
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="p10">
								<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/profession/p10.png">
								<br>
								<span>催乳师</span>
							</a>
							</div>
							<div class="col-xs-4"></div>
							<div class="col-xs-4"></div>
					</div>
					</div>
					<div class="tab-pane" id="panel-sign" style="margin-top: 20px;">
						<div class="row">
							<div class="col-md-12">
								<p style="text-indent: 20px;">
								职业资格证即职业资格证书，是表明劳动者具有从事某一职业所必备的学识和技能的证明。它是劳动者求职、任职、开业的资格凭证，是用人单位招聘、录用劳动者的主要依据，也是境外就业、对外劳务合作人员办理技能水平公证的有效证件。
								</p>
								<p style="text-indent: 20px;">
								很多职业都要求任职者具备职业资格证，这是对任职者专业基础掌握程度的检验和实践能力证明，确保企事业单位员工的办公能力和对专业知识的掌握层度。
								</p>
								<img alt="" src="${path }/static/proscenium/images/500.jpg" width="100%">
								<p style="text-indent: 20px;">
									2016年12月16日，人力资源和社会保障部公示了国家职业资格目录清单，拟列入职业资格目录清单151项。除此之外，在总理力推下，从2014年至今，国务院部门设置的职业资格许可和认定事项已实现“七连消”，累计占到总数70%以上。
								</p>
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
										<!-- <div class="row">
											<div class="col-xs-6">
												<label for="sGradations">短信验证码：</label>
												<input type="hidden" id="code" name="code">
												<input type="text" id="scode" name="scode" class="form-control" />
											</div>
											<div class="col-xs-6">
												<input style="margin-top:27px;" id="btnSendCode" type="button" value="获取验证码" onClick="sendMessage()" class="btn btn-primary btn-lg">
											</div>
									    </div> -->
								      </div>
								      <div class="form-group"> 
								       <label for="content">报考职业</label> 
								       <!-- <textarea class="form-control" rows="3" id="content" name="sContent"></textarea> --> 
								      	<input type="text" class="form-control" id="content" name="sContent" />
								      </div> 
								      <input type="hidden" id="stype" name="stype" value="5" /> 
								      <input type="hidden" id="id" name="userId" /> 
								      <button type="submit" class="btn btn-primary btn-lg">提交</button> 
								     </form>
							</div>
						</div>
					</div>
				</div>
			</div>
			
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
                    threshold :11 /* ,
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
                    } */
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