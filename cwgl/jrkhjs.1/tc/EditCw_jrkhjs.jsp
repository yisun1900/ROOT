<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ײͿͻ����㣭�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #0000FF}
.STYLE4 {font-weight: bold}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

double htsjf=0;
double sssjf=0;
double wdzgce=0;
double qye=0;
double zqljzjx=0;
double zhljzjx=0;
double zqhj=0;
double zhhj=0;
double jsze=0;
double yjzxk=0;
double dj=0;
double yjwk=0;
double yhje=0;
double fqbl=0;
double fqje=0;
double djfxje=0;
double dyq=0;
double yhze=0;
double shfqje=0;
double yjzck=0;
double zcddjezq=0;
double zcddyh=0;
double dgzcjezq=0;
double dgzcyh=0;
double zcjsje=0;
double pck=0;
double khbjk=0;
double zctcze=0;
String lrr=null;
String lrsj=null;
String bz=null;
String clzt=null;

String bxkh="";
String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String fwmj=null;
String hxmc=null;
String bjjbmc=null;
String hth=null;
String sjs=null;
String hyh=null;
String qyrq=null;
String kgrq=null;

double zqgczjf=0;
double zjxje=0;
double zqqtsf=0;
double zqqtsfzjx=0;
double zqwjrqyexm =0;
double zqwjrzjx=0;
String qtsfsm=null;
String wjrqyexmsm=null;

double glfbfb=0;
double zqguanlif=0;
double zqzjxguanlif=0;
double suijinbfb=0;
double zqsuijin=0;
double zqzjxsuijin=0;
String cxhdbm=null;
double zkl=0;
String zklmc="";
String fxgck=null;
double fxdj=0;


double tcbzjg=0;
double tcmjzjje=0;
double tczcsjcj=0;
double tczccljj=0;
double tcxsfzc=0;
double tczcjm=0;
double tcdpsj=0;
double tcdpdlsf=0;
double tcxpx=0;
double tcwsgzj=0;
double tcwgccljj=0;
double tcwzjzc=0;
double tcsgze=0;
double tcqtsf=0;


double tcbzjgzjx=0;
double tcmjzjjezjx=0;
double tczcsjcjzjx=0;
double tczccljjzjx=0;
double tcxsfzczjx=0;
double tczcjmzjx=0;
double tcdpsjzjx=0;
double tcdpdlsfzjx=0;
double tcxpxzjx=0;
double tcwsgzjzjx=0;
double tcwgccljjzjx=0;
double hqzjzcZq=0;
double hqzjzcZh=0;
double tcsgzezjx=0;
double tcqtsfzjx=0;
double tcwzjzczjx=0;

double zctcje=0;
double wntcje=0;
double jytcje=0;
double sctcje=0;
double jktcje=0;

double zctcjezjx=0;
double wntcjezjx=0;
double jytcjezjx=0;
double sctcjezjx=0;
double jktcjezjx=0;

double jddxht=0;
double jddxzjx=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bxkh,fgsbh,khxm,lxfs,fwdz,fwmj,hxmc,bjjbmc,hth,sjs,hyh,qyrq,kgrq";
	ls_sql+=" ,zqgczjf,zjxje,zqqtsf,zqqtsfzjx,zqwjrqyexm,zqwjrzjx,qtsfsm,wjrqyexmsm";
	ls_sql+=" ,glfbfb,zqguanlif,zqzjxguanlif,suijinbfb,zqsuijin,zqzjxsuijin,cxhdbm";
	
	ls_sql+=" from  crm_khxx,sq_dwxx,dm_hxbm,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ls_sql+=" and  crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bxkh=cf.fillNull(rs.getString("bxkh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxmc=cf.fillNull(rs.getString("hxmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hyh=cf.fillNull(rs.getString("hyh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));

		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		zqqtsf=rs.getDouble("zqqtsf");
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		qtsfsm=cf.fillNull(rs.getString("qtsfsm"));
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));

		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		suijinbfb=rs.getDouble("suijinbfb");
		zqsuijin=rs.getDouble("zqsuijin");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf      ,tcbzjgzjx,tcmjzjjezjx,tczcsjcjzjx,tczccljjzjx,tcxsfzczjx,tczcjmzjx,tcdpsjzjx,tcdpdlsfzjx,tcxpxzjx,tcwsgzjzjx,tcwgccljjzjx,tcsgzezjx,tcqtsfzjx ";
	ls_sql+=" ,zctcje,wntcje,jytcje,sctcje,jktcje";
	ls_sql+=" ,zctcjezjx,wntcjezjx,jytcjezjx,sctcjezjx,jktcjezjx";
	ls_sql+=" from  crm_tckhqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zctcje=rs.getDouble("zctcje");
		wntcje=rs.getDouble("wntcje");
		jytcje=rs.getDouble("jytcje");
		sctcje=rs.getDouble("sctcje");
		jktcje=rs.getDouble("jktcje");

		jytcjezjx=rs.getDouble("jytcjezjx");
		sctcjezjx=rs.getDouble("sctcjezjx");
		jktcjezjx=rs.getDouble("jktcjezjx");
		zctcjezjx=rs.getDouble("zctcjezjx");
		wntcjezjx=rs.getDouble("wntcjezjx");

		khbh=cf.fillNull(rs.getString("khbh"));
		tcbzjg=rs.getDouble("tcbzjg");
		tcmjzjje=rs.getDouble("tcmjzjje");
		tczcsjcj=rs.getDouble("tczcsjcj");
		tczccljj=rs.getDouble("tczccljj");
		tcxsfzc=rs.getDouble("tcxsfzc");
		tczcjm=rs.getDouble("tczcjm");
		tcdpsj=rs.getDouble("tcdpsj");
		tcdpdlsf=rs.getDouble("tcdpdlsf");
		tcxpx=rs.getDouble("tcxpx");
		tcwsgzj=rs.getDouble("tcwsgzj");
		tcwgccljj=rs.getDouble("tcwgccljj");
		tcwzjzc=rs.getDouble("tcwzjzc");
		tcsgze=rs.getDouble("tcsgze");
		tcqtsf=rs.getDouble("tcqtsf");

		tcbzjgzjx=rs.getDouble("tcbzjgzjx");
		tcmjzjjezjx=rs.getDouble("tcmjzjjezjx");
		tczcsjcjzjx=rs.getDouble("tczcsjcjzjx");
		tczccljjzjx=rs.getDouble("tczccljjzjx");
		tcxsfzczjx=rs.getDouble("tcxsfzczjx");
		tczcjmzjx=rs.getDouble("tczcjmzjx");
		tcdpsjzjx=rs.getDouble("tcdpsjzjx");
		tcdpdlsfzjx=rs.getDouble("tcdpdlsfzjx");
		tcxpxzjx=rs.getDouble("tcxpxzjx");
		tcwsgzjzjx=rs.getDouble("tcwsgzjzjx");
		tcwgccljjzjx=rs.getDouble("tcwgccljjzjx");
		tcsgzezjx=rs.getDouble("tcsgzezjx");
		tcqtsfzjx=rs.getDouble("tcqtsfzjx");
	}
	rs.close();
	ps.close();

	//ѡ�䶩��
	double xpzcddje=0;
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";//1��ϵͳ����Ʒ�ƶ�����2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ��
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and jc_zcdd.sfjrht='N'";//�Ƿ�����ͬ  Y�����룻N��������
	ls_sql+=" and jc_zcdd.ddlx in('C')";
	//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ�����ģ�D���ײ�������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xpzcddje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	tcxpxzjx=cf.round(tcxpxzjx+xpzcddje,2);

	//�ײ�����������
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";//1��ϵͳ����Ʒ�ƶ�����2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ��
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and jc_zcdd.sfjrht='N'";//�Ƿ�����ͬ  Y�����룻N��������
	ls_sql+=" and jc_zcdd.ddlx in('5','D')";
	//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ�����ģ�D���ײ�������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzjzczjx=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�������
	ls_sql="SELECT sum(wdzje),sum(zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and sfjrht='N' and ddlx in('1','3','4')";//�Ƿ�����ͬ  Y�����룻N��������
	//1������Ʒ��3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9��tcmc��������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jddxht=rs.getDouble(1);
		jddxzjx=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	String zklx="";
	double zdzk=0;
	double gcfqdzk=0;
	ls_sql="SELECT zklx,zdzk,gcfqdzk";
	ls_sql+=" FROM crm_khzk  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
	}
	rs.close();
	ps.close();
	
	if (zklx.equals("1"))//1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zkl=zdzk;

		zklmc="�����ۿ�:"+zkl;
	}
	else {
		zkl=gcfqdzk;
		zklmc="���̷��ۿ�:"+zkl;
	}

	//��������
	ls_sql="SELECT fxgck";
	ls_sql+=" FROM jc_cxhd  ";
	ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxgck=cf.fillNull(rs.getString("fxgck"));//�౶���ֹ��̿�
	}
	rs.close();
	ps.close();

	double zdfxdj=0;//����ֶ���
	ls_sql="select jc_cxhddjfxbz.zdfxdj";
	ls_sql+=" from jc_cxhd,jc_cxhddjfxbz";
	ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhddjfxbz.cxhdbm and jc_cxhd.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_cxhd.hdlx in('1','2') and jc_cxhd.cxhdmc='"+cxhdbm+"'";
	ls_sql+=" and qd<"+wdzgce+" and "+wdzgce+"<=zd ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdfxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//�ͻ������ֶ���
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl ";
	ls_sql+=" where cw_khfkjl.fkje!=0";
	ls_sql+=" and  cw_khfkjl.scbz='N'";
	ls_sql+=" and  cw_khfkjl.fklxbm in('52')";//51�����������52����������53����Ʒ�
	ls_sql+=" and khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if (fxdj>zdfxdj)
	{
		fxdj=zdfxdj;
	}

	ls_sql="select clzt,htsjf,sssjf,wdzgce,qye,zqljzjx,zhljzjx,zqhj,zhhj,jsze,yjzxk,dj,yjwk,yhje,fqbl,fqje,djfxje,dyq,yhze,shfqje,yjzck,zcddjezq,zcddyh,dgzcjezq,dgzcyh,zcjsje,pck,khbjk,lrr,lrsj,lrbm,bz,zctcze ";
	ls_sql+=" from  cw_jrkhjs";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		htsjf=rs.getDouble("htsjf");
		sssjf=rs.getDouble("sssjf");
		wdzgce=rs.getDouble("wdzgce");

		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");

		zhljzjx=rs.getDouble("zhljzjx");
		zqhj=rs.getDouble("zqhj");
		zhhj=rs.getDouble("zhhj");
		jsze=rs.getDouble("jsze");
		yjzxk=rs.getDouble("yjzxk");
		dj=rs.getDouble("dj");
		yjwk=rs.getDouble("yjwk");
		yhje=rs.getDouble("yhje");
		fqbl=rs.getDouble("fqbl");
		fqje=rs.getDouble("fqje");
		djfxje=rs.getDouble("djfxje");
		dyq=rs.getDouble("dyq");
		yhze=rs.getDouble("yhze");
		shfqje=rs.getDouble("shfqje");
		yjzck=rs.getDouble("yjzck");
		zcddjezq=rs.getDouble("zcddjezq");
		zcddyh=rs.getDouble("zcddyh");
		dgzcjezq=rs.getDouble("dgzcjezq");
		dgzcyh=rs.getDouble("dgzcyh");
		zcjsje=rs.getDouble("zcjsje");
		pck=rs.getDouble("pck");
		khbjk=rs.getDouble("khbjk");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		zctcze=rs.getDouble("zctcze");
	}
	rs.close();
	ps.close();
	
	if (clzt.equals("2"))//1��δ������2������ͬ�⣻3��������ͬ�� 
	{
		out.println("���󣡿ͻ������");
		return;
	}

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jrkhjs.jsp" name="insertform" >
<div align="center">�ײͿͻ����㣭�޸�(<font color="#0000FF">�ͻ����:<%=khbh%></font>)</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ�����</font></td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ϵ��ʽ</font></td>
    <td width="32%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���</font></td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>���޿���</td>
    <td><input name="bxkh" type="text" size="20" maxlength="20" value="<%=bxkh%>"></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">����</font></td>
    <td><%=hxmc%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ۼ���</font></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ͬ��</font></td>
    <td><%=hth%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��Ա����</font></td>
    <td><%=hyh%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��������</font></td>
    <td><%=kgrq%></td>
  </tr>
</table>
  
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">��Ʒ����</span></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ͬ��Ʒ�</font></td> 
  <td width="32%">
	<input type="text" name="htsjf" value="<%=htsjf%>" size="20" maxlength="17" readonly></td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">ʵ����Ʒ�</font></td> 
  <td width="32%">
	<input type="text" name="sssjf" value="<%=sssjf%>" size="20" maxlength="17" readonly></td>
</tr>
</table>
  
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr align="center" bgcolor="#FFFFFF">
    <td width="18%">&nbsp;</td>
    <td width="32%"><strong>��ͬ</strong></td>
    <td width="25%"><strong>������</strong></td>
    <td width="25%"><strong>�ϼ�</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��׼�۸�</td>
    <td align="center"><%=tcbzjg%></td>
    <td align="center"><%=tcbzjgzjx%></td>
    <td align="center"><%=cf.round(tcbzjg+tcbzjgzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ������ӽ�� </td>
    <td align="center"><%=tcmjzjje%> </td>
    <td align="center"><%=tcmjzjjezjx%></td>
    <td align="center"><%=cf.round(tcmjzjje+tcmjzjjezjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�����������</td>
    <td align="center"><%=cf.round(tczcsjcj+tcxsfzc,2)%></td>
    <td align="center"><%=cf.round(tczcsjcjzjx+tcxsfzczjx,2)%></td>
    <td align="center"><%=cf.round(tczcsjcj+tczcsjcjzjx+tcxsfzc+tcxsfzczjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��������</td>
    <td align="center"><%=tcdpsj%></td>
    <td align="center"><%=tcdpsjzjx%></td>
    <td align="center"><%=cf.round(tcdpsj+tcdpsjzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���ĳ����Ӽ� </td>
    <td align="center"><%=tczccljj%> </td>
    <td align="center"><%=tczccljjzjx%></td>
    <td align="center"><%=cf.round(tczccljj+tczccljjzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ײ������ĺ˼� </td>
    <td align="center"> -<%=tczcjm%> </td>
    <td align="center">-<%=tczcjmzjx%></td>
    <td align="center">-<%=cf.round(tczcjm+tczcjmzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ײ���ʩ������� </td>
    <td align="center"><%=cf.round(tcwsgzj+tcwgccljj,2)%></td>
    <td align="center"><%=cf.round(tcwsgzjzjx+tcwgccljjzjx,2)%></td>
    <td align="center"><%=cf.round(tcwsgzj+tcwsgzjzjx+tcwgccljj+tcwgccljjzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">Զ�̷�</td>
    <td align="center"><%=tcqtsf%></td>
    <td align="center"><%=tcqtsfzjx%></td>
    <td align="center"><%=cf.round(tcqtsf+tcqtsfzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>�ײͽ��С��</strong></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf,2)%>
      <input type="button" onClick="window.open('/dhzx/sjszxone/dybj.jsp?khbh=<%=khbh%>')" value="��ͬ����"></td>
    <td align="center"><%=cf.round(tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%>
      <input type="button" onClick="window.open('/khxx/ViewZjxxx.jsp?khbh=<%=khbh%>')" value="������"></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%><strong>
      <input type="button" onClick=window.open("/khxx/ViewZxbj.jsp?khbh=<%=khbh%>") value="�ϼƽ��">
    </strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>
      <input type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddTcwCxList.jsp?khbh=<%=khbh%>") value="�ײ�����������">
    </strong></td>
    <td align="center"><%=tcwzjzc%></td>
    <td align="center"><%=cf.round(tcwzjzczjx-tcwzjzc,2)%></td>
    <td align="center"><%=tcwzjzczjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>�� ��</strong></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcwzjzc,2)%></td>
    <td align="center"><%=cf.round(tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx+(tcwzjzczjx-tcwzjzc),2)%></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx+tcwzjzczjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFFF">�����ײ�</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��������շ�</td>
    <td align="center"><%=tcdpdlsf%></td>
    <td align="center"><%=tcdpdlsfzjx%></td>
    <td align="center"><%=cf.round(tcdpdlsf+tcdpdlsfzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ѡ������</td>
    <td align="center"><%=tcxpx%></td>
    <td align="center"><%=tcxpxzjx%></td>
    <td align="center"><%=cf.round(tcxpx+tcxpxzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�Ҿ��ײͽ��</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=zctcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ů�ײͽ��</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=jktcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�����ײͽ��</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=wntcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ɫ���ײͽ��</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=jytcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�����ײͽ��</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=sctcjezjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>
      <input type="button" value="С ��" onclick=window.open("/cwgl/jrkhjs/Jc_zcddZctcCxList.jsp?khbh=<%=khbh%>")>
    </strong></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=cf.round(zctcjezjx+wntcjezjx+jytcjezjx+sctcjezjx+jktcjezjx+tcdpdlsf+tcdpdlsfzjx+tcxpx+tcxpxzjx,2)%></td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">�ͻ��ѽ�װ�޿�</font></td>
  <td width="32%"><input type="text" name="yjzxk" value="<%=yjzxk%>" size="20" maxlength="17" readonly></td>
  <td colspan="2" bgcolor="#FFFFFF">���ж���ת��װ��:<%=dj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">Ӧ��װ��β��</font></td>
  <td><input type="text" name="yjwk" value="<%=yjwk%>" size="20" maxlength="17" readonly></td>
  <td colspan="2"><strong>
    <input name="button2" type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlJzCxList.jsp?khbh=<%=khbh%>") value="������ϸ">
  </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">�Ż����</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���������</font></td>
  <td colspan="3"><%=cxhdbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ȯ�Ż�</font></td>
  <td><%=fqje%>  </td>
  <td colspan="2">��ȯ����:<%=fqbl%>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">�ۿ��Ż�</font></td>
  <td><font color="#FF0000">
    <input type="text" name="yhje" value="<%=yhje%>" size="20" maxlength="17" readonly>
  </font></td>
  <td colspan="2"><%=zklmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���������Ż�</font></td>
  <td><font color="#FF0000">
    <input type="text" name="djfxje" value="<%=djfxje%>" size="20" maxlength="17" readonly>
  </font></td>
  <td colspan="2"><%=fxgck%>���������֣��ͻ�������:<%=fxdj%>�����������Ż�=<%=fxdj%>*(<%=fxgck%>-1)��*<%=zkl%>��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>����ȯ</td>
  <td><input type="text" name="dyq" value="<%=dyq%>" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td colspan="2">    �˹�¼��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ջؼ��ȯ���</td>
  <td><input type="text" name="shfqje" value="<%=shfqje%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
  <td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">�Żݺϼƽ��</font></td>
  <td><input type="text" name="yhze" value="<%=yhze%>" size="20" maxlength="17" readonly>  </td>
  <td colspan="2">�Żݽ��ۿ��Ż�+���������Żݣ�����ȯ-�ջؼ��ȯ���</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">�������</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">���ѽ����Ŀ�</font></td>
  <td colspan="3"><input type="text" name="yjzck" value="<%=yjzck%>" size="20" maxlength="17" readonly>    <strong>
    <input name="button" type="button" onClick=window.open("/cwgl/jrkhjs/Cw_khfkjlZcCxList.jsp?khbh=<%=khbh%>") value="������ϸ">
    </strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">�ڻ������</font></td>
  <td><font color="#0000FF">
    <input name="zcddjezq" type="text" value="<%=zcddjezq%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button32" type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddJddxCxList.jsp?khbh=<%=khbh%>") value="�������">
    </strong></font></td>
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">�������ײ�</font></td>
  <td><font color="#0000FF">
    <input name="zctcze" type="text" value="<%=zctcze%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button5" type="button" onclick=window.open("/cwgl/jrkhjs/Jc_zcddZctcCxList.jsp?khbh=<%=khbh%>") value="�����ײ�">
    </strong></font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><font color="#0000FF">��</font>���ɼҾ�����</span></td>
  <td><input name="dgzcjezq" type="text"  value="<%=dgzcjezq%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button4" type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddDgzcCxList.jsp?khbh=<%=khbh%>") value="���ɼҾ�����">
    </strong></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><font color="#0000FF">��</font>���ɼҾ������Ż�</span></td>
  <td bgcolor="#FFFFFF"><font color="#0000FF">
    <input name="dgzcyh" type="text" value="<%=dgzcyh%>" size="20" maxlength="17" readonly>
  </font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF" class="STYLE3">���Ľ����</td>
  <td colspan="3"><span class="STYLE2">
    <input name="zcjsje" type="text"  value="<%=zcjsje%>" size="20" maxlength="17" readonly>
    <font color="#990033"><strong>���Ľ����ڣ��ۣ����ܣ��ݣ�����</strong></font></span></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ͻ��⳥��</td>
  <td><input type="text" name="pck" value="<%=pck%>" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE3">�ͻ�������</span></td>
  <td><input type="text" name="khbjk" value="<%=khbjk%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>">
	  <input type="hidden" name="wdzgce" value="<%=wdzgce%>">
	  <input type="hidden" name="qye" value="<%=qye%>">
	  <input type="hidden" name="zqljzjx" value="<%=zqljzjx%>">
	  <input type="hidden" name="zhljzjx" value="<%=zhljzjx%>">
	  <input type="hidden" name="zqhj" value="<%=zqhj%>">
	  <input type="hidden" name="zhhj" value="<%=zhhj%>">

	  <input type="hidden" name="jsze" value="<%=jsze%>">
      <input type="hidden" name="dj" value="<%=dj%>"  >

      <input type="hidden" name="fqje" value="<%=fqje%>">
	  <input type="hidden" name="fqbl" value="<%=fqbl%>">

	  <input type="hidden" name="zcddyh" value="0">

	  <input type="button"  value="����" onClick="f_do(insertform)">
	  <input name="button3" type="button" onClick="window.open('/cwgl/jrkhjs/ViewTcCw_jrkhjs.jsp?khbh=<%=khbh%>')"  value="��ӡ">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	//�Żݽ��
	var yhze=FormName.yhje.value*1.0+FormName.djfxje.value*1.0+FormName.dyq.value*1.0-FormName.shfqje.value*1.0;
	yhze=round(yhze,0);
	FormName.yhze.value=yhze;

	//�ͻ�������
	var khbjk=(FormName.htsjf.value*1.0-FormName.sssjf.value*1.0)+(FormName.yjwk.value*1.0-FormName.yhze.value*1.0)+FormName.zcjsje.value*1.0-FormName.pck.value*1.0;
	khbjk=round(khbjk,0);
	FormName.khbjk.value=khbjk;
}

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bxkh)=="") {
		alert("������[���޿���]��");
		FormName.bxkh.focus();
		return false;
	}
	if(	javaTrim(FormName.htsjf)=="") {
		alert("������[��ͬ��Ʒ�]��");
		FormName.htsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.htsjf, "��ͬ��Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sssjf)=="") {
		alert("������[ʵ����Ʒ�]��");
		FormName.sssjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sssjf, "ʵ����Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[ǩԼ�ܶ��ǰ]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "ǩԼ�ܶ��ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[ǩԼ�ܶ�ۺ�]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "ǩԼ�ܶ�ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqljzjx)=="") {
		alert("������[�������ܶ��ǰ]��");
		FormName.zqljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zqljzjx, "�������ܶ��ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhljzjx)=="") {
		alert("������[�������ܶ�ۺ�]��");
		FormName.zhljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zhljzjx, "�������ܶ�ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqhj)=="") {
		alert("������[���̺ϼƣ���ǰ]��");
		FormName.zqhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqhj, "���̺ϼƣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhhj)=="") {
		alert("������[���̺ϼƣ��ۺ�]��");
		FormName.zhhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhhj, "���̺ϼƣ��ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jsze)=="") {
		alert("������[����ʩ���ܶ�]��");
		FormName.jsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsze, "����ʩ���ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yjzxk)=="") {
		alert("������[�ѽ�װ�޿�]��");
		FormName.yjzxk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjzxk, "�ѽ�װ�޿�"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����תװ�޿�]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����תװ�޿�"))) {
		return false;
	}
	if(	javaTrim(FormName.yjwk)=="") {
		alert("������[Ӧ��β��]��");
		FormName.yjwk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjwk, "Ӧ��β��"))) {
		return false;
	}
	if(	javaTrim(FormName.yhje)=="") {
		alert("������[�ۿ��Ż�]��");
		FormName.yhje.focus();
		return false;
	}
	if(!(isFloat(FormName.yhje, "�ۿ��Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.fqbl)=="") {
		alert("������[��ȯ����]��");
		FormName.fqbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fqbl, "��ȯ����"))) {
		return false;
	}
	if(	javaTrim(FormName.fqje)=="") {
		alert("������[��ȯ�Ż�]��");
		FormName.fqje.focus();
		return false;
	}
	if(!(isFloat(FormName.fqje, "��ȯ�Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.djfxje)=="") {
		alert("������[���������Ż�]��");
		FormName.djfxje.focus();
		return false;
	}
	if(!(isFloat(FormName.djfxje, "���������Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.dyq)=="") {
		alert("������[����ȯ]��");
		FormName.dyq.focus();
		return false;
	}
	if(!(isFloat(FormName.dyq, "����ȯ"))) {
		return false;
	}
	if(	javaTrim(FormName.yhze)=="") {
		alert("������[�Ż��ܶ�]��");
		FormName.yhze.focus();
		return false;
	}
	if(!(isFloat(FormName.yhze, "�Ż��ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.shfqje)=="") {
		alert("������[�ջط�ȯ���]��");
		FormName.shfqje.focus();
		return false;
	}
	if(!(isFloat(FormName.shfqje, "�ջط�ȯ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yjzck)=="") {
		alert("������[�ѽ����Ŀ�]��");
		FormName.yjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.yjzck, "�ѽ����Ŀ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zctcze)=="") {
		alert("������[�����ײ�]��");
		FormName.zctcze.focus();
		return false;
	}
	if(!(isFloat(FormName.zctcze, "�����ײ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zcddjezq)=="") {
		alert("������[�������]��");
		FormName.zcddjezq.focus();
		return false;
	}
	if(!(isFloat(FormName.zcddjezq, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.zcddyh)=="") {
		alert("������[��������Ż�]��");
		FormName.zcddyh.focus();
		return false;
	}
	if(!(isFloat(FormName.zcddyh, "��������Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgzcjezq)=="") {
		alert("������[���ɼҾ�����]��");
		FormName.dgzcjezq.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzcjezq, "���ɼҾ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.dgzcyh)=="") {
		alert("������[���ɼҾ������Ż�]��");
		FormName.dgzcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzcyh, "���ɼҾ������Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.zcjsje)=="") {
		alert("������[���Ľ����]��");
		FormName.zcjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsje, "���Ľ����"))) {
		return false;
	}
	if(	javaTrim(FormName.pck)=="") {
		alert("������[�⳥�����ڷ�]��");
		FormName.pck.focus();
		return false;
	}
	if(!(isFloat(FormName.pck, "�⳥�����ڷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.khbjk)=="") {
		alert("������[�ͻ�������]��");
		FormName.khbjk.focus();
		return false;
	}
	if(!(isFloat(FormName.khbjk, "�ͻ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
