<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>招生管理公共平台-成人教育报名</title>
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" /> 
    <link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.css" rel="stylesheet">
	
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
					<div class="piece image-con" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;" data-idx="0"> 
						<div class="image-box"> 
							<a target="_blank" class="image-link" href="javascript:void(0);"> <img class="image-item" src="${path }/static/proscenium/images/119100041505bd799dbe.png" /> </a> 
							<span class="image-text"></span> 
						</div> 
					</div> 
					<div class="piece" data-idx="2"> 
						<div class="floor-space" style="height: 10px; background-color: rgba(255,255,255,0);"></div> 
					</div> 
					<div class="piece text-piece" data-idx="3"> 
						<div class="rich-text" style="padding: 10px 15px 10px 15px;"> 
							<div class="inner"> 
								<div style="text-align: center;"> 
									<span style="line-height: 1.5; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; display: inline !important;"><b><font size="4" color="#ff0000">成人考试</font></b>&nbsp;</span> 
								</div> 
								<div style="text-align: center;"> 
									<font color="#000000">在职专/本科2017春季入学</font> 
								</div> 
							</div> 
						</div> 
					</div> 
					<div class="piece image-con" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;" data-idx="10"> 
						<div class="image-box"> 
							<a target="_blank" class="image-link" href="javascript:void(0);"> <img class="image-item" src="${path }/static/proscenium/images/11910003eb5a09c40525.png" /> </a> 
							<span class="image-text"></span> 
						</div> 
					</div> 
					<div class="piece image-con" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;" data-idx="15"> 
						<div class="image-box"> 
							<a target="_blank" class="image-link" href="javascript:void(0);"> <img class="image-item" src="${path }/static/proscenium/images/f20000b7cf4b4db90dd.png" /> </a> 
							<span class="image-text"></span> 
						</div> 
					</div> 
					<div class="piece" data-idx="16"> 
						<div class="floor-space" style="height: 10px; background-color: rgba(255,255,255,0);"></div> 
					</div> 
					<div class="piece text-piece" data-idx="17"> 
						<div class="rich-text" style="padding: 10px 15px 10px 15px;"> 
							<div class="inner"> 
								<div style="text-align: center;"> 
									<font color="#ff0000" face="Helvetica Neue, Helvetica, Arial, sans-serif" size="4"><span style="line-height: 27px;"><b>过了这一次，又要等半年 </b></span></font> 
								</div> 
								<div style="text-align: center;"> 
									<font face="Helvetica Neue, Helvetica, Arial, sans-serif" color="#000000" size="3"><span style="line-height: 27px;">填写资料，火速报名呦！</span></font> 
								</div> 
							</div> 
						</div> 
					</div> 
					<div class="piece form-piece" data-idx="18"> 
						<div class="form-count" data-node="topCount"> 
							<span class="split-count"></span> 
							<span class="count-text" data-node="countTextPre"></span> 
							<span class="count-text-num" data-node="countTextNum"></span> 
							<span class="count-text" data-node="countTextPos"></span> 
							<span class="split-count"></span> 
						</div> 
						<form role="form" id="adultEnroll"> 
							<div class="form-group"> 
								<label for="name">姓名</label> 
								<input type="text" class="form-control" id="name" name="sName" /> 
							</div> 
							<div class="form-group"> 
								<label for="id-card">身份证号码</label> 
								<input type="text" class="form-control" id="id-card" name="idNumber" /> 
							</div> 
							<div class="form-group"> 
								<label for="school">报考院校</label> 
								<!-- <select id="school" name="academyId" class="form-control"> 
									<option value="">---请选择---</option> 
								</select>  -->
								<input type="text" class="form-control" id="school" name="academyId" />
							</div> 
							<div class="form-group">
								<div class="row">
									<div class="col-xs-6">
										<label for="profession">专业</label> 
										<input type="text" id="sContent" name="sContent" class="form-control" style="width:170px;" /> 
									</div>
								<div class="col-xs-6">
									<label for="sGradations">层次</label> 
									<select id="sGradations" name="sGradations" onclick="selected();" class="form-control" style="width:170px;"> 
										<option value="">---请选择---</option>
										<option value="高达本">高达本</option>
										<option value="专达本">专达本</option>
										<option value="高达专">高达专</option>
									</select> 
								</div>
								</div>
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
							<div class="form-group" hidden="true"> 
								<input type="text" class="form-control" id="sSystme" name="sSystme" /> 
							</div> 
							<input type="hidden" id="stype" name="stype" value="1" /> 
							<input type="hidden" id="id" name="userId" /> 
							<button type="submit" class="btn btn-primary btn-lg">提交</button> 
						</form> 
						<div class="form-count" data-node="bottomCount"> 
							<span class="split-count"></span> 
							<span class="count-text" data-node="countTextPre"></span> 
							<span class="count-text-num" data-node="countTextNum"></span> 
							<span class="count-text" data-node="countTextPos"></span> 
							<span class="split-count"></span> 
						</div> 
					</div> 
				<a target="_blank" class="image-link" href="javascript:void(0);"> </a> 
				<div class="piece" data-idx="2"> 
					<div class="floor-space" style="height: 30px; background-color: rgba(255,255,255,0);"></div> 
				</div> 
				<div class="piece image-con" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;" data-idx="19"> 
					<div class="image-box"> 
						<a target="_blank" class="image-link" href="javascript:void(0);"> <img class="image-item" src="${path }/static/proscenium/images/1191000404564478855b.png" /> </a> 
						<span class="image-text"></span> 
					</div> 
				</div> 
				</div> 
			</div> 
		</div>
	<jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
	</div>
<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!-- ************************************************* -->
<script src="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.js"></script>
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js" ></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#captcha").click(function() {
	    var $this = $(this);
	    var url = $this.data("src") + new Date().getTime();
	    $this.attr("src", url);
	});
	
	$('#adultEnroll').bootstrapValidator({
		message: 'This value is not valid',
	    live: 'disabled',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    submitHandler: function(validator, form, submitButton) {
			 $.post("${path }/student/add",form.serialize(),function(data){
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
						$("#school").val("");
						$("#aMajor").val("");
						$("#sGradations").val("");
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
	    },fields: {
	    	sName: {
			  validators: {
			   notEmpty: {
			    message: '姓名不能为空'
			   }
			  }
			},
			idNumber: {
			   validators: {
				   notEmpty: {
                       message: '身份证号码不能为空'
                   } /*,
                   stringLength: {
                       min: 18,
                       max: 18,
                       message: '身份证号码格式不正确'
                   },
                   threshold :18  ,
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
                   } */
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
                    }
                    /* ,threshold :11 ,
                    remote: {
                        url: '${path }/student/validatorp',
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
			academyId: {
			  validators: {
			   notEmpty: {
			    message: '学校不能为空'
			   }
			  }
			},
			sContent: {
			  validators: {
			   notEmpty: {
			    message: '专业不能为空'
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
			sGradations: {
			  validators: {
			   notEmpty: {
			    message: '层次不能为空'
			   }
			  }
			}
	    }
	})
})

/* $(function(){
	var url = (window.location.href.split("?")[1]).split("&")[0];
	var id = url.split("=")[1];
	if(id != null && id != ''){
		$("#id").val(id);
	}
	var school = $("#school");
	$.get("${path }/academy/selectadult",function(data){
		  var json = JSON.parse(data); 
		  school.empty();
		  school.append("<option value=''>---请选择---</option>")
		  for(var i=0;i<json.length;i++){
			  school.append("<option value='"+json[i].aid+"'>"+json[i].aschool+"</option>")
		  }
	 });
}) */

function selected(){
	 var valeu =  $('#sGradations option:selected').val();//选中的值
	 if(valeu != "---请选择---"){
		 if(valeu == "专达本"){//专达本
			 $("#sSystme").val("三年"); 
		 }else if(valeu == "高达专"){//高达专
			 $("#sSystme").val("三年"); 
		 }
	 }
  }
  
var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码
var codeLength = 6;//验证码长度
function sendMessage() {
	var phone = $("#phone").val();
	var stype = $("#stype").val();
 	var school = $("#school").val();
	var sContent = $("#sContent").val();
	var sGradations = $("#sGradations").val();
	var type = 1;
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
				data: "stype=" + stype +"&phone="+ phone +"&school="+ school +"&sContent="+ sContent +"&sGradations=" + sGradations + "&type="+ type + "&code=" + code,
				error: function (data) {
					swal(
					      '手机号码不能为空!',
					      data.msg,
					      'error'
					)
				}
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