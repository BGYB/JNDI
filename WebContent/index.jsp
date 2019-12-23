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
<title>测试数据</title>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/icon.css">
		<link rel=“stylesheet” type=“text/css" href="<%=request.getContextPath()%>themes/ default/easyui.css" >
		<link rel=“stylesheet” type=“text/css" href="<%=request.getContextPath()%>themes/ icon.css" >
		<link rel=“stylesheet” type=“text/css" href="<%=request.getContextPath()%>/demo.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/common/clientScript.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/common/publicScript.js"></script>
</head>
<body>


<h1>测试成功ya</h1>
<!--  主页内容div -->
<div id="box" class="easyui-layout" style="width:100%; height: 550px;margin-bottom: 0px">
		<div data-options="region:'west',title:'左西',split:true," style="width: 180px;padding: 10px">
			<a class="a5" href='<%=request.getContextPath()%>/Import.jsp'>导入数据</a>
			<%-- <a class="a5" href='<%=request.getContextPath()%>/Newindex2.jsp'>测试页面</a> --%>
			<!-- 树 -->
			<ul id="box2"></ul>
		</div>
	<div data-options="region:'center'"style="height: 100%">
		
		<!-- 起始页 -->
		<!-- <div id="tabs">
			<div title="起始页" style="padding: 0 10px;display: block;">
				欢迎！
			</div>
		</div> -->
		
			<!-- 工具栏按钮 -->
	    	<div title="" style="background:#fafafa;height:60px;">
					<table  class = "tablestyle" width = "100%">
						<tr>
							<td>
								<a id="new"  onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-new'">新建</a>
								<a id="edit" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-edit'">编辑</a>
								<a id="specialEdit" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-edit'">特殊内容编辑</a>
								<a id="delete" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-no'">删除</a>
								 <a id="delall" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-no'">全部删除</a> 
								<a id="copy" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-begin'">复制</a> 
							</td>
						</tr>
					</table>
					<!-- 条件搜索 -->
					<table id="ee" singleselect="true" width="100%" class="tablestyle">
						<tr>
							<td style="width:100px;" class="titlestyle">模糊查询</td>
							<td>
								<input name="name" id="name" class="easyui-textbox" style="width:180px;"/>
							</td>
							<td style="width:100px;" class="titlestyle">用户编号</td>
							<td>
								<input name="id" id="id" class="easyui-textbox" style="width:180px;"/>
							</td>
							<td style="width:100px;" class="titlestyle">班级编号</td>
							<td>
								<input name="userid" id="userid" class="easyui-textbox" style="width:180px;"/>
							</td>
							<td style="width:196px;" align="center">
								<a href="#" onclick="doToolbar(this.id)" id="query" class="easyui-linkbutton" plain="true" iconcls="icon-search">查询</a>
							</td>				
						</tr>
				    </table>
					
			</div>
			
			<!-- 数据表格 -->
			<div  style="width: 100%;height: 449px">
				<table id="teatable" class="tablestyle">
				
				</table>
			</div>	
	</div>
		
	 <div data-options="region:'south'" style="height:40px;text-align:center; padding:10px 10px;">@测试专用</div> 
	
</div>

	

<!-- 弹窗div -->
<div id="win" class="" icon="icon-save"
			collapsible="true" minimizable="true" maximizable=true
			closable="true"
			style="width: 500px; height: 150px; padding: 10px; background: #fafafa;">

		<form  method='#' >
			<div region="center">
				<table class = "" width="100%">
					<tr>
						<td colspan=2>
						<a href="#" class="easyui-linkbutton" id="save" name="save" iconCls="icon-save" plain="true" onClick="doToolbar(this.id)">保存</a>
						</td>
					</tr>
				</table>
				<table class="tablestyle" width="100%">
					<tr>
							<td class="titlestyle">节数<span style="color: red;"> *
							</span></td>
							<td><input name="GS_JS" id="GS_JS"
								class="easyui-numberspinner" style="width: 200px;" min="0"
								increment="1" precision="0" editable="true" /></td>
					</tr>
					<tr>
						<td class="titlestyle">年龄<span style="color:red;"> * </span></td>
						<td>
							<input name="age" id="age2"  class="easyui-textbox"  style="width:200px;" />
						</td>
					</tr>
					<tr>
						<td class="titlestyle">姓名<span style="color:red;"> * </span></td>
						<td ">
							<input name="name" id="name2" class="easyui-textbox" style="width:200px;" />
						</td>
					</tr>
					<tr>
						<td class="titlestyle">密码<span style="color:red;"> * </span></td>
						<td ">
							<input name="pwd" id="pwd2"  class="easyui-textbox" style="width:200px;" />
						</td>
					</tr>
					<tr>
						<td class="titlestyle">班级编号<span style="color:red;"> * </span></td>
						<td ">
							<input name="bjbh" id="bjbh2"  class="easyui-textbox" style="width:200px;" />
						</td>
					</tr>
					<tr>
						<td class="titlestyle">所在区域<span style="color:red;"> * </span></td>
						<td ">
							<input name="addess" id=addess2  class="easyui-textbox" style="width:200px;" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	
</body>
<script type="text/javascript">

	//全局变量,当选中某一行数据时全局变量就会得到不同的值
	var ID="";
	var AGE="";
	var NAME="";
	var PWD="";
	var BJBH="";
	var ADDESS="";
	var USERID="";
	var TYPE=""; //操作类型
	var pageNum = 1;   //datagrid初始当前页数
	var pageSize = 20; //datagrid初始页内行数
	
	
	initData(); //调用查询全部初始化信息方法
	loadDialog();//初始化将dialog窗口隐藏

//搜索框
<%-- function doSearch(value){
    alert('You input: ' + value);
    var name=value;
		$('#teatable').datagrid({
			url: '<%=request.getContextPath()%>/Svl_index2',
 			queryParams: {"active":"likename","name":name},//请求参数
			loadMsg : "信息加载中请稍后!",//等待信息提示信息
			width:656,//列宽度
			height:346,
			rownumbers: true,  //是否显示行号列
			animate:true,//点展开或折叠是否显示动画效果
			striped : true,//隔行变色
			pageSize : 20,//每页记录数
			singleSelect : false,//单选模式是否允许只选择一行
			pageNumber : 1,//当前页码
			pagination:true,//是否显示底部分页工具栏
			fit:false,//是否允许表格自动缩放，以适应父容器
			fitColumns: true,//数据自动填充父容器
			columns:[[//表格的列的配置对象
				{field:'ckt',checkbox:true},//checkbox是否显示选择框
				{field:'id',title:'id',width:100,align:'center'},
				{field:'age',title:'年龄',width:100,align:'center'},
				{field:'name',title:'姓名',width:100,align:'center'},
				{field:'pwd',title:'密码',width:100,align:'center'},
				{field:'addess',title:'所在区域',width:100,align:'center'}	
			]],
			onSelect:function(rowIndex,rowData){//选中某一行;rowIndex是获取选中的下标;rowData是获取选中的数据通过.它的属性
				 alert(rowIndex);
			},
			onUnselect:function(rowIndex,rowData){//取消选择
				 alert("你已经取消选择！");
			},
			onLoadSuccess: function(data){//结果集成功
				alert(data);
			},
			onLoadError:function(none){//错误信息
				
			}
		});
    
}
 --%>
 
$(document).ready(function(){
	
	
$("#tabs").tabs({	//起始页
	fit:true,
	border:false,
})
	
	
	var tid=0;	 //树
	$("#box2").tree({ 
		url:'<%=request.getContextPath()%>/Svl_index2?active=queauTree&tid='+tid,
		checkbox: false,//复选框
		animate:true,//节点展开或折叠是否显示动画效果
		lines:true, //结构线
		onBeforeExpand:function(node,param){//展开之前触发，node取本身的值
			tid=node.id;//传值改变url
	  		$('#box2').tree('options').url='<%=request.getContextPath()%>/Svl_newindexBean?active=queaudittg&tid='+tid;
			
		},
		onClick:function(node){  //点击事件触发后传入userid查询用户
			alert(node.id);
			console.log(node);
			if(node.state=="open"){  //tree的状态为open时
				USERID = node.userid;
				initData2();//调用有参数查询时的方法 
			}
			
			/* var str='';点击左侧树菜单动态拼接table菜单配合上面的主页面div使用
			str+='<div style=""><table id="teatable" class="tablestyle" width="666px"></table></div>';
			
			$("#tabs").tabs('add',{
				title:node.text,
				closable:true,
				 content: str,
			})
			initData(); //调用查询全部初始化方法 */
			
		},
		
		
	});
	
	
		
	
	
});






//工具按钮方法
function doToolbar(iToolbar){
	
	
	//点击查询
	if(iToolbar == "que"){
		//全局变量得到数据
		NAME = $('#name').textbox('getValue'); 
		ID = $('#id').textbox('getValue');
		USERID = $('#userid').textbox('getValue');
		initData2();//调用有参数查询时的方法
	}
	
	//点击新建按钮
	if(iToolbar == "new"){ 
		$('#win').dialog({   
			title: '新建用户'
		});
		TYPE="new";//操作类型新建用户操作
		$('#win').dialog("open");  //让#win弹窗显示
	}
	
	//添加保存按钮
	if(iToolbar=="save"){
			alert("2");
			add();   //调用添加用户的方法
	}
	
	//编辑
	if(iToolbar == "edit"){
		if(ID==""){
			alertMsg("请选择一行数据");
			return;
		}else{
		$('#win').dialog({   
			title: '编辑用户'
		});
		TYPE="edit";//操作类型编辑用户操作
		 $("#age2").textbox('setValue',AGE);  //拿取全局变量的值，为弹窗表单赋值
		 $("#name2").textbox('setValue',NAME); 
		 $("#pwd2").textbox('setValue',PWD);
		 $("#bjbh2").textbox('setValue',BJBH);
		 $("#addess2").textbox('setValue',ADDESS); 
		 $('#win').dialog("open");  //让#win弹窗显示
			
		}
		
	}
	
	//删除
	if(iToolbar == "delete"){
		if(ID==""){
			alertMsg("请选择一行数据");
			return;
		}else{
		if(ID!=""){
			ConfirmMsg("是否确定删除？", "dele()","");
			}
		}
		
	}
	
	
	
}





//添加或修改用户方法
function add() {
	/* 拿取id和input文本框里数据，在通过Ajax方法传入userAddressServlet层，设置回调函数	 */
	var age2=$("#age2").val(); 
	var name2=$("#name2").val(); 
	var pwd2=$("#pwd2").val();
	var bjbh2=$("#bjbh2").val(); 
	var addess2=$("#addess2").val(); 
	
	var url="";
	//根据操作类型决定请求方法
	if(TYPE=="new"){
		url="<%=request.getContextPath()%>/Svl_index2?active=tgadd&age="+age2+"&name="+name2+"&pwd="+pwd2+"&addess="+addess2+"&userid="+bjbh2;
	}else if(TYPE=="edit"){
		//alert(ID);
		url="<%=request.getContextPath()%>/Svl_index2?active=tgupdate&age="+age2+"&name="+name2+"&pwd="+pwd2+"&addess="+addess2+"&id="+ID+"&userid="+bjbh2;
	}
	
	 $.ajax({
			url:url,
			type:"post",
			dataType:"json",
			success:function(data){
			if(data[0].MSG=="保存成功"){
		  		alert("操作成功");
		  		window.location="index.jsp";
		  	}else{
		  		alert("操作失败");
		  		//window.location.reload();  //刷新当前页面
		  	}
						
			}
					
		}); 
}


//删除方法
function dele() {
	$.ajax({
		url:"<%=request.getContextPath()%>/Svl_index2?active=deleteaudit&id="+ID,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data[0].MSG=="删除成功"){
				//alert(data[0].MSG);
				alertMsg("删除成功！");
				setTimeout(initData,3000);
				//initData(); //调用查询全部初始化信息方法
				//window.location.reload();  //刷新当前页面
			}else{
				alertMsg("删除失败！");
			} 
			
		}
		
	});	
}




//dialog窗口，需要初始化该方法
function loadDialog() {
	$('#win').dialog({
		width : 342,
		height: 280,
		modal : true,//定义窗口是否是一个模式窗口
		closed : true,//定义在初始化的时候关闭面板
		onOpen : function(data) {  //当面板打开之后触发
			$('#win').find('table').css('display', 'block');
		},
		onLoad : function(data) {//当远程数据加载时触发
		},
		onClose : function(data) {//当面板关闭之后触发
			
		}
	});

}





//初始化查询全部
function initData() {
	 $.ajax({
		 type:"post",
		url:"<%=request.getContextPath()%>/Svl_index2",
		data :'active=queaudittg&page='+pageNum+'&rows='+pageSize,
		dataType:"json",
		success:function(data) {
			/* console.log(data); */
			console.log("data[0]:"+data[0].listData);			
			finall(data[0].listData);
		},
	});
}


//有参数查询时
function initData2() {
	//alert(NAME+"SSS"+ID="dd"+USERID);
	 $.ajax({
		 type:"post",
		url:"<%=request.getContextPath()%>/Svl_index2",
		data :'active=queaudittg2&page='+pageNum+'&rows='+pageSize+'&name='+NAME+'&id='+ID+'&userid='+USERID,
		dataType:"json",
		success:function(data) {
			console.log("data[0]2"+data[0].listData);		
			finall(data[0].listData);  //调用数据网格拼接参数的方法，传返回参数中名为listData的数组
		},
	});
}








//主体网格显示数据方法
function finall(listData) {
	$('#teatable').datagrid({
		<%-- url: '<%=request.getContextPath()%>/Svl_index2',
		queryParams: {"active":"queaudittg"}, --%>
		data:listData,  //得到参数，下面直接取
		loadMsg : "信息加载中请稍后!",//载入时信息
		width:'100%',//宽度
		height:'100%',//高度
		rownumbers: true,//是否显示行号
		animate:true,//点展开或折叠是否显示动画效果
		striped : true,//隔行变色
		singleSelect : true,//单选模式
		pagination:true,//是否显示底部分页工具栏
		fit:true,//是否允许表格自动缩放，以适应父容器
		fitColumns:true,//数据自动填充父容器
		columns:[[
			{field:'ckt',checkbox:false},
			{field:'id',title:'编号',width:100,align:'center'},
			{field:'age',title:'年龄',width:100,align:'center'},
			{field:'name',title:'姓名',width:100,align:'center'},
			{field:'pwd',title:'密码',width:100,align:'center'},
			{field:'userid',title:'班级编号',width:100,align:'center'},
			{field:'addess',title:'所在区域',width:100,align:'center'}
		]],
		onSelect:function(rowIndex,rowData){
				console.log(rowData);
				//当选中事件触发时全局变量拿到值;
				ID=rowData.id;
				AGE=rowData.age;
				NAME=rowData.name;
				PWD=rowData.pwd;
				BJBH=rowData.userid;
				ADDESS=rowData.addess;
		},
		onUnselect:function(rowIndex,rowData){
			alert("你已经取消选中！");
		},
		onLoadSuccess: function(data){
			
			//alertMsg("数据查询成功！");
			$.messager.show({
				title:"温馨提示",
				msg:"数据查询成功！",
				timeout:3000,
				showType:"slide",
				
			});
			
		},
		onLoadError:function(none){
			//alertMsg("系统错误！");
			//alert("系统错误");
		}
	});
}







</script>

</html>