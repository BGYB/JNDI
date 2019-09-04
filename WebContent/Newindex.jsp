<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/icon.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/JQueryUI/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/common/clientScript.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/script/common/publicScript.js"></script>
</head>
<body>
	<!-- 进度条<div id="box"></div> -->
	
	<div id="box" style="width: 600px; height: 400px">
		<div data-options="region:'north',title:'上北',split:true," style="height: 60px"></div>
		<div data-options="region:'south',title:'下南',split:true," style="height: 60px"></div>
		<div data-options="region:'west',title:'左西',split:true," style="width: 100px"></div>
		<div data-options="region:'east',title:'右东',split:true," style="width: 100px"></div>
		<div data-options="region:'center',title:'中间',split:true,"></div>
	</div>
	
	
	
	<ul id="box2">
		<!-- <li>
			<span>年级</span>
			<ul>
				<li>
				<span>年级办公室</span>
					<ul>
						<li>年级办公室一</li>
						<li>年级办公室二</li>
					</ul>
				</li>

				<li>一年级</li>
				<li>二年级</li>
			</ul>
		</li>
		
		<li>
			<span>班级</span>
			<ul>
				<li>一年级一班</li>
				<li>二年级二班</li>
			</ul>
		</li> -->
	
	</ul>
	
</body>
<script type="text/javascript">

/* 进度条
$(function() {
	$("#box").progressbar({
		width:400,
		height:30,
		value:10,
		test:'{value}%',
		onChange: function (newValue,oldValue) {
			console.log('新：'+newValue+',旧：'+oldValue)
		}
		
	});
	
	
	setInterval(function () {
		$("#box").progressbar('setValue',$("#box").progressbar('getValue')+5);  //每200秒执行函数都加5%
	},200) 
	
	
	
	
	
	
	
})
 */





$(function () {
	$("#box").layout({
		
	});
	
	
	
})


$(function() {
	var tid=0;
	var url="";
	$("#box2").tree({
		url:'<%=request.getContextPath()%>/Svl_newindexBean?active=queaudittg&tid='+tid,
		checkbox: false,//复选框
		animate:true,//节点展开或折叠是否显示动画效果
		lines:true, //结构线
		
		onBeforeExpand:function(node,param){//展开之前触发，node取本身的值
			tid=node.id;//传值改变url
	  		$('#box2').tree('options').url='<%=request.getContextPath()%>/Svl_newindexBean?active=queaudittg&tid='+tid;
			
		},
		
		
		
	});
	
})




</script>

</html>