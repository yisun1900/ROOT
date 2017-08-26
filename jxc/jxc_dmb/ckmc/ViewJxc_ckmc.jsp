<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ckbh=null;
String ckmc=null;
String dqbm=null;
String cksslx=null;
String whereckbh=null;
whereckbh=cf.GB2Uni(request.getParameter("ckbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select ckbh,ckmc,dqmc dqbm,DECODE(cksslx,'1','分公司仓库','0','总部仓库') cksslx ";
	ls_sql+=" from  jxc_ckmc,dm_dqbm";
	ls_sql+=" where jxc_ckmc.dqbm=dm_dqbm.dqbm and  (ckbh='"+whereckbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckbh=cf.fillNull(rs.getString("ckbh"));
		ckmc=cf.fillNull(rs.getString("ckmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		cksslx=cf.fillNull(rs.getString("cksslx"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    仓库编号
  </td>
  <td width="35%"> 
    <%=ckbh%>
  </td>
  <td align="right" width="15%"> 
    仓库名称
  </td>
  <td width="35%"> 
    <%=ckmc%>
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
   仓库类型
  </td>
  <td width="35%"> 
<%=cksslx%>
  </td>
</tr>
</table>
</body>
</html>
