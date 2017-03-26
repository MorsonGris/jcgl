<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">

	var selectStuDataGrid;
    $(function() {

    	selectStuDataGrid = $('#selectStuDataGrid').datagrid({
            url : '${path}/student/selectDataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'sid',
            sortName : 'sdate',
            sortOrder : 'desc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [{
                width : '80',
                title : '学生编号',
                field : 'sid',
                checkbox : true,
                sortable : true
            },{
                width : '80',
                title : '姓名',
                field : 'sname',
                sortable : true
            },{
                width : '80',
                title : '学号',
                field : 'studentNo',
                sortable : true
            },{
            	width : '90',
                title : '联系电话',
                field : 'sphone',
                sortable : true
            },{
                width : '80',
                title : '院校',
                field : 'listAcademy',
                formatter : function(value, row, index) {
                	var roles = [];
                    for(var i = 0; i< value.length; i++) {
                        roles.push(value[i].aschool);
                    }
                    return(roles.join('\n'));
                }
            },{
            	width : '80',
                title : '报考层次',
                field : 'sgradations',
                sortable : true
            },{
            	width : '80',
                title : '学制',
                field : 'ssystme',
                sortable : true
            },{
            	width : '130',
                title : '日期',
                field : 'sdate',
                sortable : true
            }] ],
         });
		
        $('#stuFileAddForm').form({
            url : '${path }/stuFile/add',
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

    function queryStudent2() {
    	  $('#queryStudent2').window('open');
    	  $('#searchStuForm input').val('');
    	  $("#selectStuDataGrid").datagrid('load', {});
      }

      $("#addbtn1").click(function() {
  		var row = $("#selectStuDataGrid").datagrid("getSelected"); // 获取datagrid中被选中的行
  		$("#stuNo2").val(row.sname);
  		$("#stid").val(row.sid);
  		$("#queryStudent2").window("close");
  	});

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="stuFileAddForm" method="post" enctype="multipart/form-data">
            <table class="grid">
                <tr>
                    <td>学生姓名</td>
                    <td>
                    	<input id="stid" name="sstuId" type="hidden" />
                    	<input id="stuNo2" name="sname" type="text" placeholder="请选择学生" missingMessage="必须选择学生" class="easyui-validatebox" data-options="required:true,novalidate:true" readonly="readonly" value="" />
                    	<a href="javascript:;" class="easyui-linkbutton" data-options="toggle:true,group:'g1'" onclick="queryStudent2();">点击选择</a>
                    </td>
                </tr>
                <tr>
                    <td>相片路径</td>
                    <td>
						<input name="sfPhoto" type="file" placeholder="请选择相片"  value="">
                    </td>
                </tr>
                <tr>
                    <td>缴费凭证路径</td>
                     <td>
						<input name="sfVoucher" type="file" placeholder="请选择缴费凭证"  value="">
                    </td>
                </tr>
                <tr>
                    <td>论文路径</td>
                     <td>
						<input name="sfPaper" type="file" placeholder="请选择缴费凭证"  value="">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div id="queryStudent2" class="easyui-window" title="选择学生" data-options="iconCls:'icon-search', closable:true, closed:true"  style="width:680px;height:400px;padding:0px;">
		<!-- <div class="easyui-layout" data-options="fit:true,border:false"> -->
		    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
		        <form id="searchStuForm">
		            <table>
		                <tr>
		                   <th>学生编号:</th>
		                   <td><input name="studentNo" placeholder="请输入学生编号"/></td>
		                   <th>学生姓名:</th>
		                   <td>
			                   	<input name="sName" placeholder="请输入学生姓名"/>
		                   </td>
		                   <td>
			                   	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchStuFun();">查询</a>
			                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanStuFun();">清空</a>
		                   </td>
		                </tr>
		            </table>
		        </form>
		    </div>
		<!-- </div> -->
		<div style="height:300px;">
			<table id="selectStuDataGrid" data-options="fit:true,border:false"></table>
		</div>
		<center><a href="javascript:;" id="addbtn1" style="margin-top:10px;" class="easyui-linkbutton" data-options="toggle:true,group:'g1',iconCls:'icon-ok'" >确定</a></center>
</div>