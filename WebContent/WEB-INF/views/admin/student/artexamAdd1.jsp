<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#ArtexamAddallForm').form({
            url : '${path }/Artexam/addall',
            onSubmit : function() {
            	if($("#artexamexcel").val()=="" || document.getElementById("artexamexcel").files[0] =='请选择xls格式的文件'){
    		        $("#tishi").html("<b>*请选择文件</b>");
    				return false;
    			}
            	$("#zhongxin").hide();
    			$("#zhongxin2").show();
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
    function fileType(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.xls'){
	    	$("#tishi").html("<b>*请选择xls格式的文件</b>");
	    	$("#artexamexcel").val('');
	    	document.getElementById("excel").files[0] = '请选择xls格式的文件';
	    }else {
	    	$("#tishi").html('');
		}
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="ArtexamAddallForm" method="post" enctype="multipart/form-data">
            <div id="zhongxin">
			<table style="width:100%;" >
				<tr>
					<td style="padding-top:20px;">
						<input type="file" id="artexamexcel" name="artexamexcel" style="width:180px;" onchange="fileType(this)" />
						<a href="javascript:;" class="easyui-linkbutton" data-options="toggle:true,group:'g1'" onclick="window.location.href='${path}/Artexam/downExcel'">下载模版</a>
					</td>
				</tr>
				<tr>
					<td>
						<span id="tishi" style="color:red;font-weight:bold"></span>
					</td>
				</tr>
			</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><img src="${path}/static/style/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
        </form>
    </div>
</div>
