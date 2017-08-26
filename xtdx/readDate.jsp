<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据 </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String jssj =null;
String xxqz =null;
String xxnr =null;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();


	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	%> 
<form method="post" action="dx_Excelfs.jsp" name="editform" target="_blank">
<div align="center">
    导入数据
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="2%">序号</td>
		<td width="5%">手机号码</td>
		<td width="5%">短信前缀</td>
		<td width="50%">短信内容</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	int row=0;

	for (int i=1;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		jssj=outStr[i][0].trim();
		xxqz=outStr[i][1].trim();
		xxnr=outStr[i][2].trim();
		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td width="2%">
        <input name="xh" size="6" type="type" value="<%=row%>" readonly>
      </td>
	  <td width="5%">
        <input name="jssj" size="13" type="type" value="<%=jssj%>" >
      </td>
	  <td width="5%">
        <input name="xxqz" size="20" type="type" value="<%=xxqz%>" >
      </td>
	  <td width="2%">
        <input name="xxnr" size="50" type="type" value="<%=xxnr%>" title="<%=xxnr%>">
      </td>      
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	return;
}
finally 
{
	try{
		f.close();
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="发送" onClick="f_do(editform)" name="bc">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
