<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var shareDataGrid;

    $(function() {
    	shareDataGrid = $('#shareDataGrid').datagrid({
            url : '${path }/Share/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'shareid',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '150',
                title : '标题',
                field : 'sharetitle',
                sortable : true
            },{
                width : '150',
                title : '图标',
                field : 'sharephone',
                sortable : true
            },{
                width : '150',
                title : '图片',
                field : 'sharepicture',
                sortable : true
            },{
                width : '200',
                title : '内容',
                field : 'sharecontent',
                sortable : true
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/share/editpage">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editSharemyFun(\'{0}\');" >编辑</a>', row.shareid);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/share/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteShareFun(\'{0}\');" >删除</a>', row.shareid);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#ShareToolbar'
        });
    });
    
    function addShareFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/Share/addpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = shareDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#shareAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteShareFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = shareDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	shareDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前数据？', function(b) {
            if (b) {
	            progressLoad();
	            $.post('${path }/Share/sharedelete', {
	                id : id
	            }, function(result) {
	                if (result.success) {
	                    parent.$.messager.alert('提示', result.msg, 'info');
	                    shareDataGrid.datagrid('reload');
	                }else{
	                	parent.$.messager.alert('提示', result.msg, 'info');
	                	shareDataGrid.datagrid('reload');
	                }
	                progressClose();
	            }, 'JSON');
            }
        });
    }
    
    function editSharemyFun(id) {
        if (id == undefined) {
            var rows = shareDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
        	shareDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path }/Share/updatepage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = shareDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#shareEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchSharemyFun() {
    	shareDataGrid.datagrid('load', $.serializeObject($('#searchshareForm')));
    }
    function cleanSharemyFun() {
        $('#searchshareForm input').val('');
        shareDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchshareForm">
            <table>
                <tr>
                    <th>标题:</th>
                    <td><input name="sharetitle" placeholder="请输入标题"/></td>
                    <td>
	                   	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchSharemyFun();">查询</a>
	                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanSharemyFun();">清空</a>
                   </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'共享合作管理'" >
        <table id="shareDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="ShareToolbar" style="display: none;">
    <shiro:hasPermission name="/Share/addpage">
        <a onclick="addShareFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>