package com.pantech.src.devolop.student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pantech.base.common.tools.JsonUtil;
import com.pantech.base.common.tools.MyTools;
import com.pantech.base.common.tools.TraceLog;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class Svl_newindexBean
 */
public class Svl_newindexBean extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符编码为UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String active = MyTools.StrFiltr(request.getParameter("active"));// 拿取前台的active值
		System.out.println("请求结果是--------------"+active);
		int pageNum = MyTools.parseInt(request.getParameter("page"));	//获得页面page参数 分页
		int pageSize = MyTools.parseInt(request.getParameter("rows"));	//获得页面rows参数 分页
		
		

		Vector jsonV = null;//返回结果集
		JSONArray jal = null;//返回json对象
		newindexBean bean = new newindexBean(request);
		this.getFormData(request, bean); //获取SUBMIT提交时的参数（AJAX适用）
		
		//查询全部
		if ("queaudittg".equalsIgnoreCase(active)) {
			String tid=MyTools.StrFiltr(request.getParameter("tid"));
			
			System.out.println(tid+"ddddddddddddd");
			try {
				//查询列表
				jsonV = bean.query(tid);
				jal = (JSONArray)jsonV.get(2);
				response.getWriter().write(jal.toString());
				TraceLog.Trace(jal.toString());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
	}
	
	
	
	
	private void getFormData(HttpServletRequest request,newindexBean bean){
		bean.setId(MyTools.StrFiltr(request.getParameter("id")));//权限代码
		bean.setNj(MyTools.StrFiltr(request.getParameter("nj"))); //授课计划明细编号
		bean.setTid(MyTools.StrFiltr(request.getParameter("tid"))); //授课计划主表编号
	}

}
