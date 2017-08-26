<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String ckmc=null;
String dwmc=null;
String cksj=null;
String ckr=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String bz=null;
String sgd=null;
String sgdmc="";
String dh="";

String ckph=cf.GB2Uni(request.getParameter("ckph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select ckmc,dwmc,ckr,cksj,jxc_ckd.bz,khxm,fwdz,lxfs,crm_khxx.sgd ";
	ls_sql+=" from  jxc_ckd,jxc_ckmc,sq_dwxx,crm_khxx ";
	ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+) ";
	ls_sql+=" and jxc_ckd.fgsbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and jxc_ckd.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ckmc=cf.fillNull(rs.getString("ckmc"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		ckr=cf.fillHtml(rs.getString("ckr"));
		bz=cf.fillHtml(rs.getString("bz"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		sgd=cf.fillNull(rs.getString("sgd"));
	}
	rs.close();
	ps.close();

	ls_sql="select sgdmc,dh ";
	ls_sql+=" from sq_sgd ";
	ls_sql+=" where  sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		dh=cf.fillNull(rs.getString("dh"));

		sgdmc=sgdmc+"("+dh+")";
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
<title>���ϳ��ⵥ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td height="32"><span lang=EN-US><img src="tubiao1.jpg" v:shapes="_x0000_i1025" width="200"></span></td>
  <td height="32" align="center"><font size="+2"><b>��&nbsp;��&nbsp;��</b></font></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="32">�ͻ����ƣ���λ����<u><%=khxm%></u></td>
  <td height="32">�ֹ�˾���ƣ�<u><%=dwmc%></u></td>
  <td>���ⵥ�ţ�<u><%=ckph%></u></td>
</tr>
<tr bgcolor="#FFFFFF"  height="32">
  <td>�ͻ���ַ��<u><%=fwdz%></u></td>
  <td>�ջ��绰��<u><%=lxfs%></u></td>
  <td>������<u><%=sgdmc%></u></td>
</tr>
<tr bgcolor="#FFFFFF"  height="32">
  <td width="34%">�����ֿ⣺<u><%=ckmc%></u></td>
  <td width="33%">�������ڣ�<u><%=cksj%></u></td>
	<td width="33%">�����ˣ�<u><%=ckr%></u></td>
</tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="0">



<tr bgcolor="#FFFFFF" align="center">
	<td  width="3%">���</td>
	<td  width="9%">���ϱ���</td>
	<td  width="11%">��Ʒ����</td>
	<td  width="11%">��Ʒ�ͺ�</td>
	<td  width="11%">���ߴ�</td>
	<td  width="7%">��������</td>
	<td  width="4%">������λ</td>
	<td  width="6%">����</td>
	<td  width="6%">���ۼ�</td>
	<td  width="8%">�ϼ�</td>
	<td  width="9%">����</td>
	<td  width="6%">��װ��</td>
	<td  width="12%">��ע</td>
</tr>
<%
int ckxh=0;
int i=0;
String clbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwmc=null;
String scph=null;
String hjmc=null;
double ckdj=0;
double cksl=0;
double ckje=0;
double sumckdj=0;
double sumcksl=0;
double sumsjcksl=0;
double sumckje=0;
try {
	conn=cf.getConnection();

	ls_sql="select ckxh,jxc_ckmx.clbm clbm,clmc,xh,gg,scph,jldwbm jldwmc,ckdj,cksl,ckje,hjmc";
	ls_sql+=" from jxc_ckmx,jxc_hjmc ";
	ls_sql+=" where jxc_ckmx.hjbh=jxc_hjmc.hjbh(+) ";
	ls_sql+=" and ckph='"+ckph+"'";
	ls_sql+=" order by ckxh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		ckxh=rs.getInt("ckxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		scph=cf.fillHtml(rs.getString("scph"));
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		hjmc=cf.fillHtml(rs.getString("hjmc"));
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");
		ckje=rs.getDouble("ckje");

		sumckdj+=ckdj;
		sumcksl+=cksl;
		sumckje+=ckje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
		<td ><%=ckxh%></td>
		<td ><%=clbm%></td>
		<td ><%=clmc%></td>
		<td ><%=xh%></td>
		<td ><%=gg%></td>
		<td ><%=scph%></td>
		<td ><%=jldwmc%></td>
		<td ><%=cksl%></td>
		<td ><%=ckdj%></td>
		<td ><%=ckje%></td>
		<td ><%=hjmc%></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
		<tr bgcolor="#FFFFFF" align="center">
		<td height="30"  colspan="8">�ϼƣ�<%=cf.formatDouble(sumckje)%></td>

		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
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
		<td colspan="3" ><font size="-1"><b>��װ�ܼ�����</b></font></td>
		<td colspan="3" ><font size="-1"><b>����/�����</b></font></td>
		<td colspan="4" ><font size="-1"><b>�˷ѣ�</b></font></td>
		<td colspan="3"><b>������¥�ѣ�</b></td>
		</tr>

		<tr bgcolor="#FFFFFF" align="center" height="27">
		<td colspan="13" ><font size="-1"><b>��ע������ⵥһ����������һ��������ڶ���Ϊ�ֹ�˾��������������Ϊ�ܲ�����������</b></font></td>
		</tr>

		<tr bgcolor="#FFFFFF" height="27">
		<td colspan="4" ><font size="-1"><b>���Ϲ�����/ʱ�䣺</b></font></td>
		<td colspan="6" ><font size="-1"><b>������/ʱ�䣺</b></font></td>
		<td colspan="3"><b>ǩ���ˣ�</b></td>
		</tr>
</table>



</body>
</html>
