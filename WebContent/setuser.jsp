<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pantech.base.common.tools.MyTools"%>
<%@ page import="com.pantech.base.common.tools.PublicTools"%>
<%@ page import="com.pantech.src.develop.Logs.*"%>
<%@ page import="com.pantech.base.common.tools.*"%>
<%@ page import="com.pantech.src.develop.store.user.*"%>
<%@ page import="com.pantech.src.develop.manage.workremind.WorkRemind"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.pantech.base.common.db.DBSource"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/icon.css">
		<link rel=“stylesheet” type=“text/css" href="<%=request.getContextPath()%>themes/ default/easyui.css" >
		<link rel=“stylesheet” type=“text/css" href="<%=request.getContextPath()%>themes/ icon.css" >
		<link rel=“stylesheet” type=“text/css" href="<%=request.getContextPath()%>/demo.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/common/clientScript.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/common/publicScript.js"></script>
</head>
<body>
	  <h2>搜索框</h2>
    <p>Click search button or press enter key in input box to do searching.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <input class="easyui-searchbox" data-options="prompt:'Please Input Value',searcher:doSearch" style="width:100%">
    </div>
    <script>
        function doSearch(value){
            alert('You input: ' + value);
        }
    </script>
    
    
    
    
    
    
    
      <h2>日历</h2>
    <p>Click to select date.</p>
    <div style="margin:20px 0"></div>
    <div class="easyui-calendar" style="width:250px;height:250px;"></div>
    
    
    
    
    
    
      <h2>自定义窗口</h2>
    <p>Click the right top buttons to perform actions.</p>
    <div style="margin:20px 0;">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#w').window('open')">Open</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#w').window('close')">Close</a>
    </div>
    <div id="w" class="easyui-window" title="Custom Window Tools" data-options="iconCls:'icon-save',minimizable:false,tools:'#tt'" style="width:500px;height:200px;padding:10px;">
        The window content.
    </div>
    <div id="tt">
        <a href="javascript:void(0)" class="icon-add" onclick="javascript:alert('add')"></a>
        <a href="javascript:void(0)" class="icon-edit" onclick="javascript:alert('edit')"></a>
        <a href="javascript:void(0)" class="icon-cut" onclick="javascript:alert('cut')"></a>
        <a href="javascript:void(0)" class="icon-help" onclick="javascript:alert('help')"></a>
    </div>
    
    
    
    
    
    
    
    
    
     <h2>工具栏</h2>
    <p>The buttons with plain style have transparent background.</p>
    <div style="margin:10px 0 40px 0;"></div>
    <div class="easyui-panel" style="padding:5px;">
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">Cancel</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">Refresh</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">Search</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true">Text Button</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print'">Print</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"> </a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'"></a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'"></a>
    </div>
    
    
    
     <h2>选项卡</h2>
    <p>Click tab strip to swap tab panel content.</p>
    <div style="margin:20px 0 10px 0;"></div>
    <div class="easyui-tabs" style="width:700px;height:250px">
        <div title="关于" style="padding:10px">
            <p style="font-size:14px">jQuery EasyUI framework helps you build your web pages easily.</p>
            <ul>
                <li>easyui is a collection of user-interface plugin based on jQuery.</li>
                <li>easyui provides essential functionality for building modem, interactive, javascript applications.</li>
                <li>using easyui you don't need to write many javascript code, you usually defines user-interface by writing some HTML markup.</li>
                <li>complete framework for HTML5 web page.</li>
                <li>easyui save your time and scales while developing your products.</li>
                <li>easyui is very easy but powerful.</li>
            </ul>
        </div>
        <div title="我的文件" style="padding:10px">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true">
            	<li>easyui is very easy but powerful.</li>
            </ul>
        </div>
        <div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
            This is the help content.
        </div>
    </div>
    
    
    
    

<h1>组合框</h1>
	<div style="margin-bottom: 10px;">
		<a href="#" onclick="loadData()">loadData</a> 
		<a href="#"onclick="setValue()">setValue</a> 
		<a href="#" onclick="getValue()">getValue</a>
		<a href="#" onclick="disable()">disable</a> 
		<a href="#"onclick="enable()">enable</a>
	</div>

	<span>Options: </span>
<select id="cc" name="dept" required="true">
	<option value="">==请选择==</option>
	<option value="0">苹果</option>
	<option value="1">香蕉</option>
	<option value="2">鸭梨</option>
	<option value="3">西瓜</option>
	<option value="4">芒果</option>
</select>

<script>


		function loadData(){
			$('#cc').combobox({
				url:'combobox_data.json',//该文件内容在下面
				valueField:'id',
				textField:'text'
			});
		}
		function setValue(){
			$('#cc').combobox('setValue','2');
		}
		function getValue(){
			var val = $('#cc').combobox('getValue');
			alert(val);
		}
		function disable(){
			$('#cc').combobox('disable');
		}
		function enable(){
			$('#cc').combobox('enable');
		}

	$(function() {
		$('#cc').combobox({
			width : 150,
			listWidth : 150,
			listHeight : 100,
			//valuefield:'value',
			//textField:'text',
			//url:'combobox_data.json',
			editable : false
		});
	});
</script>
    
    
    
<div id="tb" style="padding:3px">
    <span>Item ID:</span>
    <input id="itemid" style="line-height:26px;border:1px solid #ccc">
    <span>Product ID:</span>
    <input id="productid" style="line-height:26px;border:1px solid #ccc">
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()">Search</a>
</div>
    
    
    
    <table id="tt" class="easyui-datagrid" style="width:600px;height:250px"
        url="datagrid24_getdata.php" toolbar="#tb"
        title="Load Data" iconCls="icon-save"
        rownumbers="true" pagination="true">
    <thead>
        <tr>
            <th field="itemid" width="80">Item ID</th>
            <th field="productid" width="80">Product ID</th>
            <th field="listprice" width="80" align="right">List Price</th>
            <th field="unitcost" width="80" align="right">Unit Cost</th>
            <th field="attr1" width="150">Attribute</th>
            <th field="status" width="60" align="center">Stauts</th>
        </tr>
    </thead>
</table>
<script type="text/javascript">
function doSearch(){
    $('#tt').datagrid('load',{
        itemid: $('#itemid').val(),
        productid: $('#productid').val()
    });
}


</script>







<!-- 弹窗 -->
<script>
		function open1(){
			$('#p').panel('open');
		}
		function close1(){
			$('#p').panel('close');
		}
		function load1(){
			$('#p').panel({
				href:'tabs_href_test.html'
			});
$('#p').panel('open');
		}
	</script>



	<h1>Panel</h1>
	<div style="margin-bottom: 10px;">
		<a href="#" onclick="open1()">open</a> <a href="#" onclick="close1()">close</a>
		<a href="#" onclick="load1()">load</a>
	</div>
	<div
		style="width: 600px; height: 300px; border: 1px solid red; padding: 5px;">
		<div id="p" class="easyui-panel" title="My Title" icon="icon-save"
			collapsible="true" minimizable="true" maximizable=true
			closable="true"
			style="width: 500px; height: 150px; padding: 10px; background: #fafafa;">
			<p><input type="text"> </p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
			<p>panel</p>
		</div>
	</div>







<!-- 多种弹窗提示 -->
<script>
		function show1(){
			$.messager.show({
				title:'My Title',
				msg:'Message will be closed after 4 seconds.',
				showType:'show'
			});
		}
		function show2(){
			$.messager.show({
				title:'My Title',
				msg:'Message will be closed after 5 seconds.',
				timeout:5000,
				showType:'slide'
			});
		}
		function show3(){
			$.messager.show({
				title:'My Title',
				msg:'Message never be closed.',
				timeout:0,
				showType:'fade'
			});
		}
		function alert1(){
			$.messager.alert('My Title','Here is a message!');
		}
		function alert2(){
			$.messager.alert('My Title','Here is a error message!','error');
		}
		function alert3(){
			$.messager.alert('My Title','Here is a info message!','info');
		}
		function alert4(){
			$.messager.alert('My Title','Here is a question message!','question');
		}
		function alert5(){
			$.messager.alert('My Title','Here is a warning message!','warning');
		}
		function confirm1(){
			$.messager.confirm('My Title', 'Are you confirm this?', function(r){
				if (r){
					alert('confirmed:'+r);
					location.href = 'http://www.google.com';
				}
			});
		}
		function prompt1(){
			$.messager.prompt('My Title', 'Please type something', function(r){
				if (r){
					alert('you type:'+r);
				}
			});
		}
$(function(){
$.messager.defaults={ok:"确定",cancel:"取消"};   
});
	</script>
	<h1>Messager</h1>
	<div>
		<a href="javascript:void(0)" onclick="show1()">show</a> | 
		<a href="#" onclick="show2()">slide</a> | <a href="#"onclick="show3()">fade</a> |
	</div>

	<div>
		<a href="#" onclick="alert1()">alert</a> | 
		<a href="#"onclick="alert2()">alert(error)</a> | 
		<a href="#"	onclick="alert3()">alert(info)</a> | 
		<a href="#"onclick="alert4()">alert(question)</a> |
		<a href="#"onclick="alert5()">alert(warning)</a>
	</div>
	
	<div>
		<a href="#" onclick="confirm1();">confirm</a>
	</div>
	<div>
		<a href="#" onclick="prompt1()">prompt</a>
	</div>
	<div style="height: 600px;"></div>



















<h2>树Tree</h2>
	<p>Click the arrow on the left to expand or collapse nodes.</p>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" style="padding:5px">
		<ul class="easyui-tree">
			<li>
				<span>My Documents</span>
				<ul>
					<li data-options="state:'closed'">
						<span>Photos</span>
						<ul>
							<li>
								<span>Friend</span>
							</li>
							<li>
								<span>Wife</span>
							</li>
							<li>
								<span>Company</span>
							</li>
						</ul>
					</li>
					<li>
						<span>Program Files</span>
						<ul>
							<li>Intel</li>
							<li>Java</li>
							<li>Microsoft Office</li>
							<li>Games</li>
						</ul>
					</li>
					<li>index.html</li>
					<li>about.html</li>
					<li>welcome.html</li>
				</ul>
			</li>
		</ul>
	</div>



<!-- 手风琴 -->

<script type="text/javascript">
	$( function() {
		$('#aa').accordion( {
			width : 400,
			height : 200,
			fit : false
		});
	});
</script>

	<div id="aa" border="true">
		<div title="Title1" icon="icon-save"
			style="overflow: auto; padding: 10px;">
			<h3 style="color: #0099FF;">Accordion for jQuery</h3>
			<p>Accordion is a part of easyui framework for jQuery. It lets
				you define your accordion component on web page more easily.</p>
		</div>
		<div title="Title2" icon="icon-reload" selected="true"
			style="padding: 10px;">content2</div>
		<div title="Title3">content3</div>
	</div>






<!-- Table切换 -->






</body>
</html>