<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String zjxxh=request.getParameter("zjxxh");

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwmc=null;
String clgw=null;
String sgdmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=null;
String clxlmc=null;
String ppmc=null;
String bjjbmc=null;
String bjjbbm=null;
String xh=null;
String gg=null;
double jsj=0;
String xdjldw=null;
double xdsl=0;
double je=0;
String ptcpsm=null;
String zclx=null;
String ddcljjfs=null;
String jgwzbm=null;
String tccplbbm=null;

double allsl=0;
double allje=0;
	String bjjb=null;

try {
	conn=cf.getConnection();


	ls_sql="SELECT hth,khxm,lxfs,fwdz,sjs,crm_khxx.bjjb,bjjbmc,sgdmc,dwmc,clgw";
	ls_sql+=" FROM crm_khxx,crm_zjxdj,bdm_bjjbbm,sq_sgd,sq_dwxx";
    ls_sql+=" where crm_khxx.zjxxh=crm_zjxdj.zjxxh";
    ls_sql+=" and crm_zjxdj.zjxxh='"+zjxxh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjb=rs.getString("bjjb");
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		clgw=cf.fillHtml(rs.getString("clgw"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {font-size: 18px}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
  <table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#FFFFFF">
      <td height="29" colspan="3" align="center" class="STYLE2" ><B>��ש�����嵥</B></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="37%" height="30"  >�ͻ�������<%=khxm%></td>
      <td width="40%"   >�ͻ��绰��<%=lxfs%></td>
      <td width="23%" >��ͬ�ţ�<%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="31"  >�ͻ���ַ��<%=fwdz%></td>
      <td  >ǩԼ����/���ʦ��<%=dwmc%>/<%=sjs%></td>
      <td  >���ۼ���<%=bjjbmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="29"  >ʩ���ӣ�<%=sgdmc%></td>
      <td  >���Ϲ��ʣ�<%=clgw%></td>
      <td  >&nbsp;</td>
    </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���������</td>
	<td  width="3%">�ṹλ��</td>
	<td  width="3%">��Ʒ���</td>
	<td  width="4%">Ʒ��</td>
	<td  width="2%">���ۼ���</td>
	<td  width="4%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="2%">������λ</td>
	<td  width="2%">����</td>
	<td  width="2%">����</td>
	<td  width="3%">���</td>
	<td  width="8%">���ײ�Ʒ˵��</td>
</tr>
<%

	ls_sql="SELECT bj_zjxzcbgqd.zjxxh,jxc_clxlbm.clxlmc,bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.bjjbbm,bdm_bjjbbm.bjjbmc,bj_zjxzcbgqd.xh,bj_zjxzcbgqd.gg,bj_zjxzcbgqd.jsj,bj_zjxzcbgqd.xdjldw,bj_zjxzcbgqd.xdsl,ROUND(bj_zjxzcbgqd.jsj*bj_zjxzcbgqd.xdsl,2) je,bj_zjxzcbgqd.ptcpsm";
	ls_sql+=" ,bj_zjxzcbgqd.zclx,bj_zjxzcbgqd.ddcljjfs,bj_zjxzcbgqd.jgwzbm,bj_zjxzcbgqd.tccplbbm ";
	ls_sql+=" FROM bdm_bjjbbm,bj_zjxzcbgqd,jxc_clxlbm  ";
	ls_sql+=" where bj_zjxzcbgqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_zjxzcbgqd.tclx='1'";//1���ײͣ�2�������ײ�
	ls_sql+=" and bj_zjxzcbgqd.tccpdlbm=3";//��ש��
	ls_sql+=" order by bj_zjxzcbgqd.zjxxh,bj_zjxzcbgqd.jgwzbm,bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		clxlmc=cf.fillHtml(rs.getString("clxlmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jsj=rs.getDouble("jsj");
		xdjldw=cf.fillNull(rs.getString("xdjldw"));
		xdsl=rs.getDouble("xdsl");
		je=rs.getDouble("je");
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		zclx=cf.fillNull(rs.getString("zclx"));
		ddcljjfs=cf.fillNull(rs.getString("ddcljjfs"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));


	
		allsl+=xdsl;
		allje+=je;
		allsl=cf.round(allsl,2);
		allje=cf.round(allje,2);

		if (zclx.equals("3") || zclx.equals("4"))//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
		{
			if (ddcljjfs.equals("1") || ddcljjfs.equals("2"))//0���Ƕ�����ϣ�1�����䣨����ۣ���2�����䣨�����Ƽۣ���3���ײ�ѡ��
			{
				bjjbmc="��������";
			}
			else{
				bjjbmc="ѡ��";
			}
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=zjxxh%></td>
			<td><%=jgwzbm%></td>
			<td><%=clxlmc%></td>
			<td><%=ppmc%></td>
			<td><%=bjjbmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
			<td><%=xdjldw%></td>
			<td><%=xdsl%></td>
			<td><%=jsj%></td>
			<td><%=je%></td>
			<td><%=ptcpsm%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="3">С��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=allsl%></td>
	<td>&nbsp;</td>
	<td><%=allje%></td>
	<td>&nbsp;</td>
</tr>
</table>



<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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

</body>
</html>