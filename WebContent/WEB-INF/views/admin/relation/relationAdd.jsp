<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {

        $('#relationAddForm').form({
            url : '${path }/relation/add',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
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
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="relationAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>联系类型</td>
                    <td><input name="rEffect" type="text" placeholder="请输入联系类型" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>QQ号码</td>
                    <td><input name="rQq" type="text" placeholder="请输入QQ号码" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>手机号码</td>
                    <td><input name="rPhone" type="text" placeholder="请输入手机号码" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>详细说明</td>
                     <td colspan="3">
						<textarea name="rContent" cols="" rows="3" style="width:98%;" class="textarea" placeholder="这里输入详细说明"></textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>