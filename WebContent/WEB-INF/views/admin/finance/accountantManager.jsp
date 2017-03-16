<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var accountantDataGrid;
    $(function() {
		
        accountantDataGrid = $('#accountantDataGrid').datagrid({
            url : '${path }/accountant/DataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : false,
            idField : 'fid',
            sortName : 'f_date',
	        sortOrder : 'desc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '80',
                field : 'fid',
                checkbox:true
            },{
                width : '80',
                title : '姓名',
                field : 'studentsname',
                formatter : function(value, row, index) {
                	if (row.student){
                        if(row.student.sname!= '')
                            return row.student.sname;
                        else{
                            return '';
                        }
                    } else {
                        return '';
                    }
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
                        return '银行转账';
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
                        return '未缴费';
                    case 2:
                        return '已缴费';
                    case 3:
                        return '已兑账';
                    }
                }
            },{
                width : '80',
                title : '报考类型',
                field : 'studentstype',
                formatter : function(value, row, index) {
                	if (row.student){
                        if(row.student.stype!= ''){
                            var type = row.student.stype;
                        	if(type==3) {
                        		return "会计报名";
                            }else {
                            	return "艺考报名";
                            }
                        }else{
                            return '';
                        }
                    } else {
                        return '';
                    }
                }
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/finance/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="accountant-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editaccountantFun(\'{0}\');" >编辑</a>', row.fid);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/finance/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="accountant-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteaccountantFun(\'{0}\');" >删除</a>', row.fid);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.accountant-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.accountant-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#accountantToolbar'
        });
    });
    
    function addaccountantFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 535,
            height : 255,
            href : '${path }/accountant/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = accountantDataGrid; //因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#accountantAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteaccountantFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = accountantDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            accountantDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                    progressLoad();
                    $.post('${path }/finance/delete', {
                        id : id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            accountantDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
                }
        });
    }
    
    function editaccountantFun(id) {
        if (id == undefined) {
            var rows = accountantDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            accountantDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path }/finance/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = accountantDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#financeEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchAccountantFun() {
    	accountantDataGrid.datagrid('load', $.serializeObject($('#searchAccountantsForm')));
    }
    function cleanAccountantFun() {
        $('#searchAccountantsForm input').val('');
        accountantDataGrid.datagrid('load', {});
    }

   	//导出excel
    function toExcel1(){
    	var teaClass = $("#teaClass").val();
    	var stuNo = $("#stuNo").val();
    	var fState = $("#fState").val();
    	var createdateStart = $("#createdateStart").val();
    	var createdateEnd = $("#createdateEnd").val();
    	var url = '${path }/accountant/download_finance?teaClass='+teaClass+'&stuNo='+stuNo+'&fState='+fState+'&createdateStart='+createdateStart+'&createdateEnd='+createdateEnd;
    	window.open(url);
    }

    //上传excel
    function fromExcel1() {
    	parent.$.modalDialog({
            title : '上传',
            width : 300,
            height : 150,
            href : '${path }/finance/goUploadExcel',
            buttons : [ {
                text : '导入',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = accountantDataGrid; //因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#uploadForm');
                    f.submit();
                }
            },{
        		text : '取消',
        		handler : function() {
        		parent.$.modalDialog.handler.dialog('destroy');
        		parent.$.modalDialog.handler = undefined;
        		}}]
        });
    }

    function batch_pay1() {
    	var ids = [];
    	var rows = $('#accountantDataGrid').datagrid('getSelections');
    	for(var i=0; i<rows.length; i++){
    		ids.push(rows[i].fid);
    	}
    	if(ids!='' && ids!=null) {
        	parent.$.modalDialog({
                title : '批量缴费',
                width : 300,
                height : 200,
                href : '${path }/finance/batchPay_Page?ids=' + ids.join(','),
                buttons : [ {
                    text : '确定缴费',
                    handler : function() {
                        parent.$.modalDialog.openner_dataGrid = accountantDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                        var f = parent.$.modalDialog.handler.find('#financebatch');
                        f.submit();
                    }
                } ]
            });
        }else {
        	parent.$.messager.show({
                title : '提示',
                msg : '请选择需缴费学生！'
            });
        }
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchAccountantsForm">
            <table>
                <tr>
                    <th>合作人:</th>
                    <td><input id="teaClass" name="teaClass" placeholder="请输入合作人"/></td>
                    <th>学号:</th>
                    <td><input id="stuNo" name="stuNo" placeholder="请输入学号"/></td>
                    <th>缴费状态:</th>
                    <td>
                    	<select class="easyui-combobox" id="fState" name="fState" data-options="width:80,height:29,editable:false,panelHeight:'auto'" >
							<option value="0"></option>
							<option value="1">未缴费</option>
							<option value="2">已缴费</option>
							<option value="3">已兑帐</option>
						</select>
                    </td>
                    <th>缴费时间:</th>
                    <td>
                    	<!-- <input name="createdateStart" type="text" class="easyui-datetimebox" /> -->
                    	<input id="createdateStart" name="createdateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input id="createdateEnd" name="createdateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchAccountantFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanAccountantFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'缴费人员列表'" >
        <table id="accountantDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="accountantToolbar" style="display: none;">
    <shiro:hasPermission name="/finance/add">
        <a onclick="addaccountantFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="/finance/upload_finance">
        <a onclick="fromExcel1();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-upload icon-green'" >上传缴费数据</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="/finance/download_finance">
        <a onclick="toExcel1();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-download icon-green'" >导出当前数据</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="/finance/batchPay">
        <a onclick="batch_pay1();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-dollar-bill icon-green'" >批量缴费</a>
    </shiro:hasPermission>
</div>