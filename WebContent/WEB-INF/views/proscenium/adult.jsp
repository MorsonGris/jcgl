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
    <link href="${path }/static/proscenium/plugin/sweetalert2/sweetalert2.min.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>
    <div class="container">
        <div class="row clearfix" style="margin: 20px;">
        	<div class="col-xs-12">
            <form role="form"  id="adultEnroll">
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" class="form-control" id="name" name="sName" />
                </div>
                <div class="form-group">
                    <label for="id-card">身份证号码</label>
                    <input type="text" class="form-control" id="id-card" name="idNumber" />
                </div>
                <div class="form-group">
                    <label for="phone">手机号码</label>
                    <input type="text" class="form-control" id="phone"  name="sPhone" />
                </div>
                <div class="form-group">
                    <label for="school">报考院校</label>
                	<select name="academyId" id="school" class="form-control"  onchange="selectAca();" >
                   	 	<option value="">---请选择---</option>
                   </select>
                </div>
                <div class="form-group">
                    <label for="profession">专业</label>
                	<select name="sContent" id="aMajor" class="form-control" >
                		<option value="">---请选择---</option>
                	</select>
                </div>
                <div class="form-group">
                    <label for="sGradations">层次</label>
                    <select id="sGradations" name="sGradations" onclick="selected();" class="form-control">
	               	 	<option value="">---请选择---</option>
	               	 	<option value="高达本">高达本</option>
	               	 	<option value="专达本">专达本</option>
	               	 	<option value="高达专">高达专</option>
	                </select>
                </div>
                 <div class="form-group" hidden="true">
                 	<input type="text" class="form-control" id="sSystme"  name="sSystme" />
                </div>
                <button type="submit" class="btn btn-primary btn-lg" >提交</button>
            </form>
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
					      '',
					      'success'
						);
						$("#adultEnroll").bootstrapValidator('resetForm');
						$("#name").val("");
						$("#id-card").val("");
						$("#phone").val("");
						$("#school").val("");
						$("#aMajor").val("");
						$("#sGradations").val("");
					}else if(data.success == false){ 
						 swal(
						      '',
						      '该身份证或电话已使用',
						      'error'
						  );
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
                        url: '${path }/student/validatorp',
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

$(function(){
	var school = $("#school");
	$.get("${path }/academy/selectall",function(data){
		  var json = JSON.parse(data); 
		  school.empty();
		  school.append("<option value=''>---请选择---</option>")
		  for(var i=0;i<json.length;i++){
			  school.append("<option value='"+json[i].aid+"'>"+json[i].aschool+"</option>")
		  }
	 });
})

function selected(){
	 var valeu =  $('#sGradations option:selected').val();//选中的值
	 if(valeu != "请选择"){
		 if(valeu == "高达本"){//高达本
			 $("#sSystme").val("五年"); 
		 }else if(valeu == "专达本"){//专达本
			 $("#sSystme").val("三年"); 
		 }else if(valeu == "高达专"){//高达专
			 $("#sSystme").val("三年"); 
		 }
	 }
  }

function selectAca(){
	  var value =  $('#school option:selected').val();//选中的值 
	  var dd = $("#aMajor");
	  if(value != ''){
		  $.get("${path }/student/school",{"id":value},function(data){
			  var json = JSON.parse(data); 
			  dd.empty();
			  dd.append("<option value=''>---请选择---</option>");
			  for(var i=0;i<json.length;i++){
				  dd.append("<option value='"+json[i].amajor+"'>"+json[i].amajor+"</option>")
			  }
		  });
	  }else{
		  dd.empty();
		  dd.append("<option value=''>---请选择---</option>");
	  }
  }
</script>
</body>
</html>