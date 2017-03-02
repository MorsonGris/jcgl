<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var relationDataGrid;

    $(function() {

        relationDataGrid = $('#relationDataGrid').datagrid({
            url : '${path }/relation/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'rid',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '80',
                title : '类型',
                field : 'reffect',
                sortable : true
            }, {
                width : '80',
                title : 'QQ号码',
                field : 'rqq',
                sortable : true
            },{
                width : '90',
                title : '手机号码',
                field : 'rphone',
                sortable : true
            },{
                width : '120',
                title : '详细说明',
                field : 'rcontent'
            }, {
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/relation/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editUserFun(\'{0}\');" >编辑</a>', row.rid);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/relation/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteUserFun(\'{0}\');" >删除</a>', row.rid);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#relationToolbar'
        });
    });
    
    function addUserFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/relation/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = relationDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#relationAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteUserFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = relationDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            relationDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                var currentUserId = '${sessionInfo.id}';/*当前登录用户的ID*/
                if (currentUserId != id) {
                    progressLoad();
                    $.post('${path }/user/delete', {
                        id : id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            relationDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
                } else {
                    parent.$.messager.show({
                        title : '提示',
                        msg : '不可以删除自己！'
                    });
                }
            }
        });
    }
    
    function editUserFun(id) {
        if (id == undefined) {
            var rows = relationDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            relationDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({ 
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path }/relation/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = relationDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#relationEditForm');
                    f.submit();
                }
            } ]
        });
    }

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:true,title:'联系列表'" >
        <table id="relationDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="relationToolbar" style="display: none;">
    <shiro:hasPermission name="/relation/add">
        <a onclick="addUserFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>