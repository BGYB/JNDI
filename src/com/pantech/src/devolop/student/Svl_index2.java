package com.pantech.src.devolop.student;

import java.io.IOException;
import java.io.PrintWriter;
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
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Svl_index2
 */
public class Svl_index2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		doPost(request, response);
		
		
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		Vector jsonV = null; //返回结果集
        JSONArray jal =null;//返回json对象
        indexBean bean = new indexBean(request);  //indexBean获得request对象
       
        this.getFormData(request, bean); 
		String active = MyTools.StrFiltr(request.getParameter("active"));//前台取值
		int pageNum = MyTools.parseInt(request.getParameter("page"));	//获得页面page参数 分页
		int pageSize = MyTools.parseInt(request.getParameter("rows"));	//获得页面rows参数 分页
		
		System.out.println("请求结果为："+active);
		
		//查询全部
		if ("queaudittg".equalsIgnoreCase(active)) {

			try {
				jsonV = bean.query(pageNum,pageSize); // 通过indexBean查询数据库Vector集合得到结果集
				jal = (JSONArray) jsonV.get(2); // Vector转换JSON数据

				response.getWriter().write("{\"total\":" + MyTools.StrFiltr(jsonV.get(0)) + ",\"rows\":" + jal.toString() + "}");

				TraceLog.Trace(jsonV.toString());

			} catch (Exception e) {
				System.out.println("系統錯誤！");
				e.printStackTrace();
				jal = JsonUtil.addJsonParams(jal, "MSG", "查询错误!<br>" + bean.getMsg());
				response.getWriter().write(jal.toString());
			}
		
		
		//删除
		}else if("deleteaudit".equals(active)) {
			TraceLog.Trace("come on in delete");
			try {
				// 实例化PublicTools
				bean.setId(MyTools.StrFiltr(request.getParameter("id")));// 需要的删除审核id
				System.out.println(request.getParameter("id") + "id值");

				int success = 0;
				// 如果dataList中的值不为空则进行取值操作

				boolean retuls = bean.deleteAudit();
				System.out.println(bean.getMsg() + "dddddddddddddddddddddd");
				jal = JsonUtil.addJsonParams(jal, "MSG", bean.getMsg());
				response.getWriter().write(jal.toString());

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				jal = JsonUtil.addJsonParams(jal, "MSG", "数据删除失败");
				response.getWriter().write(jal.toString());
			}

		//添加	
		}else if("tgadd".equals(active)){
			try {
				 bean.tgadd();
				jal = JsonUtil.addJsonParams(jal, "MSG", bean.getMsg());
				response.getWriter().write(jal.toString());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
		//id查询	
		}else if("queaudittg2".equals(active)) {
			
			try {
				bean.setId(MyTools.StrFiltr(request.getParameter("id")));// id
				System.out.println(request.getParameter("id") + "id值");

				jsonV = bean.query2(pageNum,pageSize); // 通过indexBean查询数据库Vector集合得到结果集
				jal = (JSONArray) jsonV.get(2); // Vector转换JSON数据
				response.getWriter().write("{\"total\":" + MyTools.StrFiltr(jsonV.get(0)) + ",\"rows\":" + jal.toString() + "}");

				TraceLog.Trace(jsonV.toString());

			} catch (Exception e) {
				System.out.println("系統錯誤！");
				e.printStackTrace();
				jal = JsonUtil.addJsonParams(jal, "MSG", "查询错误!<br>" + bean.getMsg());
				response.getWriter().write(jal.toString());
			}

			
			
		//模糊查询
		}else if("likename".equals(active)){
			try {
				bean.setId(MyTools.StrFiltr(request.getParameter("name")));// name
				System.out.println(request.getParameter("name") + "name值");

				jsonV = bean.likename(pageNum,pageSize);// 通过indexBean查询数据库Vector集合得到结果集
				jal = (JSONArray) jsonV.get(2); // Vector转换JSON数据
				response.getWriter().write("{\"total\":" + MyTools.StrFiltr(jsonV.get(0)) + ",\"rows\":" + jal.toString() + "}");

				TraceLog.Trace(jsonV.toString());

			} catch (Exception e) {
				e.printStackTrace();
				jal = JsonUtil.addJsonParams(jal, "MSG", "查询错误!<br>" + bean.getMsg());
				response.getWriter().write(jal.toString());
			}

			
		//修改	
		}else if("tgupdate".equals(active)) {
			try {
				 bean.tgupdate();
				jal = JsonUtil.addJsonParams(jal, "MSG", bean.getMsg());
				response.getWriter().write(jal.toString());
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		
		
		
		
		
	}
	
	
	
	
	//获取请求参数
	private void getFormData(HttpServletRequest request, indexBean bean) {
		bean.setId(MyTools.StrFiltr(request.getParameter("id")));
		bean.setAge(MyTools.StrFiltr(request.getParameter("age")));
		bean.setName(MyTools.StrFiltr(request.getParameter("name")));
		bean.setPwd(MyTools.StrFiltr(request.getParameter("pwd")));
		bean.setAddess(MyTools.StrFiltr(request.getParameter("addess")));
	}


}
