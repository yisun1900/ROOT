<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh="";
String cklxmc=null;
String ckmc=null;
String lydh=null;
String ckr=null;
String cksj=null;
double ckzsl=0;
double ckzje=0;
String psfs=null;
String fgsmc=null;

String jhshsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String hth=null;
String sgdmc=null;

double sumcksl=0;
double sumckje=0;

String ckph=null;
ckph=cf.GB2Uni(request.getParameter("ckph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String gsmc=null;
try {
	conn=cf.getConnection();

	//����������
	ls_sql="select khbh,DECODE(cklx,'D','��������','B','���ϳ���','T','�˻�����','Q','��������','S','�깺����','P','���ϵ�����','J','����ȯ����','X','���۳���','R','��������') cklxmc ";
	ls_sql+=" ,ckmc,lydh,dwmc,ckr,cksj,ckzsl,ckzje,DECODE(psfs,'0','��������','1','��˾�ͻ�','2','�ͻ���ȡ') psfs,jhshsj,jxc_ckd.bz ";
	ls_sql+=" from jxc_ckd,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+) and jxc_ckd.ckph='"+ckph+"'";
	ls_sql+=" and jxc_ckd.fgsbh=sq_dwxx.dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cklxmc=cf.fillNull(rs.getString("cklxmc"));
		ckmc=cf.fillNull(rs.getString("ckmc"));
		lydh=cf.fillNull(rs.getString("lydh"));
		fgsmc=cf.fillNull(rs.getString("dwmc"));

		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		ckzsl=rs.getDouble("ckzsl");
		ckzje=rs.getDouble("ckzje");
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		bz=cf.fillNull(rs.getString("bz"));

	}
	rs.close();
	ps.close();

	//��ѯ�ͻ�����
	ls_sql="select khxm,fwdz,hth,sgdmc ";
	ls_sql+=" from crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
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
<div align="center"><%=gsmc%>---<U>&nbsp;<%=fgsmc%>&nbsp;</U>���Ͽ�</div>
<div align="center"><font size="+2"><b>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td width="31%"><strong>��������</strong>��<%=ckph%></td>
  <td width="31%"><strong>��������</strong>��<%=cklxmc%></td>
  <td width="38%"><strong>����ֿ�</strong>��<%=ckmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td><strong>�ͻ�����</strong>��<%=khxm%></td>
  <td><strong>�� ͬ ��</strong>��<%=hth%></td>
  <td><strong>ʩ �� ��</strong>��<%=sgdmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td><strong>��������</strong>��<%=cksj%></td>
  <td><strong>��Դ����</strong>��<%=lydh%></td>
  <td><strong>���ݵ�ַ</strong>��<%=fwdz%></td>
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
double ckdj=0;
double cksl=0;
double ckje=0;


	int row=0;

	ls_sql="select nbbm,clmc,gg,jldwbm,ckdj,cksl,ckje ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' and xsfs!='1'";//����ӡ����Ʒ
	ls_sql+=" order by nbbm";
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
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");
		ckje=rs.getDouble("ckje");

		sumcksl+=cksl;
		sumckje+=ckje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=row%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=ckdj%></td>
			<td><%=cksl%></td>
			<td><%=ckje%></td>
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
	<td><%=cf.formatDouble(sumcksl) %></td>
	<td><%=cf.formatDouble(sumckje) %></td>
	<td>&nbsp;</td>
</tr>
		
</table>


<table width="100%" border="0">
<tr>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font size="-1"><b>����Ա��</b></font></td>
  </tr>
  <tr>
    <td width="33%"><font size="-1"><b>�����ˣ�</b></font></td>
	<td width="33%"><font size="-1"><b>��Ŀ����</b></font></td>
    <td width="33%"><font size="-1"><b>��&nbsp;&nbsp;��<%=yhmc%></b></font></td>
  </tr>
  <tr>
    <td colspan="2"><font size="-1"><b>��ע��</b></font><%=bz%></td>
	<td colspan="2" align="right"><font size="-1"><b>��ӡ���ڣ�<%=cf.today("YYYY-MM-DD")%></b></font></td>
  </tr>
</table>

</body>
</html>


