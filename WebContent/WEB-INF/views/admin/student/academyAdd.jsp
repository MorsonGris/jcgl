<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#academyAddForm').form({
            url : '${path }/academy/add',
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
        <form id="academyAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>学校</td>
                    <td><input name="aSchool" type="text" placeholder="请输入学校名称" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                </tr>
                <tr>
                	<td>专业</td>
                    <td><input name="aMajor" type="text" placeholder="请输入专业名称" class="easyui-validatebox" data-options="required:true,novalidate:true" value=""></td>
                </tr>
            </table>
        </form>
    </div>
</div>