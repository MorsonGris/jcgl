<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#academyEditForm').form({
            url : '${path }/academy/edit',
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
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
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
        <form id="academyEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>学校名称</td>
                    <td><input name=aId type="hidden"  value="${academy.AId}">
                    <input name="ASchool" type="text" placeholder="请输入学校名称" class="easyui-validatebox" data-options="required:true" value="${academy.ASchool}"></td>
                </tr>
                <tr>
                	<td>专业名称</td>
                    <td><input name="AMajor" type="text" placeholder="请输入专业名称" class="easyui-validatebox" data-options="required:true" value="${academy.AMajor}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>