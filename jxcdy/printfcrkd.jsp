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
String rkdrklx=null;
int ckzsl=0;
whererkph=cf.GB2Uni(request.getParameter("rkph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select rkph,dqmc dqbm,ckmc ckbh,DECODE(rklx,'D','�������','B','�������','T','�˻����','R','�������','S','�깺���','P','�������','J','����ȯ���','C','�ɹ����') rklx,DECODE(rkdzt,'0','¼��δ�ύ',' 1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�������ͨ��','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','������') rkdzt,dwmc fgsbh,rkr,to_char(rksj,'YYYY-MM-DD') rksj,jxc_rkd.bz bz,to_char(rksj,'YYYY') nian,to_char(rksj,'MM') yue,to_char(rksj,'DD') ri,gysmc,lydh,shr,zbshr,xzbshyy,rklx rkdrklx ";
	ls_sql+=" from  jxc_rkd,dm_dqbm,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_rkd.ckbh=jxc_ckmc.ckbh(+) and jxc_rkd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_rkd.rkrssfgs=sq_dwxx.dwbh ";
	ls_sql+=" and  (rkph='"+whererkph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
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
		rkdrklx=cf.fillNull(rs.getString("rkdrklx"));
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

	if (rklx.equals("�깺���"))//S���깺���
	{
		gysmc="�����ܲ�";
	}

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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> �����ڴ�װ�ι��̣����������޹�˾---<U>&nbsp;<%=fgsbh%>&nbsp;</U>�ֹ�˾���Ͽ�</div>
<div align="center"><font size="+3"><b>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="10%"> 
    ������ţ�</td>
  <td width="20%"> 
    <%=rkph%>  </td>
  <td align="right" width="10%"> 
    ������ͣ�</td>
  <td width="20%"> 
    <%=rklx%>  </td>
	<td align="right" width="10%"> 
    ���ֿ⣺</td>
  <td width="20%"> 
    <%=ckbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    ������ڣ�</td>
  <td width="20%"> 
    <U>&nbsp;<%=nian%>&nbsp;</U>��<U>&nbsp;<%=yue%>&nbsp;</U>��<U>&nbsp;<%=ri%>&nbsp;</U>��  </td>
  <td align="right" width="10%"> 
    ��Դ��λ��</td>
  <td width="20%"> 
   <%=gysmc%>  </td>
  <td align="right" width="10%"> 
    ��Դ���ţ�</td>
  <td width="20%"> 
    <%=lydh%> </td>
</tr>
</table>
<DIV>&nbsp;</DIV>
	  <table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF" align="center">
	<td width="4%"><b>���</b></td>
	<td width="9%"><b>�ڲ�����</b></td>
	<td width="19%"><b>��������</b></td>
	<td width="14%"><b>���Ϲ��</b></td>
	<td width="7%"><b>������λ</b></td>
	<td width="8%"><b>����</b></td>
	<td width="8%"><b>�������</b></td>
	<td width="10%"><b>�����</b></td>
	<td width="21%"><b>��ע</b></td>
</tr>

<%
int rkxh=0;
String clbm=null;
String nbbm=null;
String clmc=null;
String gg=null;
String jldwbm=null;
double rkj=0;
double rksl=0;
double rkje=0;

double xjrksl=0;
double xjrkje=0;

try {
	conn=cf.getConnection();

	ls_sql="select rkxh,clbm,nbbm,clmc,gg,jldwbm,rkj,rksl,rkje";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where jxc_rkmx.rkph='"+rkph+"'";
	ls_sql+=" order by rkxh ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{

		rkxh=rs.getInt("rkxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		rkje=rs.getDouble("rkje");


		xjrksl+=rksl;
		xjrkje+=rkje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=rkxh%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=rkj%></td>
			<td><%=rksl%></td>
			<td><%=rkje%></td>
			<td>&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="2">�� ��</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(xjrksl)%></td>
		<td><%=cf.formatDouble(xjrkje)%></td>
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

</table>
</body>
</html>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table width="100%" border="0">
  <tr>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font size="-1"><b>�ջ�Ա��</b></font></td>
  </tr>
  <tr>
    <td width="33%"><font size="-1"><b>�Ʊ��ˣ�<%=yhmc%></b></font></td>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�죺</b></font></td>
    <td width="33%"><font size="-1"><b>�ͻ�˾����</b></font></td>
  </tr>
  <tr>
    <td colspan="2"><font size="-1"><b>��ע��</b></font></td>
	<td colspan="2" align="right"><font size="-1">��ӡ���ڣ�<%=cf.today("YYYY-MM-DD")%></font></td>
  </tr>
</table>