<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#studentEditForm').form({
            url : '${path }/student/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('enableValidation').form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
    });
    
    
  var studenteditDataGrid;
  function selectstueUser() {
	  studenteditDataGrid = $('#studenteditDataGrid').datagrid({
          url : '${path }/user/dataGrid',
          fit : true,
          striped : true,
          rownumbers : true,
          pagination : true,
          singleSelect : true,
          sortName : 'createTime',
          sortOrder : 'asc',
          pageSize : 20,
          pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
          columns : [ [{
              width : '80',
              title : 'ID',
              field : 'id',
              checkbox : true,
              sortable : true
          },{
              width : '80',
              title : '姓名',
              field : 'name',
              sortable : true
          },{
              width : '80',
              title : '所属部门',
              field : 'organizationName'
          },{
              width : '40',
              title : '性别',
              field : 'sex',
              sortable : true,
              formatter : function(value, row, index) {
                  switch (value) {
                  case 0:
                      return '男';
                  case 1:
                      return '女';
                  }
              }
          },{
              width : '40',
              title : '年龄',
              field : 'age',
              sortable : true
          },{
              width : '120',
              title : '电话',
              field : 'phone',
              sortable : true
          }] ],
       });
	  $('#win').window('open');
  } 
  
  $("#addbtn").click(function() {
	  var row = $('#studenteditDataGrid').datagrid('getSelected');
	  $("#userId").val(row.id);
	  $("#name").val(row.name);
	  $('#win').window('close');
	});
  
  function selected(){
	 var valeu =  $('#sGradations option:selected').val();//选中的值
	 if(valeu != "请选择"){
		 if(valeu == "高达本"){//高达本
			 $("#sSystme").val("六年"); 
		 }else if(valeu == "专达本"){//专达本
			 $("#sSystme").val("四年"); 
		 }else if(valeu == "高达专"){//高达专
			 $("#sSystme").val("三年"); 
		 }else if(valeu == 0){
			 $("#sSystme").val(""); 
		 }
	 }
  }
  
  $(function(){
	  var dd = $("#aMajor");
	  dd.append("<option value='${student.SContent}'>${student.SContent}</option>");
  });
  
  function selectAca(){
	  var value =  $('#academyId option:selected').val();//选中的值 
	  var dd = $("#aMajor");
	  if(value != ''){
		  $.get("${path }/student/school",{"id":value},function(data){
			  var json = JSON.parse(data); 
			  dd.empty();
			  for(var i=0;i<json.length;i++){
				  dd.append("<option value='"+json[i].amajor+"'>"+json[i].amajor+"</option>")
			  }
		  });
	  }
  }
  
  $.extend($.fn.validatebox.defaults.rules, {
      phoneNum: { //验证手机号   
          validator: function(value, param){ 
           return /^1[3-8]+\d{9}$/.test(value);
          },    
          message: '请输入正确的手机号码。'   
      },
      
      telNum:{ //既验证手机号，又验证座机号
        validator: function(value, param){ 
            return /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\d3)|(\d{3}\-))?(1[358]\d{9})$)/.test(value);
           },    
           message: '请输入正确的电话号码。' 
   	 },
   	
   	idcared: { 
	  validator: function(value,param){ 
		  var flag= isCardID(value); 
		  return flag==true?true:false; 
	}, 
	 	 message: '输入的不是有效的身份证号码'
	  }});
  
  var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}

  function isCardID(sId){ 
	  var iSum=0 ; 
	  var info="" ; 
	  if(!/^\d{17}(\d|x)/i.test(sId)){
		  return"你输入的身份证长度或格式错误";sId=sId.replace(/x/i,"a");  
	  }
	  if(aCity[parseInt(sId.substr(0,2))]==null){
		  return "你的身份证地区非法"; 
	  } 
	  sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2)); 
	  var d=new Date(sBirthday.replace(/-/g,"/")) ; 
	  if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate())){
		  return "身份证上的出生日期非法";  
	  }
	  for(var i = 17;i>=0;i--) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ; 
	  if(iSum%11!=1) return "你输入的身份证号非法"; 
	  return true;//aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女") 
  }
  
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="studentEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>学生姓名</td>
                    <td><input name="sName" type="text" placeholder="请输入学生姓名" class="easyui-validatebox" data-options="required:true,novalidate:true" value="${student.SName}"></td>
                	<td>老师姓名</td>
                    <td>
	                    <input id="userId" name="userId" hidden="true" value="${user.id}">
	                    <input id="name" name="name" type="text" placeholder="请选择介绍老师" style="width:100px;" class="easyui-validatebox" data-options="required:true,novalidate:true" readonly="readonly" value="${user.name}">
                    	<input type="button" onclick="selectstueUser();" value="点击选择">
                    </td>
                </tr>
                <tr>
                	<td>手机号码</td>
                    <td><input name="sPhone" type="text" placeholder="请输入手机号码" class="easyui-validatebox"  data-options="required:true,novalidate:true,prompt:'请输入正确的手机号码。',validType:'phoneNum'" value="${student.SPhone}"></td>
                	<td>身份证号码</td>
                    <td><input name="idNumber" type="text" placeholder="请输入身份证号码" class="easyui-validatebox" data-options="required:true,novalidate:true,prompt:'请输入正确的身份证号码。',validType:'idcared'" value="${student.idNumber}"></td>
                </tr>
                <tr>
	                <td>报考院校</td>
                    <td>
                    	<select name="academyId" id="academyId" onchange="selectAca();" style="width:120px;height:22px;">
                    		<c:forEach var="academy" items="${academy}" varStatus="s">
                    			<option value="${academy.AId}" <c:if test="${aca.ASchool == academy.ASchool}">selected</c:if>>${academy.ASchool}</option>
                    		</c:forEach>
                    	</select>
                    </td>
                    <td>报考专业</td>
                	<td>
                		<select name="sContent" id="aMajor" style="width:120px;height:22px;"></select>
                	</td>
                </tr>
                <tr>
                	<td>学制</td>
                    <td><input name="sSystme" id="sSystme" type="text" placeholder="请选择学制" class="easyui-validatebox" data-options="required:true,novalidate:true" readonly="readonly" value="${student.SSystme}"></td>
               		<td>报考层次</td>
                    <td>
	                   	<select name="sGradations" id="sGradations" onclick="selected();" style="width:120px;height:22px;">
	                   	 	<option value="高达本" <c:if test="${student.SGradations =='高达本'}">selected</c:if>>高达本</option>
                   	 		<option value="专达本" <c:if test="${student.SGradations =='专达本'}">selected</c:if>>专达本</option>
                   	 		<option value="高达专" <c:if test="${student.SGradations =='高达专'}">selected</c:if>>高达专</option>
	                   	</select>
					</td>
                </tr>
                <tr>
                	<td>报考日期</td>
                    <td><input name="sDate" type="text" placeholder="请选报考日期" class="easyui-datetimebox" data-options="required:true,novalidate:true" value="${student.SDate}"></td>
                	<td>报名类型</td>
                	<td><select id="stype" name="stype" style="width:100px;height:22px;">
                		<option value="1" <c:if test="${student.stype == 1}">selected</c:if>>成人教育</option>
                		<option value="2" <c:if test="${student.stype == 2}">selected</c:if>>开放大学</option>
                	</select></td>
                </tr>
                <tr><td></td>
                	<td><input type="text" name="sId" hidden="true" value="${student.SId}" /></td></tr>
            </table>
        </form>
    </div>
</div>
<div id="win" class="easyui-window" title="用户表" closed="true"  style="width:440px;height:300px;">
  	<div style="width:430px;height:220px;">
  		<table id="studenteditDataGrid" data-options="fit:true,border:false"></table>
  	</div>
	<center><a href="javascript:;" id="addbtn" style="margin-top:10px;" class="easyui-linkbutton" data-options="toggle:true,group:'g1',iconCls:'icon-ok'" >确定</a></center>
</div>