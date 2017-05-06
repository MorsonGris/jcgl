<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="${staticPath}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/simple-calendar.css" />
<script type="text/javascript" src="${staticPath}/static/style/simple-calendar.js"></script>
<script type="text/javascript" src="${staticPath}/static/ztree/js/jquery.ztree.core.js"></script>
<title>招生管理公共平台</title>
<script type="text/javascript">
var zTreeObj;
var index_tabs;
var tree;
var indexTabsMenu;
$(function() {
    $('#index_layout').layout({fit : true});
    
    index_tabs = $('#index_tabs').tabs({
        fit : true,
        border : false,
        onContextMenu : function(e, title) {
            e.preventDefault();
            indexTabsMenu.menu('show', {
                left : e.pageX,
                top : e.pageY
            }).data('tabTitle', title);
        },
        tools : [{
            iconCls : 'fi-home',
            handler : function() {
                index_tabs.tabs('select', 0);
            }
        }, {
            iconCls : 'fi-loop',
            handler : function() {
                refreshTab();
            }
        }, {
            iconCls : 'fi-x',
            handler : function() {
                var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
                var tab = index_tabs.tabs('getTab', index);
                if (tab.panel('options').closable) {
                    index_tabs.tabs('close', index);
                }
            }
        } ]
    });
    // 选项卡菜单
    indexTabsMenu = $('#tabsMenu').menu({
        onClick : function(item) {
            var curTabTitle = $(this).data('tabTitle');
            var type = $(item.target).attr('type');
            if (type === 'refresh') {
                refreshTab();
                return;
            }
            if (type === 'close') {
                var t = index_tabs.tabs('getTab', curTabTitle);
                if (t.panel('options').closable) {
                    index_tabs.tabs('close', curTabTitle);
                }
                return;
            }
            var allTabs = index_tabs.tabs('tabs');
            var closeTabsTitle = [];
            $.each(allTabs, function() {
                var opt = $(this).panel('options');
                if (opt.closable && opt.title != curTabTitle
                        && type === 'closeOther') {
                    closeTabsTitle.push(opt.title);
                } else if (opt.closable && type === 'closeAll') {
                    closeTabsTitle.push(opt.title);
                }
            });
            for ( var i = 0; i < closeTabsTitle.length; i++) {
                index_tabs.tabs('close', closeTabsTitle[i]);
            }
        }
    });
});
// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var setting = {
	 view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pid",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				var opts = {
		                title : treeNode.name,
		                border : false,
		                closable : true,
		                fit : true
	            };
	            var url = treeNode.attributes;
	            if (url && url.indexOf("http") == -1) {
	                url = '${path }' + url;
	            }
	            if (treeNode.openMode == 'iframe') {
	                opts.content = '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99.5%;"></iframe>';
	                addTab(opts);
	            } else if (url) {
	                opts.href = url;
	                addTab(opts);
	            }
			}
		}
};

$(document).ready(function(){
	var treeNodes;
	 var t = $("#tree");
	 	$.ajax({  //JQuery的Ajax  
	        type: 'POST',    
	        dataType : "json",//返回数据类型  
	        async:false,  
	        url: "${path }/resource/tree",//请求的action路径  
	        data: {"flag":true},  //同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行  
	        error: function () {//请求失败处理函数    
	            alert('请求失败');    
	        },  
	        success:function(data){ //请求成功后处理函数。  取到Json对象data  
	            treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes      
	            t = $.fn.zTree.init(t, setting, treeNodes);//初始化树，传入树的Dom<pre name="code" class="html">  
			} 
		}); 
		
		demoIframe = $("#testIframe");
		demoIframe.bind("load", loadReady);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", 1));
 		zTreeObj = $.fn.zTree.init($("#tree"), setting, treeNodes);
});
function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
		htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
		maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
		h = demoIframe.height() >= maxH ? minH:maxH ;
		if (h < 530) h = 530;
		demoIframe.height(h);
}
   

   function addTab(opts) {
       var t = $('#index_tabs');
       if (t.tabs('exists', opts.title)) {
           t.tabs('select', opts.title);
       } else {
           t.tabs('add', opts);
       }
   }
   
   function refreshTab() {
       var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
       var tab = index_tabs.tabs('getTab', index);
       var options = tab.panel('options');
       if (options.content) {
           index_tabs.tabs('update', {
               tab: tab,
               options: {
                   content: options.content
               }
           });
       } else {
           tab.panel('refresh', options.href);
       }
   }
   
   function logout(){
       $.messager.confirm('提示','确定要退出?',function(r){
           if (r){
               progressLoad(); 
               $.post('${path }/logout',{}, function(result) {
                   if(result.success){
                       progressClose();
                       window.location.href='${path }/login';
                   }
               }, 'json');
           }
       });
   }

   function editUserPwd() {
       parent.$.modalDialog({
           title : '修改密码',
           width : 300,
           height : 250,
           href : '${path }/user/editPwdPage',
           buttons : [ {
               text : '确定',
               handler : function() {
                   var f = parent.$.modalDialog.handler.find('#editUserPwdForm');
                   f.submit();
               }
           } ]
       });
   }

</script>
</head>
<body>
    <div id="loading" style="position: fixed;top: -50%;left: -50%;width: 200%;height: 200%;background: #fff;z-index: 100;overflow: hidden;">
        <img src="${staticPath }/static/style/images/ajax-loader.gif" style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;margin: auto;"/>
    </div>
    <div id="index_layout">
        <div data-options="region:'north',border:false" style="overflow: hidden;">
            <div>
                <span style="float: right; padding-right: 20px; margin-top: 15px; color: #333">
                    <i class="fi-torso"></i>
                    <b><shiro:principal></shiro:principal></b>&nbsp;&nbsp; 
                    <shiro:hasPermission name="/user/editPwdPage">
                        <a href="javascript:void(0)" onclick="editUserPwd()" class="easyui-linkbutton" plain="true" icon="fi-unlock" >修改密码</a>
                    </shiro:hasPermission>&nbsp;&nbsp;
                    <a href="${path }/logout" class="easyui-linkbutton" plain="true" icon="fi-x">安全退出</a>
                </span>
                <span class="header"></span>
            </div>
        </div>
        <div data-options="region:'west',split:true" title="菜单" style="width: 160px; overflow: hidden;overflow-y:auto; padding:0px">
            <div class="well well-small" style="padding: 5px 5px 5px 5px;">
                <ul id="tree" class="ztree"></ul>
            </div>
        </div>
        <div data-options="region:'center'" style="overflow: hidden;">
            <div id="index_tabs" style="overflow: hidden;">
                <div title="首页" data-options="iconCls:'fi-home',border:false" style="overflow: hidden;">
					 <div>
					 	<div class="inner clearfix" style="margin: 50px;">
					        <div id='calendar'>
					        </div>
					    </div>
					    <div style="float: left;margin-left:30px;">
					    	<c:if test="${empty schedule }">
					    		<h3>暂无工作安排..</h3>
					    	</c:if>
					    	
					    	<c:if test="${!empty schedule }">
					    		<h2>工作提示：</h2>
						    	<c:forEach var="schedule" items="${schedule}" varStatus="idxStatus">
						    		<p style="font-size:18px;"><c:out value='${idxStatus.count}'/>、<c:out value="${schedule.SContent}"></c:out></p>
						    	</c:forEach>
					    	</c:if>
					    </div>
					    <script>
						     var myCalendar = new SimpleCalendar('#calendar');
						</script>
					 </div>
                </div>
            </div>
        </div>
    </div>
    <div id="tabsMenu">
        <div data-options="iconCls:'fi-loop'" type="refresh" style="font-size: 12px;">刷新</div>
        <div class="menu-sep"></div>
        <div data-options="iconCls:'fi-x'" type="close" style="font-size: 12px;">关闭</div>
        <div data-options="iconCls:''" type="closeOther">关闭其他</div>
        <div data-options="iconCls:''" type="closeAll">关闭所有</div>
    </div>
    
    <!--[if lte IE 7]>
    <div id="ie6-warning"><p>您正在使用 低版本浏览器，在本页面可能会导致部分功能无法使用。建议您升级到 <a href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank">Internet Explorer 8</a> 或以下浏览器：
    <a href="http://www.mozillaonline.com/" target="_blank">Firefox</a> / <a href="http://www.google.com/chrome/?hl=zh-CN" target="_blank">Chrome</a> / <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> / <a href="http://www.operachina.com/" target="_blank">Opera</a></p></div>
    <![endif]-->
    <style>
        /*ie6提示*/
        #ie6-warning{width:100%;position:absolute;top:0;left:0;background:#fae692;padding:5px 0;font-size:12px}
        #ie6-warning p{width:960px;margin:0 auto;}
    </style>
</body>
</html>