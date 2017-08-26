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
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
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

String ssfgs=null;
String bjmb="";
String bjjb=null;
String bjbbh=null;
String xmdlbm=null;
String xmdlmc=null;
String xmxlbm=null;
String xmxlmc=null;
try {
	conn=cf.getConnection();   //得到连接

	sql="select bjjb,bjbbh,ssfgs,bjmb";
	sql+=" from  crm_zxkhxx";
	sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		bjmb=cf.fillNull(rs.getString("bjmb"));
	}
	rs.close();
	ps.close();


	//精装
	String lx="";
	sql="select lx";
	sql+=" from  bdm_bjjbbm";
	sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
	}
	rs.close();
	ps.close();
	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		%>
		zdyxm00= insFld(foldersTree, gFld("精装", ""));
		insDoc(zdyxm00, gLnk(2, "选择主材", "Bj_khzcxmxjCxList.jsp?khbh=<%=khbh%>&bjjb=<%=bjjb%>"));
		<%
	}
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
<form method="post" action="" name="menuform" >
</form>
<br><br>
</body>
</html>
