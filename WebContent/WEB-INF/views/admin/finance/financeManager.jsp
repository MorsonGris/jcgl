<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var financeDataGrid;

    $(function() {

        financeDataGrid = $('#financeDataGrid').datagrid({
            url : '${path }/finance/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'fid',
            sortName : 'f_date',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '80',
                title : '姓名',
                field : 'student',
                formatter : function(value, row, index) {
                    return value.sname;
                }
            }, {
                width : '80',
                title : '学号',
                field : 'stuNo',
                sortable : true
            },{
                width : '80',
                title : '班主任',
                field : 'teaClass',
                sortable : true
            },{
                width : '80',
                title : '合作人',
                field : 'user',
                formatter : function(value, row, index) {
                    return value.name;
                }
            },{
                width : '80',
                title : '需缴金额',
                field : 'needMoney',
                sortable : true
            },{
                width : '80',
                title : '实缴金额',
                field : 'practicalMoney',
                sortable : true
            },{
                width : '130',
                title : '缴费时间',
                field : 'fdate',
                sortable : true
            },{
                width : '80',
                title : '缴费方式',
                field : 'fway',
                sortable : true,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '';
                    case 1:
                        return '支付宝';
                    case 2:
                        return '微信';
                    case 3:
                        return '银行';
                    case 4:
                        return '现金';
                    }
                }
            },{
                width : '80',
                title : '累计金额',
                field : 'faccumulative',
                sortable : true
            },{
                width : '80',
                title : '缴费状态',
                field : 'fstate',
                sortable : true,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '';
                    case 1:
                        return '未交费';
                    case 2:
                        return '已缴费';
                    case 3:
                        return '已兑账';
                    }
                }
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/finance/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editUserFun(\'{0}\');" >编辑</a>', row.fid);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/finance/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteUserFun(\'{0}\');" >删除</a>', row.fid);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#financeToolbar'
        });
    });
    
    function addUserFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/finance/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = financeDataGrid; //因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#financeAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteUserFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = financeDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            financeDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                var currentUserId = '${sessionInfo.id}';/*当前登录用户的ID*/
                if (currentUserId != id) {
                    progressLoad();
                    $.post('${path }/finance/delete', {
                        id : id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            financeDataGrid.datagrid('reload');
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
            var rows = financeDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            financeDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path }/finance/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = financeDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#financeEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchUserFun() {
    	financeDataGrid.datagrid('load', $.serializeObject($('#searchFinanceForm')));
    }
    function cleanUserFun() {
        $('#searchFinanceForm input').val('');
        financeDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchFinanceForm">
            <table>
                <tr>
                    <th>姓名:</th>
                    <td><input name="teaClass" placeholder="请输入姓名"/></td>
                    <th>学号:</th>
                    <td><input name="stuNo" placeholder="请输入学号"/></td>
                    <th>缴费状态:</th>
                    <td>
                    	<select class="easyui-combobox" name="fState" data-options="width:80,height:29,editable:false,panelHeight:'auto'" >
							<option value="0"></option>
							<option value="1">未缴费</option>
							<option value="2">已缴费</option>
							<option value="3">已兑帐</option>
						</select>
                    </td>
                    <th>缴费时间:</th>
                    <td>
                    	<input name="createdateStart" type="text" class="easyui-datetimebox" />
                    	<input name="createdateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input  name="createdateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchUserFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUserFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'缴费人员列表'" >
        <table id="financeDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="financeToolbar" style="display: none;">
    <shiro:hasPermission name="/finance/add">
        <a onclick="addUserFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>