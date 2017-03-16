<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var homeContentDataGrid;

    $(function() {

        homeContentDataGrid = $('#homeContentDataGrid').datagrid({
            url : '${path }/homeContent/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'hcId',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '80',
                title : '轮播图一',
                field : 'pictureOne',
                sortable : true
            }, {
                width : '80',
                title : '轮播图二',
                field : 'pictureTwo',
                sortable : true
            },{
                width : '80',
                title : '轮播图三',
                field : 'pictureThree',
                sortable : true
            },{
                width : '80',
                title : '二维码一',
                field : 'qrcodeOne'
            },{
                width : '80',
                title : '二维码二',
                field : 'qrcodeTwo',
                sortable : true
            },{
                width : '90',
                title : '联系电话',
                field : 'hcPhone'
            },{
                width : '120',
                title : '联系地址',
                field : 'hcAddress',
                sortable : true
            },{
                width : '80',
                title : '链接一',
                field : 'interlinkageOne'
            },{
                width : '80',
                title : '链接二',
                field : 'interlinkageTwo'
            },{
                width : '80',
                title : '链接三',
                field : 'interlinkageThree'
            },{
                width : '80',
                title : '链接四',
                field : 'interlinkageFour'
            },{
                field : 'action',
                title : '操作',
                width : 80,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/homeContent/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="homeContent-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="edithomeContentFun(\'{0}\');" >编辑</a>', row.hcId);
                        </shiro:hasPermission>
                       /*  <shiro:hasPermission name="/homeContent/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="homeContent-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deletehomeContentFun(\'{0}\');" >删除</a>', row.rid);
                        </shiro:hasPermission> */
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.homeContent-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                /* $('.homeContent-easyui-linkbutton-del').linkbutton({text:'删除'}); */
            },
            toolbar : '#homeContentToolbar'
        });
    });
    
    function addhomeContentFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/homeContent/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = homeContentDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#homeContentAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deletehomeContentFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = homeContentDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            homeContentDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                    progressLoad();
                    $.post('${path }/homeContent/delete', {
                        id : id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            homeContentDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
                } else {
                    parent.$.messager.show({
                        title : '提示',
                        msg : '不可以删除自己！'
                    });
                }
        });
    }
    
    function edithomeContentFun(id) {
        if (id == undefined) {
            var rows = homeContentDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            homeContentDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 600,
            height : 340,
            href : '${path }/homeContent/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = homeContentDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#homeContentEditForm');
                    f.submit();
                }
            } ]
        });
    }

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:true,title:'首页显示内容'" >
        <table id="homeContentDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<%-- <div id="homeContentToolbar" style="display: none;">
    <shiro:hasPermission name="/homeContent/add">
        <a onclick="addhomeContentFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div> --%>