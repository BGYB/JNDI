<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导入</title>

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


</head>
<body>

<%-- 遮罩层2222222222 --%>
<div id="divPageMask4" class="maskStyle">
	<div id="maskFont2"></div>
</div>


<!-- 导入数据按钮 -->
<div style="border: 1px solid #00ff63;width: 320px;height: 210px;">
	<h2>上传附件</h2>
	<input type="button" onclick="doToolbar(this.id);" id="importTJXX" class="btn form-control btn-success" value="信息批量导入" style="width:135px;"/>
</div>

<!-- 弹窗 -->
<div id="importInfoDialog">
		<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 content" style="width:100%;padding-top: 30px;">
			<div class="content-border">
				<div id="querybox2">
					<form id="form3" name="form3" method="POST" action="<%=request.getContextPath()%>/Svl_Import" enctype="multipart/form-data">
						<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="height:80px;">
								  <input id="excel1" name="excel1" width="100%" type="text" style="width:90%;height: 34px;" >
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
								<input type="button" id="saveImport" class="btn form-control btn-success dialogButtom-btn" value="导入" onclick="doToolbar(this.id);"/> 
							</div>
						</div>
						<input type="hidden" id="active2" name="active" />
					</form>
				</div>
			</div>
		</div>
	</div>


</body>

<script type="text/javascript">


$(document).ready(function(){
		initDialog();//初始化对话框
		initFilebox();
});











/**工具栏按钮调用方法，传入按钮的id
@id 当前按钮点击事件
**/
function doToolbar(iToolbar){

	//点击按钮打开上传附件弹窗
	if (iToolbar == 'importTJXX'){
		$('#importInfoDialog').dialog('setTitle', '导入');
		$('#importInfoDialog').dialog("open");
	}

	//上传体检excel文件
	if (iToolbar == 'saveImport'){
		var excel1 = $('#excel1').filebox('getValue')
		var excelsuffix=excel1.substring(excel1.lastIndexOf("."),excel1.length);

		if($('#excel1').filebox('getValue') == ''){
			layer.alert('请选择上传文件');
			return;
		}
		if(excelsuffix!=".xls" && excelsuffix!=".xlsx"){  
			layer.alert('只能导入Excel类型的文件!');
	   		return;
		} 
		
		$("#active2").val("importExamInfo");
		showShade();
		$('#form3').submit(); 
		
	}
}


//遮罩层
function showShade(){ 
	$('#maskFont2').html('导入中，请稍候...'); 
	$('#divPageMask4').show(); 
}







//上传按钮初始化
function initFilebox(){
	$('#excel1').filebox({
	    buttonText: '选择文件',
	    buttonAlign: 'right'
	});
}



	/**加载 dialog控件**/
function initDialog(){
		$('#importInfoDialog').dialog({  
			width: 360,//宽度设置   
			height: 200,//高度设置 
			modal:true,
			closed: true,   
			cache: false, 
			draggable:false,//是否可移动dialog框设置
			//打开事件
			onOpen:function(data){},
			//读取事件
			onLoad:function(data){},
			//关闭事件
			onClose:function(data){
				$('#form3').form('clear');
			}
		});

	}


$('#form3').form({
	//定位到servlet位置的url
	url:'<%=request.getContextPath()%>/Svl_Import',
	//当点击事件后触发的事件
    onSubmit: function(data){ 
    }, 
    //当点击事件并成功提交后触发的事件
    success:function(data){
    	var json = eval("("+data+")");
    	if(json[0].MSG=="导入完成"){
    		$('#divPageMask4').hide();
   		 	$('#importInfoDialog').dialog("close");
   		 	layer.msg(json[0].MSG);
		}else if(json[0].MSG=="未找到sheet1"){
			layer.alert("工作表名称不符");
		}else{
			layer.alert(json[0].MSG);
		}
		   
	}
});



</script>
</html>