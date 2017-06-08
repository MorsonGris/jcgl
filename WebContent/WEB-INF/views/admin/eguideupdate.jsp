<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
        $('#EguideEditForm').form({
            url : '${path }/index/Eguideupdate',
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
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="EguideEditForm" method="post" enctype="multipart/form-data">
            <table class="grid">
                <tr>
                    <td>图标</td>
                    <td>
                    	<input type="hidden" name="id" value="${eguide.id}"/> 
                    	<input type="file" name="log" id="log"/>
                    </td>
                    <td>院校图片</td>
                    <td>
                    	<input type="file" name="picture1" value="${eguide.picture1}"/>
                    </td>
                </tr>
                <tr>
                	<td>毕业证图片</td>
                    <td>
                    	<input type="file" name="picture3" value="${eguide.picture2}"/>
                    </td>
                    <td>专业图片</td>
                    <td>
                    	<input type="file" name="picture2" value="${eguide.picture3}"/>
                    </td>
                </tr>
                <tr>
                    <td>介绍标题</td>
                    <td>
                    	<textarea rows="3" name="title" style="width: 180px;" placeholder="请输入标题" class="easyui-validatebox" data-options="required:true,novalidate:true"><c:out value="${eguide.title}"></c:out></textarea>
                    </td>
                    <td>学校名称</td>
                    <td>
                        <input type="text" name="type" value="${eguide.type}" placeholder="请输入学校名称" class="easyui-validatebox" data-options="required:true,novalidate:true">
                    </td>
                </tr>
                <tr>
                	<td>学校简介</td>
                    <td>
                    	<textarea rows="2" name="school" style="width: 180px;" placeholder="请输入学校介绍"  class="easyui-validatebox" data-options="required:true,novalidate:true"><c:out value="${eguide.school}"></c:out></textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>