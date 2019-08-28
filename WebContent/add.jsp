<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</head>
<body>
<h1>数据</h1>
	<form action="#">
	<input type="hidden" id="active" value="tgadd">
	<p>年龄：<input type="text" id="age" value=""></p>
	<p>用户名：<input type="text" id="name" value=""></p>
	<p>密码：<input type="text" id="pwd" value=""></p>
	<p>所在地区：<input type="text" id="addess" value=""></p>
	<p><input type="button" id="tj" value="提交数据"><input type="reset" value="清空数据"></p>
	</form>
</body>


<script type="text/javascript">

$(document).ready(function(){
	function name() {
		
	}
	
	$("#tj").click(function name() {
			alert("2");
				
				/* 拿取id和input文本框里数据，在通过Ajax方法传入userAddressServlet层，设置回调函数	 */
					 var age=$("#age").val(); 
					  var name=$("#name").val(); 
					  var pwd=$("#pwd").val(); 
					  var addess=$("#addess").val(); 
					 
					   $.ajax({
							url:"<%=request.getContextPath()%>/Svl_index2?active=tgadd&age="+age+"&name="+name+"&pwd="+pwd+"&addess="+addess,
							type:"post",
							dataType:"json",
							success:function(data){
								if(data[0].MSG=="保存成功"){
						  			alert("添加成功");
						  				window.location="index.jsp";
						  		}else{
						  			alert("添加失败");
						  			window.location="index.jsp";
						  			//window.location.reload();  //刷新当前页面
						  		}
								
							}
							
						});
					   
			});
	
	});
</script>

</html>