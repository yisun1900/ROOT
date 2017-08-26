<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cdbh=null;
String cdxh=null;
String cdxsmc=null;
String glurl=null;
String fcdbh=null;
String sfmjcd=null;
String cdsm=null;
String wherecdbh=null;
wherecdbh=cf.GB2Uni(request.getParameter("cdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cdbh,cdxh,cdxsmc,glurl,fcdbh,sfmjcd,cdsm ";
	ls_sql+=" from  sq_cd";
	ls_sql+=" where (1=1) and  (cdbh='"+wherecdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cdbh=cf.fillNull(rs.getString("cdbh"));
		cdxh=cf.fillNull(rs.getString("cdxh"));
		cdxsmc=cf.fillNull(rs.getString("cdxsmc"));
		glurl=cf.fillNull(rs.getString("glurl"));
		fcdbh=cf.fillNull(rs.getString("fcdbh"));
		sfmjcd=cf.fillNull(rs.getString("sfmjcd"));
		cdsm=cf.fillNull(rs.getString("cdsm"));
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 查看信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">菜单编号</div>
  </td>
  <td width="35%"> 
    <%=cdbh%>
  </td>
  <td width="15%"> 
    <div align="right">菜单序号</div>
  </td>
  <td width="35%"> 
    <%=cdxh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">菜单显示名称</div>
  </td>
  <td width="35%"> 
    <%=cdxsmc%>
  </td>
  <td width="15%"> 
    <div align="right">菜单关联URL</div>
  </td>
  <td width="35%"> 
    <%=glurl%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">父菜单编号</div>
  </td>
  <td width="35%"> 
    <%=fcdbh%>
  </td>
  <td width="15%"> 
    <div align="right">是否末级菜单</div>
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "Y+是&N+否",sfmjcd,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">菜单说明</div>
  </td>
  <td width="35%"> 
    <%=cdsm%>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
