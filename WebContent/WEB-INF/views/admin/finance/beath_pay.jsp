<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript">
    $(function() {
		
        $('#financebatch').form({
            url : '${path }/finance/batchPay',
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

    function getAccumulative() {
		var total = $("#practicalMoney").val();
		if(total!=null) {
			$("#fAccumulative").val(total);
		}
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="financebatch" method="post">
            <table class="grid">
                <tr>
                    <td>缴费金额</td>
                    <td>
                    	<input type="hidden" name="teaClass" value="${ids}"/>
                    	<input id="practicalMoney" name="practicalMoney" type="number" onblur="getAccumulative();" placeholder="请输入缴费金额" missingMessage="缴费金额不能为空" class="easyui-validatebox" data-options="required:true" value="">
                    	<input id="fAccumulative" name="fAccumulative" type="hidden" />
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
                </tr>
            </table>
        </form>
    </div>
</div>