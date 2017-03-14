<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#applyTypeAddForm').form({
            url : '${path }/applyType/add',
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
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
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
        <form id="applyTypeAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>报名类别</td>
                    <td><input name="atName" type="text" placeholder="请输入报名类别名称" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                </tr>
                <tr>
                	<td>图标地址</td>
                    <td><input name="atIcon" type="text" placeholder="请选择图标" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                </tr>
            </table>
        </form>
    </div>
</div>