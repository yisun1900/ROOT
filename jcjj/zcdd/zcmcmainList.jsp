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
String curPageStr=cf.GB2Uni(request.getParameter("curPage"));


String ppbm=null;
String fgsbh=null;
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int pageRow=100;

try {
	conn=cf.getConnection();

	int curPage=0;
	curPage=Integer.parseInt(curPageStr.trim());

	int priPage=curPage-1;
	int nextPage=curPage+1;

	int start=pageRow*priPage+1;
	int end=pageRow*curPage;

	int zsl=0;
	ls_sql=" select count(distinct zcmc)";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where jc_zcjgb.dwbh='"+ppbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	double maxPage=zsl/pageRow;

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
		<td align="center">主材名称  
			<%
			if (priPage>0)
			{
				%>
				&nbsp;&nbsp;<A HREF="zcmcmainList.jsp?ddbh=<%=ddbh%>&curPage=<%=priPage%>"><B>上页</B></A>  
				<%
			}
			if (nextPage<=maxPage)
			{
				%>
				&nbsp;&nbsp;<A HREF="zcmcmainList.jsp?ddbh=<%=ddbh%>&curPage=<%=nextPage%>"><B>下页</B></A>
				<%
			}
			%>
			<BR>（<%=ppbm%>）
		</td>
	  </tr>
	<%
		
		String zcmc=null;
		int sl=0;
		int count=0;

		
		ls_sql=" select zcmc,count(*) sl";
		ls_sql+=" from  jc_zcjgb";
		ls_sql+=" where jc_zcjgb.dwbh='"+ppbm+"' and dqbm='"+dqbm+"'";
		ls_sql+=" group by zcmc";
		ls_sql+=" order by zcmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			count++;

			if (count<start){
				continue;
			}
			else if (count>end){
				break;
			}

			zcmc=cf.fillNull(rs.getString("zcmc"));
			sl=rs.getInt(2);
	%>
	  <tr>
		<td align="center" height="20"><A target="cpmain" HREF="zcmccpmainList.jsp?ddbh=<%=ddbh%>&dqbm=<%=dqbm%>&dwbh=<%=java.net.URLEncoder.encode(ppbm,"UTF-8")%>&zcmc=<%=java.net.URLEncoder.encode(zcmc,"UTF-8")%>" ><%=zcmc%>（<%=sl%>种）</A></td>
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
