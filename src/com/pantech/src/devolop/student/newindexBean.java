package com.pantech.src.devolop.student;

import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.pantech.base.common.db.DBSource;
import com.pantech.base.common.tools.MyTools;

public class newindexBean {
	
	private String id;
	private String nj;
	private	String tid;
	
	private String msg;
	private HttpServletRequest request;
	private DBSource db;
	
	
	
	
	//初始化参数
	private void InitialData() {
		id = "";
		nj = "";
		tid = "";
		msg = "";
	}

	
	/**
	 * 类初始化，数据库操作必有 此时无主关键字
	 */
	public newindexBean(HttpServletRequest request){
		this.request = request;
		this.db = new DBSource(request);
		this.msg = "";
		this.InitialData();
	}


	
	
	
	
	
	//查询符合条件的树：Njb表
	public Vector query(String tid) throws SQLException {
		
		DBSource db = new DBSource(request); // 数据库对象
		String sql = ""; // 查询用SQL语句
		Vector vec = null; // 结果集
		
		sql = "SELECT [id],[userid],[nj] as text,'closed' as state, [tid] FROM [student].[dbo].[Njb] where tid='"+Integer.parseInt(this.getTid())+"'";

		//当userId不等于0的时候最后的节点状态为open，不为文件夹显示
		if(!tid.equals("0")) {
			sql = "SELECT [id],[userid],[nj] as text,'open' as state, [tid] FROM [student].[dbo].[Njb] where tid='"+Integer.parseInt(this.getTid())+"'";

		}
		vec = db.getConttexJONSArr(sql,0, 0);
		return vec;
		
		
	}	
	
	
	
	
	
	
	
	public newindexBean() {
		super();
	}


	public newindexBean(String id, String nj, String tid, String msg) {
		super();
		this.id = id;
		this.nj = nj;
		this.tid = tid;
		this.msg = msg;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getNj() {
		return nj;
	}


	public void setNj(String nj) {
		this.nj = nj;
	}


	public String getTid() {
		return tid;
	}


	public void setTid(String tid) {
		this.tid = tid;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	
	
	
		
	

}
