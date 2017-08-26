<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");
String rkph=null;
String dqbm=null;
String ckbh=null;
String hjbh=null;
String rklx=null;
String rkdzt=null;
String ddbh=null;
String fgsbh=null;
String jsr=null;
String rkr=null;
String rksj=null;
String ckzje=null;
String whererkph=null;
String psfs=null;
String sfjz=null;
String sfth=null;
String gysmc=null;
String nian=null;
String yue=null;
String ri=null;
String bz="";
String czxh=null;
String jhshsj=null;
String hth=null;
String lydh=null;
String shr=null;
String zbshr=null;
String xzbshyy=null;
int ckzsl=0;
double yf=0;
double qtfy=0;
whererkph=cf.GB2Uni(request.getParameter("rkph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yf,qtfy,rkph,dqmc dqbm,ckmc ckbh,DECODE(rklx,'D','�������','B','�������','T','�˻����','Q','�������','S','�깺���','P','�������','J','����ȯ���','C','�ɹ����') rklx,DECODE(rkdzt,'0','¼��δ�ύ',' 1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�������ͨ��','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','������') rkdzt,dwmc fgsbh,rkr,to_char(rksj,'YYYY-MM-DD') rksj,jxc_rkd.bz bz,to_char(rksj,'YYYY') nian,to_char(rksj,'MM') yue,to_char(rksj,'DD') ri,gysmc,lydh,shr,zbshr,xzbshyy ";
	ls_sql+=" from  jxc_rkd,dm_dqbm,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_rkd.ckbh=jxc_ckmc.ckbh and jxc_rkd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_rkd.rkrssfgs=sq_dwxx.dwbh ";
	ls_sql+=" and  (rkph='"+whererkph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yf=rs.getDouble("yf");
		qtfy=rs.getDouble("qtfy");
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		lydh=cf.fillNull(rs.getString("lydh"));
		xzbshyy=cf.fillNull(rs.getString("xzbshyy"));

		rkph=cf.fillNull(rs.getString("rkph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		rklx=cf.fillNull(rs.getString("rklx"));
//		rkdzt=cf.fillNull(rs.getString("rkdzt"));
//		ddbh=cf.fillNull(rs.getString("ddbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
//		jsr=cf.fillNull(rs.getString("jsr"));
		rkr=cf.fillNull(rs.getString("rkr"));
		shr=cf.fillNull(rs.getString("shr"));
		zbshr=cf.fillNull(rs.getString("zbshr"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)+1 ";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"'";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		ckzsl=rs.getInt(1);
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
<title>������ⵥ</title>
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
  <td height="32" colspan="2">��Ӧ�����ƣ�<u><%=gysmc%></u></td>
  <td>��ⵥ�ţ�<u><%=rkph%></u></td>
</tr>
<tr bgcolor="#FFFFFF"  height="32">
  <td width="34%">�ջ��ֿ⣺<u><%=ckbh%></u></td>
  <td width="33%">���ʱ�䣺<u>&nbsp;<%=nian%>&nbsp;</u>��<u>&nbsp;<%=yue%>&nbsp;</u>��<u>&nbsp;<%=ri%>&nbsp;</u>�� </td>
	<td width="33%">�����ˣ�<u><%=rkr%></u></td>
</tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">


<tr bgcolor="#FFFFFF" align="center">
	<td  width="4%"><b>���</b></td>
	<td  width="16%"><b>��Ʒ����</b></td>
	<td  width="15%"><b>��Ʒ�ͺ�</b></td>
	<td  width="10%"><b>��������</b></td>
	<td  width="15%"><b>���ߴ�</b></td>
	<td  width="7%"><b>���ۣ�Ԫ��</b></td>
	<td  width="6%"><b>������λ</b></td>
	<td  width="6%"><b>����</b></td>
	<td  width="9%"><b>��Ԫ��</b></td>
	<td  width="12%"><b>��ע</b></td>
</tr>
<%
int rkxh=0;
int i=0;
String clbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwmc=null;
String scph=null;
double rkj=0;
double rksl=0;
double rkje=0;
double sumrkj=0;
double sumrksl=0;
double sumsjrksl=0;
double sumckje=0;
try {
	conn=cf.getConnection();
	ls_sql="select rkxh,jxc_rkmx.clbm clbm,clmc,xh,gg,scph,jldwbm jldwmc,rkj,rksl,rkje";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"'";
	ls_sql+=" order by rkxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		rkxh=rs.getInt("rkxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		scph=cf.fillHtml(rs.getString("scph"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		rkje=rs.getDouble("rkje");

		sumrkj+=rkj;
		sumrksl+=rksl;
		sumckje+=rkje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
		<td ><%=rkxh%></td>
		<td ><%=clmc%></td>
		<td ><%=xh%></td>
		<td ><%=scph%></td>
		<td ><%=gg%></td>
		<td ><%=rkj%></td>
		<td ><%=jldwmc%></td>
		<td ><%=rksl%></td>
		<td ><%=rkje%></td>
		<td >&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
		<tr bgcolor="#FFFFFF" align="center">
		<td height="30"  colspan="8">�����ϼƣ�<%=cf.NumToRMBStr(sumckje)%></td>

		<td ><%=cf.formatDouble(sumckje)%></td>
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
		<td colspan="3" ><font size="-1"><b>�˷ѣ�Сд����<%=yf%></b></font></td>
		<td colspan="3" ><font size="-1"><b>�������ã�Сд����<%=qtfy%></b></font></td>
		<td colspan="4" ><font size="-1"><b>���úϼ�(�˷�+��������)��<%=cf.round(yf+qtfy,2)%></b></font></td>
		</tr>

		<tr bgcolor="#FFFFFF" align="center" height="27">
		<td colspan="10" ><font size="-1"><b>����ⵥһ����������һ��������ڶ���Ϊ��������������Ϊ��Ӧ�����桢������Ϊ�������</b></font></td>
		</tr>

		<tr bgcolor="#FFFFFF" height="27">
		<td colspan="4" ><font size="-1"><b>���Ϲ�����/ʱ�䣺 </b></font></td>
		<td colspan="6" ><font size="-1"><b>���/ʱ�䣺</b></font></td>
		</tr>

</table>



</body>
</html>
