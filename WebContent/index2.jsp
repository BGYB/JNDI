<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/icon.css">
	<link charset="utf-8" rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css"/>
	<link charset="utf-8" rel="stylesheet" href="<%=request.getContextPath()%>/css/naber.css"/>
	<link charset="utf-8" rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.css">
	<link charset="utf-8" rel="stylesheet" href="<%=request.getContextPath()%>/css/SMS-index.css"/>
	<link charset="utf-8" rel="stylesheet" href="<%=request.getContextPath()%>/css/listPage.css"/>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/locale/easyui-lang-zh_CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/script/bootstrap.min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/script/layer/layer.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/common/clientScript.js"></script> 
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/common/publicScript.js"></script>

<style>
		.maskStyle{
			width:100%;
			height:100%;
			overflow:hidden;
			display:none;
			background-color:#000000;
			filter:alpha(opacity=50);
			-moz-opacity:0.5;
			opacity: 0.5;
			position:absolute;
			top:0px;
			left:0px;
			z-index:100;
		}
		#maskFont{
			 font-size:16px;
			 font-weight:bold;
			 color:#ffffff;
			 width:170px;
			 height:100%;
			 position:absolute;
			 top:50%;
			 left:50%;
			 margin-top:-10px;
			 margin-left:-85px;
		}
	</style>


</head>
<body>


	<div class="bg-box indexBox">
		<div class="box">
			<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 content" style="width:100%">
				<div class="content-border">
					<ol class="breadcrumb">
						<li>用户管理</li>
						<li class="active"><b>查询条件</b></li>
					</ol>
					
					<div id="querybox">
						<!-- 查询条件 -->
						<div class="row">
							<div class="col-lg-1 col-md-1 col-sm-2 col-xs-3" style="height:34px;">
								<label>模糊查询</label>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-9 col-xs-9" style="height:34px;">
								<input class="form-control" id="CX_name" name="CX_name" style="width:100%;">                                
							</div>
							
							<div class="col-lg-1 col-md-1 col-sm-2 col-xs-3" style="height:34px;">
								<label>班级编号</label>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-9 col-xs-9" style="height:34px;">
							   <input class="form-control easyui-numberbox" style="width:100%; height:34px;" id="CX_userid" name="CX_DSSJ" />
							</div>
							
							<div class="col-lg-1 col-md-1 col-sm-2 col-xs-3" style="height:34px;">
								<label>用户编号</label>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-9 col-xs-9" style="height:34px;">
							<input class="form-control easyui-numberbox" style="width:100%; height:34px;" id="CX_id" name="CX_DSSJ" />
							</div>
						</div>
						
						
						<div class="row btn-box">
							<div class="col-lg-5 col-md-5 col-sm-3 col-xs-3"></div>
							<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 text-center">
								<input type="button" class="btn btn-primary" id="query" style="width:50%" value="查询" onclick="doToolbar(this.id)">
								<!-- <input type="button" class="btn" id="more" style="background:#ccc; width:60px;" value=". . ." data-toggle="collapse" data-target="#hideQueryArea"> -->
							</div>
							<div class="col-lg-5 col-md-5 col-sm-3 col-xs-3"></div>
						</div>
						
						<!-- 标题按钮栏 -->
						<div class="manage-list">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<span>用户管理列表</span>
								</div>
								<div id="listButton" class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right">
									<input type="button" onclick="doToolbar(this.id);" id="new" class="btn form-control btn-success" value="新建" style="width:60px;"/>
									<input type="button" onClick="doToolbar(this.id);" id="edit" class="btn form-control btn-warning" value="编辑" style="width:60px;"/>
									<input type="button" onclick="doToolbar(this.id);" id="del" class="btn form-control btn-danger" value="删除" style="width:60px;"/>
									<input type="button" onclick="doToolbar(this.id);" id="import" class="btn form-control btn-success" value="导入" style="width:60px;"/>
									<input type="button" onclick="doToolbar(this.id);" id="mod" class="btn form-control btn-warning" value="模板下载" style="width:80px;"/>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 列表区 -->
					<div class="list-table table-responsive" style="height:600px;">
						<table id="BJGLList" width="100%"></table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="njxxInfoDialog">
		<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 content" style="width:100%;">
			<div class="content-border">
				<div id="querybox">
					<form id="form1" name="form1" method="post" class="colorForm">
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="height:34px;">
								<label class="formRowTitle">年龄</label>
							</div>
							<div class="col-lg-8 col-md-8 col-sm-4 col-xs-4" style="height:34px;">
								<input class="form-control" id="age" name="JLDW" style="width:100%;" maxlength="20"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="height:34px;">
								<label class="formRowTitle">姓名</label>
							</div>
							<div class="col-lg-8 col-md-8 col-sm-4 col-xs-4" style="height:34px;">
								<input class="form-control" id="name" name="JLDW" style="width:100%;" maxlength="20"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="height:34px;">
								<label class="formRowTitle">密码</label>
							</div>
							<div class="col-lg-8 col-md-8 col-sm-4 col-xs-4" style="height:34px;">
								<input class="form-control" id="pwd" name="CX_JLDW" style="width:100%;">    
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="height:34px;">
								<label class="formRowTitle">班级编号</label>
							</div>
							<div class="col-lg-8 col-md-8 col-sm-4 col-xs-4" style="height:34px;">
								<input class="form-control" id="bjbh" name="JLDW" style="width:100%;" maxlength="20"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="height:34px;">
								<label class="formRowTitle">所在地区</label>
							</div>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="height:80px;">
								<textarea class="form-control" id="addess" name="BZ" style="width:100%; height:80px;" maxlength="200"></textarea>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
								<input type="button" id="save" class="btn form-control btn-success dialogButtom-btn" value="保存" onclick="doToolbar(this.id);"/>
							</div>
						</div>
						
					</form>
				</div>
			</div>
		</div>
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
var active="queaudittg";

$(document).ready(function(){
		$('#hideQueryArea').collapse('hide');
		initDialog();//初始化对话框
		
		loadGrid();//页面初始化加载数据
});

/**加载 dialog控件**/
function initDialog(){
	$('#njxxInfoDialog').dialog({  
		width: 580,//宽度设置   
		height: 385,//高度设置 
		modal:true,
		closed: true,   
		cache: false, 
		draggable:true,//是否可移动dialog框设置
		//打开事件
		onOpen:function(data){},
		//读取事件
		onLoad:function(data){},
		//关闭事件
		onClose:function(data){
			$('#form1').form('clear');
			$('#XG_BJMC').combobox('setValue', '');
			$('#XG_BJMC').combobox('readonly', false);
		}
	});
	
}





//工具按钮方法
function doToolbar(iToolbar){
	
	
	//点击查询
	if(iToolbar == "query"){
		active="queaudittg2";
		loadGrid();
	}
	
	//点击新建按钮
	if(iToolbar == "new"){ 
		TYPE="new";//操作类型新建用户操作
		$('#saveType').val('new');

		$('#njxxInfoDialog').dialog('setTitle', '新建');
		$('#njxxInfoDialog').dialog("open");
	}
	
	//添加保存按钮
	if(iToolbar=="save"){
			alert("2");
			add();   //调用添加用户的方法
	}
	
	//编辑
	if(iToolbar == "edit"){
		if(ID == ''){
			layer.alert("请选择一行数据");
			return;
		}else{
			$('#njxxInfoDialog').dialog('setTitle', '编辑');
			TYPE="edit";//操作类型编辑用户操作
			 $('#age').val(AGE);
			 $('#name').val(NAME);
			 $('#pwd').val(PWD);
			 $('#bjbh').val(BJBH);
			 $('#age').val(AGE);
			 $("#addess").val(ADDESS);  //拿取全局变量的值，为弹窗表单赋值
			 $('#njxxInfoDialog').dialog("open");  //让#win弹窗显示
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
	var age2=$("#age").val(); 
	var name2=$("#name").val(); 
	var pwd2=$("#pwd").val();
	var bjbh2=$("#bjbh").val(); 
	var addess2=$("#addess").val(); 
	
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
		  		window.location="index2.jsp";
		  	}else{
		  		alert("操作失败");
		  		//window.location.reload();  //刷新当前页面
		  	}
						
			}
					
		}); 
}







//查询列表
function loadGrid(){
	$('#BJGLList').datagrid({
		 url: '<%=request.getContextPath()%>/Svl_index2',
		queryParams:{"active":active,"name":$('#CX_name').val(),"userid":$('#CX_userid').numberbox('getValue'),"id":$('#CX_id').numberbox('getValue')},
		loadMsg : "信息加载中请稍后!",//载入时信息
		nowrap: false,//当数据长度超出列宽时将会自动截取
		fit:true,//自动折叠容器的大小将填充父容器
		showFooter:true,//显示视图的页脚
		striped:true, //隔行变色
		pagination:true,//开启分页
		pageSize:loadGrid,//每页查看的记录数量
		//pageList:null,
		singleSelect:true,//开启单选模式
		pageNumber:pageNum,//初始的页面为第一页
		rownumbers:true,//显示行数
		fitColumns: true,//自适应
		fit:true,
		width:'100%',
		nowrap:false,
		striped:true,
		pageSize:20,
		pageNumber:1,
		showFooter:true,
		rownumbers:true,
		singleSelect:true,
		pagination:true,
		fitColumns:false,
		//不使用后台排序
		remoteSort :false,
		async:false,
		//下面是表单中加载显示的信息
		columns:[[
			{field:'id',align:'center',title:'编号',width:fillsize(0.15)},
			{field:'age',align:'center',title:'年龄',width:fillsize(0.15)},
			{field:'name',align:'center',title:'姓名',width:fillsize(0.15)},
			{field:'pwd',align:'center',title:'密码',width:fillsize(0.15)},
			{field:'userid',align:'center',title:'班级编号',width:fillsize(0.15)},
			{field:'addess',align:'center',title:'所在区域',width:fillsize(0.26)}
		]],
		//双击某行时触发
		onDblClickRow:function(rowIndex,rowData){
			doToolbar("edit");
		},
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
		//读取datagrid之前加载
		onClickRow:function(rowIndex,rowData){
			iKeyCode = rowData.编号;
			row = rowData;
		},
		//加载成功后触发
		onLoadSuccess: function(data){
			$.messager.show({
				title:"温馨提示",
				msg:"数据查询成功！",
				timeout:3000,
				showType:"slide",
				
			});
		},
	});
}



</script>

</html>