<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
	var userDataGrid;

    $(function() {
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
    });
   
    function searchUserFun() {
    	academyDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
    }
    function cleanUserFun() {
        $('#searchUserForm input').val('');
        academyDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchUserForm">
            <table>
                <tr>
                    <th>姓名:</th>
                    <td><input name="aSchool" placeholder="请输入学校名称"/></td>
                    <th>专业名称:</th>
                    <td><input name="aMajor" placeholder="请输入专业名称"/></td>
               		<td>
	                   	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchUserFun();">查询</a>
	                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUserFun();">清空</a>
                   </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'用户表'" >
        <table id="userDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="userToolbar" style="display: none;">
    <shiro:hasPermission name="/academy/addpage">
        <a onclick="addUserFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>