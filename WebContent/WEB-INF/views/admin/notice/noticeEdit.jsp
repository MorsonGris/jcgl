<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        
        $('#noticeEditForm').form({
            url : '${path }/notice/edit',
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
        
        $("#nFlag").val('${notice.NFlag}');
    });

</script>
<div style="padding: 3px;">
    <form id="noticeEditForm" method="post">
        <table class="grid">
            	<tr>
                    <td>标题</td>
                    <td>
                    	<input type="hidden" name="nId" value="${notice.NId }" />
                    	<input name="nTitle" type="text" placeholder="请输入标题" missingMessage="标题不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true"  value="${notice.NTitle }">
                    </td>
                </tr>
                <tr>
                    <td>内容</td>
                    <td colspan="3">
						<textarea name="nContent" cols="" rows="3" style="width:98%;" placeholder="这里输入内容" missingMessage="内容不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true">${notice.NContent }</textarea>
                    </td>
                </tr>
                <tr>
                    <td>类型</td>
                     <td>
						<select class="easyui-combobox" id="nFlag" name="nFlag" data-options="width:80,height:29,editable:false,panelHeight:'auto'" >
							<option value="1">公告</option>
							<option value="2">简章</option>
						</select>
                    </td>
                </tr>
        </table>
    </form>
</div>
