<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚成教育-成人教育</title>
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" /> 
    <link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
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
    <jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include>
</div>
<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!-- ************************************************* -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/bootstrap-validator/bootstrapValidator.min.js" ></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
<script type="text/javascript">
$(document).ready(function() {
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
	})
})
</script>
</body>
</html>