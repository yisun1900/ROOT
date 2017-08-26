<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "隶书";
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");
String lx=request.getParameter("lx");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;
String jldwmc=null;
String jgwzmc=null;
double dj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;'  scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="">

  <table border="0" cellspacing="1" cellpadding="1" width="100%" style='FONT-SIZE: 12px' bgcolor="#999999">
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="5%">序号</td>
	<td  width="24%">套餐名称</td>
	<td  width="6%">标准面积</td>
	<td  width="8%">套餐价格</td>
	<td  width="8%">超出平米单价</td>
	<td  width="8%">面积是否可增加</td>
	<td  width="8%">主材是否需选择</td>
	<td  width="7%">选择套餐</td>
	<td  width="8%">明细</td>
	<td  width="6%">录入套餐外项</td>
	<td  width="6%">实际面积</td>
	<td  width="6%">删除</td>
    </tr>

<%
	String bjjb=null;
	String hxbm=null;
	String ssfgs=null;
	ls_sql="SELECT bjjb,hxbm,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		hxbm=rs.getString("hxbm");
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	String tcmc=null;
	int bzmj=0;
	double tcjg=0;
	double pmzjdj=0;
	String mjsfkzj=null;
	String zcsfxxz=null;
	String mjsfkzjmc=null;
	String zcsfxxzmc=null;
	ls_sql="SELECT tcmc,bzmj,tcjg,pmzjdj ";
	ls_sql+=" ,bj_wntcmc.mjsfkzj,DECODE(bj_wntcmc.mjsfkzj,'1','不可增加','2','增加加价') mjsfkzjmc,bj_wntcmc.zcsfxxz,DECODE(bj_wntcmc.zcsfxxz,'1','自动选择','2','人工选择') zcsfxxzmc";
	ls_sql+=" FROM bj_wntcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"'";
    ls_sql+=" and bj_wntcmc.lx='"+lx+"'";//1：温暖套餐；2：静音套餐
    ls_sql+=" order by tcmc";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcmc=rs.getString("tcmc");
		bzmj=rs.getInt("bzmj");
		tcjg=rs.getDouble("tcjg");
		pmzjdj=rs.getDouble("pmzjdj");
		mjsfkzj=rs.getString("mjsfkzj");
		zcsfxxz=rs.getString("zcsfxxz");
		mjsfkzjmc=rs.getString("mjsfkzjmc");
		zcsfxxzmc=rs.getString("zcsfxxzmc");



		String zjlx="";//1：原套餐；3：删除套餐；4：新增套餐
		String khtcmc="";
		int sjmj=0;
		ls_sql="SELECT tcmc,sjmj,zjlx";
		ls_sql+=" FROM bj_khwntcmch";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khtcmc=rs1.getString("tcmc");
			sjmj=rs1.getInt("sjmj");
			zjlx=cf.fillNull(rs1.getString("zjlx"));
		}
		rs1.close();
		ps1.close();

		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//输出每行数据
		if (zjlx.equals("3"))
		{
			%> 
			<tr bgcolor="<%=bgcolor%>" align="center"> 
				<td><%=(row+1)%></td>
				<td><A HREF="ViewBj_wntczcmx.jsp?dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=tcmc%>" target="_blank"><%=tcmc%></A></td>
				<td><%=bzmj%></td>
				<td><%=tcjg%></td>
				<td><%=pmzjdj%></td>
				<td><%=mjsfkzjmc%></td>
				<td><%=zcsfxxzmc%></td>
				<td>&nbsp;</td>
				<td colspan="2">被删除</td>
				<td><%=sjmj%></td>
				<td><A HREF="HyDeleteBj_khwntcmc.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&tcmc=<%=tcmc%>&lx=<%=lx%>" >还原</A></td>
			</tr>
			<%
		}
		else if (!zjlx.equals(""))
		{
			%> 
			<tr bgcolor="<%=bgcolor%>" align="center"> 
				<td><%=(row+1)%></td>
				<td><A HREF="ViewBj_wntczcmx.jsp?dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=tcmc%>" target="_blank"><%=tcmc%></A></td>
				<td><%=bzmj%></td>
				<td><%=tcjg%></td>
				<td><%=pmzjdj%></td>
				<td><%=mjsfkzjmc%></td>
				<td><%=zcsfxxzmc%></td>
				<td>&nbsp;</td>
				<%
				if (zcsfxxz.equals("1"))//1：自动选择；2：人工选择
				{
					%>
					<td>自动选择</td>
					<%
				}
				else{
					%>
					<td><A HREF="Bj_wntczcmxList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=java.net.URLEncoder.encode(tcmc,"UTF-8")%>&lx=<%=lx%>" target="_blank">选择明细</A></td>
					<%
				}
				%>
				<td><A HREF="InsertBj_wntczcmx.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&hxbm=<%=hxbm%>&dqbm=<%=dqbm%>&tcmc=<%=tcmc%>&lx=<%=lx%>" target="_blank">录入</A></td>
				<td><%=sjmj%></td>
				<td><A HREF="DeleteBj_khwntcmc.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&tcmc=<%=tcmc%>&lx=<%=lx%>" >删除</A></td>
			</tr>
			<%
		}
		else{
			%> 
			<tr bgcolor="<%=bgcolor%>" align="center"> 
				<td><%=(row+1)%></td>
				<td><A HREF="ViewBj_wntczcmx.jsp?dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=tcmc%>" target="_blank"><%=tcmc%></A></td>
				<td><%=bzmj%></td>
				<td><%=tcjg%></td>
				<td><%=pmzjdj%></td>
				<td><%=mjsfkzjmc%></td>
				<td><%=zcsfxxzmc%></td>
				<td><A HREF="InsertBj_khwntcmc.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=tcmc%>&lx=<%=lx%>" >选择</A></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<%
		}

		row++;
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

parent.parent.guol.editform.fjlr.disabled=false;

//-->
</script>

