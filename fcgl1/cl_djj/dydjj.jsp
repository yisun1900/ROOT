<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String czxh=request.getParameter("czxh");
String ckmc=null;
int sl=0;

try {
	conn=cf.getConnection();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<div align="center"><font size="5"><b>选择仓库打印</b></font> 
  <table border="1" cellspacing="0" cellpadding="1" width="50%" style='FONT-SIZE: 15px' >
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="18%" height="26">仓库名称</td>
      <td  width="8%" height="26">数量</td>
    </tr>
    <%
	ls_sql="SELECT ckmc,count(*)";
	ls_sql+=" FROM cl_djjmx ";
	ls_sql+=" where czxh='"+czxh+"' ";
	ls_sql+=" group by ckmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ckmc=cf.fillNull(rs.getString("ckmc"));
		sl=rs.getInt(2);
%> 
    <tr > 
      <td  height="25"> 
        <div align="center"><A HREF="dydjj1.jsp?czxh=<%=czxh%>&ckmc=<%=ckmc%>" target="_blank"><%=ckmc%></A></div>
      </td>
      <td  height="25"> 
        <div align="center"><%=sl%></div>
      </td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
    <tr align="center" > 
      <td  height="58" colspan="2"> 
        <input type="button" name="Button" value="打印完成" onclick="window.open('MarkDy.jsp?czxh=<%=czxh%>')">
      </td>
    </tr>
  </table>
</div>
</body>

</html>
</script>

