<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">

    $(function() {
		
        $('#shareAddForm').form({
            url : '${path }/Share/shareadd',
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

        });

    function LessThan(oTextArea){
        //获得textarea的maxlength属性
        var MaxLength=oTextArea.getAttribute("maxlength");
        var num=MaxLength-oTextArea.value.length;  
        if(num==MaxLength){
               $('#txtNum').attr('visi','yes').hide();
        }else{
               $('#txtNum').attr('visi','yes').show();
               $('#txtNum').html("<font font-size='13px'>还能输入："+num+"字</font>");
        }
        //返回文本框字符个数是否符号要求的boolean值
        return oTextArea.value.length < oTextArea.getAttribute("maxlength");
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="shareAddForm" method="post" enctype="multipart/form-data">
            <table class="grid">
                <tr>
                    <td>共享图标</td>
                    <td>
                    	<input name="sharephone" type="file" placeholder="请选择共享图标"  value="">
                    </td>
                </tr>
                <tr>
                    <td>共享标题</td>
                    <td>
						<input name="sharetitle" type="text" placeholder="请输入标题" missingMessage="必须输入标题" class="easyui-validatebox" data-options="required:true,novalidate:true" value="" />
                    </td>
                </tr>
                <tr>
                    <td>页面图片</td>
                     <td>
						<input name="sharepicture" type="file" placeholder="请选择页面图片"  value="">
                    </td>
                </tr>
                <tr>
                    <td>页面内容</td>
                    <td colspan="3">
						<textarea name="sharecontent" cols="" rows="5" style="width:98%;" class="easyui-validatebox textarea " validtype="length[0,500]"  invalidMessage="最大长度500位" placeholder="这里输入页面内容"></textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>