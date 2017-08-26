<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");


String dbph=cf.GB2Uni(request.getParameter("dbph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String gsmc="";

String dcgs="";
String drgs="";
double dbzsl=0;
double dbzje=0;
String dbyy="";
String lrr="";
String lrsj="";
String bz="";

double xjdbsl=0;
double xjdbje=0;

try {
	conn=cf.getConnection();

	ls_sql="select a.dwmc dcgs,b.dwmc drgs,dbzsl,dbzje,DECODE(dbyy,'0','���ŵ���','1','�˻�����') dbyy,jxc_db.lrr,jxc_db.lrsj,jxc_db.bz ";
	ls_sql+=" from jxc_db,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where jxc_db.dbph='"+dbph+"'";
	ls_sql+=" and jxc_db.dcgs=a.dwbh(+) ";
	ls_sql+=" and jxc_db.drgs=b.dwbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dcgs=cf.fillNull(rs.getString("dcgs"));
		drgs=cf.fillNull(rs.getString("drgs"));
		dbzsl=rs.getDouble("dbzsl");
		dbzje=rs.getDouble("dbzje");

		dbyy=cf.fillNull(rs.getString("dbyy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select csz";
	ls_sql+=" from sq_xtcsb ";
	ls_sql+=" where csbm='gsmc'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gsmc=cf.fillNull(rs.getString("csz"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>���ϳ��ⵥ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><strong><font size="5"><%=gsmc%>����������</font></strong></div>
<BR>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td width="31%" height="26"><strong>��������</strong>��<%=dbph%></td>
  <td width="31%"><strong>����ԭ��</strong>��<%=dbyy%></td>
  <td width="38%"><strong>�� �� ��</strong>��<%=lrr%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td height="26"><strong>������˾</strong>��<%=dcgs%></td>
  <td><strong>���빫˾</strong>��<%=drgs%></td>
  <td><strong>��������</strong>��<%=lrsj%></td>
  </tr>
</table>


<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF" align="center">
	<td width="4%"><b>���</b></td>
	<td width="10%"><b>�ڲ�����</b></td>
	<td width="20%"><b>��������</b></td>
	<td width="15%"><b>���Ϲ��</b></td>
	<td width="6%"><b>��λ</b></td>
	<td width="7%"><b>����</b></td>
	<td width="8%"><b>����</b></td>
	<td width="9%"><b>���</b></td>
	<td width="21%"><b>��ע</b></td>
</tr>
<%
	String nbbm=null;
	String clmc=null;
	String gg=null;
	String jldwbm=null;
	double dbdj=0;
	double dbsl=0;
	double dbje=0;

	int row=0;

	ls_sql="select nbbm,clmc,gg,jldwbm,dbdj,dbsl,dbje ";
	ls_sql+=" from jxc_dbmx ";
	ls_sql+=" where dbph='"+dbph+"'";
	ls_sql+=" order by dbxh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;

		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dbdj=rs.getDouble("dbdj");
		dbsl=rs.getDouble("dbsl");
		dbje=rs.getDouble("dbje");

		xjdbsl+=dbsl;
		xjdbje+=dbje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=row%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=dbdj%></td>
			<td><%=dbsl%></td>
			<td><%=dbje%></td>
			<td>&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<tr bgcolor="#FFFFFF" align="center">
	<td colspan="5">�ϼ�</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(xjdbsl) %></td>
	<td><%=cf.formatDouble(xjdbje) %></td>
	<td>&nbsp;</td>
</tr>

		
</table>


<table width="100%" border="0">
<tr>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;��<%=yhmc%></b></font></td>
  </tr>
  
  <tr>
    <td colspan="2"><font size="-1"><b>��ע��</b></font><%=bz%></td>
	<td colspan="2" align="right"><font size="-1"><b>��ӡ���ڣ�<%=cf.today("YYYY-MM-DD")%></b></font></td>
  </tr>
</table>

</body>
</html>


