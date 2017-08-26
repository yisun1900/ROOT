<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String fgs=request.getParameter("fgs");
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String wheresql="";
String wheresql1="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (ssfgs='"+fgs+"')";
}
else {
	out.print("请选择分公司！");
	return;
}

wheresql1+=" and crm_khxx.jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql1+=" and crm_khxx.jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String dwmc=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=rs.getString(1);
	}
	rs.close();
	ps.close();

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>（<%=dwmc%>）处罚统计表</B><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="9%">序号</td>
  <td  width="13%">姓名</td>
  <td  width="13%">职务</td>
  <td  width="13%">事由</td>
  <td  width="13%">处罚类型</td>
  <td  width="13%">罚款额度</td>
  <td  width="13%">日期</td>
  <td  width="13%">缴纳罚款日期</td>
</tr>
<%
	int row=0;
	String yhmc=null;
	String xzzwbm=null;
	String jfsy=null;
	String jflxbm=null;
	double jfje=0;
	String jfrq=null;
	String jfzfrq=null;

	ls_sql="SELECT yhmc,xzzwbm,jfsy,dm_jflxbm.jflxmc jflxbm,jfje,jfrq,jfzfrq";
	ls_sql+=" FROM rs_jfjl,dm_jflxbm";
	ls_sql+=" where rs_jfjl.jflxbm=dm_jflxbm.jflxbm and rs_jfjl.lx='1' ";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yhmc=rs.getString("yhmc");
		xzzwbm=rs.getString("xzzwbm");
		jfsy=rs.getString("jfsy");
		jflxbm=rs.getString("jflxbm");
		jfje=rs.getDouble("jfje");
		jfrq=cf.fillHtml(rs.getDate("jfrq"));
		jfzfrq=cf.fillHtml(rs.getDate("jfzfrq"));
		row++;

		%>
		<tr align="center">
			<td ><%=row%></td>
			<td ><%=yhmc%></td>
			<td ><%=xzzwbm%></td>
			<td  align="right"><%=jfsy%></td>
			<td  align="right"><%=jflxbm%></td>
			<td  align="right"><%=cf.formatDouble((long)jfje)%></td>
			<td  align="right"><%=jfrq%></td>
			<td  align="right"><%=jfzfrq%></td>		
		</tr>

		<%	
	}
	rs.close();
	ps.close();
%>
</table>
<br>
<CENTER>
<div><B>（<%=dwmc%>）奖励统计表</B><BR></div>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="9%">序号</td>
  <td  width="13%">姓名</td>
  <td  width="13%">职务</td>
  <td  width="13%">事由</td>
  <td  width="13%">奖励类型</td>
  <td  width="13%">奖励额度</td>
  <td  width="13%">日期</td>
  <td  width="13%">支出奖金日期</td>
</tr>
<%
	row=0;
//	String yhmc=null;
//	String xzzwbm=null;
//	String jfsy=null;
//	String jflxbm=null;
//	double jfje=0;
//	String jfrq=null;
//	String jfzfrq=null;

	ls_sql="SELECT yhmc,xzzwbm,jfsy,dm_jflxbm.jflxmc jflxbm,jfje,jfrq,jfzfrq";
	ls_sql+=" FROM rs_jfjl,dm_jflxbm";
	ls_sql+=" where rs_jfjl.jflxbm=dm_jflxbm.jflxbm and rs_jfjl.lx='2' ";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yhmc=rs.getString("yhmc");
		xzzwbm=rs.getString("xzzwbm");
		jfsy=rs.getString("jfsy");
		jflxbm=rs.getString("jflxbm");
		jfje=rs.getDouble("jfje");
		jfrq=cf.fillHtml(rs.getDate("jfrq"));
		jfzfrq=cf.fillHtml(rs.getDate("jfzfrq"));
		row++;

		%>
		<tr align="center">
			<td ><%=row%></td>
			<td ><%=yhmc%></td>
			<td ><%=xzzwbm%></td>
			<td  align="right"><%=jfsy%></td>
			<td  align="right"><%=jflxbm%></td>
			<td  align="right"><%=cf.formatDouble((long)jfje)%></td>
			<td  align="right"><%=jfrq%></td>
			<td  align="right"><%=jfzfrq%></td>		
		</tr>

		<%	
	}
	rs.close();
	ps.close();
%>
</table>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>
