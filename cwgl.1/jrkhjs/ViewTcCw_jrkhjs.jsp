<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ײͿͻ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE4 {color: #000FF}
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
String clzt="";
String spyj=null;
String spr=null;
String spsj=null;

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

	ls_sql="select fgsbh,khxm,lxfs,fwdz,fwmj,hxmc,bjjbmc,hth,sjs,hyh,qyrq,kgrq";
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
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
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

	ls_sql="select spr,spsj,spyj,clzt,htsjf,sssjf,wdzgce,qye,zqljzjx,zhljzjx,zqhj,zhhj,jsze,yjzxk,dj,yjwk,yhje,fqbl,fqje,djfxje,dyq,yhze,shfqje,yjzck,zcddjezq,zcddyh,dgzcjezq,dgzcyh,zcjsje,pck,khbjk,lrr,lrsj,lrbm,bz,zctcze ";
	ls_sql+=" from  cw_jrkhjs";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
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
		zctcze=rs.getDouble("zctcze");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	//�ײ�����������
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";//1��ϵͳ����Ʒ�ƶ�����2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ��
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and sfjrht='N'";//�Ƿ�����ͬ  Y�����룻N��������
	ls_sql+=" and ddlx in('5','D')";//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzjzczjx=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (clzt.equals("1"))//1��δ������2������ͬ�⣻3��������ͬ�� 
	{
		out.println("���󣡽���δ���");
//		return;
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
<div align="center">�ײͿͻ�����(�ͻ����:<%=khbh%>)</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF">
    <td width="16%" align="right">�ͻ�����</td>
    <td width="29%"><%=khxm%></td>
    <td width="23%" align="right" bgcolor="#FFFFFF">��ϵ��ʽ</td>
    <td width="32%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ݵ�ַ</td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF">���</td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">����</td>
    <td><%=hxmc%></td>
    <td align="right" bgcolor="#FFFFFF">���ۼ���</td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">��ͬ��</td>
    <td><%=hth%></td>
    <td align="right" bgcolor="#FFFFFF">��Ա����</td>
    <td><%=hyh%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">ǩԼ����</td>
    <td><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF">��������</td>
    <td><%=kgrq%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">��Ʒ����</span></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="16%" align="right" bgcolor="#FFFFFF">��ͬ��Ʒ�</td> 
  <td width="29%"><%=htsjf%></td>
  <td width="23%" align="right" bgcolor="#FFFFFF">ʵ����Ʒ�</td> 
  <td width="32%"><%=sssjf%></td>
</tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td>&nbsp;</td>
    <td><strong>��ͬ</strong></td>
    <td><strong>������</strong></td>
    <td><strong>�ϼ�</strong></td>
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
    <td align="right"><strong>
    �ײͽ��С��</strong></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf,2)%></td>
    <td align="center"><%=cf.round(tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%></td>
    <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ײ�����������</td>
    <td align="center"><%=tcwzjzc%></td>
    <td align="center"><%=cf.round(tcwzjzczjx-tcwzjzc,2)%></td>
    <td align="center"><%=tcwzjzczjx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>
    �� ��</strong></td>
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
    С ��</strong></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=cf.round(zctcjezjx+wntcjezjx+jytcjezjx+sctcjezjx+jktcjezjx+tcdpdlsf+tcdpdlsfzjx+tcxpx+tcxpxzjx,2)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td width="16%" align="right" bgcolor="#FFFFFF">�ͻ��ѽ�װ�޿�</td>
  <td width="29%"><%=yjzxk%></td><td colspan="2" bgcolor="#FFFFFF">���ж���ת��װ��:<%=dj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">Ӧ��װ��β��</td>
  <td><%=yjwk%></td><td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">�Ż����</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">���������</td>
  <td colspan="3"><%=cxhdbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">��ȯ�Ż�</td>
  <td><%=fqje%>  </td>
  <td colspan="2">��ȯ����:<%=fqbl%>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">�ۿ��Ż�</td>
  <td><%=yhje%>  </td>
  <td colspan="2"><%=zklmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">���������Ż�</td>
  <td><%=djfxje%>  </td>
  <td colspan="2"><%=fxgck%>���������֣��ͻ�������:<%=fxdj%>�����������Ż�=<%=fxdj%>*(<%=fxgck%>-1)��*<%=zkl%>��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">����ȯ</td>
  <td><%=dyq%></td>
  <td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ջؼ��ȯ���</td>
  <td><%=shfqje%>  </td><td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Żݺϼƽ��</td>
  <td><%=yhze%> </td><td colspan="2">�Żݽ��ۿ��Ż�+���������Żݣ�����ȯ-�ջؼ��ȯ���</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">�������</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ѽ����Ŀ�</td>
  <td><%=yjzck%></td><td width="23%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><%=zcddjezq%>    </td>
  <td align="right" bgcolor="#FFFFFF">�����ײ�</td>
  <td><%=zctcze%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">��������</td>
  <td><%=dgzcjezq%></td><td align="right" bgcolor="#FFFFFF">���������Ż�</td>
  <td ><%=dgzcyh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">���Ľ����</td>
  <td><%=zcjsje%>  </td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ��⳥��</td>
  <td><%=pck%></td><td align="right">�ͻ�������</td>
  <td><%=khbjk%></td></tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><%=bz%></td>
</tr>
</table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF">
    <td height="28">�� �� �ˣ�<%=lrr%></td>
    <td>�� �� �ˣ�<%=spr%></td>
    <td bgcolor="#FFFFFF">�ͻ�ǩ�֣�</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" height="28">����ʱ�䣺<%=lrsj%></td>
    <td width="25%">���ʱ�䣺<%=spsj%></td>
    <td width="25%" bgcolor="#FFFFFF">ʱ&nbsp;&nbsp;&nbsp;&nbsp;�䣺</td>
    <td width="25%">&nbsp;</td>
  </tr>
</table>

</body>
</html>


