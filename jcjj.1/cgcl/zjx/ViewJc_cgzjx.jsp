<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_zjxm=null;
String cgzjxyybm=null;
String qrsj=null;
String qrr=null;
String srksj=null;
String rkr=null;
String rksm=null;
String jhazsj=null;
String azwcsj=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String dwbh=null;
String bz=null;

double gtzjxje=0;
double tmzjxje=0;
double wjzjxje=0;
double dqzjxje=0;
double zjxze=0;

double zqgtzjxje=0;
double zqtmzjxje=0;
double zqwjzjxje=0;
double zqdqzjxje=0;
double zqzjxze=0;

double cgzkl=0;
double tmzkl=0;
double wjzkl=0;
double dqzkl=0;
String dzyy=null;

String ssfgsbh=null;
String qddm=null;
String jzsjs=null;
String zjxfssj=null;

String pdgc=null;
String pdgcmc=null;
String gys=null;
String ppmc=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String cgsjs=null;
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
	ls_sql="select pdgc,pdgcmc,gys,ppmc,clgw,ztjjgw,jc_cgzjx.xmzy,cgsjs,jc_cgzjx.zjxfssj,jc_cgzjx.fgsbh,jc_cgzjx.qddm,jc_cgzjx.jzsjs,jc_cgzjx.ddbh,jc_cgzjx.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.zjxm as crm_khxx_zjxm, mmzjxyymc as cgzjxyybm,jc_cgzjx.qrsj as qrsj,jc_cgzjx.qrr as qrr,jc_cgzjx.srksj as srksj,jc_cgzjx.rkr as rkr,jc_cgzjx.rksm as rksm,jc_cgzjx.jhazsj as jhazsj,jc_cgzjx.azwcsj as azwcsj,jc_cgzjx.clzt as clzt,jc_cgzjx.lrr as lrr,jc_cgzjx.lrsj as lrsj,jc_cgzjx.dwbh as dwbh,jc_cgzjx.bz as bz ";
	ls_sql+=" ,jc_cgzjx.gtzjxje,jc_cgzjx.tmzjxje,jc_cgzjx.wjzjxje,jc_cgzjx.dqzjxje,jc_cgzjx.zjxze";
	ls_sql+=" ,jc_cgzjx.zqgtzjxje,jc_cgzjx.zqtmzjxje,jc_cgzjx.zqwjzjxje,jc_cgzjx.zqdqzjxje,jc_cgzjx.zqzjxze";
	ls_sql+=" ,jc_cgzjx.cgzkl,jc_cgzjx.tmzkl,jc_cgzjx.wjzkl,jc_cgzjx.dqzkl,jc_cgzjx.dzyy,jc_cgzjx.khjl ";
	ls_sql+=" from  crm_khxx,jc_cgzjx,jdm_mmzjxyybm";
	ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgzjx.zjxxh='"+zjxxh+"' and jc_cgzjx.cgzjxyybm=jdm_mmzjxyybm.mmzjxyybm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		pdgc=cf.fillHtml(rs.getString("pdgc"));
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		gys=cf.fillHtml(rs.getString("gys"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		clgw=rs.getString("clgw");
		ztjjgw=rs.getString("ztjjgw");
		xmzy=rs.getString("xmzy");
		cgsjs=rs.getString("cgsjs");

		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		ssfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		cgzjxyybm=cf.fillNull(rs.getString("cgzjxyybm"));
		qrsj=cf.fillNull(rs.getDate("qrsj"));
		qrr=cf.fillNull(rs.getString("qrr"));
		srksj=cf.fillNull(rs.getDate("srksj"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rksm=cf.fillNull(rs.getString("rksm"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		azwcsj=cf.fillNull(rs.getDate("azwcsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));

		gtzjxje=rs.getDouble("gtzjxje");
		tmzjxje=rs.getDouble("tmzjxje");
		wjzjxje=rs.getDouble("wjzjxje");
		dqzjxje=rs.getDouble("dqzjxje");
		zjxze=rs.getDouble("zjxze");

		zqgtzjxje=rs.getDouble("zqgtzjxje");
		zqtmzjxje=rs.getDouble("zqtmzjxje");
		zqwjzjxje=rs.getDouble("zqwjzjxje");
		zqdqzjxje=rs.getDouble("zqdqzjxje");
		zqzjxze=rs.getDouble("zqzjxze");

		cgzkl=rs.getDouble("cgzkl");
		tmzkl=rs.getDouble("tmzkl");
		wjzkl=rs.getDouble("wjzkl");
		dqzkl=rs.getDouble("dqzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> �����������������ţ�<%=zjxxh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ͻ���� </td>
    <td><%=khbh%> </td>
    <td align="right"> �ͻ����� </td>
    <td><%=crm_khxx_khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���ݵ�ַ </td>
    <td><%=crm_khxx_fwdz%> </td>
    <td align="right">�ʼ� </td>
    <td><%=crm_khxx_zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ��ͬ�� </td>
    <td><%=crm_khxx_hth%> </td>
    <td align="right"> ���ʦ </td>
    <td><%=crm_khxx_sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right">&nbsp;</td>
  </tr>
  
  <tr bgcolor="#99CCFF"> 
    <td width="21%" align="right">�����ֹ�˾</td>
    <td width="29%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgsbh+"'",ssfgsbh,true);
%> </td>
    <td width="21%" align="right">��������</td>
    <td width="29%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="21%" align="right" bgcolor="#99CCFF">��װ���ʦ</td>
    <td width="29%"><%=jzsjs%> </td>
    <td width="21%" align="right" bgcolor="#99CCFF">�ͻ�����</td>
    <td width="29%"><%=khjl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">�ɵ��������</td>
    <td width="29%"><%=pdgc%></td>
    <td width="21%" align="right">�ɵ���������</td>
    <td width="29%"><%=pdgcmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��Ӧ��</td>
    <td width="29%"><%=gys%></td>
    <td width="21%" align="right">Ʒ��</td>
    <td width="29%"><%=ppmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">פ��Ҿӹ���</td>
    <td width="29%"><%=clgw%></td>
    <td width="21%" align="right">չ���Ҿӹ���</td>
    <td width="29%"><%=ztjjgw%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��ĿרԱ</td>
    <td width="29%"><%=xmzy%></td>
    <td width="21%" align="right">�������ʦ</td>
    <td width="29%"><%=cgsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">�������ʱ��</td>
    <td bgcolor="#FFFFFF"><%=zjxfssj%></td>
    <td align="right" bgcolor="#FFFFFF">������ԭ��</td>
    <td bgcolor="#FFFFFF"><%=cgzjxyybm%></td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>����ԭ��</strong></td>
    <td colspan="4" bgcolor="#FFFFFF"> <%=dzyy%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right" bgcolor="#FFFFFF"><strong> ��ǰ-������������ </strong></td>
    <td width="19%" bgcolor="#FFFFFF"> <strong><%=zqgtzjxje%> </strong></td>
    <td align="right"><span class="STYLE9"><span class="STYLE2">�����ۿ���</span>��<%=cgzkl %></span></td>
    <td width="21%" align="right" bgcolor="#FFFFFF"><span class="STYLE1"> �ۺ�-������������ </span></td>
    <td width="19%" bgcolor="#FFFFFF"><strong><%=gtzjxje%> </strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>��ǰ-̨����������</strong></td>
    <td bgcolor="#FFFFFF"><strong><%=zqtmzjxje%></strong></td>
    <td align="right"><span class="STYLE9"><span class="STYLE2">̨���ۿ���</span>��<%=tmzkl %></span></td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">�ۺ�-̨����������</span></td>
    <td bgcolor="#FFFFFF"><strong><%=tmzjxje%></strong></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right" bgcolor="#FFFFFF"><strong> ��ǰ-����������� </strong></td>
    <td width="19%" bgcolor="#FFFFFF"> <strong><%=zqwjzjxje%> </strong></td>
    <td align="right"><span class="STYLE9"><span class="STYLE2">����ۿ���</span>��<%=wjzkl %></span></td>
    <td width="21%" align="right" bgcolor="#FFFFFF"><span class="STYLE1"> �ۺ�-����������� </span></td>
    <td width="19%" bgcolor="#FFFFFF"><strong><%=wjzjxje%> </strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>��ǰ-������������</strong></td>
    <td bgcolor="#FFFFFF"><strong><%=zqdqzjxje%></strong></td>
    <td align="right"><span class="STYLE9"><span class="STYLE2">�����ۿ���</span>��<%=dqzkl %></span></td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">�ۺ�-������������</span></td>
    <td bgcolor="#FFFFFF"><strong><%=dqzjxje%></strong></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right" bgcolor="#FFFFFF"><strong> ��ǰ-�������ܶ� </strong></td>
    <td width="19%" bgcolor="#FFFFFF"> <strong><%=zqzjxze%> </strong></td>
    <td width="20%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="21%" align="right" bgcolor="#FFFFFF"><span class="STYLE1"> �ۺ�-�������ܶ� </span></td>
    <td width="19%" bgcolor="#FFFFFF"><strong><%=zjxze%> </strong></td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> ȷ��¼���� </td>
    <td width="29%"> <%=qrr%> </td>
    <td align="right" width="21%">ȷ��ʱ�� </td>
    <td width="29%"><%=qrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> ���¼���� </td>
    <td width="29%"> <%=rkr%> </td>
    <td align="right" width="21%">ʵ���ʱ�� </td>
    <td width="29%"><%=srksj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%">���˵��</td>
    <td colspan="3"><%=rksm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> �ƻ���װʱ�� </td>
    <td width="29%"> <%=jhazsj%> </td>
    <td align="right" width="21%"> ��װ���ʱ�� </td>
    <td width="29%"> <%=azwcsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> ����״̬ </td>
    <td width="29%"> <%
	cf.selectToken(out,"00+¼��δ���&01+¼�������&02+������ȷ��&04+��װ���&99+�˵�",clzt,true);
%> </td>
    <td align="right" width="21%"> ¼���� </td>
    <td width="29%"> <%=lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> ¼��ʱ�� </td>
    <td width="29%"> <%=lrsj%> </td>
    <td align="right" width="21%"> ¼�벿�� </td>
    <td width="29%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> ��ע </td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="20%">������Ŀ</td>
	<td  width="7%">��������</td>
	<td  width="7%">��ǰ����</td>
	<td  width="7%">�ۺ󵥼�</td>
	<td  width="9%">��ǰ�������</td>
	<td  width="9%">�ۺ��������</td>
	<td  width="35%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT DECODE(lx,'1','����','2','̨��','3','���','4','����'),zjxm,zjsl,TO_CHAR(zqdj),TO_CHAR(dj),zqzjje,zjje,bz  ";
	ls_sql+=" FROM jc_cgzjxmx  ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
    ls_sql+=" order by xh";
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
