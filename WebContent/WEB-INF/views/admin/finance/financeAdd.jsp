<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript">
	var selectStuDataGrid;
    $(function() {
        
    	selectStuDataGrid = $('#selectStuDataGrid').datagrid({
            url : '<%=path %>/student/selectDataGrid?stype=1',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            sortName : 'sdate',
            sortOrder : 'desc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [{
                width : '80',
                title : '学生编号',
                field : 'sid',
                checkbox : true,
                sortable : true
            },{
                width : '80',
                title : '姓名',
                field : 'sname',
                sortable : true
            },{
                width : '80',
                title : '学号',
                field : 'studentNo',
                sortable : true
            },{
            	width : '90',
                title : '联系电话',
                field : 'sphone',
                sortable : true
            },{
            	width : '80',
                title : '院校',
                field : 'academyId',
                sortable : true
            }/* {
                width : '80',
                title : '院校',
                field : 'listAcademy',
                formatter : function(value, row, index) {
                	var roles = [];
                    for(var i = 0; i< value.length; i++) {
                        roles.push(value[i].aschool);
                    }
                    return(roles.join('\n'));
                }
            } */,{
            	width : '80',
                title : '报考层次',
                field : 'sgradations',
                sortable : true
            },{
            	width : '80',
                title : '学制',
                field : 'ssystme',
                sortable : true
            },{
            	width : '130',
                title : '日期',
                field : 'sdate',
                sortable : true
            }] ],
         });
		
        $('#financeAddForm').form({
            url : '${path }/finance/add',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('enableValidation').form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });

       });

    
    function queryStudent() {
  	  $('#queryStudent').window('open');
  	  $('#searchStuForm input').val('');
  	  $("#selectStuDataGrid").datagrid('load', {});
    }

    $("#addbtn1").click(function() {
		var row = $("#selectStuDataGrid").datagrid("getSelected"); // 获取datagrid中被选中的行
		$("#stuNo1").val(row.studentNo);
		$("#queryStudent").window("close");
	});
    
	function getAccumulative() {
		var total = $("#practicalMoney").val();
		if(total!=null) {
			$("#fAccumulative").val(total);
		}
	}

	function searchStuFun() {
		$("#selectStuDataGrid").datagrid('load', $.serializeObject($('#searchStuForm')));
    }
    function cleanStuFun() {
        $('#searchStuForm input').val('');
        $("#selectStuDataGrid").datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="financeAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>学生编号</td>
                    <td>
                    	<input id="stuNo1" name="stuNo" type="text" placeholder="请选择学生" missingMessage="必须选择学生" class="easyui-validatebox" data-options="required:true,novalidate:true" readonly="readonly" value="" />
                    	<a href="javascript:;" id="addStudent" class="easyui-linkbutton" data-options="toggle:true,group:'g1'" onclick="queryStudent();">点击选择</a>
                    </td>
                    <td>班主任</td>
                    <td>
                    	<input name="teaClass" type="text" placeholder="请输入班主任" missingMessage="班主任不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="">
                    </td>
                </tr>
                <tr>
                	<td>需交金额</td>
                    <td>
                    	<input name="needMoney" type="number" placeholder="请输入需交金额" missingMessage="需交金额不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="">
                    </td>
                    <td>实缴金额</td>
                    <td>
                    	<input id="practicalMoney" name="practicalMoney" type="number" placeholder="请输入实缴金额" missingMessage="实缴金额不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" onblur="getAccumulative();" value="">
                    </td>
                </tr>
                <tr>
                    <td>缴费方式</td>
                     <td>
						<select class="easyui-combobox" id="fWay" name="fWay" data-options="width:80,height:29,editable:false,panelHeight:'auto'" >
							<option value="1">支付宝</option>
							<option value="2">微信</option>
							<option value="3">银行转账</option>
							<option value="4">现金</option>
						</select>
                    </td>
                    <td>缴费总额</td>
                    <td>
                    	<input id="fAccumulative" name="fAccumulative" type="number" readonly class="easyui-validatebox" data-options="required:true,novalidate:true" value="">
                    </td>
                </tr>
                <tr>
                    <td>缴费状态</td>
                    <td>
						<select class="easyui-combobox" id="fState" name="fState" data-options="width:80,height:29,editable:false,panelHeight:'auto'" >
							<option value="1">未缴费</option>
							<option value="2">已缴费</option>
							<option value="3">已兑帐</option>
						</select>
                    </td>
                    <td>缴费时间</td>
                    <td>
                    	<input  name="fDate" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                    </td>
                </tr>
                <tr>
	               	 <td>学期</td>
	               	 <td>
	               	 	<select class="easyui-combobox" id="fObligate" name="fObligate" data-options="width:80,height:29,editable:false,panelHeight:'auto'" >
	               	 		<option value="第一学期">第一学期</option>
	               	 		<option value="第二学期">第二学期</option>
	               	 		<option value="第三学期">第三学期</option>
	               	 	</select>
	               	 </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div id="queryStudent" class="easyui-window" title="选择学生" data-options="iconCls:'icon-search', closable:true, closed:true"  style="width:680px;height:400px;padding:0px;">
		<!-- <div class="easyui-layout" data-options="fit:true,border:false"> -->
		    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
		        <form id="searchStuForm">
		            <table>
		                <tr>
		                   <th>学生编号:</th>
		                   <td><input name="studentNo" placeholder="请输入学生编号"/></td>
		                   <th>学生姓名:</th>
		                   <td>
			                   	<input name="sName" placeholder="请输入学生姓名"/>
			                   	<input name="stype" type="hidden" value="1" />
		                   </td>
		                   <td>
			                   	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchStuFun();">查询</a>
			                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanStuFun();">清空</a>
		                   </td>
		                </tr>
		            </table>
		        </form>
		    </div>
		<!-- </div> -->
		<div style="height:300px;">
			<table id="selectStuDataGrid" data-options="fit:true,border:false"></table>
		</div>
		<center><a href="javascript:;" id="addbtn1" style="margin-top:10px;" class="easyui-linkbutton" data-options="toggle:true,group:'g1',iconCls:'icon-ok'" >确定</a></center>
</div>