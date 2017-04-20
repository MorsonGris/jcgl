<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<link rel="stylesheet" href="${staticPath}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${staticPath}/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${staticPath}/static/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript">

var setting = {
		 view: {
				dblClickExpand: false,
				showLine: true,
				selectedMulti: false
			},
			check: {
				enable: true,
				nocheckInherit: false
			},
			data: {
				simpleData: {
					enable:true,
					idKey: "id",
					pIdKey: "pid",
					rootPId: "0"
				}
			},
			callback: {
				beforeClick: function(treeId, treeNode) {
					var zTree = $.fn.zTree.getZTreeObj("resourceTree");
					var opts = {
			                title : treeNode.name,
			                border : false,
			                closable : true,
			                fit : true
		            };
				}
			}
		};

  		$(document).ready(function(){
  			var treeNodes;
  		 	var t = $("#resourceTree");
  		 	$.ajax({  //JQuery的Ajax  
  		        type: 'POST',    
  		        dataType : "json",//返回数据类型  
  		        async:false,  
  		        url: "${path }/resource/allTrees",//请求的action路径  
  		        data: {"flag":true},  //同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行  
  		        error: function () {//请求失败处理函数    
  		            alert('请求失败');    
  		        },  
  		        success:function(data){ //请求成功后处理函数。  取到Json对象data  
  		            treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes      
  		            t = $.fn.zTree.init(t, setting, treeNodes);//初始化树，传入树的Dom<pre name="code" class="html">  

			         $.post( '${path }/role/findResourceIdListByRoleId', {
			                 id : '${id}'
			             }, function(result) {
			                 var ids;
			                 if (result.success == true && result.obj != undefined) {
			                     ids = $.stringToList(result.obj + '');
			                 }
			               //获取当前的树对象  
			            	 var zTree = $.fn.zTree.getZTreeObj("resourceTree");
			            	 /* zTree.selectNode(zTree.getNodeByParam("id", "269")); */
			            	 alert(zTree.selectNode(zTree.getNodeByParam("id", "269")));
			            	//根据过滤机制获得zTree的所有节点        
			            	 var nodes = zTree.getNodesByFilter(filter);
			                 if (ids.length > 0) {
			                     for ( var i = 0; i < ids.length; i++) {
			                    	 zTree.checkNode(ids[i], true, true);
			                    	 zTree.updateNode(nodes);  //重新更新该节点
			                     }
			                 }
			             }, 'json');
  		          	
  				} 
  			}); 
  			
  			demoIframe = $("#testIframe");
  			demoIframe.bind("load", loadReady);
  			var zTree = $.fn.zTree.getZTreeObj("resourceTree");
  			zTree.selectNode(zTree.getNodeByParam("id", 101));
  	 		zTreeObj = $.fn.zTree.init($("#resourceTree"), setting, treeNodes);
  		});
  		function loadReady() {
  			var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
  			htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
  			maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
  			h = demoIframe.height() >= maxH ? minH:maxH ;
  			if (h < 530) h = 530;
  			demoIframe.height(h);
  		}
  		
    $(function() {

        $('#roleGrantForm').form({
            url : '${path }/role/grant',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
	             //获取当前的树对象  
	           	 var zTree = $.fn.zTree.getZTreeObj("resourceTree");
	           	 //根据过滤机制获得zTree的所有节点        
	           	 var nodes = zTree.getNodesByFilter(filter);
                var ids = [];
                if (nodes && nodes.length > 0) {
      	          for ( var i = 0; i < nodes.length; i++) {
	      	        	var checked = nodes[i].checked;
	  	                if(checked) {
	  	                	ids.push(nodes[i].id);
		  	            }
                    }
                }
                $('#resourceIds').val(ids);
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
    });
    
  //过滤节点的机制 直接return node表示不做任何过滤  
    function filter(node) {  
        return node;  
    } 
    function checkAll() {
    	//获取当前的树对象  
    	 var zTree = $.fn.zTree.getZTreeObj("resourceTree");
    	//根据过滤机制获得zTree的所有节点        
    	 var nodes = zTree.getNodesByFilter(filter);
        if (nodes && nodes.length > 0) {
            for ( var i = 0; i < nodes.length; i++) {
            	zTree.checkNode(nodes[i], true, true);
            	zTree.updateNode(nodes);  //重新更新该节点
            }
        } 
    }
    function uncheckAll() {
    	//获取当前的树对象  
 	 	  var zTree = $.fn.zTree.getZTreeObj("resourceTree");
 		  //根据过滤机制获得zTree的所有节点        
 		  var nodes = zTree.getNodesByFilter(filter);
	      if (nodes && nodes.length > 0) {
	          for ( var i = 0; i < nodes.length; i++) {
	              var checked = nodes[i].checked;
	              if(checked) {
	            	  zTree.checkNode(nodes[i], false, false);   //设置节点选中
		              zTree.updateNode(nodes);  //重新更新该节点
		          }
	          }
	      } 
    }
    function checkInverse() {
    	  //获取当前的树对象  
   	 	  var zTree = $.fn.zTree.getZTreeObj("resourceTree");
   		  //根据过滤机制获得zTree的所有节点        
   		  var nodes = zTree.getNodesByFilter(filter);
	      if (nodes && nodes.length > 0) {
	          for ( var i = 0; i < nodes.length; i++) {
	              var checked = nodes[i].checked;
	              if(checked) {
	            	  zTree.checkNode(nodes[i], false, false);   //设置节点选中
		              zTree.updateNode(nodes);  //重新更新该节点
		          }else {
		        	  zTree.checkNode(nodes[i], true, true);	 //设置节点取消
		              zTree.updateNode(nodes);  //重新更新该节点
			      }
	          }
	      } 
    }
</script>
<div id="roleGrantLayout" class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'west'" title="系统资源" style="width: 300px; padding: 1px;">
        <div class="well well-small">
            <form id="roleGrantForm" method="post">
                <input name="id" type="hidden"  value="${id}" readonly="readonly">
                <ul id="resourceTree" class="ztree"></ul>
                <input id="resourceIds" name="resourceIds" type="hidden" />
            </form>
        </div>
    </div>
    <div data-options="region:'center'" title="" style="overflow: hidden; padding: 10px;">
        <div>
            <button class="btn btn-success" onclick="checkAll();">全选</button>
            <br /> <br />
            <button class="btn btn-warning" onclick="checkInverse();">反选</button>
            <br /> <br />
            <button class="btn btn-inverse" onclick="uncheckAll();">取消</button>
        </div>
    </div>
</div>