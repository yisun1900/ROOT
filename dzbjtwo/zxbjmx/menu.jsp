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
String bjjb=null;
String bjbbh=null;
String xmdlbm=null;
String xmdlmc=null;
String xmxlbm=null;
String xmxlmc=null;
try {
	conn=cf.getConnection();   //得到连接

	sql="select bjjb,bjbbh,ssfgs";
	sql+=" from  crm_zxkhxx";
	sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();


	//电子报价版本是否已停用
	int bjtyMark=0;
	sql="select count(*)";
	sql+=" from  bj_dzbjbb";
	sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and sfzybb='4'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjtyMark=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (bjtyMark>0)//已停用，从表[bj_jzbjb1]取数据而非表[bj_jzbjb]
	{
		sql="select distinct bj_jzbjb1.xmdlbm,xmdlmc";
		sql+=" from bdm_xmdlbm,bj_jzbjb1";
		sql+=" where bdm_xmdlbm.xmdlbm=bj_jzbjb1.xmdlbm and bj_jzbjb1.dqbm='"+dqbm+"' and bj_jzbjb1.bjjbbm='"+bjjb+"' and bj_jzbjb1.bjbbh='"+bjbbh+"'";
		sql+=" and bj_jzbjb1.sfbxx!='9'";//1：必报项；2：必列项；3：可选项；9：作废项
		sql+=" group by bj_jzbjb1.xmdlbm,xmdlmc";
		sql+=" order by bj_jzbjb1.xmdlbm";
	}
	else{
		sql="select distinct bj_jzbjb.xmdlbm,xmdlmc";
		sql+=" from bdm_xmdlbm,bj_jzbjb";
		sql+=" where bdm_xmdlbm.xmdlbm=bj_jzbjb.xmdlbm and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
		sql+=" and bj_jzbjb.sfbxx!='9'";//1：必报项；2：必列项；3：可选项；9：作废项
		sql+=" group by bj_jzbjb.xmdlbm,xmdlmc";
		sql+=" order by bj_jzbjb.xmdlbm";
	}
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		xmdlbm=rs.getString("xmdlbm");
		xmdlmc=rs.getString("xmdlmc");
%>
		cdbh<%=xmdlbm%>= insFld(foldersTree, gFld("<%=xmdlmc%>", ""));
<%
		if (bjtyMark>0)//已停用，从表[bj_jzbjb1]取数据而非表[bj_jzbjb]
		{
			sql="select distinct bj_jzbjb1.xmxlbm,xmxlmc";
			sql+=" from bdm_xmxlbm,bj_jzbjb1";
			sql+=" where bdm_xmxlbm.xmxlbm=bj_jzbjb1.xmxlbm and bj_jzbjb1.xmdlbm='"+xmdlbm+"' and bj_jzbjb1.dqbm='"+dqbm+"' and bj_jzbjb1.bjjbbm='"+bjjb+"' and bj_jzbjb1.bjbbh='"+bjbbh+"'";
			sql+=" and bj_jzbjb1.sfbxx!='9'";//1：必报项；2：必列项；3：可选项；9：作废项
			sql+=" group by bj_jzbjb1.xmxlbm,xmxlmc";
			sql+=" order by bj_jzbjb1.xmxlbm";
		}
		else{
			sql="select distinct bj_jzbjb.xmxlbm,xmxlmc";
			sql+=" from bdm_xmxlbm,bj_jzbjb";
			sql+=" where bdm_xmxlbm.xmxlbm=bj_jzbjb.xmxlbm and bj_jzbjb.xmdlbm='"+xmdlbm+"' and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
			sql+=" and bj_jzbjb.sfbxx!='9'";//1：必报项；2：必列项；3：可选项；9：作废项
			sql+=" group by bj_jzbjb.xmxlbm,xmxlmc";
			sql+=" order by bj_jzbjb.xmxlbm";
		}

		ps1=conn.prepareStatement(sql);
		rs1=ps1.executeQuery();
		while (rs1.next())
		{
			xmxlbm=rs1.getString("xmxlbm");
			xmxlmc=rs1.getString("xmxlmc");
%>
			insDoc(cdbh<%=xmdlbm%>, gLnk(2, "<%=xmxlmc%>", "Bj_jzbjbCxList.jsp?jzbz=<%=jzbz%>&dqbm=<%=dqbm%>&khbh=<%=khbh%>&xmdlbm=<%=xmdlbm%>&xmxlbm=<%=xmxlbm%>"));
<%
		}
		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();

	//自定义项目
	String zdyxmshbz="";
	sql="select zdyxmshbz";
	sql+=" from sq_dwxx";
	sql+=" where dwbh='"+ssfgs+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		zdyxmshbz=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	int zdyCount=0;
	sql="select count(*)";
	sql+=" from bj_zdyxmb";
	sql+=" where lrr='"+yhdlm+"' and bjjbbm='"+bjjb+"' and zdyxmyxq>SYSDATE-1";
	if (zdyxmshbz.equals("Y"))
	{
		sql+=" and shbz='Y'";
	}
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		zdyCount=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (zdyCount>0)
	{
		%>
		zdyxm00= insFld(foldersTree, gFld("自定义项目", ""));
		insDoc(zdyxm00, gLnk(2, "选择项目", "Bj_jzbjb1CxList.jsp?khbh=<%=khbh%>&zdyxmshbz=<%=zdyxmshbz%>&bjjb=<%=bjjb%>"));
		<%
	}

	//套餐
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
		zdyxm00= insFld(foldersTree, gFld("套餐", ""));
		insDoc(zdyxm00, gLnk(2, "选择主材项目", "Bj_khzcxmxjCxList.jsp?khbh=<%=khbh%>&bjjb=<%=bjjb%>"));
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
