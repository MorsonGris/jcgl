<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#studentAddForm').form({
            url : '${path }/student/add',
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
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
    });
    
    var userDataGrid;
   	function User(){
  	 userDataGrid = $('#userDataGrid').datagrid({
        url : '${path }/user/dataGrid',
        fit : true,
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'id',
        sortName : 'createTime',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [{
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
        }, {
            width : '40',
            title : '年龄',
            field : 'age',
            sortable : true
        },{
            width : '120',
            title : '电话',
            field : 'phone',
            sortable : true
        },{
            field : 'action',
            title : '操作',
            width : 70,
            formatter : function(value, row, index) {
               var str = '';
                   <shiro:hasPermission name="/user/edit">
                       str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="addUserFun(\'{0}\');" >确定</a>');
                   </shiro:hasPermission>
               return str;
            }
        }] ],
        onLoadSuccess:function(data){
            $('.user-easyui-linkbutton').linkbutton({text:'确定'});
        },
     });
   }
   
   function addUserFun(){
	   var rows = $('#userDataGrid').datagrid('getSelected');
	   document.getElementById("name").value=rows.name;
	   document.getElementById("userId").value=rows.id;
	   $('#userData').dialog("close");
   }
    
  function selectUser() {
	 User();
	 $('#userData').dialog({
	    title: '教师信息表',
	    width: 500,
	    height: 300,
	    closed: false,
	    cache: false,
	    modal: true
	 });
  } 
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="studentAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>学生姓名</td>
                    <td><input name="sName" type="text" placeholder="请输入学生姓名" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                	<td>老师姓名</td>
                    <td><input id="userId" name="userId" hidden="true">
                    <input id="name" name="name" type="text" placeholder="请选择介绍老师" class="easyui-validatebox" onclick="selectUser();" data-options="required:true,novalidate:true" value=""></td>
                </tr>
                <tr>
                	<td>手机号码</td>
                    <td><input name="sPhone" type="text" placeholder="请输入手机号码" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                	<td>身份证号码</td>
                    <td><input name="idNumber" type="text" placeholder="请输入身份证号码" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                </tr>
                <tr>
                	<td>学习内容</td>
                    <td><input name="sContent" type="text" placeholder="请选择学习内容" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                	<td>学制</td>
                    <td><input name="sSystme" type="text" placeholder="请选择学制" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                </tr>
                <tr>
                	<td>报考院校</td>
                    <td><input name="academyId" type="text" placeholder="请选择报考院校" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                	<td>报考层次</td>
                    <td><input name="sGradations" type="text" placeholder="请选择报考层次" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                </tr>
                <tr>
                	<td>报考日期</td>
                    <td><input name="sDate" type="text" placeholder="请选报考日期" class="easyui-datetimebox" data-options="required:true,novalidate:true" value=""></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="userData">
        <table id="userDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>