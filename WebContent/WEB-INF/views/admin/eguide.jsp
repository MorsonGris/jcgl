<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var eguideDataGrid;

    $(function() {
    	eguideDataGrid = $('#eguideDataGrid').datagrid({
            url : '${path }/index/selectPage',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '120',
                title : '图标',
                field : 'log',
                sortable : true
            },{
                width : '120',
                title : '学校简介',
                field : 'school',
                sortable : true
            },{
                width : '120',
                title : '院校图片',
                field : 'picture1',
                sortable : true
            },{
                width : '200',
                title : '介绍标题',
                field : 'title',
                sortable : true
            },{
                width : '120',
                title : '专业图',
                field : 'picture2',
                sortable : true
            },{
                width : '120',
                title : '毕业证图',
                field : 'picture3',
                sortable : true
            },{
                width : '120',
                title : '类型',
                field : 'type',
                sortable : true,
                hidder: true
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/eguide/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editEguideFun(\'{0}\');" >编辑</a>', row.id);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/eguide/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteEguideFun(\'{0}\');" >删除</a>', row.id);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#EguideToolbar'
        });
    });
    
    function addEguideFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 600,
            height : 300,
            href : '${path }/index/Eguideaddpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = eguideDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#EguideaddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteEguideFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = eguideDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	eguideDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前数据？', function(b) {
            if (b) {
	            progressLoad();
	            $.post('${path }/index/Eguidedelete', {
	                id : id
	            }, function(result) {
	                if (result.success) {
	                    parent.$.messager.alert('提示', result.msg, 'info');
	                    eguideDataGrid.datagrid('reload');
	                }else{
	                	parent.$.messager.alert('提示', result.msg, 'info');
	                	eguideDataGrid.datagrid('reload');
	                }
	                progressClose();
	            }, 'JSON');
            }
        });
    }
    
    function editEguideFun(id) {
        if (id == undefined) {
            var rows = eguideDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
        	eguideDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 600,
            height : 300,
            href : '${path }/index/Eguideupdatepage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = eguideDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#EguideEditForm');
                    f.submit();
                }
            } ]
        });
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:true,title:'招生简章'" >
        <table id="eguideDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="EguideToolbar" style="display: none;">
    <shiro:hasPermission name="/eguide/add">
        <a onclick="addEguideFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>