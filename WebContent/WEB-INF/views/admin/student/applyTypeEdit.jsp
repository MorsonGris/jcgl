<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#applyTypeEditForm').form({
            url : '${path }/applyType/edit',
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
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="applyTypeEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>报名类别</td>
                    <td><input name="atId" type="hidden"  value="${applyType.atId}">
                    <input name="atName" type="text" placeholder="请输入报名类别" class="easyui-validatebox" data-options="required:true" value="${applyType.atName}"></td>
                </tr>
                <tr>
                	<td>图标地址</td>
                    <td><input name="atIcon" type="text" placeholder="请选择图标" class="easyui-validatebox" data-options="required:true" value="${applyType.atIcon}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>