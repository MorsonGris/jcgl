<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var hotmajorDataGrid;

    $(function() {
    	hotmajorDataGrid = $('#hotmajorDataGrid').datagrid({
            url : '${path }/hotmajor/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'hmId',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '100',
                title : '标题',
                field : 'hmTitle',
                sortable : true
            },{
                width : '100',
                title : '图片',
                field : 'hmPicture',
                sortable : true
            },{
                width : '300',
                title : '内容',
                field : 'hmContent',
                sortable : true
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/hotmajor/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="edithotmajorFun(\'{0}\');" >编辑</a>', row.hmId);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/hotmajor/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deletehotmajorFun(\'{0}\');" >删除</a>', row.hmId);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#hotmajorToolbar'
        });
    });
    
    function addhotmajorFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 300,
            height : 250,
            href : '${path }/hotmajor/addpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = hotmajorDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#hotmajorAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deletehotmajorFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = hotmajorDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	hotmajorDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前数据？', function(b) {
            if (b) {
	            progressLoad();
	            $.post('${path }/hotmajor/delete', {
	                id : id
	            }, function(result) {
	                if (result.success) {
	                    parent.$.messager.alert('提示', result.msg, 'info');
	                    hotmajorDataGrid.datagrid('reload');
	                }
	                progressClose();
	            }, 'JSON');
            }
        });
    }
    
    function edithotmajorFun(id) {
        if (id == undefined) {
            var rows = hotmajorDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
        	hotmajorDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 300,
            height : 250,
            href : '${path }/hotmajor/editpage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = hotmajorDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#hotmajorEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchhotmajorFun() {
    	hotmajorDataGrid.datagrid('load', $.serializeObject($('#searchhotmajorForm')));
    }
    function cleanhotmajorFun() {
        $('#searchhotmajorForm input').val('');
        hotmajorDataGrid.datagrid('load', {});
    }
    
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchhotmajorForm">
            <table>
                <tr>
                   <th>标题:</th>
                   <td><input name="hmTitle" placeholder="请输入标题"/></td>
                   <td>
	                   	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchhotmajorFun();">查询</a>
	                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanhotmajorFun();">清空</a>
                   </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'热门专业信息表'" >
   		<table id="hotmajorDataGrid" data-options="fit:true,border:false"></table>
	</div>
</div>
<div id="hotmajorToolbar" style="display: none;">
    <shiro:hasPermission name="/hotmajor/add">
     	<a onclick="addhotmajorFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>