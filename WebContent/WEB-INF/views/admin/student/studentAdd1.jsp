<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#StudentAddallForm').form({
            url : '${path }/student/addall',
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
                	parent.$.messager.alert('提示', result.msg, 'warning');
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
        <form id="StudentAddallForm" method="post" enctype="multipart/form-data">
            <table class="grid">
                <tr>
                    <td>
                    	<p style="float:left;width:160px;"><input type="file" id="studentexcel" name="studentexcel"></p>
                    	<p><a href="javascript:;" class="easyui-linkbutton" data-options="toggle:true,group:'g1'" onclick="window.location.href='${path}/student/downExcel'">下载模版</a></p>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
