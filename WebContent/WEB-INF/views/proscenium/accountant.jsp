<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-会计培训报名</title>
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
		      <a target="_blank" class="image-link" href="javascript:void(0);"> <img class="image-item" src="${path }/static/proscenium/images/119100041505bd799dbe3.png" /> </a> 
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
		        <span style="line-height: 1.5; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; display: inline !important;"><b><font size="4" color="#ff0000">会计培训</font></b>&nbsp;</span> 
		       </div> 
		       <div style="text-align: center;"> 
		        <font color="#000000">一计在手，前程无忧</font> 
		       </div> 
		      </div> 
		     </div> 
		    </div> 
		    <div class="piece image-con" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;" data-idx="10"> 
		     <div class="image-box"> 
		      <a target="_blank" class="image-link" href="javascript:void(0);"> <img class="image-item" src="${path }/static/proscenium/images/11910003eb5a09c405253.png" /> </a> 
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
		      <!-- <div class="form-group">
		           <label for="id-card">身份证号码</label>
		           <input type="text" class="form-control" id="id-card" name="idNumber" />
		       </div> --> 
		      <div class="form-group"> 
		       <label for="phone">手机号码</label> 
		       <input type="text" class="form-control" id="phone" name="sPhone" /> 
		      </div> 
		      <div class="form-group"> 
		       <label for="content">学习内容</label> 
		       <textarea class="form-control" rows="3" id="content" name="sContent"></textarea> 
		      </div> 
		      <input type="hidden" name="stype" value="3" /> 
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
<!-- **************************************** -->
<script src="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.js"></script>
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>

<script type="text/javascript">
$(document).ready(function() {
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
					      '',
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
			/* idNumber: {
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
                       url: '${path }/Bookkeeper/validatori',
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
			 }, */
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
			sContent: {
			  validators: {
			   notEmpty: {
			    message: '学习内容不能为空'
			   }
			  }
			}
	    }
	})
})
</script>
</body>
</html>