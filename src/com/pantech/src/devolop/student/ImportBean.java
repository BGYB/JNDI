package com.pantech.src.devolop.student;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartFiles;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.pantech.base.common.db.DBSource;
import com.pantech.base.common.exception.WrongSQLException;
import com.pantech.base.common.tools.MyTools;

public class ImportBean {
	
	private HttpServletRequest request; 
	private DBSource db;
	
	private String MSG;//提示消息
	private String MSG2;//提示未导入课程
	private String SKTERM;//提示消息
	
	private String dddd;//提示消息
	
	/** 
	* <p>Title: </p> 
	* <p>Description: </p> 
	* @param request 
	*/
	public ImportBean(HttpServletRequest request) {
		// TODO 自动生成的构造函数存根
		
		this.request = request;
	}

	
	
	
	
	/**
	 * @Title: saveimpxls
	 * @Description: 导入考试信息
	 * @author lupengfei
	 * @date 2016-7-19
	 */
	@SuppressWarnings("unchecked")
	public void importExamInfo(SmartUpload mySmartUpload) throws SQLException, ServletException, IOException, SmartUploadException, WrongSQLException{
		DBSource db = new DBSource(request);
		String sql="";
		String sqlmx="";
		Vector vec = null; // 结果集
		
		String tempsheet="";//sheet名
		String tempsoin="";//第1列
		String tempsoin2="";
		String templine="";//第3列
		int sheetnum=0;//sheet计数
		String BH="";//编号
		String TJZXM="";//体检者姓名
		String TJRQ="";//体检日期
		String TJJGMC="";//体检机构名称
		String TJJG="";//体检结果
		
		String path = "c:/temp/upload";
		File f1 = new File(path);  
		//当文件夹不存在时创建
		if (!f1.exists()) {  
		    f1.mkdirs();  
		}
		//Workbook workbook = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		Vector vectormx=new Vector();

		SmartFiles files = mySmartUpload.getFiles(); //获取文件
		
		SmartFile file= null;

		//判断
		
		if(files.getCount() > 0){
			file = files.getFile(0);
			if(file.getSize()<=0){
				MSG = "文件内容为空，请确认！";
			}
			file.saveAs(path +"/"+file.getFileName());
		}
		path=path +"/"+file.getFileName();
		String filename=file.getFileName();
		System.out.println("file=:"+file.getFileName());

		File file1=new File(path);
		
		
		try {
			InputStream is = new FileInputStream(file1);
			if (filename.substring(filename.indexOf(".")+1,filename.length()).equals("xls")) {
			   workbook = new HSSFWorkbook(is);
			   System.out.println(workbook.getNumberOfSheets());
			
			for(int k=0;k<workbook.getNumberOfSheets();k++){ //控制循环几个Sheet
					
					HSSFSheet sheet = workbook.getSheetAt(k); //获取sheet(k)的数据对象
					tempsheet=workbook.getSheetName(k);//获取sheet名
					int firstRowIndex = sheet.getFirstRowNum();
		            int lastRowIndex = sheet.getLastRowNum();
		            int rsRows=lastRowIndex;
					
		            if(lastRowIndex==0){
	                	
	                }else{	
				
					if("sheet1".equalsIgnoreCase(tempsheet.trim().toLowerCase())){//对工作表名称进行判断
						System.out.println("sheet:"+tempsheet+" rows="+rsRows);
						sheetnum++;

							int locbh=-1;//编号
							int loctjzxm=-1;//体检者姓名
							int loctjrq=-1;//体检日期
							int loctjjgmc=-1;//体检机构名称
							int loctjjg=-1;//体检结果
							
							
							Row currentRow = sheet.getRow(0);// 当前行
							int firstColumnIndex = currentRow.getFirstCellNum(); // 首列
		                    int lastColumnIndex = currentRow.getLastCellNum();// 最后一列

							
		                    //对头标题进行判断记录下标
							for (int columnIndex = firstColumnIndex; columnIndex < lastColumnIndex; columnIndex++) {
								Cell currentCell = currentRow.getCell(columnIndex);// 当前单元格
								tempsoin = this.getCellValue(currentCell, true);// 当前单元格的值
								
								if(tempsoin.equalsIgnoreCase("编号")){
									locbh=columnIndex;
								}else if(tempsoin.equalsIgnoreCase("体检者")){
									loctjzxm=columnIndex;
								}else if(tempsoin.equalsIgnoreCase("体检日期")){
									loctjrq=columnIndex;
								}else if(tempsoin.equalsIgnoreCase("体检机构")){
									loctjjgmc=columnIndex;
								}else if(tempsoin.equalsIgnoreCase("体检结果")){
									loctjjg=columnIndex;
								}
							}
							
							
							
							for (int i = 1; i <= rsRows; i++) {//从第2行遍历excel文件
								currentRow = sheet.getRow(i);// 当前行
								if (currentRow == null) {
									   
								}else{
									firstColumnIndex = currentRow.getFirstCellNum(); // 首列
					                lastColumnIndex = currentRow.getLastCellNum();// 最后一列
									for (int columnIndex =firstColumnIndex; columnIndex < lastColumnIndex; columnIndex++) {
										Cell currentCell = currentRow.getCell(columnIndex);// 当前单元格
										tempsoin = this.getCellValue(currentCell, true);// 当前单元格的值
										if(tempsoin.equalsIgnoreCase("")){
											continue;
										}else{
											if(locbh==-1){
												BH=""; //编号列
											}else{
												if(locbh==columnIndex){
													BH=tempsoin.trim(); 
												}	
											}
											if(loctjzxm==-1){
												TJZXM=""; //体检者
											}else{
												if(loctjzxm==columnIndex){
													TJZXM=tempsoin.trim(); 
												}	
											}
											if(loctjrq==-1){
												TJRQ=""; //体检日期列
											}else{
												if(loctjrq==columnIndex){
													TJRQ=tempsoin.trim(); 
													TJRQ=convertDate(TJRQ);//转换时间类型
												}	
											}
											if(loctjjgmc==-1){
												TJJGMC=""; //体检机构
											}else{
												if(loctjjgmc==columnIndex){
													TJJGMC=tempsoin.trim();
												}	
											}
											if(loctjjg==-1){
												TJJG=""; //体检结果列
											}else{
												if(loctjjg==columnIndex){
													TJJG=tempsoin.trim(); 
												}	
											}
									}
								}
									
									sqlmx=" insert into  ([编号],[体检者],[体检日期],[体检机构],[体检结果]) values (" +
											"'"+MyTools.fixSql(BH)+"'," +//编号
											"'"+MyTools.fixSql(TJZXM)+"'," +//体检者姓名
											"'"+MyTools.fixSql(TJRQ)+"'," +//体检日期
											"'"+MyTools.fixSql(TJJGMC)+"'," +//体检机构名称
											"'"+MyTools.fixSql(TJJG)+"') " ;//体检结果
											 
									vectormx.add(sqlmx);
								}
							}
						}
					}
			}
        } else if (filename.substring(filename.indexOf(".")+1,filename.length()).equals("xlsx")) {
            workbook2 = new XSSFWorkbook(is);
            System.out.println(workbook2.getNumberOfSheets());
			
			for(int k=0;k<workbook2.getNumberOfSheets();k++){
				
					XSSFSheet sheet = workbook2.getSheetAt(k); //获取sheet(k)的数据对象
					tempsheet=workbook2.getSheetName(k);//获取sheet名
					int firstRowIndex = sheet.getFirstRowNum();
	                int lastRowIndex = sheet.getLastRowNum()+1;
	                int rsRows=lastRowIndex;
	                if(lastRowIndex==1){
	                	
	                }else{                    
						System.out.println("sheet:"+tempsheet+" rows="+rsRows);
						
						if("sheet1".equalsIgnoreCase(tempsheet.trim().toLowerCase())){
							sheetnum++;
							
							int locbh=-1;//编号
							int loctjzxm=-1;//体检者姓名
							int loctjrq=-1;//体检日期
							int loctjjgmc=-1;//体检机构名称
							int loctjjg=-1;//体检结果
								
							Row currentRow = sheet.getRow(0);// 当前行
		                    int firstColumnIndex = currentRow.getFirstCellNum(); // 首列
		                    int lastColumnIndex = currentRow.getLastCellNum();// 最后一列
		                    
		                    for (int columnIndex = firstColumnIndex; columnIndex < lastColumnIndex; columnIndex++) {
								Cell currentCell = currentRow.getCell(columnIndex);// 当前单元格
								tempsoin = this.getCellValue(currentCell, true);// 当前单元格的值

								if(tempsoin.equalsIgnoreCase("编号")){
									locbh=columnIndex;
								}else if(tempsoin.equalsIgnoreCase("体检者")){
									loctjzxm=columnIndex;
								}else if(tempsoin.equalsIgnoreCase("体检日期")){
									loctjrq=columnIndex;
								}else if(tempsoin.equalsIgnoreCase("体检机构")){
									loctjjgmc=columnIndex;
								}else if(tempsoin.equalsIgnoreCase("体检结果")){
									loctjjg=columnIndex;
								}
							}
		                    
								
								for (int i = 1; i < rsRows; i++) {//从第2行遍历excel文件
									currentRow = sheet.getRow(i);// 当前行

									if (currentRow == null) {
									   
									}else{
										firstColumnIndex = currentRow.getFirstCellNum(); // 首列
					                    lastColumnIndex = currentRow.getLastCellNum();// 最后一列
										for (int columnIndex = firstColumnIndex; columnIndex < lastColumnIndex; columnIndex++) {
											Cell currentCell = currentRow.getCell(columnIndex);// 当前单元格
											tempsoin = this.getCellValue(currentCell, true);// 当前单元格的值
											
											if(tempsoin.equalsIgnoreCase("")){
												continue;
											}else{
												if(locbh==-1){
													BH=""; //编号列
												}else{
													if(locbh==columnIndex){
														BH=tempsoin.trim(); 
													}	
												}
												if(loctjzxm==-1){
													TJZXM=""; //体检者
												}else{
													if(loctjzxm==columnIndex){
														TJZXM=tempsoin.trim(); 
													}	
												}
												if(loctjrq==-1){
													TJRQ=""; //体检日期列
												}else{
													if(loctjrq==columnIndex){
														TJRQ=tempsoin.trim(); 
														TJRQ=convertDate(TJRQ);//转换时间类型
													}	
												}
												if(loctjjgmc==-1){
													TJJGMC=""; //体检机构
												}else{
													if(loctjjgmc==columnIndex){
														TJJGMC=tempsoin.trim(); 
													}	
												}
												if(loctjjg==-1){
													TJJG=""; //体检结果列
												}else{
													if(loctjjg==columnIndex){
														TJJG=tempsoin.trim(); 
													}	
												}
										}
									}
											
										sqlmx=" insert into V_个人档案_体检记录 ([编号],[体检者],[体检日期],[体检机构],[体检结果]) values (" +
												"'"+MyTools.fixSql(BH)+"'," +//编号
												"'"+MyTools.fixSql(TJZXM)+"'," +//体检者姓名
												"'"+MyTools.fixSql(TJRQ)+"'," +//体检日期
												"'"+MyTools.fixSql(TJJGMC)+"'," +//体检机构名称
												"'"+MyTools.fixSql(TJJG)+"') " ;//体检结果
												 
									}	vectormx.add(sqlmx);
								}
						}	
	                }
			}
        }
		if(db.executeInsertOrUpdateTransaction(vectormx)){
			this.MSG="导入完成";
		}else{
			this.MSG="导入失败";
		}
		if(sheetnum==0){
			this.MSG="未找到sheet1";
		}
	}catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		//workbook.close();
	}
}
	
	
	
	
	
	
	
	
	/**
     * 取单元格的值
     * @param cell 单元格对象
     * @param treatAsStr 为true时，当做文本来取值 (取到的是文本，不会把“1”取成“1.0”)
     * @return
     */
    private String getCellValue(Cell cell, boolean treatAsStr) {
        if (cell == null) {
            return "";
        }

        if (treatAsStr) {
            // 虽然excel中设置的都是文本，但是数字文本还被读错，如“1”取成“1.0”
            // 加上下面这句，临时把它当做文本来读取
            cell.setCellType(Cell.CELL_TYPE_STRING);
        }

        if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(cell.getBooleanCellValue());
        } else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            return String.valueOf(cell.getNumericCellValue());
        }else {
            return String.valueOf(cell.getStringCellValue());
        }
  
    }
    
    
 // 转换日期
 	public static String convertDate(String s) throws ParseException{
 		if (s == null || "".equals(s)) {
 			return "";
 		}
 		// 将excel读取日期时遇到数字 转化为日期
 		// Excel 的一个有趣之处就是，当您试图将数字转换为日期时，程序会假定该数字是一个序列号，
 		// 代表自 1900 年 1 月 1 日起所发生的天数。自 1900 年 1 月 1 日 算起的第 39331 天就是 2007 年 9 月 6 日
 		String rtn = "1900-01-01";
 		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 		Date date1 = new Date();
 		date1 = format.parse("1900-01-01");
 		long i1 = date1.getTime();
 		// 这里要减去2，(Long.parseLong(s)-2) 不然日期会提前2天，具体原因不清楚，
 		// 估计和java计时是从1970-01-01开始有关
 		// 而excel里面的计算是从1900-01-01开始
 		i1 = i1 / 1000 + ((Long.parseLong(s) - 2) * 24 * 3600);
 		date1.setTime(i1 * 1000);
 		rtn = format.format(date1);
 		return rtn;
 	}
    

	public String getMSG() {
		return MSG;
	}

	public void setMSG(String mSG) {
		MSG = mSG;
	}

	public String getMSG2() {
		return MSG2;
	}

	public void setMSG2(String mSG2) {
		MSG2 = mSG2;
	}



	public String getSKTERM() {
		return SKTERM;
	}


	public void setSKTERM(String sKTERM) {
		SKTERM = sKTERM;
	}


}
