<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var noticeDataGrid;

    $(function() {

        noticeDataGrid = $('#noticeDataGrid').datagrid({
            url : '${path }/notice/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'nid',
            sortName : 'n_date',
	        sortOrder : 'desc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '80',
                title : '标题',
                field : 'ntitle',
                sortable : true
            }, {
                width : '180',
                title : '内容',
                field : 'ncontent',
                sortable : true
            },{
                width : '130',
                title : '时间',
                field : 'ndate',
                sortable : true
            },{
                width : '50',
                title : '类型',
                field : 'nflag',
                sortable : true,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '';
                    case 1:
                        return '公告';
                    case 2:
                        return '简章';
                    }
                }
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/notice/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="notice-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editNoticeFun(\'{0}\');" >编辑</a>', row.nid);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/notice/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="notice-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteNoticeFun(\'{0}\');" >删除</a>', row.nid);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.notice-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.notice-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#noticeToolbar'
        });
    });
    
    function addNoticeFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/notice/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = noticeDataGrid; //因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#noticeAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteNoticeFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = noticeDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            noticeDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                var currentnoticeId = '${sessionInfo.id}';/*当前登录用户的ID*/
                if (currentnoticeId != id) {
                    progressLoad();
                    $.post('${path }/notice/delete', {
                        id : id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            noticeDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
                }
            }
        });
    }
    
    function editNoticeFun(id) {
        if (id == undefined) {
            var rows = noticeDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            noticeDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path }/notice/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = noticeDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#noticeEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchNoticeFun() {
        noticeDataGrid.datagrid('load', $.serializeObject($('#searchNoticeForm')));
    }
    function cleanNoticeFun() {
        $('#searchNoticeForm input').val('');
        noticeDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchNoticeForm">
            <table>
                <tr>
                    <th>标题:</th>
                    <td><input name="nTitle" placeholder="请输入标题"/></td>
                    <th>类型:</th>
                    <td>
                    	<select class="easyui-combobox" name="nFlag" data-options="width:80,height:29,editable:false,panelHeight:'auto'" >
							<option value="0"></option>
							<option value="1">公告</option>
							<option value="2">简章</option>
						</select>
                    </td>
                    <th>创建时间:</th>
                    <td>
                        <input name="nDate" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input  name="endDate" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchNoticeFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanNoticeFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'公告列表'" >
        <table id="noticeDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="noticeToolbar" style="display: none;">
    <shiro:hasPermission name="/notice/add">
        <a onclick="addNoticeFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>