<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='org.apache.poi.hssf.usermodel.HSSFWorkbook,org.apache.poi.hssf.usermodel.HSSFSheet,org.apache.poi.hssf.usermodel.HSSFRow,org.apache.poi.hssf.usermodel.HSSFCell,java.io.FileInputStream' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%

String  fileToBeRead="D:\\tomcat\\webapps\\ROOT\\exec\\book1.xls";  

try
{  
	//  创建对Excel工作簿文件的引用  
	HSSFWorkbook  workbook  =  new  HSSFWorkbook(new  FileInputStream(fileToBeRead));  
	//  创建对工作表的引用。  
	//  本例是按名引用（让我们假定那张表有着缺省名"Sheet1"）  
	HSSFSheet  sheet  =  workbook.getSheet("Sheet1");  
//	HSSFSheet  sheet  =  workbook.getSheetAt(0);  
	//  也可用getSheetAt(int  index)按索引引用，  
	//  在Excel文档中，第一张工作表的缺省索引是0，  
	//  其语句为：HSSFSheet  sheet  =  workbook.getSheetAt(0);  
	//  读取左上端单元  
	
	int rownum1=sheet.getFirstRowNum();
	int rownum2=sheet.getLastRowNum();

	out.println("<BR>rownum1="+rownum1+";rownum2="+rownum2);

	HSSFRow row=null;
	HSSFCell cell=null;
	for (int i=rownum1;i<=rownum2 ;i++ )
	{
		row = sheet.getRow(i);  

		int colnum1=row.getFirstCellNum();
		int colnum2=row.getLastCellNum();

		out.println("<BR>colnum1="+colnum1+";colnum2="+colnum2);

		for (int j=colnum1;j<colnum2 ;j++ )
		{
			cell = row.getCell((short)j);  

			int typeInt=cell.getCellType();

			if (typeInt==0)
			{
				out.println(" + "  +  cell.getNumericCellValue());    
			}
			else if (typeInt==1)
			{
				out.println(" + "  +  cell.getStringCellValue());    
			}
			else if (typeInt==2)
			{
				out.println(" + "  +  cell.getStringCellValue());    
			}
			else if (typeInt==3)
			{
				out.println(" + "  +  cell.getStringCellValue());    
			}


		}
	}
}
catch(Exception  e)  
{  
	out.println("<BR>读Excel出错:"  +  e  );  
}  


%>


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFCell;
import java.io.FileOutputStream;
public class CreateXL {
　/** Excel 文件要存放的位置，假定在D盘JTest目录下*/
　public static String outputFile="D:/JTest/ gongye.xls";
　public static void main(String argv[])
  {
　try
  {
　　// 创建新的Excel 工作簿
　　HSSFWorkbook workbook = new HSSFWorkbook();
　　// 在Excel工作簿中建一工作表，其名为缺省值
　　// 如要新建一名为"效益指标"的工作表，其语句为：
　　// HSSFSheet sheet = workbook.createSheet("效益指标");
　　HSSFSheet sheet = workbook.createSheet();
　　// 在索引0的位置创建行（最顶端的行）
　　HSSFRow row = sheet.createRow((short)0);
　　//在索引0的位置创建单元格（左上端）
　　HSSFCell cell = row.createCell((short) 0);
　　// 定义单元格为字符串类型
　　cell.setCellType(HSSFCell.CELL_TYPE_STRING);
　　// 在单元格中输入一些内容
　　cell.setCellValue("增加值");
　　// 新建一输出文件流
　　FileOutputStream fOut = new FileOutputStream(outputFile);
　　// 把相应的Excel 工作簿存盘
　　workbook.write(fOut);
　　fOut.flush();
　　// 操作结束，关闭文件
　　fOut.close();
　　System.out.println("文件生成...");



　}catch(Exception e) {
　　System.out.println("已运行 xlCreate() : " + e );
　}
}
}


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFCell;
import java.io.FileInputStream;
public class ReadXL {
　/** Excel文件的存放位置。注意是正斜线*/
　public static String fileToBeRead="D:/JTest/ gongye.xls";
　public static void main(String argv[]){ 
　try{
　　// 创建对Excel工作簿文件的引用
　　HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(fileToBeRead));
　　// 创建对工作表的引用。
　　// 本例是按名引用（让我们假定那张表有着缺省名"Sheet1"）
　　HSSFSheet sheet = workbook.getSheet("Sheet1");
　　// 也可用getSheetAt(int index)按索引引用，
　　// 在Excel文档中，第一张工作表的缺省索引是0，
　　// 其语句为：HSSFSheet sheet = workbook.getSheetAt(0);
　　// 读取左上端单元
　　HSSFRow row = sheet.getRow(0);
　　HSSFCell cell = row.getCell((short)0);
　　// 输出单元内容，cell.getStringCellValue()就是取所在单元的值
　　System.out.println("左上端单元是： " + cell.getStringCellValue()); 
　}catch(Exception e) {
　　System.out.println("已运行xlRead() : " + e );
　}
}
}




　　设置单元格格式
　　在这里，我们将只介绍一些和格式设置有关的语句，我们假定workbook就是对一个工作簿的引用。在Java



中，第一步要做的就是创建和设置字体和单元格的格式，然后再应用这些格式：



　　1、创建字体，设置其为红色、粗体：
HSSFFont font = workbook.createFont();
font.setColor(HSSFFont.COLOR_RED);
font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
　　2、创建格式
HSSFCellStyle cellStyle= workbook.createCellStyle();
cellStyle.setFont(font);
　　3、应用格式 
HSSFCell cell = row.createCell((short) 0);
cell.setCellStyle(cellStyle);
cell.setCellType(HSSFCell.CELL_TYPE_STRING);
cell.setCellValue("标题 ");



　　总之，如本篇文章所演示的一样，Java程序员不必担心Excel工作表中的数据了，利用Jakarta POI API，



我们就可以轻易的在程序中存取Excel文档。
 
