<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.io.*,org.apache.poi.poifs.filesystem.POIFSFileSystem,org.apache.poi.hssf.record.*,org.apache.poi.hssf.model.*,org.apache.poi.hssf.usermodel.*,org.apache.poi.hssf.util.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>



<html>
<head><title>Read Excel file </title>
</head>
<body>



<%
	String filename = "D:\\tomcat\\webapps\\ROOT\\cwgl\\drdc\\impdata\\crm.xls";  


            try
            {

                // create a poi workbook from the excel spreadsheet file
                POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(filename));
                HSSFWorkbook wb = new HSSFWorkbook(fs);

                for (int k = 0; k < wb.getNumberOfSheets(); k++)
                {

                    HSSFSheet sheet = wb.getSheetAt(k);
                    int  rows  = sheet.getPhysicalNumberOfRows();

                    for (int r = 0; r < rows; r++)
                    {
                        HSSFRow row   = sheet.getRow(r);
                        if (row != null) 
						{ 
                            int     cells = row.getPhysicalNumberOfCells();
                            for (short c = 0; c < cells; c++) 
                            { 
                                HSSFCell cell  = row.getCell(c);
                                if (cell != null) { 
                                    String   value = null;

                                    switch (cell.getCellType())
                                    {

                                        case HSSFCell.CELL_TYPE_FORMULA :
                                            value = "FORMULA ";
                                            break;

                                        case HSSFCell.CELL_TYPE_NUMERIC :
                                            value = "NUMERIC value="
                                                    + cell.getNumericCellValue();
                                            break;

                                        case HSSFCell.CELL_TYPE_STRING :
                                            value = "STRING value="
                                                    + cell.getStringCellValue();
                                            break;

                                        default :
                                    }
%>									
                                    <%= "CELL col=" + cell.getCellNum()  + " VALUE=" + value %>
<%
                                } 
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
%>
	Error occurred:  <%= e.getMessage() %>
<%			
                e.printStackTrace();
            }


%> 
</body>
</html>

