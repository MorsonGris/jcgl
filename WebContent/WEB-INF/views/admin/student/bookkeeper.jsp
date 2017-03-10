<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var bookkeeperDataGrid;

    $(function() {
    	bookkeeperDataGrid = $('#bookkeeperDataGrid').datagrid({
            url : '${path }/Bookkeeper/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'sId',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '100',
                title : '学生编号',
                field : 'studentNo',
                sortable : true
            },{
                width : '70',
                title : '学生姓名',
                field : 'sname',
                sortable : true
            },{
                width : '70',
                title : '老师姓名',
                field : 'listUser',
                sortable : true,
                formatter : function(value, row, index) {
                    var roles = [];
                    for(var i = 0; i< value.length; i++) {
                        roles.push(value[i].name);  
                    }
                    return(roles.join('\n'));
                }
            },{
                width : '120',
                title : '手机号码',
                field : 'sphone',
                sortable : true
            },{
                width : '120',
                title : '学习内容',
                field : 'scontent',
                sortable : true
            },{
                width : '100',
                title : '报名日期',
                field : 'sdate',
                sortable : true,
                formatter: formatDatebox
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/Bookkeeper/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editUserFun(\'{0}\');" >编辑</a>', row.sid);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/Bookkeeper/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteUserFun(\'{0}\');" >删除</a>', row.sid);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#userToolbar'
        });
    });
    
    function addUserFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 200,
            href : '${path }/Bookkeeper/addpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = bookkeeperDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#studentAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteUserFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = bookkeeperDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	bookkeeperDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前数据？', function(b) {
            if (b) {
	            progressLoad();
	            $.post('${path }/Bookkeeper/delete', {
	                id : id
	            }, function(result) {
	                if (result.success) {
	                    parent.$.messager.alert('提示', result.msg, 'info');
	                    bookkeeperDataGrid.datagrid('reload');
	                }
	                progressClose();
	            }, 'JSON');
            }
        });
    }
    
    function editUserFun(id) {
        if (id == undefined) {
            var rows = bookkeeperDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
        	bookkeeperDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 200,
            href : '${path }/Bookkeeper/editpage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = bookkeeperDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#studentEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchUserFun() {
    	bookkeeperDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
    }
    function cleanUserFun() {
        $('#searchUserForm input').val('');
        bookkeeperDataGrid.datagrid('load', {});
    }
    
    Date.prototype.format = function (format) {    
        var o = {    
            "M+": this.getMonth() + 1,   
            "d+": this.getDate(),    
            "h+": this.getHours(),   
            "m+": this.getMinutes(),    
            "s+": this.getSeconds(),  
            "q+": Math.floor((this.getMonth() + 3) / 3),  
            "S": this.getMilliseconds()    
        }    
        if (/(y+)/.test(format))    
            format = format.replace(RegExp.$1, (this.getFullYear() + "")    
                .substr(4 - RegExp.$1.length));    
        for (var k in o)    
            if (new RegExp("(" + k + ")").test(format))    
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));    
        return format;    
    }    
    function formatDatebox(value) {    
        if (value == null || value == '') {    
            return '';    
        }    
        var dt;    
        if (value instanceof Date) {    
            dt = value;    
        } else {    
            dt = new Date(value);    
        }    
        return dt.format("yyyy-MM-dd");  
    }  
    
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchUserForm">
            <table>
                <tr>
                   <th>学生编号:</th>
                   <td><input name="studentNo" placeholder="请输入学生编号"/></td>
                   <th>学生姓名:</th>
                   <td><input name="sName" placeholder="请输入学生姓名"/></td>
                   <td>
	                   	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchUserFun();">查询</a>
	                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUserFun();">清空</a>
                   </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'学生信息表'" >
        <table id="bookkeeperDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="userToolbar" style="display: none;">
    <shiro:hasPermission name="/Bookkeeper/add">
     	<a onclick="addUserFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>