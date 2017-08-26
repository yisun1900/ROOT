<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>优铂利家装管理信息系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK HREF='/js/menu.css' REL='stylesheet' TYPE='text/css'>
</head>
<%
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String bjjb=request.getParameter("bjjb");
String jzbz=request.getParameter("jzbz");
%>
<BODY CLASS='nav' TEXT="#333333" LINK="#003399" VLINK="#003399" ALINK="#cc9900" LEFTMARGIN=3 TOPMARGIN=5 oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<SCRIPT SRC="/js/menu.js"></SCRIPT>
<SCRIPT SRC="/js/menu_functions.js"></SCRIPT>

<script>

		foldersTree = gFld("<B>选择报价项目</B>", '');

<%

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String sql=null;

String xmdlbm=null;
String xmdlmc=null;
String xmxlbm=null;
String xmxlmc=null;
try {
	conn=cf.getConnection();   //得到连接
	sql="select xmdlbm,xmdlmc";
	sql+=" from bdm_xmdlbm";
	sql+=" order by xmdlbm";
//	out.println(sql);
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		xmdlbm=rs.getString("xmdlbm");
		xmdlmc=rs.getString("xmdlmc");
%>
		cdbh<%=xmdlbm%>= insFld(foldersTree, gFld("<%=xmdlmc%>", ""));
<%
		sql="select xmxlbm,xmxlmc";
		sql+=" from bdm_xmxlbm";
		sql+=" where xmdlbm='"+xmdlbm+"'";
		sql+=" order by xmxlbm";
		ps1=conn.prepareStatement(sql);
		rs1=ps1.executeQuery();
		while (rs1.next())
		{
			xmxlbm=rs1.getString("xmxlbm");
			xmxlmc=rs1.getString("xmxlmc");
%>
			insDoc(cdbh<%=xmdlbm%>, gLnk(2, "<%=xmxlmc%>", "Bj_jzbjbCxList.jsp?jzbz=<%=jzbz%>&bjjb=<%=bjjb%>&dqbm=<%=dqbm%>&khbh=<%=khbh%>&xmdlbm=<%=xmdlbm%>&xmxlbm=<%=xmxlbm%>"));
<%
		}
		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();
}
catch(Exception e){
	out.println("Exception:"+e.getMessage());
	return;
}
finally{
	if (rs!=null) rs.close();
	if (ps!=null) ps.close();
	if (rs1!=null) rs1.close();
	if (ps1!=null) ps1.close();
	if (conn != null) cf.close(conn); 
}
%>			
	initializeDocument()
</SCRIPT>

<br><br>
</body>
</html>
