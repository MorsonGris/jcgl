<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        
        $('#homeContentEditForm').form({
            url : '${path }/homeContent/edit',
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
        
    });

    $.extend($.fn.validatebox.defaults.rules, {
        phoneNum: { //验证手机号   
            validator: function(value, param){ 
             return /^1[3-8]+\d{9}$/.test(value);
            },    
            message: '请输入正确的手机号码。'   
        },
        
        telNum:{ //既验证手机号，又验证座机号
          validator: function(value, param){ 
              return /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\d3)|(\d{3}\-))?(1[358]\d{9})$)/.test(value);
             },    
             message: '请输入正确的电话号码。' 
     }});
</script>
<div style="padding: 3px;">
    <form id="homeContentEditForm" method="post" enctype="multipart/form-data">
        <table class="grid">
            	<tr>
                    <td>轮播图一</td>
                    <td>
                    	<input name="hcId" type="hidden"  value="${homeContent.hcId}">
                    	<input name="pictureOne" type="file" placeholder="请选择轮播图一" value="">
                    </td>
                    <td>轮播图二</td>
                    <td>
                    	<input name="pictureTwo" type="file" placeholder="请选择轮播图二"  value="">
                    </td>
                </tr>
                <tr>
                    <td>轮播图三</td>
                    <td>
                    	<input name="pictureThree" type="file" placeholder="请选择轮播图三" value="">
                    </td>
                    <td>二维码一</td>
                    <td>
                    	<input name="qrcodeOne" type="file" placeholder="请选择二维码一" value="">
                    </td>
                </tr>
                <tr>
                    <td>二维码二</td>
                    <td>
                    	<input name="qrcodeTwo" type="file" placeholder="请选择二维码二" value="">
                    </td>
                	<td>电话号码</td>
                    <td><input name="hcPhone" type="text" placeholder="请输入电话号码" class="easyui-textbox" data-options="prompt:'请输入正确的电话号码。',validType:'telNum'" value="${homeContent.hcPhone}" /></td>
                </tr>
                <tr>
                    <td>链接一</td>
                    <td>
                    	<input name="interlinkageOne" type="text" placeholder="请输入链接一" missingMessage="链接一不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="${homeContent.interlinkageOne}">
                    </td>
                    <td>链接二</td>
                    <td>
                    	<input name="interlinkageTwo" type="text" placeholder="请输入链接二" missingMessage="链接二不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="${homeContent.interlinkageTwo}">
                    </td>
                </tr>
                <tr>
                    <td>链接三</td>
                    <td>
                    	<input name="interlinkageThree" type="text" placeholder="请输入链接三" missingMessage="链接三不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="${homeContent.interlinkageThree}">
                    </td>
                    <td>链接四</td>
                    <td>
                    	<input name="interlinkageFour" type="text" placeholder="请输入链接四" missingMessage="链接四不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="${homeContent.interlinkageFour}">
                    </td>
                </tr>
                <tr>
                	<td>联系地址</td>
                    <td colspan="3">
                    	<input name="hcAddress" type="text" style="width:350px;" placeholder="请输入联系地址" missingMessage="联系地址不能为空" class="easyui-validatebox" data-options="required:true,novalidate:true" value="${homeContent.hcAddress}">
                    </td>
                </tr>
        </table>
    </form>
</div>
