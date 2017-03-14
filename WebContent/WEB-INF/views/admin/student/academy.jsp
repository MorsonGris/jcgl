<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var academyDataGrid;

    $(function() {
    	academyDataGrid = $('#academyDataGrid').datagrid({
            url : '${path }/academy/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'aId',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '200',
                title : '学校',
                field : 'aschool',
                sortable : true
            }, {
                width : '120',
                title : '专业',
                field : 'amajor',
                sortable : true
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/applyType/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editAcademyFun(\'{0}\');" >编辑</a>', row.aid);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/applyType/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteAcademyFun(\'{0}\');" >删除</a>', row.aid);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#AcademyToolbar'
        });
    });
    
    function addAcademyFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 250,
            height : 200,
            href : '${path }/academy/addpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = academyDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#academyAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteAcademyFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = academyDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	academyDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前数据？', function(b) {
            if (b) {
	            progressLoad();
	            $.post('${path }/academy/delete', {
	                id : id
	            }, function(result) {
	                if (result.success) {
	                    parent.$.messager.alert('提示', result.msg, 'info');
	                    academyDataGrid.datagrid('reload');
	                }else{
	                	parent.$.messager.alert('提示', result.msg, 'info');
		                academyDataGrid.datagrid('reload');
	                }
	                progressClose();
	            }, 'JSON');
            }
        });
    }
    
    function editAcademyFun(id) {
        if (id == undefined) {
            var rows = academyDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
        	academyDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 250,
            height : 200,
            href : '${path }/academy/editpage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = academyDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#academyEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchAcademyFun() {
    	academyDataGrid.datagrid('load', $.serializeObject($('#searchAcademyForm')));
    }
    function cleanAcademyFun() {
        $('#searchAcademyForm input').val('');
        academyDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchAcademyForm">
            <table>
                <tr>
                    <th>学校名称:</th>
                    <td><input name="aSchool" placeholder="请输入学校名称"/></td>
                    <th>专业名称:</th>
                    <td><input name="aMajor" placeholder="请输入专业名称"/></td>
               		<td>
	                   	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchAcademyFun();">查询</a>
	                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanAcademyFun();">清空</a>
                   </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'专业管理'" >
        <table id="academyDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="AcademyToolbar" style="display: none;">
    <shiro:hasPermission name="/academy/addpage">
        <a onclick="addAcademyFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>