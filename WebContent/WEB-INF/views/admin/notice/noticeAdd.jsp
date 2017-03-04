<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
		
        $('#noticeAddForm').form({
            url : '${path }/notice/add',
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
        <form id="noticeAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>标题</td>
                    <td><input name="nTitle" type="text" placeholder="请输入标题" missingMessage="标题不能为空" class="easyui-validatebox" data-options="required:true"  value=""></td>
                </tr>
                <tr>
                    <td>内容</td>
                    <td colspan="3">
						<textarea name="nContent" cols="" rows="3" style="width:98%;" class="textarea" placeholder="这里输入内容"></textarea>
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
</div>