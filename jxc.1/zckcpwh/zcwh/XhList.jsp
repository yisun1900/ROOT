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
<%
String cldlbm=cf.GB2Uni(cf.getParameter(request,"cldlbm"));
String clxlbm=cf.GB2Uni(cf.getParameter(request,"clxlbm"));
String ppmc=cf.GB2Uni(cf.getParameter(request,"ppmc"));
String dqbm=request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:16"  cellpadding="2" cellspacing="2">
  <tr>
    <td>
      <div align="center">
	  <p>类别/系列（<%=cldlbm%>，子品牌：<%=ppmc%>） </p>
      </div>
    </td>
  </tr>
<%
String cllbbm=null;
int count=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cllbbm,count(*)";
	ls_sql+=" from  jc_zcjgb";
    ls_sql+=" where jc_zcjgb.ppmc='"+ppmc+"' and jc_zcjgb.cldlbm='"+cldlbm+"' and dqbm='"+dqbm+"'";
	ls_sql+=" group by cllbbm";
	ls_sql+=" order by cllbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cllbbm=cf.fillNull(rs.getString("cllbbm"));
		count=rs.getInt(2);
%>
  <tr>
    <td align="center" height="30"><A HREF="cpList.jsp?dqbm=<%=dqbm%>&cldlbm=<%=cldlbm%>&ppmc=<%=ppmc%>&cllbbm=<%=cllbbm%>" ><%=cllbbm%>（有<%=count%>种型号可选择）</A></td>
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
