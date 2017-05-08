<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var studentDataGrid;

    $(function() {
    	studentDataGrid = $('#studentDataGrid').datagrid({
            url : '${path }/student/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'sId',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '100',
                title : '学生编号',
                field : 'studentNo',
                sortable : true
            },{
                width : '70',
                title : '学生姓名',
                field : 'sname',
                sortable : true
            },{
                width : '70',
                title : '老师姓名',
                field : 'listUser',
                sortable : true,
                formatter : function(value, row, index) {
                    var roles = [];
                    for(var i = 0; i< value.length; i++) {
                        roles.push(value[i].name);  
                    }
                    return(roles.join('\n'));
                }
            },{
                width : '150',
                title : '身份证号码',
                field : 'idNumber',
                sortable : true
            },{
                width : '120',
                title : '手机号码',
                field : 'sphone',
                sortable : true
            },{
                width : '120',
                title : '报考院校',
                field : 'academyId',
                sortable : true
            },{
                width : '100',
                title : '专业',
                field : 'scontent',
                sortable : true
            },{
                width : '70',
                title : '报考层次',
                field : 'sgradations',
                sortable : true
            },{
                width : '80',
                title : '学制',
                field : 'ssystme',	
                sortable : true
            },{
                width : '90',
                title : '报名类型',
                field : 'stype',
                sortable : true,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 1:
                        return '成人教育';
                    case 2:
                        return '国家开放大学';
                    case 6:
                        return '远程教育';
                    }
                }
            },{
                width : '100',
                title : '报考日期',
                field : 'sdate',
                sortable : true,
                formatter: formatDatebox
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                	var str = '';
                        <shiro:hasPermission name="/student/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editStudentFun(\'{0}\',\'{1}\');" >编辑</a>', row.sid,row.stype);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/student/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteStudentFun(\'{0}\');" >删除</a>', row.sid);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#studentToolbar'
        });
    });
    
    function addStudentFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 250,
            href : '${path }/student/addpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = studentDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#studentAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function addallStudentFun(){
    	 parent.$.modalDialog({
             title : '批量添加',
             width : 270,
             height : 160,
             href : '${path }/student/addall',
             buttons : [ {
                 text : '确定',
                 handler : function() {
                     parent.$.modalDialog.openner_dataGrid = studentDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                     var f = parent.$.modalDialog.handler.find('#StudentAddallForm');
                     f.submit();
                 }
             } ]
         });
    }
    
    function deleteStudentFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = studentDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	studentDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前数据？', function(b) {
            if (b) {
	            progressLoad();
	            $.post('${path }/student/delete', {
	                id : id
	            }, function(result) {
	                if (result.success) {
	                    parent.$.messager.alert('提示', result.msg, 'info');
	                    studentDataGrid.datagrid('reload');
	                }else{
	                	 parent.$.messager.alert('提示', result.msg, 'info');
	                }
	                progressClose();
	            }, 'JSON');
            }
        });
    }
    
    function editStudentFun(id,type) {
       if (id == undefined || type == undefined) {
            var rows = studentDataGrid.datagrid('getSelections');
            id = rows[0].id;
            type = rows[1].type;
        } else {
        	studentDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : "${path }/student/editpage?type="+type+"&id="+id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = studentDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#studentEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchStudentFun() {
    	studentDataGrid.datagrid('load', $.serializeObject($('#searchStudentForm')));
    }
    function cleanStudentFun() {
        $('#searchStudentForm input').val('');
        $('#teaid').find("option").eq(0).prop("selected",true);
        $('#s').find("option").eq(0).prop("selected",true);
        studentDataGrid.datagrid('load', {});
    }
    
    Date.prototype.format = function (format) {    
        var o = {    
            "M+": this.getMonth() + 1,   
            "d+": this.getDate(),    
            "h+": this.getHours(),   
            "m+": this.getMinutes(),    
            "s+": this.getSeconds(),  
            "q+": Math.floor((this.getMonth() + 3) / 3),  
            "S": this.getMilliseconds()    
        }    
        if (/(y+)/.test(format))    
            format = format.replace(RegExp.$1, (this.getFullYear() + "")    
                .substr(4 - RegExp.$1.length));    
        for (var k in o)    
            if (new RegExp("(" + k + ")").test(format))    
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));    
        return format;    
    }    
    function formatDatebox(value) {    
        if (value == null || value == '') {    
            return '';    
        }    
        var dt;    
        if (value instanceof Date) {    
            dt = value;    
        } else {    
            dt = new Date(value);    
        }    
        return dt.format("yyyy-MM-dd");  
    }  
    
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height:30px; overflow: hidden;background-color: #fff">
        <form id="searchStudentForm">
            <table>
                <tr>
                   <th>学生编号:</th>
                   <td>
                   	<input name="studentNo" style="width:85px;" placeholder="请输入学生编号"/>
                   </td>
                   <th>学生姓名:</th>
                   <td>
                   	<input name="sName" style="width:85px;" placeholder="请输入学生姓名"/>
                   </td>
                   <th>手机号码:</th>
                   <td>
                   		<input name="sPhone" style="width:110px;" placeholder="请输入学生手机号码"/>
                   </td>
                   <th>老师姓名:</th>
                   <td>
	                  <select id="teaid" name="userId" style="height:20px;">
	                   	<option value="0">请选择老师</option>
	                   	<c:forEach var="list" items="${list}">
	                   		<option value="${list.id}">${list.name}</option>
	                   	</c:forEach>
	                   </select>
                   </td>
                   <th>报名类型:</th>
                   <td>
	                  <select id="s" name="stype" style="height:20px;">
	                   	<option value="0">报名类型</option>
		                <option value="1">成人教育</option>
		                <option value="2">开放大学</option>
		                <option value="6">远程教育</option>
	                  </select>
                   </td>
                  <th>报名日期:</th>
                  <td>
                   	<input id="createdateStart" name="createdateStart" style="width:120px;" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                    <input id="createdateEnd" name="createdateEnd" style="width:120px;" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                  </td>
                  <td>
	                 <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchStudentFun();">查询</a>
	                 <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanStudentFun();">清空</a>
                  </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'学生信息表'" >
        <table id="studentDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="studentToolbar" style="display: none;">
    <shiro:hasPermission name="/student/add">
     	<a onclick="addStudentFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
     	<a onclick="addallStudentFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-upload icon-green'">批量添加</a>
    </shiro:hasPermission>
</div>