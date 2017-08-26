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
String zcdlbm=cf.GB2Uni(cf.getParameter(request,"zcdlbm"));
String zcxlbm=cf.GB2Uni(cf.getParameter(request,"zcxlbm"));
String dwbh=cf.GB2Uni(cf.getParameter(request,"dwbh"));
String dqbm=request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:16"  cellpadding="2" cellspacing="2">
  <tr>
    <td>
      <div align="center">
	  <p>类别/系列（<%=zcdlbm%>，品牌供应商：<%=dwbh%>） </p>
      </div>
    </td>
  </tr>
<%
String zclbbm=null;
int count=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zclbbm,count(*)";
	ls_sql+=" from  jc_zcjgb";
    ls_sql+=" where jc_zcjgb.dwbh='"+dwbh+"' and jc_zcjgb.zcdlbm='"+zcdlbm+"' and dqbm='"+dqbm+"'";
	ls_sql+=" group by zclbbm";
	ls_sql+=" order by zclbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		count=rs.getInt(2);
%>
  <tr>
    <td align="center" height="30"><A HREF="cpList.jsp?dqbm=<%=dqbm%>&zcdlbm=<%=zcdlbm%>&dwbh=<%=dwbh%>&zclbbm=<%=zclbbm%>" ><%=zclbbm%>（有<%=count%>种型号可选择）</A></td>
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
