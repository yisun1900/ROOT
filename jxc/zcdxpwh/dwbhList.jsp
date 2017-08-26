<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>主材展厅</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:16"  cellpadding="2" cellspacing="2">
  <tr>
    <td>
      <div align="center">
        <p>子品牌</p>
      </div>
    </td>
  </tr>

<%
String dqbm=request.getParameter("dqbm");
String clxlmc=cf.GB2Uni(cf.getParameter(request,"clxlmc"));
String cldlmc=cf.GB2Uni(cf.getParameter(request,"cldlmc"));

String ppmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select distinct jxc_clbm.ppmc ";
	ls_sql+=" from  jxc_clbm,jxc_cljgb";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.cldlbm='"+cldlmc+"' and jxc_clbm.clxlbm='"+clxlmc+"' and jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
	ls_sql+=" and jxc_cljgb.xsfs='1'";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
	ls_sql+=" order by ppmc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ppmc=cf.fillNull(rs.getString("ppmc"));
%>
  <tr>
    <td align="center" height="30"><A HREF="XhList.jsp?dqbm=<%=dqbm%>&clxlmc=<%=clxlmc%>&ppmc=<%=ppmc%>" ><%=ppmc%></A></td>
  </tr>
<%
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
</table>
</body>
</html>
