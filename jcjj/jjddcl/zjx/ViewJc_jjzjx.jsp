<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String jc_jjzjx_zjxxh=null;
String jc_jjzjx_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_zjxm=null;
String jc_jjzjx_zjxyybm=null;
String jc_jjzjx_jjzjxje=null;
String jc_jjzjx_xcmzjxje=null;
String jc_jjzjx_zjxze=null;
String jc_jjzjx_qrsj=null;
String jc_jjzjx_qrr=null;
String jc_jjzjx_srksj=null;
String jc_jjzjx_rkr=null;
String jc_jjzjx_rksm=null;
String jc_jjzjx_jhazsj=null;
String jc_jjzjx_azwcsj=null;
String jc_jjzjx_clzt=null;
String jc_jjzjx_lrr=null;
String jc_jjzjx_lrsj=null;
String jc_jjzjx_dwbh=null;
String jc_jjzjx_bz=null;
double cpjjzjxje=0;
double zqcpjjzjxje=0;
double zqjjzjxje=0;
double zqxcmzjxje=0;
double zqzjxze=0;
double jjzkl=0;
String dzyy=null;

String ssfgsbh=null;
String qddm=null;
String jzsjs=null;
String zjxfssj=null;

String pdgc=null;
String pdgcmc=null;
String jjgys=null;
String jjppmc=null;
String xcmgc=null;
String xcmgcmc=null;
String xcmgys=null;
String xcmppmc=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jjsjs=null;
String khjl=null;


String zjxxh=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select pdgc,pdgcmc,jjgys,jjppmc,xcmgc,xcmgcmc,xcmgys,xcmppmc,clgw,ztjjgw,jc_jjzjx.xmzy,jjsjs,jc_jjzjx.zjxfssj,jc_jjzjx.fgsbh,jc_jjzjx.qddm,jc_jjzjx.jzsjs,jc_jjzjx.ddbh as ddbh,jc_jjzjx.zjxxh as jc_jjzjx_zjxxh,jc_jjzjx.khbh as jc_jjzjx_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.zjxm as crm_khxx_zjxm,jc_jjzjx.zjxyybm as jc_jjzjx_zjxyybm,jc_jjzjx.jjzjxje as jc_jjzjx_jjzjxje,jc_jjzjx.xcmzjxje as jc_jjzjx_xcmzjxje,jc_jjzjx.zjxze as jc_jjzjx_zjxze,jc_jjzjx.qrsj as jc_jjzjx_qrsj,jc_jjzjx.qrr as jc_jjzjx_qrr,jc_jjzjx.srksj as jc_jjzjx_srksj,jc_jjzjx.rkr as jc_jjzjx_rkr,jc_jjzjx.rksm as jc_jjzjx_rksm,jc_jjzjx.jhazsj as jc_jjzjx_jhazsj,jc_jjzjx.azwcsj as jc_jjzjx_azwcsj,jc_jjzjx.clzt as jc_jjzjx_clzt,jc_jjzjx.lrr as jc_jjzjx_lrr,jc_jjzjx.lrsj as jc_jjzjx_lrsj,jc_jjzjx.dwbh as jc_jjzjx_dwbh,jc_jjzjx.bz as jc_jjzjx_bz ";
	ls_sql+=" ,jc_jjzjx.khjl,jc_jjzjx.cpjjzjxje,jc_jjzjx.zqcpjjzjxje,jc_jjzjx.zqjjzjxje,jc_jjzjx.zqxcmzjxje,jc_jjzjx.zqzjxze,jc_jjzjx.jjzkl,jc_jjzjx.dzyy";
	ls_sql+=" from  crm_khxx,jc_jjzjx";
	ls_sql+=" where jc_jjzjx.khbh=crm_khxx.khbh and  (jc_jjzjx.zjxxh="+zjxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		cpjjzjxje=rs.getDouble("cpjjzjxje");
		zqcpjjzjxje=rs.getDouble("zqcpjjzjxje");
		zqjjzjxje=rs.getDouble("zqjjzjxje");
		zqxcmzjxje=rs.getDouble("zqxcmzjxje");
		zqzjxze=rs.getDouble("zqzjxze");
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillHtml(rs.getString("dzyy"));

		pdgc=cf.fillHtml(rs.getString("pdgc"));
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		jjgys=cf.fillHtml(rs.getString("jjgys"));
		jjppmc=cf.fillHtml(rs.getString("jjppmc"));
		xcmgc=cf.fillHtml(rs.getString("xcmgc"));
		xcmgcmc=cf.fillHtml(rs.getString("xcmgcmc"));
		xcmgys=cf.fillHtml(rs.getString("xcmgys"));
		xcmppmc=cf.fillHtml(rs.getString("xcmppmc"));
		clgw=rs.getString("clgw");
		ztjjgw=rs.getString("ztjjgw");
		xmzy=rs.getString("xmzy");
		jjsjs=rs.getString("jjsjs");

		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		ssfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		jc_jjzjx_zjxxh=cf.fillNull(rs.getString("jc_jjzjx_zjxxh"));
		jc_jjzjx_khbh=cf.fillNull(rs.getString("jc_jjzjx_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		jc_jjzjx_zjxyybm=cf.fillNull(rs.getString("jc_jjzjx_zjxyybm"));
		jc_jjzjx_jjzjxje=cf.fillNull(rs.getString("jc_jjzjx_jjzjxje"));
		jc_jjzjx_xcmzjxje=cf.fillNull(rs.getString("jc_jjzjx_xcmzjxje"));
		jc_jjzjx_zjxze=cf.fillNull(rs.getString("jc_jjzjx_zjxze"));
		jc_jjzjx_qrsj=cf.fillNull(rs.getDate("jc_jjzjx_qrsj"));
		jc_jjzjx_qrr=cf.fillNull(rs.getString("jc_jjzjx_qrr"));
		jc_jjzjx_srksj=cf.fillNull(rs.getDate("jc_jjzjx_srksj"));
		jc_jjzjx_rkr=cf.fillNull(rs.getString("jc_jjzjx_rkr"));
		jc_jjzjx_rksm=cf.fillNull(rs.getString("jc_jjzjx_rksm"));
		jc_jjzjx_jhazsj=cf.fillNull(rs.getDate("jc_jjzjx_jhazsj"));
		jc_jjzjx_azwcsj=cf.fillNull(rs.getDate("jc_jjzjx_azwcsj"));
		jc_jjzjx_clzt=cf.fillNull(rs.getString("jc_jjzjx_clzt"));
		jc_jjzjx_lrr=cf.fillNull(rs.getString("jc_jjzjx_lrr"));
		jc_jjzjx_lrsj=cf.fillNull(rs.getDate("jc_jjzjx_lrsj"));
		jc_jjzjx_dwbh=cf.fillNull(rs.getString("jc_jjzjx_dwbh"));
		jc_jjzjx_bz=cf.fillNull(rs.getString("jc_jjzjx_bz"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">�Ҿ�������(������ţ�<%=ddbh%>����������ţ�<%=jc_jjzjx_zjxxh%>)</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#99CCFF"> 
    <td width="20%" align="right">�����ֹ�˾</td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgsbh+"'",ssfgsbh,true);
%> </td>
    <td width="20%" align="right">��������</td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">��װ���ʦ</td>
    <td width="30%"><%=jzsjs%> </td>
    <td width="20%" align="right">�ͻ�����</td>
    <td width="30%"><%=khjl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">�Ҿ߹������</td>
    <td width="30%" bgcolor="#99CCFF"><%=pdgc%></td>
    <td width="20%" align="right" bgcolor="#CCCCFF">�Ͳ��Ź������</td>
    <td width="30%" bgcolor="#CCCCFF"><%=xcmgc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">�Ҿ߹�������</td>
    <td width="30%" bgcolor="#99CCFF"><%=pdgcmc%></td>
    <td width="20%" align="right" bgcolor="#CCCCFF">�Ͳ��Ź�������</td>
    <td width="30%" bgcolor="#CCCCFF"><%=xcmgcmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">�Ҿ߹�Ӧ��</td>
    <td width="30%" bgcolor="#99CCFF"><%=jjgys%></td>
    <td width="20%" align="right" bgcolor="#CCCCFF">�Ͳ��Ź�Ӧ��</td>
    <td width="30%" bgcolor="#CCCCFF"><%=xcmgys%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#99CCFF">�Ҿ�Ʒ��</td>
    <td width="30%" bgcolor="#99CCFF"><%=jjppmc%></td>
    <td width="20%" align="right" bgcolor="#CCCCFF">�Ͳ���Ʒ��</td>
    <td width="30%" bgcolor="#CCCCFF"><%=xcmppmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">פ��Ҿӹ���</td>
    <td width="30%"><%=clgw%></td>
    <td width="20%" align="right">չ���Ҿӹ���</td>
    <td width="30%"><%=ztjjgw%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">��ĿרԱ</td>
    <td width="30%"><%=xmzy%></td>
    <td width="20%" align="right">�Ҿ����ʦ</td>
    <td width="30%"><%=jjsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> �ͻ���� </td>
    <td width="30%"> <%=jc_jjzjx_khbh%> </td>
    <td align="right" width="20%"> �ͻ����� </td>
    <td width="30%"> <%=crm_khxx_khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ���ݵ�ַ </td>
    <td width="30%"> <%=crm_khxx_fwdz%> </td>
    <td align="right" width="20%"> ��ϵ��ʽ </td>
    <td width="30%"> <%=crm_khxx_lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ��ͬ�� </td>
    <td width="30%"> <%=crm_khxx_hth%> </td>
    <td align="right" width="20%"> ���ʦ </td>
    <td width="30%"> <%=crm_khxx_sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> �ʼ� </td>
    <td width="30%"> <%=crm_khxx_zjxm%> </td>
    <td align="right" width="20%"> ������ԭ�� </td>
    <td width="30%"> <%=jc_jjzjx_zjxyybm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ۿ���</td>
    <td><%=jjzkl%></td>
    <td align="right" bgcolor="#99CCFF">�������ʱ��</td>
    <td bgcolor="#99CCFF"><%=zjxfssj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ԭ��</td>
    <td colspan="3"><%=dzyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�Ҿ���������-�ۺ�</span></td>
    <td><%=jc_jjzjx_jjzjxje%></td>
    <td align="right"><strong>�Ҿ���������-��ǰ</strong></td>
    <td><%=zqjjzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�Ͳ�����������-�ۺ�</span></td>
    <td><%=jc_jjzjx_xcmzjxje%></td>
    <td align="right"><strong>�Ͳ�����������-��ǰ</strong></td>
    <td><%=zqxcmzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"><span class="STYLE1">��Ʒ�Ҿ���������-�ۺ�</span></td>
    <td width="30%"><%=cpjjzjxje%></td>
    <td width="20%" align="right"><strong>��Ʒ�Ҿ���������-��ǰ</strong></td>
    <td width="30%"><%=zqcpjjzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"><span class="STYLE1"> �������ܶ�-�ۺ� </span></td>
    <td width="30%"> <%=jc_jjzjx_zjxze%> </td>
    <td width="20%" align="right"><strong> �������ܶ�-��ǰ </strong></td>
    <td width="30%"><%=zqzjxze%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ȷ��¼���� </td>
    <td width="30%"> <%=jc_jjzjx_qrr%> </td>
    <td align="right" width="20%">ȷ��ʱ�� </td>
    <td width="30%"><%=jc_jjzjx_qrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ���¼���� </td>
    <td width="30%"> <%=jc_jjzjx_rkr%> </td>
    <td align="right" width="20%">ʵ���ʱ�� </td>
    <td width="30%"><%=jc_jjzjx_srksj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%">���˵��</td>
    <td colspan="3"><%=jc_jjzjx_rksm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> �ƻ���װʱ�� </td>
    <td width="30%"> <%=jc_jjzjx_jhazsj%> </td>
    <td align="right" width="20%"> ��װ���ʱ�� </td>
    <td width="30%"> <%=jc_jjzjx_azwcsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ����״̬ </td>
    <td width="30%"> <%
	cf.selectToken(out,"00+¼��δ���&01+¼�������&02+������ȷ��&04+��װ���&99+�˵�",jc_jjzjx_clzt,true);
%> </td>
    <td align="right" width="20%"> ¼���� </td>
    <td width="30%"> <%=jc_jjzjx_lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ¼��ʱ�� </td>
    <td width="30%"> <%=jc_jjzjx_lrsj%> </td>
    <td align="right" width="20%"> ¼�벿�� </td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh",jc_jjzjx_dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="20%"> ��ע </td>
    <td colspan="3"> <%=jc_jjzjx_bz%> </td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">��־</td>
	<td  width="8%">�������</td>
	<td  width="9%">��������</td>
	<td  width="8%">��װλ��</td>
	<td  width="9%">���</td>
	<td  width="8%">�Ҿ�ϵ��</td>
	<td  width="12%">�������</td>
	<td  width="8%">�����ɫ</td>
	<td  width="9%">�������-�ۺ�</td>
	<td  width="9%">�������-��ǰ</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT DECODE(jc_gtzjxmx.ysl-jc_gtzjxmx.xsl,1,'����',-1,'����+'),jc_jjgtmx.gtxh,jc_jjgtmx.gtmc,jc_jjgtmx.jjazwz,jc_jjgtmx.guige,jc_jjgtmx.jjlx,jc_jjgtmx.bclx,jc_jjgtmx.bcys,(jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*jc_jjgtmx.zj,(jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*jc_jjgtmx.zqzj";
	ls_sql+=" FROM jc_jjgtmx,jc_gtzjxmx  ";
    ls_sql+=" where jc_jjgtmx.gtxh=jc_gtzjxmx.gtxh and jc_gtzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by gtxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">��־</td>
	<td  width="10%">�Ͳ�������</td>
	<td  width="10%">��*��(mm)</td>
	<td  width="12%">�߿�ϵ���ͺ�</td>
	<td  width="9%">�߿���ɫ</td>
	<td  width="10%">������1</td>
	<td  width="10%">������2</td>
	<td  width="7%">�ۺ��ܼ�</td>
	<td  width="7%">��ǰ�ܼ�</td>
	<td  width="10%">��ע</td>
</tr>
<%
	ls_sql="SELECT DECODE(jc_xcmzjxmx.ysl-jc_xcmzjxmx.xsl,1,'����',-1,'����+'),jc_jjxcmmx.xcmmc,jc_jjxcmmx.gd||'*'||jc_jjxcmmx.kd gg,jc_jjxcmmx.bklxxh,jc_jjxcmmx.bkys,jc_jjxcmmx.mbcl1,jc_jjxcmmx.mbcl2,(jc_xcmzjxmx.xsl-jc_xcmzjxmx.ysl)*jc_jjxcmmx.zj,(jc_xcmzjxmx.xsl-jc_xcmzjxmx.ysl)*jc_jjxcmmx.zqzj,jc_jjxcmmx.bz  ";
	ls_sql+=" FROM jc_jjxcmmx,jc_xcmzjxmx ";
    ls_sql+=" where jc_jjxcmmx.xcmxh=jc_xcmzjxmx.xcmxh and jc_xcmzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_jjxcmmx.xcmxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�Ҿ�����</td>
	<td  width="7%">�ͺ�</td>
	<td  width="11%">���(mm)</td>
	<td  width="14%">����</td>
	<td  width="18%">��ɫ����</td>
	<td  width="5%">ԭ����</td>
	<td  width="5%">������</td>
	<td  width="8%">�����ܼ�-�ۺ�</td>
	<td  width="8%">�����ܼ�-��ǰ</td>
	<td  width="15%">��ע</td>
</tr>
<%
	ls_sql="SELECT cpjjmc,xh,gg,cpjjcz,cpjjhs,jc_cpjjzjxmx.ysl,jc_cpjjzjxmx.xsl,jc_cpjjddmx.khdj*(jc_cpjjzjxmx.xsl-jc_cpjjzjxmx.ysl),jc_cpjjddmx.bzdj*(jc_cpjjzjxmx.xsl-jc_cpjjzjxmx.ysl),bz  ";
	ls_sql+=" FROM jc_cpjjddmx,jc_cpjjzjxmx  ";
    ls_sql+=" where jc_cpjjddmx.cpjjbh=jc_cpjjzjxmx.cpjjbh and jc_cpjjddmx.ddbh=jc_cpjjzjxmx.ddbh and jc_cpjjzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_cpjjzjxmx.lx,jc_cpjjzjxmx.cpjjbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>
</body>
</html>
