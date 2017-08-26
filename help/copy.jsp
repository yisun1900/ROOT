<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	String rootPath=getServletContext().getRealPath("");
	//拷贝标准凭证文件
	String DBFSourece=null;
	String DownFile=null;



/*
	DBFSourece="D:\\tomcat\\webapps\\ROOT\\foxpro\\JINDIEPZ.dbf";
	DownFile="D:\\tomcat\\webapps\\ROOT\\foxpro\\crm.dbf";
	cf.toByteFile(DBFSourece,DownFile,50,40,"1");
	cf.toByteFile(DBFSourece,DownFile,50,40,36*50+25,"1");

	DBFSourece="D:\\tomcat\\webapps\\ROOT\\foxpro\\1234.dbf";
	DownFile="D:\\tomcat\\webapps\\ROOT\\foxpro\\JINDIEPZ.dbf";
	cf.copyDBFFile(DBFSourece,DownFile,36*50+25,"1");
*/

	DBFSourece="D:\\tomcat\\webapps\\ROOT\\cwgl\\drdc\\impdata\\aaa.xls";
	DownFile="D:\\tomcat\\webapps\\ROOT\\cwgl\\drdc\\impdata\\aaa.txt";
	cf.toByteFile(DBFSourece,DownFile,50,40);

	DBFSourece="D:\\tomcat\\webapps\\ROOT\\cwgl\\drdc\\impdata\\crm.xls";
	DownFile="D:\\tomcat\\webapps\\ROOT\\cwgl\\drdc\\impdata\\crm.txt";
	cf.toByteFile(DBFSourece,DownFile,50,40);

/*

	DBFSourece="D:\\tomcat\\webapps\\ROOT\\foxpro\\3\\gyh.dbf";
	DownFile="D:\\tomcat\\webapps\\ROOT\\foxpro\\3\\gyh.txt";
	cf.toByteFile(DBFSourece,DownFile,50,40,"1");
	DBFSourece="D:\\tomcat\\webapps\\ROOT\\foxpro\\crm.dbf";
	DownFile="D:\\tomcat\\webapps\\ROOT\\foxpro\\crm.txt";
	cf.toByteFile(DBFSourece,DownFile,50,40,"1");
	DBFSourece="D:\\tomcat\\webapps\\ROOT\\foxpro\\55.dbf";
	DownFile="D:\\tomcat\\webapps\\ROOT\\foxpro\\55.txt";
	cf.toByteFile(DBFSourece,DownFile,50,40,"1");

	DBFSourece="D:\\tomcat\\webapps\\ROOT\\foxpro\\72.dbf";
	DownFile="D:\\tomcat\\webapps\\ROOT\\foxpro\\72.txt";
	cf.toByteFile(DBFSourece,DownFile,50,40,"1");
*/

	out.println("OK");

	//5048485448564852，20060804


%>

short rownum;

// create a new file
FileOutputStream out = new FileOutputStream("workbook.xls");
// create a new workbook
HSSFWorkbook wb = new HSSFWorkbook();
// create a new sheet
HSSFSheet s = wb.createSheet();
// declare a row object reference
HSSFRow r = null;
// declare a cell object reference
HSSFCell c = null;
// create 3 cell styles
HSSFCellStyle cs = wb.createCellStyle();
HSSFCellStyle cs2 = wb.createCellStyle();
HSSFCellStyle cs3 = wb.createCellStyle();
HSSFDataFormat df = wb.createDataFormat();
// create 2 fonts objects
HSSFFont f = wb.createFont();
HSSFFont f2 = wb.createFont();

//set font 1 to 12 point type
f.setFontHeightInPoints((short) 12);
//make it blue
f.setColor( (short)0xc );
// make it bold
//arial is the default font
f.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

//set font 2 to 10 point type
f2.setFontHeightInPoints((short) 10);
//make it red
f2.setColor( (short)HSSFFont.COLOR_RED );
//make it bold
f2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

f2.setStrikeout( true );

//set cell stlye
cs.setFont(f);
//set the cell format 
cs.setDataFormat(df.getFormat("#,##0.0"));

//set a thin border
cs2.setBorderBottom(cs2.BORDER_THIN);
//fill w fg fill color
cs2.setFillPattern((short) HSSFCellStyle.SOLID_FOREGROUND);
//set the cell format to text see HSSFDataFormat for a full list
cs2.setDataFormat(HSSFDataFormat.getBuiltinFormat("text"));

// set the font
cs2.setFont(f2);

// set the sheet name in Unicode
wb.setSheetName(0, "\u0422\u0435\u0441\u0442\u043E\u0432\u0430\u044F " + 
                   "\u0421\u0442\u0440\u0430\u043D\u0438\u0447\u043A\u0430", 
                HSSFWorkbook.ENCODING_UTF_16 );
// in case of compressed Unicode
// wb.setSheetName(0, "HSSF Test", HSSFWorkbook.ENCODING_COMPRESSED_UNICODE );
// create a sheet with 30 rows (0-29)
for (rownum = (short) 0; rownum < 30; rownum++)
{
    // create a row
    r = s.createRow(rownum);
    // on every other row
    if ((rownum % 2) == 0)
    {
        // make the row height bigger  (in twips - 1/20 of a point)
        r.setHeight((short) 0x249);
    }

    //r.setRowNum(( short ) rownum);
    // create 10 cells (0-9) (the += 2 becomes apparent later
    for (short cellnum = (short) 0; cellnum < 10; cellnum += 2)
    {
        // create a numeric cell
        c = r.createCell(cellnum);
        // do some goofy math to demonstrate decimals
        c.setCellValue(rownum * 10000 + cellnum
                + (((double) rownum / 1000)
                + ((double) cellnum / 10000)));

        String cellValue;

        // create a string cell (see why += 2 in the
        c = r.createCell((short) (cellnum + 1));
        
        // on every other row
        if ((rownum % 2) == 0)
        {
            // set this cell to the first cell style we defined
            c.setCellStyle(cs);
            // set the cell's string value to "Test"
            c.setEncoding( HSSFCell.ENCODING_COMPRESSED_UNICODE );
            c.setCellValue( "Test" );
        }
        else
        {
            c.setCellStyle(cs2);
            // set the cell's string value to "\u0422\u0435\u0441\u0442"
            c.setEncoding( HSSFCell.ENCODING_UTF_16 );
            c.setCellValue( "\u0422\u0435\u0441\u0442" );
        }


        // make this column a bit wider
        s.setColumnWidth((short) (cellnum + 1), (short) ((50 * 8) / ((double) 1 / 20)));
    }
}

//draw a thick black border on the row at the bottom using BLANKS
// advance 2 rows
rownum++;
rownum++;

r = s.createRow(rownum);

// define the third style to be the default
// except with a thick black border at the bottom
cs3.setBorderBottom(cs3.BORDER_THICK);

//create 50 cells
for (short cellnum = (short) 0; cellnum < 50; cellnum++)
{
    //create a blank type cell (no value)
    c = r.createCell(cellnum);
    // set it to the thick black border style
    c.setCellStyle(cs3);
}

//end draw thick black border


// demonstrate adding/naming and deleting a sheet
// create a sheet, set its title then delete it
s = wb.createSheet();
wb.setSheetName(1, "DeletedSheet");
wb.removeSheetAt(1);
//end deleted sheet

// write the workbook to the output stream
// close our file (don't blow out our file handles
wb.write(out);
out.close();
        