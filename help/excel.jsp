<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='org.apache.poi.hssf.usermodel.HSSFWorkbook,org.apache.poi.hssf.usermodel.HSSFSheet,org.apache.poi.hssf.usermodel.HSSFRow,org.apache.poi.hssf.usermodel.HSSFCell,java.io.FileInputStream' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%

String  fileToBeRead="D:\\tomcat\\webapps\\ROOT\\exec\\book1.xls";  

try
{  
	//  ������Excel�������ļ�������  
	HSSFWorkbook  workbook  =  new  HSSFWorkbook(new  FileInputStream(fileToBeRead));  
	//  �����Թ���������á�  
	//  �����ǰ������ã������Ǽٶ����ű�����ȱʡ��"Sheet1"��  
	HSSFSheet  sheet  =  workbook.getSheet("Sheet1");  
//	HSSFSheet  sheet  =  workbook.getSheetAt(0);  
	//  Ҳ����getSheetAt(int  index)���������ã�  
	//  ��Excel�ĵ��У���һ�Ź������ȱʡ������0��  
	//  �����Ϊ��HSSFSheet  sheet  =  workbook.getSheetAt(0);  
	//  ��ȡ���϶˵�Ԫ  
	
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
	out.println("<BR>��Excel����:"  +  e  );  
}  


%>


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFCell;
import java.io.FileOutputStream;
public class CreateXL {
��/** Excel �ļ�Ҫ��ŵ�λ�ã��ٶ���D��JTestĿ¼��*/
��public static String outputFile="D:/JTest/ gongye.xls";
��public static void main(String argv[])
  {
��try
  {
����// �����µ�Excel ������
����HSSFWorkbook workbook = new HSSFWorkbook();
����// ��Excel�������н�һ����������Ϊȱʡֵ
����// ��Ҫ�½�һ��Ϊ"Ч��ָ��"�Ĺ����������Ϊ��
����// HSSFSheet sheet = workbook.createSheet("Ч��ָ��");
����HSSFSheet sheet = workbook.createSheet();
����// ������0��λ�ô����У���˵��У�
����HSSFRow row = sheet.createRow((short)0);
����//������0��λ�ô�����Ԫ�����϶ˣ�
����HSSFCell cell = row.createCell((short) 0);
����// ���嵥Ԫ��Ϊ�ַ�������
����cell.setCellType(HSSFCell.CELL_TYPE_STRING);
����// �ڵ�Ԫ��������һЩ����
����cell.setCellValue("����ֵ");
����// �½�һ����ļ���
����FileOutputStream fOut = new FileOutputStream(outputFile);
����// ����Ӧ��Excel ����������
����workbook.write(fOut);
����fOut.flush();
����// �����������ر��ļ�
����fOut.close();
����System.out.println("�ļ�����...");



��}catch(Exception e) {
����System.out.println("������ xlCreate() : " + e );
��}
}
}


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFCell;
import java.io.FileInputStream;
public class ReadXL {
��/** Excel�ļ��Ĵ��λ�á�ע������б��*/
��public static String fileToBeRead="D:/JTest/ gongye.xls";
��public static void main(String argv[]){ 
��try{
����// ������Excel�������ļ�������
����HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(fileToBeRead));
����// �����Թ���������á�
����// �����ǰ������ã������Ǽٶ����ű�����ȱʡ��"Sheet1"��
����HSSFSheet sheet = workbook.getSheet("Sheet1");
����// Ҳ����getSheetAt(int index)���������ã�
����// ��Excel�ĵ��У���һ�Ź������ȱʡ������0��
����// �����Ϊ��HSSFSheet sheet = workbook.getSheetAt(0);
����// ��ȡ���϶˵�Ԫ
����HSSFRow row = sheet.getRow(0);
����HSSFCell cell = row.getCell((short)0);
����// �����Ԫ���ݣ�cell.getStringCellValue()����ȡ���ڵ�Ԫ��ֵ
����System.out.println("���϶˵�Ԫ�ǣ� " + cell.getStringCellValue()); 
��}catch(Exception e) {
����System.out.println("������xlRead() : " + e );
��}
}
}




�������õ�Ԫ���ʽ
������������ǽ�ֻ����һЩ�͸�ʽ�����йص���䣬���Ǽٶ�workbook���Ƕ�һ�������������á���Java



�У���һ��Ҫ���ľ��Ǵ�������������͵�Ԫ��ĸ�ʽ��Ȼ����Ӧ����Щ��ʽ��



����1���������壬������Ϊ��ɫ�����壺
HSSFFont font = workbook.createFont();
font.setColor(HSSFFont.COLOR_RED);
font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
����2��������ʽ
HSSFCellStyle cellStyle= workbook.createCellStyle();
cellStyle.setFont(font);
����3��Ӧ�ø�ʽ 
HSSFCell cell = row.createCell((short) 0);
cell.setCellStyle(cellStyle);
cell.setCellType(HSSFCell.CELL_TYPE_STRING);
cell.setCellValue("���� ");



������֮���籾ƪ��������ʾ��һ����Java����Ա���ص���Excel�������е������ˣ�����Jakarta POI API��



���ǾͿ������׵��ڳ����д�ȡExcel�ĵ���
 
