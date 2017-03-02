<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        
        $('#relationEditForm').form({
            url : '${path }/relation/edit',
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
                	parent.$.modalDialog.openner_dataGrid.datagrid('reload'); //之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为organization.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                }
            }
        });
        
    });
</script>
<div style="padding: 3px;">
    <form id="relationEditForm" method="post">
        <table class="grid">
            <tr>
                    <td>联系类型</td>
                    <td>
                    	<input name="rId" type="hidden"  value="${relation.RId}">
                    	<input name="rEffect" type="text" placeholder="请输入联系类型" class="easyui-validatebox" data-options="required:true" value="${relation.REffect}">
                    </td>
                </tr>
                <tr>
                    <td>QQ号码</td>
                    <td><input name="rQq" type="text" placeholder="请输入QQ号码" class="easyui-validatebox" data-options="required:true" value="${relation.RQq}"></td>
                </tr>
                <tr>
                    <td>手机号码</td>
                    <td><input name="rPhone" type="text" placeholder="请输入手机号码" class="easyui-validatebox" data-options="required:true" value="${relation.RPhone}"></td>
                </tr>
                <tr>
                    <td>详细说明</td>
                     <td colspan="3">
						<textarea name="rContent" cols="" rows="3" style="width:98%;" class="textarea" placeholder="这里输入详细说明">${relation.RContent}</textarea>
                    </td>
                </tr>
        </table>
    </form>
</div>
