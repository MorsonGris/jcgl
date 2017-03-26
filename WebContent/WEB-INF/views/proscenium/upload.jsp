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
<title>聚成教育-工作助手</title>
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
			<form role="form" id="upload" method="post" enctype="multipart/form-data">
				<div class="form-group">
					 <label for="photo">图片</label>
					 <input type="file" name="sfPhoto" id="photo" />
				</div>
				<div class="form-group">
					 <label for="voucher">缴费凭证</label>
					 <input type="file" name="sfVoucher" id="voucher" />
				</div>
				<div class="form-group">
					 <label for="paper">论文</label>
					 <input type="file" name="sfPaper" id="paper" />
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
	<script type="text/javascript">
	$(document).ready(function() {
		$("#captcha").click(function() {
		    var $this = $(this);
		    var url = $this.data("src") + new Date().getTime();
		    $this.attr("src", url);
		});
		
		$('#upload').bootstrapValidator({
			message: 'This value is not valid',
		    live: 'disabled',
		    feedbackIcons: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		    },
		    submitHandler: function(validator, form, submitButton) {
		    	$.ajaxFileUpload({
	                //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	                url:'${path }/stuFile/add}',
	                secureuri:false, 
	                data:{
						"sstuId" : "${stu.SId"},
					},
	                fileElementId:['photo','voucher','paper'],
	                dataType:'json',                       
	                success:function(data, status){      
	                    $('#result').html('修改头像成功' + data);
	                },
	                error:function(data, status, e){ 
	                    $('#result').html('图片上传失败，请重试！！');
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



	</script>
</body>
</html>