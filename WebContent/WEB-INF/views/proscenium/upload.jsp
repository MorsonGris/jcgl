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
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
    <link href="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.css" rel="stylesheet">
<title>招生管理公共平台-文件上传</title>
</head>
<body>
	<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
	<div>
		<img alt="" src="${path }/static/proscenium/images/timg1.jpg" style="width: 100%;">
		
	</div>
	<div class="container" style="margin-bottom: 40px;">
	
	<div class="row" style="margin: 20px;">
		<div class="col-md-12">
			<h3>文件上传</h3>
			<form role="form" id="uploadForm" method="post" enctype="multipart/form-data">
				<div class="form-group">
					 <label for="photo">相片</label>
					 <input type="file" name="sfPhoto" id="photo" onchange="fileType2(this,'t1')" />
					 <span id="tishi1" style="color:red;font-weight:bold"></span>
				</div>
				<div class="form-group">
					 <label for="voucher">缴费凭证</label>
					 <input type="file" name="sfVoucher" id="voucher" onchange="fileType2(this,'t2')" />
					 <span id="tishi2" style="color:red;font-weight:bold"></span>
				</div>
				<div class="form-group">
					 <label for="paper">论文</label>
					 <input type="file" name="sfPaper" id="paper" onchange="fileType1(this)" />
					 <span id="tishi3" style="color:red;font-weight:bold"></span>
				</div>
				<input type="hidden" name="sstuId" value="${stu.SId }">
				<button type="submit" class="btn btn-info btn-lg">上传</button>
			</form>
		</div>
	</div>
	</div>
	<jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
	<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
	<script src="${path }/static/proscenium/js/jquery.min.js"></script>
	<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
	<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js"></script>
	<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
	<script src="${path }/static/proscenium/js/app.js"></script>
	<script src="${path }/static/proscenium/js/ajaxfileupload.js"></script>
	<script src="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.js"></script>
	<!-- *************************** -->
	<script type="text/javascript">
	$(document).ready(function() {
		$("#captcha").click(function() {
		    var $this = $(this);
		    var url = $this.data("src") + new Date().getTime();
		    $this.attr("src", url);
		});
		
		$('#uploadForm').bootstrapValidator({
			message: 'This value is not valid',
		    live: 'disabled',
		    feedbackIcons: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		    },
		    submitHandler: function(validator, form, submitButton) {
		     var formData = new FormData($( "#uploadForm" )[0]);
		     $.ajax({  
		          url: '${path }/stuFile/add' ,  
		          type: 'POST',  
		          data: formData,  
		          async: true,  
		          cache: false,  
		          contentType: false,  
		          processData: false,  
		          success: function (returndata) {  
		        	  returndata = $.parseJSON(returndata);
		        	 if(returndata.success == true){
		        		  swal(
							      '上传文件成功!',
							      returndata.msg,
							      'success'
								);
		        		  $("#uploadForm").bootstrapValidator('resetForm');
		        		  $(".swal2-styled").click(function(){
								window.location="${path }/index";
							});
			          }else if(returndata.success == false){ 
							swal(
								      '上传文件失败，请登录后重试！',
								      returndata.msg,
								      'error'
							);
							 $(".swal2-styled").click(function(){
									window.location="${path }/index/stuLogin";
								});
						}else if(returndata.result=="exist"){
							
						}
		          },  
		          error: function (returndata) {  
		        	  swal(
						      '上传文件失败，请登录后重试！',
						      returndata.msg,
						      'error'
					);
		          }  
		     });
		    },fields: {
		    	sstuId: {
					  validators: {
					   notEmpty: {
					    message: '请登录后上传！'
					   }
					}
				}
		    }
		})
	})
	
	function fileType1(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
		    if(fileType != '.doc'){
		    	$("#tishi3").html("<b>*请选择doc格式的文件</b>");
		    	$("#paper").val('');
		    	document.getElementById("paper").files[0] = '请选择doc格式的文件';
		    }else {
		    	$("#tishi3").html('');
			}
	}

	function fileType2(obj,t){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
		if(t=='t1') {
			if(fileType == '.jpeg' | fileType == '.png'){
				$("#tishi1").html('');
		    }else {
		    	$("#tishi1").html("<b>*请选择jpeg或png格式的文件</b>");
		    	$("#photo").val('');
		    	document.getElementById("photo").files[0] = '请选择jpeg或png格式的文件';
			}
		}else {
			if(fileType == '.jpeg' | fileType == '.png'){
				$("#tishi2").html('');
		    }else {
		    	$("#tishi2").html("<b>*请选择jpeg或png格式的文件</b>");
		    	$("#voucher").val('');
		    	document.getElementById("voucher").files[0] = '请选择jpeg或png格式的文件';
			}
		}
	}
	
</script>
</body>
</html>