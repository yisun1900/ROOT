<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");
String rkph=null;
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

whererkph=cf.GB2Uni(request.getParameter("rkph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String gsmc="";
try {
	conn=cf.getConnection();

	ls_sql="select rkph,ckmc ckbh,DECODE(rklx,'C','�ɹ����','T','�˻����','R','�������','S','�깺���','J','����ȯ�˻����','D','���Ķ����˻�','P','�������') rklx,DECODE(rkdzt,'0','¼��δ�ύ',' 1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�������ͨ��','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','������') rkdzt,dwmc fgsbh,rkr,to_char(rksj,'YYYY-MM-DD') rksj,jxc_rkd.bz bz,to_char(rksj,'YYYY') nian,to_char(rksj,'MM') yue,to_char(rksj,'DD') ri,gysmc,lydh,shr,zbshr,xzbshyy,rklx rkdrklx ";
	ls_sql+=" from  jxc_rkd,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_rkd.ckbh=jxc_ckmc.ckbh ";
	ls_sql+=" and jxc_rkd.rkrssfgs=sq_dwxx.dwbh ";
	ls_sql+=" and  (rkph='"+whererkph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		lydh=cf.fillNull(rs.getString("lydh"));
		xzbshyy=cf.fillNull(rs.getString("xzbshyy"));

		rkph=cf.fillNull(rs.getString("rkph"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		rklx=cf.fillNull(rs.getString("rklx"));
		rkdrklx=cf.fillNull(rs.getString("rkdrklx"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		rkr=cf.fillNull(rs.getString("rkr"));
		shr=cf.fillNull(rs.getString("shr"));
		zbshr=cf.fillNull(rs.getString("zbshr"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select csz";
	ls_sql+=" from sq_xtcsb";
	ls_sql+=" where csbm='gsmc'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gsmc=cf.fillNull(rs.getString("csz"));
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
<div align="center"><%=gsmc%>---<U>&nbsp;<%=fgsbh%>&nbsp;</U>�ֹ�˾���Ͽ�</div>
<div align="center"><font size="+2"><b>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</b></font></div>
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

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF" align="center">
	<td width="4%"><b>���</b></td>
	<td width="12%"><b>���ϱ���</b></td>
	<td width="10%"><b>�ڲ�����</b></td>
	<td width="18%"><b>��������</b></td>
	<td width="11%"><b>�ͺ�</b></td>
	<td width="11%"><b>���</b></td>
	<td width="7%"><b>��λ</b></td>
	<td width="8%"><b>��ⵥ��</b></td>
	<td width="8%"><b>�������</b></td>
	<td width="11%"><b>�����</b></td>
</tr>
<%

int row=0;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwbm=null;

double rkj=0;
double rksl=0;
double rkje=0;

double allrksl=0;
double allrkje=0;

try {
	conn=cf.getConnection();

	ls_sql="select jxc_clbm.clbm,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jldwbm,jxc_rkmx.rkj,jxc_rkmx.rksl,jxc_rkmx.rkje";
	ls_sql+=" from jxc_rkmx,jxc_clbm ";
	ls_sql+=" where rkph='"+rkph+"' and jxc_clbm.clbm=jxc_rkmx.clbm ";
	ls_sql+=" order by rkxh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;

		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		rkje=rs.getDouble("rkje");


		allrksl+=rksl;
		allrkje+=rkje;


		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=row%></td>
			<td><%=clbm%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=rkj%></td>
			<td><%=rksl%></td>
			<td><%=rkje%></td>
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
		<td colspan="3"><B>С ��</B></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(allrksl)%></td>
		<td><%=cf.formatDouble(allrkje)%></td>
	</tr>

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