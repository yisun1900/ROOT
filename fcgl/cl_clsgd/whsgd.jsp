<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<CENTER >
  <B><font size="3">材料申购单</font></B>
</CENTER>

<table width="100%" bgcolor="#000000"  style='FONT-SIZE: 12px' border="1" cellspacing="1">
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="4%">&nbsp;</td>
    <td width="4%">&nbsp;</td>
	<td width="4%">&nbsp;</td>
	<td width="4%">&nbsp;</td>
    <td width="10%">申购批号</td>
    <td width="8%">申购单位</td>
    <td width="6%">申购总数量</td>
    <td width="6%">录入人</td>
    <td width="7%">录入时间</td>
    <td width="20%">备注</td>
  </tr>
  <%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh2=(String)session.getAttribute("dwbh");
String sgph=null;
String dwbh=null;
String sgzsl=null;
java.sql.Date lrsj=null;
String bz=null;
String lrr=null;
try {
	conn=cf.getConnection();
	ls_sql="SELECT cl_clsgd.sgph,dwmc,cl_clsgd.sgzsl,cl_clsgd.lrr,cl_clsgd.lrsj,cl_clsgd.bz  ";
	ls_sql+=" FROM cl_clsgd,sq_dwxx ";
    ls_sql+=" where cl_clsgd.dwbh=sq_dwxx.dwbh(+) and sgzt='1' and cl_clsgd.dwbh='"+dwbh2+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;  
	while (rs.next())
	{
		count++;
		sgph=cf.fillNull(rs.getString("sgph"));
		dwbh=cf.fillNull(rs.getString("dwmc"));
		sgzsl=cf.fillNull(rs.getString("sgzsl"));
		lrsj=rs.getDate("lrsj");
		lrr=cf.fillNull(rs.getString("lrr"));
		bz=cf.fillNull(rs.getString("bz"));
%> 
  <tr bgcolor="#FFFFFF" align="center"> 
    <td><A HREF="tjdgd.jsp?sgph=<%=sgph%>" target="_back">提交</A></td>
	<td><A HREF="SelectCxCl_clbm.jsp?sgph=<%=sgph%>" target="_back">继续</A></td>
    <td><A HREF="Editdgd.jsp?sgph=<%=sgph%>"  target="_back">修改</A></td>
	<td><A HREF="Deldgd.jsp?sgph=<%=sgph%>"  onclick="return confirm('您确定要删除此批号么？')" target="_back">删除</A></td>
    <td><%=sgph%></td>
    <td><%=dwbh%></td>
    <td><%=sgzsl%></td>
    <td><%=lrr%></td>
    <td><%=lrsj%></td>
	<td><%=bz%></td>
  </tr>
  <%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
</table>
</body>
</html>
