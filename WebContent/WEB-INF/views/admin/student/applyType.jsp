<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var applyTypeDataGrid;

    $(function() {
    	applyTypeDataGrid = $('#applyTypeDataGrid').datagrid({
            url : '${path }/applyType/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'atId',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '200',
                title : '报名类别',
                field : 'atName',
                sortable : true
            }, {
                width : '120',
                title : '图标地址',
                field : 'atIcon',
                sortable : true
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/applyType/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editUserFun(\'{0}\');" >编辑</a>', row.atId);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/applyType/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteUserFun(\'{0}\');" >删除</a>', row.atId);
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
            width : 250,
            height : 200,
            href : '${path }/applyType/addpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = applyTypeDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#applyTypeAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteUserFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = applyTypeDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	applyTypeDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前数据？', function(b) {
            if (b) {
	            progressLoad();
	            $.post('${path }/applyType/delete', {
	                id : id
	            }, function(result) {
	                if (result.success) {
	                    parent.$.messager.alert('提示', result.msg, 'info');
	                    applyTypeDataGrid.datagrid('reload');
	                }
	                progressClose();
	            }, 'JSON');
            }
        });
    }
    
    function editUserFun(id) {
        if (id == undefined) {
            var rows = applyTypeDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
        	applyTypeDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 250,
            height : 200,
            href : '${path }/applyType/editpage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = applyTypeDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#applyTypeEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchUserFun() {
    	applyTypeDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
    }
    function cleanUserFun() {
        $('#searchUserForm input').val('');
        applyTypeDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchUserForm">
            <table>
                <tr>
                    <th>报名类型:</th>
                    <td><input name="name" placeholder="请输入报名类型"/></td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'报名类型'" >
        <table id="applyTypeDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="userToolbar" style="display: none;">
    <shiro:hasPermission name="/user/add">
        <a onclick="addUserFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>