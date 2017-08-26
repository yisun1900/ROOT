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
        <p>品牌供应商</p>
      </div>
    </td>
  </tr>
<%
String dqbm=request.getParameter("dqbm");
String zcdlbm=cf.GB2Uni(cf.getParameter(request,"zcdlbm"));
String zcxlbm=cf.GB2Uni(cf.getParameter(request,"zcxlbm"));

String dwbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select distinct jc_zcjgb.dwbh ";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where  zcdlbm='"+zcdlbm+"' and zcxlbm='"+zcxlbm+"' and dqbm='"+dqbm+"'";
	ls_sql+=" order by dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
%>
  <tr>
    <td align="center" height="30"><A HREF="XhList.jsp?dqbm=<%=dqbm%>&zcdlbm=<%=zcdlbm%>&dwbh=<%=dwbh%>" ><%=dwbh%></A></td>
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
