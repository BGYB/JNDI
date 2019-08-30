package com.pantech.src.devolop.student;

import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.pantech.base.common.db.DBSource;
import com.pantech.base.common.tools.MyTools;

import net.sf.json.JSONArray;

/**
  * @author 郁春海 E-mail:739259267@qq.com
  * @version 创建时间：2019年8月20日 下午4:27:38
  * @company www.wiserun.com
  * @description 
  */
public class indexBean {
	
	private String id;
	private String age;
	private	String name;
	private	String pwd;
	private	String addess;
	
	private String msg;
	private HttpServletRequest request;
	private DBSource db;
	
	
	
	//初始化参数
		private void InitialData() {
			id = "";
			age = "";
			name = "";
			pwd = "";
			addess = "";
			msg = "";
		}
	
	
	
	/**
	 * 类初始化，数据库操作必有 此时无主关键字
	 */
	public indexBean(HttpServletRequest request){
		this.request = request;
		this.db = new DBSource(request);
		this.msg = "";
		this.InitialData();
	}
	
	
	
	
	
	
	//查询全部及条件查询
	public Vector query(int pageNum, int page,String name,String id) throws SQLException {
		
		DBSource db = new DBSource(request); // 数据库对象
		String sql = ""; // 查询用SQL语句
		Vector vec = null; // 结果集
		sql = "SELECT[id],[age] ,[name],[pwd],[addess]FROM [student].[dbo].[Table4]";
		
		if(name!=""&&id!=""){
			sql += "where name like '%"+ MyTools.fixSql(this.getName()) +"%' and id='"+Integer.parseInt(this.getId())+"'";
		}
		
		if(name!=""&&id=="") {
			sql += "where name like '%"+ MyTools.fixSql(this.getName()) +"%'";
		}
		
		if(id!=""&&name=="") {
			sql += "where id='"+Integer.parseInt(this.getId())+"'";
		}
		
		vec = db.getConttexJONSArr(sql,pageNum, page);
		return vec;
		
		
	}
	
		
	
	
	//删除
	public boolean deleteAudit() throws SQLException{
		DBSource db = new DBSource(request);
		Vector vec = new Vector(); // 结果集
		String sql="";
		/*
		 * 需要扩展删除关联表SELECT 
		 * 
		 */
		sql="delete FROM [student].[dbo].[Table4] where id='"+Integer.parseInt(this.getId())+"'";
		vec.add(sql);
		boolean ruesl=db.executeInsertOrUpdateTransaction(vec);
		if(ruesl) {
			this.setMsg("删除成功");
			return true;
		}
		
		return false;
		
	}
	
	
	//添加
	public void tgadd() throws SQLException{
		DBSource db = new DBSource(request);// 数据库对象
		String sql="";
		int edition=0;
		sql = "INSERT INTO Table4(age,name,pwd,addess) VALUES("+
		"'" + MyTools.fixSql(this.getAge())+ "'," + 
		"'" + MyTools.fixSql(this.getName())+ "'," + 
		"'" + MyTools.fixSql(this.getPwd())+ "'," + 
		"'" + MyTools.fixSql(this.getAddess())+ "')"; 
		if(db.executeInsertOrUpdate(sql)){
			setMsg("保存成功");
		}else{
			setMsg("保存失败");
		}
		
	}
	
	
	
	//修改
	public void tgupdate() throws SQLException{
		DBSource db = new DBSource(request);// 数据库对象
		String sql="";
		sql = "update Table4 set " +
				"age='" + MyTools.fixSql(this.getAge()) + "'," +
				"name='" + MyTools.fixSql(this.getName()) + "'," +
				"pwd='" + MyTools.fixSql(this.getPwd()) + "'," +
				"addess='" + MyTools.fixSql(this.getAddess()) + "' " +
				"where id='" + MyTools.fixSql(this.getId()) + "'";
		if(db.executeInsertOrUpdate(sql)){
			setMsg("保存成功");
		}else{
			setMsg("保存失败");
		}
		
	}
	
	
	
	
	
	
	
	public indexBean() {
		super();
	}
	public indexBean(String id, String age, String name, String pwd, String addess, String msg) {
		super();
		this.id = id;
		this.age = age;
		this.name = name;
		this.pwd = pwd;
		this.addess = addess;
		this.msg = msg;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAddess() {
		return addess;
	}
	public void setAddess(String addess) {
		this.addess = addess;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

}
