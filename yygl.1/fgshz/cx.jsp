<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>日期选择</title>
</head>

<body > 
<form name="cx" action="Yy_lrList.jsp" method="post">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="1">
<tr>
<td colspan="4">&nbsp;</td></tr>
<tr>
<td colspan="4">&nbsp;</td></tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" colspan="4"> 
    <div align="center">时间选择</div>
  </td>

<tr bgcolor="#FFFFFF">
<%
String yy_rqsd_bzs=null;
String yy_rqsd_bze=null;
int i=0;
int j=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql=" select distinct yy_rqsd_bzs,count(*) j";
	ls_sql+=" from yy_rqsd";
	ls_sql+=" group by yy_rqsd_bzs";
	ps=conn.prepareStatement(ls_sql);
    rs=ps.executeQuery(ls_sql);
	while(rs.next())
	{
	j=rs.getInt("j");
	}
	rs.close();
	ps.close();
	
%>
<td align="center">本周日期开始时间</td>
<td align="center">
<select name="ks" style="FONT-SIZE:12PX;WIDTH:152PX">
<option></option>
<%
	for( i=0;i<j;i++)
	{
	ls_sql=" select yy_rqsd_bzs,yy_rqsd_bze";
	ls_sql+=" from yy_rqsd";
	ps=conn.prepareStatement(ls_sql);
    rs=ps.executeQuery(ls_sql);
	while(rs.next())
	{
	yy_rqsd_bzs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
	yy_rqsd_bze=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	
	%>
	
	<option value="<%=yy_rqsd_bzs%>"><%=yy_rqsd_bzs%></option>
	<%
	}
	rs.close();
	ps.close();
	}
%>
</select></td>
<td align="center">本周日期结束时间</td>
<td align="center">
<select name="js" style="FONT-SIZE:12PX;WIDTH:152PX">
<option></option>
<%
	for( i=0;i<j;i++)
	{
	ls_sql=" select yy_rqsd_bzs,yy_rqsd_bze";
	ls_sql+=" from yy_rqsd";
	ps=conn.prepareStatement(ls_sql);
    rs=ps.executeQuery(ls_sql);
	while(rs.next())
	{
	yy_rqsd_bzs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
	yy_rqsd_bze=cf.fillNull(rs.getDate("yy_rqsd_bze"));	
	
	%>
	<option value="<%=yy_rqsd_bze%>"><%=yy_rqsd_bze%></option>
	<%
	}
	rs.close();
	ps.close();
%>
</select></td>


</tr>
<tr>
<td colspan="4">&nbsp;</td></tr>
<tr>
<td colspan="4">&nbsp;</td></tr>
<tr>
<td colspan="2" bgcolor="#FFFFFF" align="right"><input type="button" onClick="dos(cx)" value="查询"></td>
<td colspan="2" bgcolor="#FFFFFF" align="right">&nbsp;</td></tr>
<%
}
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
</table>
</form>
<script language="javascript">
function dos(FormName)
{
FormName.submit;
return true;
}
</script>
</body>
</html>
