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
<table width="100%" border="0" style="FONT-SIZE:12"  cellpadding="2" cellspacing="2">
<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String lx=cf.GB2Uni(request.getParameter("lx"));


String ppbm=null;
String fgsbh=null;
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ppbm,fgsbh";
	ls_sql+=" from  jc_zcdd";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from sq_dwxx";
    ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	%>
	  <tr>
		<td align="center">型号<BR>（<%=ppbm%>）</td>
	  </tr>
	<%
		
		String xh="";
		int row=0;
		
		String sxh="";
		String exh="";

		ls_sql=" select xh";
		ls_sql+=" from  jc_zcjgb";
		ls_sql+=" where jc_zcjgb.dwbh='"+ppbm+"' and dqbm='"+dqbm+"'";
		ls_sql+=" group by xh";
		ls_sql+=" order by xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xh=cf.fillNull(rs.getString("xh"));

			row++;

			if (row==1)
			{
				sxh=xh;
			}

			if (row==40)
			{
				exh=xh;

				%>
				  <tr>
					<td height="40"><A target="cpmain" HREF="xhfdcpmainList.jsp?ddbh=<%=ddbh%>&dqbm=<%=dqbm%>&dwbh=<%=java.net.URLEncoder.encode(ppbm,"UTF-8")%>&sxh=<%=java.net.URLEncoder.encode(sxh,"UTF-8")%>&exh=<%=java.net.URLEncoder.encode(exh,"UTF-8")%>" ><%=sxh%>&nbsp;至<BR><%=exh%></A></td>
				  </tr>
				<%

				row=0;
			}
		}
		rs.close();
		ps.close();

		//最后一行
		exh=xh;
		%>
		  <tr>
			<td height="40"><A target="cpmain" HREF="xhfdcpmainList.jsp?ddbh=<%=ddbh%>&dqbm=<%=dqbm%>&dwbh=<%=java.net.URLEncoder.encode(ppbm,"UTF-8")%>&sxh=<%=java.net.URLEncoder.encode(sxh,"UTF-8")%>&exh=<%=java.net.URLEncoder.encode(exh,"UTF-8")%>" ><%=sxh%>&nbsp;至<BR><%=exh%></A></td>
		  </tr>
		<%
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
