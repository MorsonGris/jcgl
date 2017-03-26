<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var stuFileDataGrid;

    $(function() {

        stuFileDataGrid = $('#stuFileDataGrid').datagrid({
            url : '${path }/stuFile/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'sfId',
            sortName : 'sf_date',
	        sortOrder : 'desc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '80',
                title : '姓名',
                field : 'studentsname',
                formatter : function(value, row, index) {
                	if (row.student){
                        if(row.student.sname!= '')
                            return row.student.sname;
                        else{
                            return '';
                        }
                    } else {
                        return '';
                    }
                }
            }, {
                width : '110',
                title : '相片',
                field : 'sfPhoto',
                sortable : true
            },{
                width : '110',
                title : '缴费凭证',
                field : 'sfVoucher',
                sortable : true
            },{
                width : '110',
                title : '论文',
                field : 'sfPaper',
                sortable : true
            },{
                width : '130',
                title : '上传时间',
                field : 'sfDate',
                sortable : true
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        /* <shiro:hasPermission name="/stuFile/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="stuFile-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editstuFileFun(\'{0}\');" >编辑</a>', row.sfId);
                        </shiro:hasPermission> */
                        <shiro:hasPermission name="/stuFile/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="stuFile-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deletestuFileFun(\'{0}\');" >删除</a>', row.sfId);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                /* $('.stuFile-easyui-linkbutton-edit').linkbutton({text:'编辑'}); */
                $('.stuFile-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#stuFileToolbar'
        });
    });
    
    function addstuFileFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 260,
            href : '${path }/stuFile/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = stuFileDataGrid; //因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#stuFileAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deletestuFileFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = stuFileDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            stuFileDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                var currentstuFileId = '${sessionInfo.id}';/*当前登录用户的ID*/
                if (currentstuFileId != id) {
                    progressLoad();
                    $.post('${path }/stuFile/delete', {
                        id : id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            stuFileDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
                }
            }
        });
    }
    
    function editstuFileFun(id) {
        if (id == undefined) {
            var rows = stuFileDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            stuFileDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path }/stuFile/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = stuFileDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#stuFileEditForm');
                    f.submit();
                }
            } ]
        });
    }

	function downphoto(obj) {
		var stuname;
		var photo;
		var paper;
		var voucher;
    	var rows = $('#stuFileDataGrid').datagrid('getSelections');
    	for(var i=0; i<rows.length; i++){
    		/* ids.push(rows[i].sfId); */
    		stuname = rows[i].student.sname;
    		photo = rows[i].sfPhoto;
    		paper = rows[i].sfPaper;
    		voucher = rows[i].sfVoucher;
    	}
    	if(obj=='photo') {
    		if(stuname!='' && stuname!=null) {
        		window.location.href='${path}/stuFile/downphoto?stuname='+stuname+'&photo='+photo;
            }else {
            	parent.$.messager.show({
                    title : '提示',
                    msg : '请选择下载相片学生！'
                });
            }
        }else if(obj=='sfPaper') {
        	if(stuname!='' && stuname!=null) {
        		window.location.href='${path}/stuFile/downpaper?stuname='+stuname+'&paper='+paper;
            }else {
            	parent.$.messager.show({
                    title : '提示',
                    msg : '请选择需下载论文学生！'
                });
            }
        }else {
        	if(stuname!='' && stuname!=null) {
        		window.location.href='${path}/stuFile/downvoucher?stuname='+stuname+'&voucher='+voucher;
            }else {
            	parent.$.messager.show({
                    title : '提示',
                    msg : '请选择需下载缴费凭证学生！'
                });
            }
        }
    	
	}
    
    function searchstuFileFun() {
        stuFileDataGrid.datagrid('load', $.serializeObject($('#searchstuFileForm')));
    }
    function cleanstuFileFun() {
        $('#searchstuFileForm input').val('');
        stuFileDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchstuFileForm">
            <table>
                <tr>
                    <th>姓名:</th>
                    <td><input name="sfPaper" placeholder="请输入姓名"/></td>
                    <th>上传时间:</th>
                    <td>
                        <input name="sfDate" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input  name="endDate" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchstuFileFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanstuFileFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'文件上传列表'" >
        <table id="stuFileDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="stuFileToolbar" style="display: none;">
    <shiro:hasPermission name="/stuFile/add">
        <a onclick="addstuFileFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="/stuFile/downphoto">
        <a onclick="downphoto('photo');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-download icon-green'">下载相片</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="/stuFile/downvoucher">
        <a onclick="downphoto('sfVoucher');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-download icon-green'">下载缴费凭证</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="/stuFile/downpaper">
        <a onclick="downphoto('sfPaper');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-download icon-green'">下载论文</a>
    </shiro:hasPermission>
</div>