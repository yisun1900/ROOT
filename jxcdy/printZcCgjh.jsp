<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String cgjhmc="";
String dwmc="";
String lrr="";
String lrsj="";
String cgsqr="";

String cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select cgjhmc,dwmc,lrr,lrsj,cgsqr";
	ls_sql+=" from  jxc_clcgjh,sq_dwxx ";
	ls_sql+=" where jxc_clcgjh.ssfgs=sq_dwxx.dwbh(+) ";
	ls_sql+=" and cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgjhmc=cf.fillNull(rs.getString("cgjhmc"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		cgsqr=cf.fillNull(rs.getString("cgsqr"));
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

<html>
<head>
<title>�ɹ��ƻ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td width="34%" height="32"><span lang=EN-US><img src="tubiao1.jpg" v:shapes="_x0000_i1025" width="200"></span></td>
  <td width="33%" height="32" align="center"><font size="+2"><b>�ɹ��ƻ�</b></font></td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="32" colspan="2">�ɹ��ƻ����ƣ�<u><%=cgjhmc%></u></td>
  <td>�ֹ�˾��<u><%=dwmc%></u></td>
</tr>
<tr bgcolor="#FFFFFF"  height="32">
  <td>�ɹ��ƻ����ţ�<u><%=cgjhph%></u></td>
  <td>¼���ˣ�<u><%=lrr%></u></td>
  <td>¼��ʱ�䣺<u><%=lrsj%></u></u></td>
</tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="0">


<tr bgcolor="#FFFFFF" align="center">
	<td  width="4%">���</td>
	<td  width="9%">���ϱ���</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="11%">��Ʒ�ͺ�</td>
	<td  width="10%">���ߴ�</td>
	<td  width="19%">��Ӧ��</td>
	<td  width="7%">���ۣ�Ԫ��</td>
	<td  width="5%">������λ</td>
	<td  width="6%">�ƻ��ɹ�����</td>
	<td  width="9%">��Ԫ��</td>
	<td  width="8%">��ע</td>
</tr>
<%
int jhxh=0;
int i=0;
String clbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwmc=null;
String gysmc=null;
double jhcgdj=0;
double jhcgsl=0;
double jhcgje=0;
double sumjhcgdj=0;
double sumjhcgsl=0;
double sumsjjhcgsl=0;
double sumckje=0;
try {
	conn=cf.getConnection();
	ls_sql="select jhxh,jxc_cgjhmx.clbm,clmc,xh,gg,jldwbm,gysmc,jhcgdj,jhcgsl,jhcgje";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where cgjhph='"+cgjhph+"'";
	ls_sql+=" order by jhxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		jhxh=rs.getInt("jhxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldwmc=cf.fillNull(rs.getString("jldwbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		jhcgdj=rs.getDouble("jhcgdj");
		jhcgsl=rs.getDouble("jhcgsl");
		jhcgje=rs.getDouble("jhcgje");

		sumjhcgdj+=jhcgdj;
		sumjhcgsl+=jhcgsl;
		sumckje+=jhcgje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
		<td ><%=jhxh%></td>
		<td ><%=clbm%></td>
		<td ><%=clmc%></td>
		<td ><%=xh%></td>
		<td ><%=gg%></td>
		<td ><%=gysmc%></td>
		<td ><%=jhcgdj%></td>
		<td ><%=jldwmc%></td>
		<td ><%=jhcgsl%></td>
		<td ><%=jhcgje%></td>
		<td >&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
		<tr bgcolor="#FFFFFF" align="center">
		<td height="30"  colspan="9" align="left">���ϼƣ�����ң���<%=cf.NumToRMBStr(sumckje)%></td>

		<td align="center" ><%=cf.formatDouble(sumckje)%></td>
		<td  align="center">&nbsp;</td>
		</tr>
		
		<%
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

		<tr bgcolor="#FFFFFF" height="27">
		<td colspan="4" ><font size="-1">�µ�\ʱ�䣺 </font></td>
		<td colspan="3" ><font size="-1">����\ʱ�䣺</font></td>
		<td colspan="4" >&nbsp;</td>
		</tr>
</table>



</body>
</html>
