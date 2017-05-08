<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-default navbar-fixed-top navbar-top" role="navigation">
       
         <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
                   <span class="sr-only">Toggle navigation</span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
               </button>
               <a class="navbar-brand" href="${path }/index"  style="padding: 0 0;width:68%;">
          			<img src="${path }/static/proscenium/logo/logo.png" style="width: 100%;">
           	   </a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-menu">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href="${path }/index">
	                    <img alt="" src="${path }/static/proscenium/icon/home1.png" style="width: 30px;">
	                   	首页
                   	</a>
                </li>
            	<c:choose>
            		
            		<c:when test="${user.id != null }">
	            		<li>
	            			<div style="padding: 10px 15px;">
		            			<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
		          				${user.name }
	             			</div>
	           			</li>
	           			<li>
            				<div style="padding: 10px 15px;">
             					<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
             					<a onclick="update();">修改密码</a>
             				</div>
            			</li>
            		</c:when>
            		
            		<c:when test="${stu.studentNo != null }">
            			<li>
            				<div style="padding: 10px 15px;">
            					<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
          						${stu.SName }
             				</div>
            			</li>
            		</c:when>
            		<c:otherwise>
            		<li>
            			<div style="padding: 10px 15px;">
            				<a href="${path }/index/teaLogin">
          						<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
           					 	合作招生
         		 			</a>
         		 		</div>
   		 			</li>
       		 		<%-- <li>
       		 			<div style="padding: 10px 15px;">
         		 		<a href="${path }/index/stuLogin">
          				<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
           				 学生登录
         		 		</a>
         		 		</div>
   		 			</li> --%>
   		 			<li>
   		 				<div style="padding: 10px 15px;">
         		 		<a href="${path }/login">
          				<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
           				 后台登录
         		 		</a>
         		 		</div>
        		 	</li>	
           			</c:otherwise>
           		</c:choose>
                <c:if test="${user.id != null || stu.SId != null }">
                	<li>
	                    <a href="${path }/index/loginout">
		                    <img alt="" src="${path }/static/proscenium/icon/logout2.png" style="width: 30px;">
		                   	退出
	                   	</a>
                	</li>
                </c:if>
            </ul>
        </div>
    <script type="text/javascript">
    function update(){
    	swal({
    	  title: '',
    	  html:
    	    '旧密码<input id="oldPwd" name="oldPwd" type="password" class="swal2-input" autofocus>' +
    	    '新密码<input id="pwd" name="pwd" type="password" class="swal2-input">'+
    	    '确认新密码<input id="rePwd" name="rePwd" type="password" class="swal2-input">',
    	  preConfirm: function() {
    		  var oldPwd = $('#oldPwd').val();
	          var pwd = $('#pwd').val();
	          var rePwd = $('#rePwd').val();
	          var id = ${user.id};
    	      return new Promise(function(resolve) {
    	   		if(pwd==rePwd){
    	   			$.post("${path }/user/editUserPwd1",{"oldPwd":oldPwd,"pwd":rePwd,"id":id},function(data) {
    	   				data = $.parseJSON(data);
    	   				if(data.success == true){
							sweetAlert(
								data.msg,
		   	   				  	'',
		   	   				  	'success'
		     	   			).then(function(isConfirm) {
		     	   				if(isConfirm) {
		     	   					window.location="${path }/index/loginout";
		     	   				}
		     	   			})
						}else{
							sweetAlert(
								data.msg,
		   	   				  	'',
		   	   				  	'error'
		     	   			)
						}
					});
      		  	}else{
      		  		sweetAlert(
   	   				  '新密码不一致',
   	   				  '',
   	   				  'error'
     	   			)
      		  	}
    	    });
    	  }
    	})
    }
    </script>
</nav>
