<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        
        $('#financeEditForm').form({
            url : '${path }/finance/edit',
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
                	parent.$.modalDialog.openner_dataGrid.datagrid('reload'); //之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为organization.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                }
            }
        });
        
        $("#fWay").val('${finance.FWay}');
        $("#ffState").val('${finance.FState}');
    });

    function getAccumulative() {
		var total = $("#practicalMoney").val();
		if(total!=null) {
			$("#fAccumulative").val(total);
		}
	}
</script>
<div style="padding: 3px;">
    <form id="financeEditForm" method="post">
        <table class="grid">
            	<tr>
                    <td>学生编号</td>
                    <td>
                    	<input type="hidden" name="fId" value="${finance.FId }" />
                    	<input id="stuNo" name="stuNo" type="text" placeholder="请选择学生" missingMessage="必须选择学生" class="easyui-validatebox" data-options="required:true,novalidate:true" readonly="readonly"  value="${finance.stuNo }">
                    	<!-- <a href="javascript:;" id="addStudent" class="easyui-linkbutton" data-options="toggle:true,group:'g1'" onclick="queryStudent();">点击选择</a> -->
                    </td>
                    <td>班主任</td>
                    <td>
                    	<input name="teaClass" type="text" placeholder="请输入班主任" missingMessage="班主任不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="${finance.teaClass }">
                    </td>
                </tr>
                <tr>
                	<td>需交金额</td>
                    <td>
                    	<input name="needMoney" type="number" placeholder="请输入需交金额" missingMessage="需交金额不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="${finance.needMoney }">
                    </td>
                    <td>实缴金额</td>
                    <td>
                    	<input id="practicalMoney" name="practicalMoney" type="number" placeholder="请输入实缴金额" missingMessage="实缴金额不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" onblur="getAccumulative();" value="${finance.practicalMoney }">
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
                    	<input id="fAccumulative" name="fAccumulative" type="number" readonly class="easyui-validatebox" data-options="required:true,novalidate:true" value="${finance.FAccumulative }">
                    </td>
                </tr>
                <tr>
                    <td>缴费状态</td>
                    <td>
                    	<select class="easyui-combobox" id="ffState" name="fState" data-options="width:80,height:29,editable:false,panelHeight:'auto'" >
							<option value="1">未缴费</option>
							<option value="2">已缴费</option>
							<option value="3">已兑帐</option>
						</select>
                    </td>
                </tr>
        </table>
    </form>
</div>
