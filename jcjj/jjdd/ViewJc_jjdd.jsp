<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String kgrq=null;
String jgrq=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String qyrq=null;
String qydm=null;
String ssfgs=null;
String cxhdbm=null;

String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh="";

String jc_jjdd_ddbh=null;
String jc_jjdd_khbh=null;
String jc_jjdd_dj=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jc_jjdd_jhccsj=null;
String jc_jjdd_jjsjs=null;


String jc_jjdd_sccsj=null;
String jc_jjdd_ccbz=null;

String jc_jjdd_qhtsj=null;
String jc_jjdd_qhtr=null;
String jc_jjdd_htbz=null;
String jc_jjdd_tdsj=null;
String jc_jjdd_tdblr=null;
String jc_jjdd_tdsm=null;
String jc_jjdd_jhazrq=null;
String jc_jjdd_sazrq=null;
String clztmc=null;
String jc_jjdd_lrr=null;
String jc_jjdd_lrsj=null;
String jc_jjdd_bz=null;

String jc_jjdd_rksj=null;
String sq_dwxx_dwmc=null;
String jc_jjdd_rkr=null;
String jc_jjdd_rksm=null;

String jhccxgr=null;
String jhccxgsj=null;
String jhccxgyy=null;
String ccr=null;


String pdgc=null;
String pdgcmc=null;
String jjgys=null;
String jjppmc=null;
String xcmgc=null;
String xcmgcmc=null;
String xcmgys=null;
String xcmppmc=null;
String pdr=null;
String pdsj=null;
String pdsm=null;

String kclf=null;
String jctdyybm=null;

String sfpsjs=null;
String sjsgpyybm=null;

String jc_jjdd_sjsdh="";


String htqrr=null;
String htqrsj=null;
String htqrbz=null;
String pgcr=null;
String pgcsj=null;
String pgcsm=null;
String sfkgh=null;
String gcjsr=null;
String gcjssj=null;
String gcjsbz=null;

String kazsj=null;
String kazsjlrr=null;
String azsjbz=null;
String azr=null;
String ksazsj=null;
String sazrq=null;
String azsm=null;
String ycyybm=null;
String ycclzt=null;
String zsycyybm=null;
String ychsqk=null;
String ychsr=null;
String ychssj=null;
String sfxwyj=null;
String wyj=null;
String jjfa=null;
String wjsj=null;
String wjlrr=null;
String sfjs=null;
String jstx=null;
String aztzr=null;
String aztzsj=null;

String ssfgsbh=null;
String qddm=null;
String jzsjs=null;
String fkfs=null;
String khjl=null;


double jjzkl=0;
String dzyy=null;
double cbze=0;

double htze=0;
double jjje=0;
double xcmje=0;
double cpjjje=0;

double wdzje=0;
double zqjjje=0;
double zqxcmje=0;
double zqcpjjje=0;

double jjzjje=0;
double xcmzjje=0;
double cpjjzjje=0;
double zjhze=0;

double zqjjzjje=0;
double zqxcmzjje=0;
double zqcpjjzjje=0;
double zqzjhze=0;

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";


try {
	conn=cf.getConnection();
	ls_sql="select jc_jjdd.fkfs,jc_jjdd.fgsbh,jc_jjdd.qddm,jc_jjdd.jzsjs,jc_jjdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.jgrq,crm_khxx.sgd,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.dwbh,cxhdbm,jc_jjdd.fgsbh";
	ls_sql+=" ,jc_jjdd.aztzr,jc_jjdd.aztzsj,jc_jjdd.kazsj,jc_jjdd.kazsjlrr,jc_jjdd.azsjbz,jc_jjdd.azr,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.azsm,jc_jjdd.ycyybm,jc_jjdd.ycclzt,jc_jjdd.zsycyybm,jc_jjdd.ychsqk,jc_jjdd.ychsr,jc_jjdd.ychssj,jc_jjdd.sfxwyj,jc_jjdd.wyj,jc_jjdd.jjfa,jc_jjdd.wjsj,jc_jjdd.wjlrr,jc_jjdd.sfjs,jc_jjdd.jstx,jc_jjdd.htqrr,jc_jjdd.htqrsj,jc_jjdd.htqrbz,jc_jjdd.pgcr,jc_jjdd.pgcsj,jc_jjdd.pgcsm,jc_jjdd.sfkgh,jc_jjdd.gcjsr,jc_jjdd.gcjssj,jc_jjdd.gcjsbz,jc_jjdd.htbz,sjsgpyybm,sfpsjs,kclf,jctdyybm,pdgc,xcmgc,jc_jjdd.pdr,jc_jjdd.pdsj,jc_jjdd.pdsm,jc_jjdd.rkr jc_jjdd_rkr,jc_jjdd.rksm jc_jjdd_rksm,jhccxgr,jhccxgsj,jhccxgyy,ccr,jc_jjdd.ddbh as jc_jjdd_ddbh,jc_jjdd.khbh as jc_jjdd_khbh,jc_jjdd.dj as jc_jjdd_dj,jc_jjdd.clgw as clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.jhccsj as jc_jjdd_jhccsj,jc_jjdd.jjsjs as jc_jjdd_jjsjs,jc_jjdd.sccsj as jc_jjdd_sccsj,jc_jjdd.ccbz as jc_jjdd_ccbz,jc_jjdd.qhtsj as jc_jjdd_qhtsj,jc_jjdd.qhtr as jc_jjdd_qhtr,jc_jjdd.tdsj as jc_jjdd_tdsj,jc_jjdd.tdblr as jc_jjdd_tdblr,jc_jjdd.tdsm as jc_jjdd_tdsm,jc_jjdd.jhazrq as jc_jjdd_jhazrq,jc_jjdd.sazrq as jc_jjdd_sazrq,clztmc,jc_jjdd.lrr as jc_jjdd_lrr,jc_jjdd.lrsj as jc_jjdd_lrsj,jc_jjdd.bz as jc_jjdd_bz,jc_jjdd.rksj as jc_jjdd_rksj,sq_dwxx.dwmc as sq_dwxx_dwmc ";
	ls_sql+=" ,jc_jjdd.pdgcmc,jc_jjdd.jjgys,jc_jjdd.jjppmc,jc_jjdd.xcmgcmc,jc_jjdd.xcmgys,jc_jjdd.xcmppmc";
	ls_sql+=" ,jc_jjdd.jjzkl,jc_jjdd.dzyy,jc_jjdd.cbze";	
	ls_sql+=" ,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.cpjjje         ,jc_jjdd.wdzje,jc_jjdd.zqjjje,jc_jjdd.zqxcmje,jc_jjdd.zqcpjjje";
	ls_sql+=" ,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.cpjjzjje  ,jc_jjdd.zqzjhze,jc_jjdd.zqjjzjje,jc_jjdd.zqxcmzjje,jc_jjdd.zqcpjjzjje ";	
	ls_sql+=" ,jc_jjdd.khjl";
	
	ls_sql+=" from  jc_jjdd,crm_khxx,sq_dwxx,jdm_jjddzt";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.dwbh=sq_dwxx.dwbh and  (jc_jjdd.ddbh='"+ddbh+"')  ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		cbze=rs.getDouble("cbze");

		htze=rs.getDouble("htze");
		jjje=rs.getDouble("jjje");
		xcmje=rs.getDouble("xcmje");
		cpjjje=rs.getDouble("cpjjje");

		wdzje=rs.getDouble("wdzje");
		zqjjje=rs.getDouble("zqjjje");
		zqxcmje=rs.getDouble("zqxcmje");
		zqcpjjje=rs.getDouble("zqcpjjje");

		zjhze=rs.getDouble("zjhze");
		jjzjje=rs.getDouble("jjzjje");
		xcmzjje=rs.getDouble("xcmzjje");
		cpjjzjje=rs.getDouble("cpjjzjje");

		zqzjhze=rs.getDouble("zqzjhze");
		zqjjzjje=rs.getDouble("zqjjzjje");
		zqxcmzjje=rs.getDouble("zqxcmzjje");
		zqcpjjzjje=rs.getDouble("zqcpjjzjje");

		fkfs=cf.fillNull(rs.getString("fkfs"));
		ssfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qydm=cf.fillNull(rs.getString("dwbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		kazsjlrr=cf.fillNull(rs.getString("kazsjlrr"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		azr=cf.fillNull(rs.getString("azr"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azsm=cf.fillNull(rs.getString("azsm"));
		ycyybm=cf.fillNull(rs.getString("ycyybm"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
		zsycyybm=cf.fillNull(rs.getString("zsycyybm"));
		ychsqk=cf.fillNull(rs.getString("ychsqk"));
		ychsr=cf.fillNull(rs.getString("ychsr"));
		ychssj=cf.fillNull(rs.getDate("ychssj"));
		sfxwyj=cf.fillNull(rs.getString("sfxwyj"));
		wyj=cf.fillNull(rs.getString("wyj"));
		jjfa=cf.fillNull(rs.getString("jjfa"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		jstx=cf.fillNull(rs.getString("jstx"));

		htqrr=cf.fillNull(rs.getString("htqrr"));
		htqrsj=cf.fillNull(rs.getDate("htqrsj"));
		htqrbz=cf.fillNull(rs.getString("htqrbz"));
		pgcr=cf.fillNull(rs.getString("pgcr"));
		pgcsj=cf.fillNull(rs.getDate("pgcsj"));
		pgcsm=cf.fillNull(rs.getString("pgcsm"));
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		gcjsr=cf.fillNull(rs.getString("gcjsr"));
		gcjssj=cf.fillNull(rs.getDate("gcjssj"));
		gcjsbz=cf.fillNull(rs.getString("gcjsbz"));

		
		jc_jjdd_htbz=cf.fillNull(rs.getString("htbz"));
		sjsgpyybm=cf.fillNull(rs.getString("sjsgpyybm"));
		sfpsjs=cf.fillNull(rs.getString("sfpsjs"));
		kclf=cf.fillNull(rs.getString("kclf"));
		jctdyybm=cf.fillNull(rs.getString("jctdyybm"));

		
		pdgc=cf.fillNull(rs.getString("pdgc"));
		pdgcmc=cf.fillNull(rs.getString("pdgcmc"));
		jjgys=cf.fillNull(rs.getString("jjgys"));
		jjppmc=cf.fillNull(rs.getString("jjppmc"));
		xcmgc=cf.fillNull(rs.getString("xcmgc"));
		xcmgcmc=cf.fillNull(rs.getString("xcmgcmc"));
		xcmgys=cf.fillNull(rs.getString("xcmgys"));
		xcmppmc=cf.fillNull(rs.getString("xcmppmc"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdsm=cf.fillNull(rs.getString("pdsm"));

		jc_jjdd_rkr=cf.fillNull(rs.getString("jc_jjdd_rkr"));
		jc_jjdd_rksm=cf.fillNull(rs.getString("jc_jjdd_rksm"));
		jhccxgr=cf.fillNull(rs.getString("jhccxgr"));
		jhccxgsj=cf.fillNull(rs.getDate("jhccxgsj"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		ccr=cf.fillNull(rs.getString("ccr"));

		jc_jjdd_ddbh=cf.fillNull(rs.getString("jc_jjdd_ddbh"));
		jc_jjdd_khbh=cf.fillNull(rs.getString("jc_jjdd_khbh"));
		jc_jjdd_dj=cf.fillNull(rs.getString("jc_jjdd_dj"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jc_jjdd_jhccsj=cf.fillNull(rs.getDate("jc_jjdd_jhccsj"));
		jc_jjdd_jjsjs=cf.fillNull(rs.getString("jc_jjdd_jjsjs"));
		jc_jjdd_sccsj=cf.fillNull(rs.getDate("jc_jjdd_sccsj"));
		jc_jjdd_ccbz=cf.fillNull(rs.getString("jc_jjdd_ccbz"));


		jc_jjdd_qhtsj=cf.fillNull(rs.getDate("jc_jjdd_qhtsj"));
		jc_jjdd_qhtr=cf.fillNull(rs.getString("jc_jjdd_qhtr"));
		jc_jjdd_tdsj=cf.fillNull(rs.getDate("jc_jjdd_tdsj"));
		jc_jjdd_tdblr=cf.fillNull(rs.getString("jc_jjdd_tdblr"));
		jc_jjdd_tdsm=cf.fillNull(rs.getString("jc_jjdd_tdsm"));
		jc_jjdd_jhazrq=cf.fillNull(rs.getDate("jc_jjdd_jhazrq"));
		jc_jjdd_sazrq=cf.fillNull(rs.getDate("jc_jjdd_sazrq"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		jc_jjdd_lrr=cf.fillNull(rs.getString("jc_jjdd_lrr"));
		jc_jjdd_lrsj=cf.fillNull(rs.getDate("jc_jjdd_lrsj"));
		jc_jjdd_bz=cf.fillNull(rs.getString("jc_jjdd_bz"));
		jc_jjdd_rksj=cf.fillNull(rs.getDate("jc_jjdd_rksj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
	}
	rs.close();
	ps.close();

	//�Ҿ����ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+jc_jjdd_jjsjs+"' and ssfgs='"+ssfgs+"' and zwbm='12'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jc_jjdd_sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+qydm+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">�Ҿ߶��� </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">�ͻ����</td>
    <td width="30%"><%=khbh%></td>
    <td align="right" width="20%">��ͬ��</td>
    <td width="30%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">�ͻ�����</td>
    <td width="30%"><%=khxm%>�� 
      <input type="button" value="�鿴�绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
      �� </td>
    <td align="right" width="20%">�μӴ����</td>
    <td width="30%"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">ǩԼ����</td>
    <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qydm+"'",qydm,true);
%></td>
    <td align="right" width="20%">��װ���ʦ</td>
    <td width="30%"><%=sjs%>��<%=sjsdh%>��</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">ʩ����</td>
    <td width="30%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> ��<%=dzdh%>�� </td>
    <td align="right" width="20%">�೤</td>
    <td width="30%"><%=sgbz%>��<%=bzdh%>�� </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">��װǩԼ����</td>
    <td width="30%"><%=qyrq%> </td>
    <td align="right" width="20%">�ʼ�</td>
    <td width="30%"><%=zjxm%>��<%=zjdh%>�� </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">��ͬ��������</td>
    <td width="30%"><%=kgrq%> </td>
    <td align="right" width="20%">��ͬ��������</td>
    <td width="30%"><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td colspan="4" align="center"> 
      <input type="button" name="Button4" value="�鿴Ԥ����" onClick="window.open('ViewJc_jjyddmx.jsp?ddbh=<%=ddbh%>')">    </td>
  </tr>
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
    <td width="20%" align="right">��װ���ʦ</td>
    <td width="30%"><%=jzsjs%> </td>
    <td width="20%" align="right">�ͻ�����</td>
    <td width="30%"><%=khjl%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" width="20%">�������</td>
    <td width="30%"><%=jc_jjdd_ddbh%></td>
    <td align="right" width="20%">����״̬</td>
    <td width="30%"><%=clztmc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">��ĿרԱ</td>
    <td width="30%"><%=xmzy%></td>
    <td width="20%" align="right"></td>
    <td width="30%"></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">פ��Ҿӹ���</td>
    <td width="30%"><%=clgw%> </td>
    <td width="20%" align="right">չ���Ҿӹ���</td>
    <td width="30%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">¼����</td>
    <td width="30%"> <%=jc_jjdd_lrr%> </td>
    <td width="20%" align="right">¼��ʱ��</td>
    <td width="30%"> <%=jc_jjdd_lrsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">¼�벿��</td>
    <td width="30%"> <%=sq_dwxx_dwmc%></td>
    <td width="20%" align="right"></td>
    <td width="30%"></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">��ע</td>
    <td colspan="3"><%=jc_jjdd_bz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�Ƿ��������ʦ</td>
    <td width="30%"><%
	cf.radioToken(out, "1+��&2+��",sfpsjs,true);
%></td>
    <td width="20%" align="right">�Ҿ����ʦ</td>
    <td width="30%"><%=jc_jjdd_jjsjs%>��<%=jc_jjdd_sjsdh%>��</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�ɵ���</td>
    <td width="30%"><%=pdr%></td>
    <td width="20%" align="right">�ɵ�ʱ��</td>
    <td width="30%"><%=pdsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">���ʦ����ԭ��</td>
    <td colspan="3"><%
	cf.selectItem(out,"select sjsgpyybm,sjsgpyymc from jdm_sjsgpyybm where sjsgpyybm='"+sjsgpyybm+"'",sjsgpyybm,true);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�ɵ�˵��</td>
    <td colspan="3"><%=pdsm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td colspan="4" align="center"> 
      <input type="button" name="Button2" value="���ʦ���ɼ�¼" onClick="window.open('ViewJc_jjsjsgpjl.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button22" value="���ʦ��ϵ�ͻ���¼" onClick="window.open('ViewJc_jjsjslxjl.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button" value="�鿴���ⵥ" onClick="window.open('ViewJc_cgccdmx.jsp?ddbh=<%=ddbh%>')">    </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">�ƻ�����ʱ��</td>
    <td colspan="3"><%=jc_jjdd_jhccsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">�ƻ�����¼����</td>
    <td width="30%"><%=jhccxgr%></td>
    <td width="20%" align="right">�ƻ�����¼��ʱ��</td>
    <td width="30%"><%=jhccxgsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">�ƻ����ⱸע</td>
    <td colspan="3"><%=jhccxgyy%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">ʵ����¼����</td>
    <td width="30%"><%=ccr%></td>
    <td width="20%" align="right">ʵ����ʱ��</td>
    <td width="30%"><%=jc_jjdd_sccsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">ʵ���ⱸע</td>
    <td colspan="3"><%=jc_jjdd_ccbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td colspan="4" align="center"> 
      <input type="button" name="Button5" value="�鿴��ͬ��ϸ" onClick="window.open('ViewJc_jjddmx.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button3" value="�鿴������" onClick="window.open('ViewJc_jjzjx.jsp?ddbh=<%=ddbh%>')">    </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td colspan="4" bgcolor="#FFFFFF"><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td align="right">�ۿ���</td>
        <td><%=jjzkl %></td>
        <td width="20%" align="right">�ɱ��ܶ�</td>
        <td width="30%"><%=cbze%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">����ԭ��</td>
        <td colspan="3"><%=dzyy %></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right"><strong>�Ҿߺ�ͬ���-��ǰ</strong></td>
        <td width="30%"><%=zqjjje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>�Ҿߺ�ͬ���-�ۺ�</strong></span></td>
        <td width="30%"><%=jjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right"><strong>�Ͳ��ź�ͬ���-��ǰ</strong></td>
        <td width="30%"><%=zqxcmje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>�Ͳ��ź�ͬ���-�ۺ�</strong></span></td>
        <td width="30%"><%=xcmje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right"><strong>��Ʒ�Ҿߺ�ͬ���-��ǰ</strong></td>
        <td><%=zqcpjjje%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>��Ʒ�Ҿߺ�ͬ���-�ۺ�</strong></span></td>
        <td><%=cpjjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right"><strong>δ���ۺ�ͬ��</strong></td>
        <td width="30%"><%=wdzje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>��ͬ�ܶ�-�ۺ�</strong></span></td>
        <td width="30%"><%=htze%></td>
      </tr>

      <tr bgcolor="#FFFFFF">
        <td colspan="4" align="right">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right" bgcolor="#FFFFFF"><strong>�Ҿ���������-��ǰ</strong></td>
        <td width="30%"><%=zqjjzjje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>�Ҿ���������-�ۺ�</strong></span></td>
        <td width="30%"><%=jjzjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right" bgcolor="#FFFFFF"><strong>�Ͳ�����������-��ǰ</strong></td>
        <td width="30%"><%=zqxcmzjje%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>�Ͳ�����������-�ۺ�</strong></span></td>
        <td width="30%"><%=xcmzjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><strong>��Ʒ�Ҿ���������-��ǰ</strong></td>
        <td><%=zqcpjjzjje%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>��Ʒ�Ҿ���������-�ۺ�</strong></span></td>
        <td><%=cpjjzjje%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="20%" align="right" bgcolor="#FFFFFF"><strong>�������ܶ�-��ǰ</strong></td>
        <td width="30%"><%=zqzjhze%></td>
        <td width="20%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"><strong>�������ܶ�-�ۺ�</strong></span></td>
        <td width="30%"><%=zjhze%></td>
      </tr>

    </table></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> ǩ��ͬʱ��</td>
    <td width="30%"><%=jc_jjdd_qhtsj%></td>
    <td width="20%" align="right">ǩ��ͬ��</td>
    <td width="30%"><%=jc_jjdd_qhtr%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">�ƻ���װ����</td>
    <td width="30%"><%=jc_jjdd_jhazrq%></td>
    <td align="right" width="20%">�ɼ����ֹʱ��</td>
    <td width="30%"><%=jc_jjdd_jhazrq%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">��ͬ��ע</td>
    <td colspan="3"><%=jc_jjdd_htbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#FFFFCC" width="20%"><b><font color="#CC0000">���ʽ</font></b></td>
    <td bgcolor="#FFFFCC" width="30%"><%
	cf.selectToken(out,"1+�ѽ��Ҿ߿�&2+����Ԥ����&3+����Ԥ����&4+�Ҿ�Ԥ����&5+ľ��Ԥ����&9+δ����",fkfs,true);
%></td>
    <td align="right" bgcolor="#FFFFCC" width="20%">&nbsp;</td>
    <td bgcolor="#FFFFCC" width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">����ȷ����</td>
    <td bgcolor="#FFFFCC" width="30%"><%=htqrr%></td>
    <td align="right" bgcolor="#FFFFCC" width="20%"> ����ȷ��ʱ��</td>
    <td bgcolor="#FFFFCC" width="30%"><%=htqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">����ȷ��˵��</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=htqrbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ҿ߹������</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pdgc%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ͳ��Ź������</td>
    <td bgcolor="#CCCCFF" width="30%"><%=xcmgc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ҿ߹�������</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pdgcmc%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ͳ��Ź�������</td>
    <td bgcolor="#CCCCFF" width="30%"><%=xcmgcmc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ҿ߹�Ӧ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=jjgys%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ͳ��Ź�Ӧ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=xcmgys%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ҿ�Ʒ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=jjppmc%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ͳ���Ʒ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=xcmppmc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ɹ�����</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pgcr%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">�ɹ���ʱ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pgcsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ɹ���˵��</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=pgcsm%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ƿ�ɹ���</td>
    <td bgcolor="#CCCCFF" width="30%"><%
	cf.radioToken(out,"Y+�ɹ���&N+�޻�",sfkgh,true);
%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">&nbsp;</td>
    <td bgcolor="#CCCCFF" width="30%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">����������</td>
    <td bgcolor="#CCCCFF" width="30%"><%=gcjsr%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">��������ʱ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=gcjssj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">��������˵��</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=gcjsbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">�����</td>
    <td width="30%"><%=jc_jjdd_rkr%> </td>
    <td width="20%" align="right"> ���ʱ��</td>
    <td width="30%"><%=jc_jjdd_rksj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">���˵��</td>
    <td colspan="3"><%=jc_jjdd_rksm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td height="24" colspan="4" align="center" bgcolor="#FFFFCC"> 
      <input type="button"  value="Э�̰�װʱ���¼" onClick="window.open('ViewJc_jjazsjjl.jsp?ddbh=<%=ddbh%>')" >
      <input type="button" value="���Ű�װ��¼"  onClick="window.open('ViewJc_jjazjl.jsp?ddbh=<%=ddbh%>')" >    </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">Э�̰�װʱ��</td>
    <td width="30%"><%=kazsj%></td>
    <td align="right" width="20%">Э�̰�װʱ��¼����</td>
    <td width="30%"><%=kazsjlrr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">��װʱ��˵��</td>
    <td colspan="3"><%=azsjbz%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">����װ֪ͨʱ��</td>
    <td width="30%"><%=aztzsj%></td>
    <td align="right" width="20%">����װ֪ͨ��</td>
    <td width="30%"><%=aztzr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">ʵ��װ¼����</td>
    <td bgcolor="#CCCCFF" width="30%"><%=azr%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">&nbsp;</td>
    <td bgcolor="#CCCCFF" width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">��ʼ��װʱ�� </td>
    <td bgcolor="#CCCCFF" width="30%"><%=ksazsj%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">��װ���ʱ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=sazrq%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">ʵ��װ˵��</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=azsm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">�ӳ�ԭ��</td>
    <td width="30%"><%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",ycyybm,true);
%></td>
    <td align="right" width="20%">��ʵ�ӳ�ԭ��</td>
    <td width="30%"><%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",zsycyybm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">�ӳٴ���״̬</td>
    <td width="30%"> <%
	cf.radioToken(out, "0+δ�ӳ�&1+�ӳ�δ��ʵ&2+�ӳ�ԭ����ʵ&3+�ӳ�ԭ����ʵ",ycclzt,true);
%> </td>
    <td align="right" width="20%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ӳٺ�ʵ���</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=ychsqk%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ӳٺ�ʵ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=ychsr%></td>
    <td align="right" bgcolor="#CCCCFF" width="20%">�ӳٺ�ʵʱ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=ychssj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">��֧��ΥԼ��</td>
    <td bgcolor="#CCCCFF" width="30%"> <%
	cf.radioToken(out, "Y+��Ҫ&N+����Ҫ",sfxwyj,true);
%> </td>
    <td align="right" bgcolor="#CCCCFF" width="20%">ΥԼ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=wyj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�������</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=jjfa%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">���ʱ��</td>
    <td bgcolor="#FFFFCC" width="30%"><%=wjsj%></td>
    <td align="right" bgcolor="#FFFFCC" width="20%">���¼����</td>
    <td bgcolor="#FFFFCC" width="30%"><%=wjlrr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">�Ƿ��빤������</td>
    <td bgcolor="#FFFFCC" width="30%"> <%
	cf.selectToken(out,"N+δ����&Y+�ѽ���",sfjs,true);
%> </td>
    <td align="right" bgcolor="#FFFFCC" width="20%">&nbsp;</td>
    <td bgcolor="#FFFFCC" width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">��������</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=jstx%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�۲�����</td>
    <td width="30%"><%=kclf%> </td>
    <td width="20%" align="right">�˵�ԭ��</td>
    <td width="30%"><%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm where jctdyybm='"+jctdyybm+"'",jctdyybm,false);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�˵�ʱ��</td>
    <td width="30%"> <%=jc_jjdd_tdsj%> </td>
    <td width="20%" align="right">�˵�������</td>
    <td width="30%"> <%=jc_jjdd_tdblr%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�˵�˵��</td>
    <td colspan="3"><%=jc_jjdd_tdsm%></td>
  </tr>
</table>

</body>
</html>
