<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hwbh=null;
String hwmc=null;
String hjmc=null;
String ckmc=null;
String dqmc=null;
String wherehwbh=null;
wherehwbh=cf.GB2Uni(request.getParameter("hwbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select hwbh,hwmc,hjmc,ckmc,dqmc ";
	ls_sql+=" from  jxc_hwmc,jxc_hjmc,jxc_ckmc,dm_dqbm";
	ls_sql+=" where jxc_hwmc.hjbh=jxc_hjmc.hjbh and jxc_hjmc.ckbh=jxc_ckmc.ckbh and jxc_ckmc.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and  (hwbh='"+wherehwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hwbh=cf.fillNull(rs.getString("hwbh"));
		hwmc=cf.fillNull(rs.getString("hwmc"));
		hjmc=cf.fillNull(rs.getString("hjmc"));
		ckmc=cf.fillNull(rs.getString("ckmc"));
		dqmc=cf.fillNull(rs.getString("dqmc"));
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
  <td align="right" width="15%">所属地区</td>
  <td width="35%"> 
    <%=dqmc%>  </td>
  <td align="right" width="15%"> 
    所属仓库  </td>
  <td width="35%"> 
    <%=ckmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    所属货架</td>
  <td width="35%"> 
    <%=hjmc%>  </td>
  <td align="right" width="15%"> 
    货位编码  </td>
  <td width="35%"> 
    <%=hwbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    货位名称  </td>
  <td colspan="3"> 
    <%=hwmc%>    </td>
  </tr>
</table>
</body>
</html>
