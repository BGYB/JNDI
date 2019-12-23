package com.pantech.src.devolop.student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.pantech.base.common.exception.WrongSQLException;
import com.pantech.base.common.tools.JsonUtil;
import com.pantech.base.common.tools.MyTools;

import net.sf.json.JSONArray;

public class Svl_Import extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("UTF-8");//request编码类型
		response.setContentType("text/html;charset=UTF-8");//reponse类型统一
		
		Vector vector=new Vector();
		JSONArray jsonArray = new JSONArray(); 
		Vector jsonV = null;//返回结果集2222222
		JSONArray jal = null;//返回json对象
		
		ImportBean  bean = new ImportBean(request);
		ServletConfig sc = this.getServletConfig();
		SmartUpload mySmartUpload = new SmartUpload("UTF-8");
		mySmartUpload.initialize(sc, request, response);
		try {
			mySmartUpload.upload();
		} catch (SmartUploadException exception1) {
			// TODO 自动生成 catch 块
			exception1.printStackTrace();
		}
		getParameters(request, bean,mySmartUpload);
		String active = MyTools.StrFiltr(mySmartUpload.getRequest().getParameter("active"));//获取前台提交的操作类型
		
		
		//导入信息
		if(active.equalsIgnoreCase("importExamInfo")){
			try {
					bean.importExamInfo(mySmartUpload);//试题xls解析保存
					jsonArray = JsonUtil.addJsonParams(jsonArray, "MSG", bean.getMSG());
					response.getWriter().write(jsonArray.toString());
					
				} catch (SQLException e) {
					// TODO 自动生成 catch 块
					e.printStackTrace();
				} catch (SmartUploadException e) {
					// TODO 自动生成 catch 块
					e.printStackTrace();
				} catch (WrongSQLException e) {
					// TODO 自动生成 catch 块
					e.printStackTrace();
				}
		}
		
		
		
	}
	
	
	//获得页面参数
	public void getParameters(HttpServletRequest request,ImportBean bean,SmartUpload mySmartUpload){
			
	}
}
