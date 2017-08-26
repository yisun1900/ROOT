<%@ page contentType="text/html;charset=GBK" %>	
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String pdph=null;
pdph=cf.GB2Uni(request.getParameter("pdph"));
int ydrsj=0;
String xsnr="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select count(*) ";
	ls_sql+=" from  jxc_kcpdmx";
	ls_sql+=" where  (pdph="+pdph+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ydrsj=rs.getInt(1);
	}
	if (ydrsj>0)
	{
		xsnr="<font color=red>批号：["+pdph+"]已经导入了"+ydrsj+"条数据！！！<a href=\"ViewJxc_kcpdjl.jsp?pdph="+pdph+"\" target=\"_back\">点击查看</a></font>";
	}
	else
	{
		xsnr="批号：["+pdph+"]还没有导入数据，<a href=\"dckcexcel.jsp?pdph="+pdph+"\" target=\"_back\">点击这里下载库存盘点表</a>";
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<html>
<head>
<title>库存盘点</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<CENTER>
  <B>库存盘点</B><BR>
  <div align="center">
<a href="#" onClick="window.open('/jxc/bz/exceluninsert.jsp','center','width=400,height=350,top=300,left=350');" title="为何我的入库仓库不能显示？"><font size="-1"><b>帮助</b></font></a> 
</div>
  <HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
	<tr align="center"> 
        <td colspan="2" height="52"><b><%=xsnr%></b></td>
		<input type="hidden" name="pdph" value="<%=pdph%>">
      </tr>
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择EXECEL文件</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
          <input type="button"  value="继续" onClick="f_onclick(loadform)">
        </td>
	  </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	FormName.action="ckexcel.jsp";

	FormName.submit();
	return true;
} 
//-->
</script>