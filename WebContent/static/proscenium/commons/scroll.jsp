<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%	String	path = request.getContextPath(); %>

<div class="float">
        <a href = "JavaScript:void(0)" id="contact2">
            <img src="<%=path %>/static/proscenium/images/phone9.png" style="width: 100%;margin-bottom: 10px; border-radius: 10px;">
        </a>
        <a href = "JavaScript:void(0)" id="maps">
            <img src="<%=path %>/static/proscenium/icon/maps.png" style="width: 100%; border-radius: 10px;">
        </a>
</div>
<div id="light" class="white_content">
    <div class="phone-head" style="text-align: right;background-color: burlywood;">
        <a href = "javascript:void(0)" id="closePhone">
            <img src="<%=path %>/static/proscenium/icon/close2.png" style="width: 35px;margin: 5px;">
        </a>
    </div>
    <div class="phone-body" style="text-align: left;margin-top: 20px;">
    	<div class="container">
    	
    		<div class ="row">
    		<c:forEach items="${relation}" var="rel" varStatus="status">
    			<div class="col-xs-6 column">
	    			<p><span>${rel.REffect}：</span><span>${rel.RContent }</span></p>
			        <p>
			        	<img src="<%=path %>/static/proscenium/images/phone8.png">
			            <a href="http://wpa.qq.com/msgrd?v=3&uin=${rel.RQq}&site=qq&menu=yes" target="_blank">
			            <img src="http://wpa.qq.com/pa?p=2:${rel.RQq}:51" title="点击这里给我发消息" style="height: 32px;width: 80px;"/>
						</a>
						<br>
			        	<span>${rel.RPhone}</span>
			        </p>
	    		</div>
    		</c:forEach>
	    	</div>   
    	</div>
   </div>
</div>
<div id="map" class="map_content">
    <div class="phone-head" style="text-align: right;background-color: burlywood;">
        <a href = "javascript:void(0)" id="closeMap">
            <img src="<%=path %>/static/proscenium/icon/close2.png" style="width: 35px;margin: 5px;">
        </a>
    </div>
    <div class="phone-body" style="text-align: left;margin-top: 20px;">
    	<div class="container"> 	
    		<div class ="row">
    		<h4 style="margin-left: 5px;">地址：江西省赣州市红旗大道55号</h4>
			<iframe style="width: 284px; height: 338px;frameborder: 0;scrolling: no; marginheight: 0px; marginwidth: 0;margin-left: 5px;"    src="http://j.map.baidu.com/KlYke"></iframe>	    	
			</div>   
    	</div>
   </div>
</div>
<!-- <div id="fade" class="black_overlay"></div> -->