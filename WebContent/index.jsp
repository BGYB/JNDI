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

<h1>测试成功ya！</h1>

<a class="a1" href='#'>Ajax测试</a>

<a class="a5" href='<%=request.getContextPath()%>/add.jsp'>添加用户</a>
<a class="a5" href='<%=request.getContextPath()%>/setuser.jsp'>测试页面</a>

	<div style="">
	
		<!-- 工具栏按钮 -->
		<div data-options="region:'center'" style="width:100%; max-width:300px;height:100%;">
			<div  title="" style="background:#fafafa;height:30px;">
				<table  class = "tablestyle" width = "100%">
					<tr>
						<td>
							<a id="new"  onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-new'">新建</a>
							<a id="edit" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-edit'">编辑</a>
							<!-- <a id="specialEdit" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-edit'">特殊内容编辑</a> -->
							<a id="delete" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-no'">删除</a>
							<!-- <a id="delall" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-no'">全部删除</a> 
							<a id="copy" onclick="doToolbar(this.id)" class="easyui-linkbutton" href="javascript:void(0);" data-options="plain:true,iconCls:'icon-begin'">复制</a>  -->
						</td>
					</tr>
			
				</table>
			</div>
			<div id="grid" style="width:100%;">
				<table id='list' width="100%" >
				</table>
			</div>
		</div>
		
			
	
		<!-- 数据表格 -->
		<table id="teatable" class="tablestyle" width="566px">
			<!-- 输入框 -->
			<input class="easyui-searchbox" data-options="prompt:'请输入',searcher:doSearch" style="width:100%;max-width:300px;">	
		</table>
	</div>
	
	<!-- 用户个人信息 -->
	<!-- <div id="yh" style="border: 1px solid red;width:400px; display: none;" >
	<form action="#">
	<input type="hidden" id="active" value="tgadd">
	<p>年龄：<input type="text" id="age" value=""></p>
	<p>用户名：<input type="text" id="name" value=""></p>
	<p>密码：<input type="text" id="pwd" value=""></p>
	<p>所在地区：<input type="text" id="addess" value=""></p>
	<p><input type="button" id="tj" value="提交数据"><input type="reset" value="清空数据"></p>
	</form>
	</div> -->
	
	

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
	var ADDESS="";
	var TYPE=""; //操作类型




//搜索框
function doSearch(value){
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


$(document).ready(function(){
	//loadGridTea();
	loadDialog();//初始化将dialog窗口隐藏
	//查询全部
	$(".a1").click(function name() {
		var str='';
		alert("1");
		
		<%-- $.ajax({
			url:"<%=request.getContextPath()%>/Svl_index2?active=queaudittg",
			type:"post",
			dataType:"json",
			success:function(data) {
				if(data!=null){
					console.log(data);
					console.log("数组长度"+data.length);
					str+='<tr><td><a href="#">编号</td></a><td>年龄</td><td>用户名</td><td>密码</td><td>所在区域</td><td>操作</td></tr>';
					 for(var i=0;i<data.length;i++){
						str+='<tr><td><a href="javascript:void(0)" name='+data[i].id+' id="xg">'+data[i].id+'</a></td><td>'+data[i].age+'</td><td>'+data[i].name+'</td><td>'+data[i].pwd+'</td><td>'+data[i].addess+'</td><td><a href="javascript:void(0)" id="sc" name='+data[i].id+'>删除</a></tr>';
						$("#a2").html(str); 
					}
					
				}else{
					alert("请求失败!");
				}; 
				
			},
			
			
		}); --%>
		
		
		$('#teatable').datagrid({
			url: '<%=request.getContextPath()%>/Svl_index2',
 			queryParams: {"active":"queaudittg"},
			loadMsg : "信息加载中请稍后!",//载入时信息
			width:666,
			height:346,
			rownumbers: true,
			animate:true,
			striped : true,//隔行变色
			pageSize : 10,//每页记录数
			singleSelect : true,//单选模式
			pageNumber : 1,//当前页码
			pagination:true,
			fit:false,
			fitColumns: true,//设置边距
			columns:[[
				{field:'ckt',checkbox:true},
				{field:'id',title:'id',width:100,align:'center'},
				{field:'age',title:'年龄',width:100,align:'center'},
				{field:'name',title:'姓名',width:100,align:'center'},
				{field:'pwd',title:'密码',width:100,align:'center'},
				{field:'addess',title:'所在区域',width:100,align:'center'}
			]],
			onSelect:function(rowIndex,rowData){
				<%--  $.ajax({
						url:"<%=request.getContextPath()%>/Svl_index2?active=queaudittg2&id="+rowData.id,
						type:"post",
						dataType:"json",
						success:function(data){
							 $("#yh").show();
							alert(data.rows[0].name);
							console.log(data);
							console.log("数组长度"+data.rows.length);
							 $("#age").val(data.rows[0].age); 
							 $("#name").val(data.rows[0].name);  
							 $("#pwd").val(data.rows[0].pwd); 
							 $("#addess").val(data.rows[0].addess);   
						},
						
					});   --%>
					console.log(rowData);
					//当选中事件触发时全局变量拿到值;
					ID=rowData.id;
					AGE=rowData.age;
					NAME=rowData.name;
					PWD=rowData.pwd;
					ADDESS=rowData.addess;
			},
			onUnselect:function(rowIndex,rowData){
				alert("2");
			},
			onLoadSuccess: function(data){
				
				alert("数据查询成功！");
			},
			onLoadError:function(none){
				alert("系统错误");
			}
		});
		
		
	});
	
	<%-- //传入id删除
	$(document).on('click',"#sc",function(){
		var id = $(this).attr('name');
		alert(id);
		$.ajax({
			url:"<%=request.getContextPath()%>/Svl_index2?active=deleteaudit&id="+id,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data[0].MSG=="删除成功"){
					//alert(data[0].MSG);
					alert("删除成功！");
					window.location.reload();  //刷新当前页面
				}else{
					alert("删除失败！");
					window.location.reload();  //刷新当前页面
				} 
				
			}
			
		});
		
	});   --%>
	
});



//工具按钮方法
function doToolbar(iToolbar){
	
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
	var addess2=$("#addess2").val(); 
	
	var url="";
	
	//根据操作类型决定请求方法
	if(TYPE=="new"){
		url="<%=request.getContextPath()%>/Svl_index2?active=tgadd&age="+age2+"&name="+name2+"&pwd="+pwd2+"&addess="+addess2;
	}else if(TYPE=="edit"){
		//alert(ID);
		url="<%=request.getContextPath()%>/Svl_index2?active=tgupdate&age="+age2+"&name="+name2+"&pwd="+pwd2+"&addess="+addess2+"&id="+ID;
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
				alert("删除成功！");
				window.location.reload();  //刷新当前页面
			}else{
				alert("删除失败！");
				window.location.reload();  //刷新当前页面
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


</script>

</html>