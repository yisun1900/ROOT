<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String gysbm=null;
String gysmc=null;
String dqbm=null;
String whereppbm=null;
String wheregysbm=null;
whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	String ssfgs="";
	ls_sql="select ppbm,ppmc,gysbm,gysmc,ssfgs";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqmc ";
	ls_sql+=" from  sq_dwxx,dm_dqbm";
	ls_sql+=" where sq_dwxx.dqbm=dm_dqbm.dqbm and  dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqmc"));
	}
	rs.close();
	ps.close();



}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    子品牌编码
  </td>
  <td width="35%"> 
    <%=ppbm%>
  </td>
  <td align="right" width="15%"> 
    子品牌名称
  </td>
  <td width="35%"> 
    <%=ppmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    供应商编码
  </td>
  <td width="35%"> 
    <%=gysbm%>
  </td>
  <td align="right" width="15%"> 
    供应商名称
  </td>
  <td width="35%"> 
    <%=gysmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    所属地区
  </td>
  <td width="35%"> 
    <%=dqbm%>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
</table>
</body>
</html>
