<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-default navbar-fixed-top navbar-top" role="navigation">
       <div class="container">
           <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
                   <span class="sr-only">Toggle navigation</span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
               </button>
               <a class="navbar-brand" href="${path }/index"  style="padding: 0 0;width:68%;">
          <img src="${path }/static/proscenium/logo/logo5.png" >
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
                <li>
	               	<c:choose>
	               		<c:when test="${user.id != null }">
	               		<div style="padding: 10px 15px;">
	               			<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
              				${user.name }
	                		</div>
	               		</c:when>
	               		<c:when test="${stu.studentNo != null }">
	               		<div style="padding: 10px 15px;">
	               			<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
              				${stu.SName }
	                		</div>
	               		</c:when>
	               		<c:otherwise>
	               			<a href="${path }/index/teaLogin">
	             				<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
	              				 教师登录
             		 		</a>
             		 		<a href="${path }/index/stuLogin">
	             				<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
	              				 学生登录
             		 		</a>
             		 		<a href="${path }/login">
	             				<img alt="" src="${path }/static/proscenium/icon/user62.png" style="width: 30px;">
	              				 后台登录
             		 		</a>
	               		</c:otherwise>
	               	</c:choose>
                </li>
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
    </div>
</nav>
