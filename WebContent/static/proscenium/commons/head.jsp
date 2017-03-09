<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	String	path = request.getContextPath(); %>
<nav class="navbar navbar-default navbar-fixed-top navbar-top" role="navigation">
       <div class="container">
           <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
                   <span class="sr-only">Toggle navigation</span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
               </button>
               <a class="navbar-brand" href="<%=path %>/index"  style="padding: 0 0;margin-left: 10px;width:68%;">
          <img src="<%=path %>/static/proscenium/logo/logo5.png" >
            </a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-menu">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href="<%=path %>/index">
                    <img alt="" 	src="<%=path %>/static/proscenium/icon/home1.png" style="width: 30px;">
                    首页</a>
                </li>
                <li>
                	<a href="<%=path %>/accountant">
                	<img alt="" 	src="<%=path %>/static/proscenium/icon/user62.png" style="width: 30px;">
                    我的账户</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
