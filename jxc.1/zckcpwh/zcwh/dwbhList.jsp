<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>主材展厅</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
String cldlbm=cf.GB2Uni(cf.getParameter(request,"cldlbm"));
String clxlbm=cf.GB2Uni(cf.getParameter(request,"clxlbm"));

String ppmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select distinct jc_zcjgb.ppmc ";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where  cldlbm='"+cldlbm+"' and clxlbm='"+clxlbm+"' and dqbm='"+dqbm+"'";
	ls_sql+=" order by ppmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ppmc=cf.fillNull(rs.getString("ppmc"));
%>
  <tr>
    <td align="center" height="30"><A HREF="XhList.jsp?dqbm=<%=dqbm%>&cldlbm=<%=cldlbm%>&ppmc=<%=ppmc%>" ><%=ppmc%></A></td>
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
