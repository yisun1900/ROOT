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

String fkje=null;
String sqdj="";


String jc_cgdd_ddbh=null;
String jc_cgdd_khbh=null;
String jc_cgdd_dj=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jc_cgdd_jhccsj=null;
String jc_cgdd_cgsjs=null;


String jc_cgdd_sccsj=null;
String jc_cgdd_ccbz=null;

String jc_cgdd_jhfcsj=null;
String jc_cgdd_sfcsj=null;
String jc_cgdd_fcbz=null;

String jc_cgdd_qhtsj=null;
String jc_cgdd_qhtr=null;
String jc_cgdd_htbz=null;
String jc_cgdd_tdsj=null;
String jc_cgdd_tdblr=null;
String jc_cgdd_tdsm=null;
String jc_cgdd_jhazrq=null;
String jc_cgdd_sazrq=null;
String clztmc=null;
String jc_cgdd_lrr=null;
String jc_cgdd_lrsj=null;
String jc_cgdd_bz=null;

String jc_cgdd_rksj=null;
String sq_dwxx_dwmc=null;
String jc_cgdd_rkr=null;
String jc_cgdd_rksm=null;

String jhccxgr=null;
String jhccxgsj=null;
String jhccxgyy=null;
String ccr=null;
String jhfcxgr=null;
String jhfcxgsj=null;
String jhfcxgyy=null;
String fcr=null;
String sdlsfxt=null;


String pdgc=null;
String pdr=null;
String pdsj=null;
String pdsm=null;

String sdks =null;
String tmpp=null;
String xtbc=null;
String blcz=null;
String jiaolian=null;
String kclf=null;
String jctdyybm=null;

String sfpsjs=null;
String sjsgpyybm=null;

String jc_cgdd_sjsdh="";


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
String cghs=null;
String tmhs=null;

String cgfgsbh=null;
String qddm=null;
String jzsjs=null;
String pdgcmc=null;
String gys=null;
String ppmc=null;
String fkfs=null;

double cgzkl=0;
double tmzkl=0;
double wjzkl=0;
double dqzkl=0;
String dzyy=null;
double cbze=0;

double gtbfje =0;
double tmbfje =0;
double wjhtze=0;
double dqhtze=0;
double htze=0;

double zqgtbfje =0;
double zqtmbfje =0;
double zqwjhtze=0;
double zqdqhtze=0;
double wdzje=0;

double gtzjje=0;
double tmzjje=0;
double wjzjje=0;
double dqzjje=0;
double zjhze=0;

double zqgtzjje=0;
double zqtmzjje=0;
double zqwjzjje=0;
double zqdqzjje=0;
double zqzjhze=0;

String dqpp=null;
String dqxh=null;
String khjl=null;

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";



try {
	conn=cf.getConnection();
	ls_sql="select jc_cgdd.fkfs,jc_cgdd.pdgcmc,jc_cgdd.gys,jc_cgdd.ppmc,jc_cgdd.fgsbh,jc_cgdd.qddm,jc_cgdd.jzsjs,tmhs,cghs,jc_cgdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.jgrq,crm_khxx.sgd,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.dwbh,cxhdbm,crm_khxx.fgsbh";
	ls_sql+=" ,jc_cgdd.aztzr,jc_cgdd.aztzsj,jc_cgdd.kazsj,jc_cgdd.kazsjlrr,jc_cgdd.azsjbz,jc_cgdd.azr,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.azsm,jc_cgdd.ycyybm,jc_cgdd.ycclzt,jc_cgdd.zsycyybm,jc_cgdd.ychsqk,jc_cgdd.ychsr,jc_cgdd.ychssj,jc_cgdd.sfxwyj,jc_cgdd.wyj,jc_cgdd.jjfa,jc_cgdd.wjsj,jc_cgdd.wjlrr,jc_cgdd.sfjs,jc_cgdd.jstx,jc_cgdd.htqrr,jc_cgdd.htqrsj,jc_cgdd.htqrbz,jc_cgdd.pgcr,jc_cgdd.pgcsj,jc_cgdd.pgcsm,jc_cgdd.sfkgh,jc_cgdd.gcjsr,jc_cgdd.gcjssj,jc_cgdd.gcjsbz,jc_cgdd.htbz,sjsgpyybm,sfpsjs,sdks,tmpp,xtbc,blcz,jiaolian,kclf,jctdyybm,pdgc,jc_cgdd.pdr,jc_cgdd.pdsj,jc_cgdd.pdsm,jc_cgdd.rkr jc_cgdd_rkr,jc_cgdd.rksm jc_cgdd_rksm,jhccxgr,jhccxgsj,jhccxgyy,ccr,jhfcxgr,jhfcxgsj,jhfcxgyy,fcr,sdlsfxt,jc_cgdd.ddbh as jc_cgdd_ddbh,jc_cgdd.khbh as jc_cgdd_khbh,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.clgw as clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.jhccsj as jc_cgdd_jhccsj,jc_cgdd.cgsjs as jc_cgdd_cgsjs,jc_cgdd.sccsj as jc_cgdd_sccsj,jc_cgdd.ccbz as jc_cgdd_ccbz,jc_cgdd.jhfcsj as jc_cgdd_jhfcsj,jc_cgdd.sfcsj as jc_cgdd_sfcsj,jc_cgdd.fcbz as jc_cgdd_fcbz,jc_cgdd.qhtsj as jc_cgdd_qhtsj,jc_cgdd.qhtr as jc_cgdd_qhtr,jc_cgdd.tdsj as jc_cgdd_tdsj,jc_cgdd.tdblr as jc_cgdd_tdblr,jc_cgdd.tdsm as jc_cgdd_tdsm,jc_cgdd.jhazrq as jc_cgdd_jhazrq,jc_cgdd.sazrq as jc_cgdd_sazrq,clztmc,jc_cgdd.lrr as jc_cgdd_lrr,jc_cgdd.lrsj as jc_cgdd_lrsj,jc_cgdd.bz as jc_cgdd_bz,jc_cgdd.rksj as jc_cgdd_rksj,sq_dwxx.dwmc as sq_dwxx_dwmc ";
	ls_sql+=" ,jc_cgdd.cgzkl,jc_cgdd.tmzkl,jc_cgdd.wjzkl,jc_cgdd.dqzkl,jc_cgdd.dzyy,jc_cgdd.cbze ";
	ls_sql+=" ,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.htze ";
	ls_sql+=" ,jc_cgdd.zqgtbfje,jc_cgdd.zqtmbfje,jc_cgdd.zqwjhtze,jc_cgdd.zqdqhtze,jc_cgdd.wdzje ";
	ls_sql+=" ,jc_cgdd.gtzjje,jc_cgdd.tmzjje,jc_cgdd.wjzjje,jc_cgdd.dqzjje,jc_cgdd.zjhze";
	ls_sql+=" ,jc_cgdd.zqgtzjje,jc_cgdd.zqtmzjje,jc_cgdd.zqwjzjje,jc_cgdd.zqdqzjje,jc_cgdd.zqzjhze,jc_cgdd.dqpp,jc_cgdd.dqxh,jc_cgdd.khjl";
	ls_sql+=" from  jc_cgdd,crm_khxx,sq_dwxx,jdm_cgddzt";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and jc_cgdd.dwbh=sq_dwxx.dwbh and  (jc_cgdd.ddbh='"+ddbh+"')  ";
	ls_sql+=" and jc_cgdd.clzt=jdm_cgddzt.clzt";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		cgzkl=rs.getDouble("cgzkl");
		tmzkl=rs.getDouble("tmzkl");
		wjzkl=rs.getDouble("wjzkl");
		dqzkl=rs.getDouble("dqzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		cbze=rs.getDouble("cbze");

		gtbfje=rs.getDouble("gtbfje");
		tmbfje=rs.getDouble("tmbfje");
		wjhtze=rs.getDouble("wjhtze");
		dqhtze=rs.getDouble("dqhtze");
		htze=rs.getDouble("htze");

		zqgtbfje=rs.getDouble("zqgtbfje");
		zqtmbfje=rs.getDouble("zqtmbfje");
		zqwjhtze=rs.getDouble("zqwjhtze");
		zqdqhtze=rs.getDouble("zqdqhtze");
		wdzje=rs.getDouble("wdzje");

		gtzjje=rs.getDouble("gtzjje");
		tmzjje=rs.getDouble("tmzjje");
		wjzjje=rs.getDouble("wjzjje");
		dqzjje=rs.getDouble("dqzjje");
		zjhze=rs.getDouble("zjhze");

		zqgtzjje=rs.getDouble("zqgtzjje");
		zqtmzjje=rs.getDouble("zqtmzjje");
		zqwjzjje=rs.getDouble("zqwjzjje");
		zqdqzjje=rs.getDouble("zqdqzjje");
		zqzjhze=rs.getDouble("zqzjhze");


		fkfs=cf.fillNull(rs.getString("fkfs"));
		pdgcmc=cf.fillNull(rs.getString("pdgcmc"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cgfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		tmhs=cf.fillNull(rs.getString("tmhs"));
		cghs=cf.fillNull(rs.getString("cghs"));
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


		
		jc_cgdd_htbz=cf.fillNull(rs.getString("htbz"));
		sjsgpyybm=cf.fillNull(rs.getString("sjsgpyybm"));
		sfpsjs=cf.fillNull(rs.getString("sfpsjs"));
		sdks=cf.fillNull(rs.getString("sdks"));
		tmpp=cf.fillNull(rs.getString("tmpp"));
		xtbc=cf.fillNull(rs.getString("xtbc"));
		blcz=cf.fillNull(rs.getString("blcz"));
		jiaolian=cf.fillNull(rs.getString("jiaolian"));
		kclf=cf.fillNull(rs.getString("kclf"));
		jctdyybm=cf.fillNull(rs.getString("jctdyybm"));

		
		pdgc=cf.fillNull(rs.getString("pdgc"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdsm=cf.fillNull(rs.getString("pdsm"));

		jc_cgdd_rkr=cf.fillNull(rs.getString("jc_cgdd_rkr"));
		jc_cgdd_rksm=cf.fillNull(rs.getString("jc_cgdd_rksm"));
		jhccxgr=cf.fillNull(rs.getString("jhccxgr"));
		jhccxgsj=cf.fillNull(rs.getDate("jhccxgsj"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		ccr=cf.fillNull(rs.getString("ccr"));
		jhfcxgr=cf.fillNull(rs.getString("jhfcxgr"));
		jhfcxgsj=cf.fillNull(rs.getDate("jhfcxgsj"));
		jhfcxgyy=cf.fillNull(rs.getString("jhfcxgyy"));
		fcr=cf.fillNull(rs.getString("fcr"));
		sdlsfxt=cf.fillNull(rs.getString("sdlsfxt"));

		
		jc_cgdd_ddbh=cf.fillNull(rs.getString("jc_cgdd_ddbh"));
		jc_cgdd_khbh=cf.fillNull(rs.getString("jc_cgdd_khbh"));
		jc_cgdd_dj=cf.fillNull(rs.getString("jc_cgdd_dj"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jc_cgdd_jhccsj=cf.fillNull(rs.getDate("jc_cgdd_jhccsj"));
		jc_cgdd_cgsjs=cf.fillNull(rs.getString("jc_cgdd_cgsjs"));
		jc_cgdd_sccsj=cf.fillNull(rs.getDate("jc_cgdd_sccsj"));
		jc_cgdd_ccbz=cf.fillNull(rs.getString("jc_cgdd_ccbz"));
		jc_cgdd_jhfcsj=cf.fillNull(rs.getDate("jc_cgdd_jhfcsj"));
		jc_cgdd_sfcsj=cf.fillNull(rs.getDate("jc_cgdd_sfcsj"));
		jc_cgdd_fcbz=cf.fillNull(rs.getString("jc_cgdd_fcbz"));
		jc_cgdd_qhtsj=cf.fillNull(rs.getDate("jc_cgdd_qhtsj"));
		jc_cgdd_qhtr=cf.fillNull(rs.getString("jc_cgdd_qhtr"));
		jc_cgdd_tdsj=cf.fillNull(rs.getDate("jc_cgdd_tdsj"));
		jc_cgdd_tdblr=cf.fillNull(rs.getString("jc_cgdd_tdblr"));
		jc_cgdd_tdsm=cf.fillNull(rs.getString("jc_cgdd_tdsm"));
		jc_cgdd_jhazrq=cf.fillNull(rs.getDate("jc_cgdd_jhazrq"));
		jc_cgdd_sazrq=cf.fillNull(rs.getDate("jc_cgdd_sazrq"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		jc_cgdd_lrr=cf.fillNull(rs.getString("jc_cgdd_lrr"));
		jc_cgdd_lrsj=cf.fillNull(rs.getDate("jc_cgdd_lrsj"));
		jc_cgdd_bz=cf.fillNull(rs.getString("jc_cgdd_bz"));
		jc_cgdd_rksj=cf.fillNull(rs.getDate("jc_cgdd_rksj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));

		dqpp=cf.fillNull(rs.getString("dqpp"));
		dqxh=cf.fillNull(rs.getString("dqxh"));
	}
	rs.close();
	ps.close();

	//�Ҿ����ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+jc_cgdd_cgsjs+"' and ssfgs='"+ssfgs+"' and zwbm='12'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jc_cgdd_sjsdh=cf.fillNull(rs.getString("dh"));
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
	ls_sql+=" where zwbm='04' and dwbh='"+qydm+"' and yhmc ='"+sjs+"'";
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
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where zwbm='05' and ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE8 {color: #FF0000; font-weight: bold; }
.STYLE9 {
	color: #990033;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">���񶩵� </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">�ͻ����</td>
    <td width="30%"><%=khbh%></td>
    <td align="right" width="19%">��ͬ��</td>
    <td width="31%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">�ͻ�����</td>
    <td width="30%"><%=khxm%>�� 
      <input type="button" value="�鿴�绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
      �� </td>
    <td align="right" width="19%">�μӴ����</td>
    <td width="31%"><%=cxhdbm%></td>
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
    <td align="right" width="19%">��װ���ʦ</td>
    <td width="31%"><%=sjs%>��<%=sjsdh%>��</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">ʩ����</td>
    <td width="30%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> ��<%=dzdh%>�� </td>
    <td align="right" width="19%">�೤</td>
    <td width="31%"><%=sgbz%>��<%=bzdh%>�� </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">��װǩԼ����</td>
    <td width="30%"><%=qyrq%> </td>
    <td align="right" width="19%">�ʼ�</td>
    <td width="31%"><%=zjxm%>��<%=zjdh%>�� </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">��ͬ��������</td>
    <td width="30%"><%=kgrq%> </td>
    <td align="right" width="19%">��ͬ��������</td>
    <td width="31%"><%=jgrq%> </td>
  </tr>
  
  <tr bgcolor="#99CCFF"> 
    <td width="20%" align="right">�����ֹ�˾</td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cgfgsbh+"'",cgfgsbh,true);
%> </td>
    <td width="19%" align="right">��������</td>
    <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="20%" align="right">��װ���ʦ</td>
    <td width="30%"><%=jzsjs%> </td>
    <td width="19%" align="right">�ͻ�����</td>
    <td width="31%"><%=khjl%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" width="20%">�������</td>
    <td width="30%"><%=jc_cgdd_ddbh%></td>
    <td align="right" width="19%"><span class="STYLE4">����״̬</span></td>
    <td width="31%"><span class="STYLE4"><%=clztmc%></span></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">��ĿרԱ</td>
    <td width="30%"><%=xmzy%></td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">פ��Ҿӹ���</td>
    <td width="30%"><%=clgw%> </td>
    <td width="19%" align="right">չ���Ҿӹ���</td>
    <td width="31%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">¼����</td>
    <td width="30%"> <%=jc_cgdd_lrr%> </td>
    <td width="19%" align="right">¼��ʱ��</td>
    <td width="31%"> <%=jc_cgdd_lrsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">¼�벿��</td>
    <td width="30%"> <%=sq_dwxx_dwmc%></td>
    <td width="19%" align="right"></td>
    <td width="31%"></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">��ע</td>
    <td colspan="3"><%=jc_cgdd_bz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�Ƿ��������ʦ</td>
    <td width="30%"><%
	cf.radioToken(out, "1+��&2+��",sfpsjs,true);
%></td>
    <td width="19%" align="right">�Ҿ����ʦ</td>
    <td width="31%"><%=jc_cgdd_cgsjs%>��<%=jc_cgdd_sjsdh%>��</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�ɵ���</td>
    <td width="30%"><%=pdr%></td>
    <td width="19%" align="right">�����ʦʱ��</td>
    <td width="31%"><%=pdsj%></td>
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
      <input type="button" name="Button2" value="���ʦ���ɼ�¼" onClick="window.open('ViewJc_cgsjsgpjl.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button22" value="���ʦ��ϵ�ͻ���¼" onClick="window.open('ViewJc_cgsjslxjl.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button" value="�鿴���ⵥ" onClick="window.open('ViewJc_cgccdmx.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button4" value="�鿴���ⵥ" onClick="window.open('ViewJc_cgfcdmx.jsp?ddbh=<%=ddbh%>')"></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">�ƻ�����ʱ��</td>
    <td colspan="3"><%=jc_cgdd_jhccsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�ƻ�����¼����</td>
    <td width="30%"><%=jhccxgr%></td>
    <td width="19%" align="right">�ƻ�����¼��ʱ��</td>
    <td width="31%"><%=jhccxgsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�ƻ����ⱸע</td>
    <td colspan="3"><%=jhccxgyy%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">ʵ����¼����</td>
    <td width="30%"><%=ccr%></td>
    <td width="19%" align="right">ʵ����ʱ��</td>
    <td width="31%"><%=jc_cgdd_sccsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">ʵ���ⱸע</td>
    <td colspan="3"><%=jc_cgdd_ccbz%></td>
  </tr>

  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">�ƻ�����ʱ��</td>
    <td width="30%"><%=jc_cgdd_jhfcsj%> </td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">�ƻ�����¼����</td>
    <td width="30%"><%=jhfcxgr%></td>
    <td width="19%" align="right">�ƻ�����¼��ʱ��</td>
    <td width="31%"><%=jhfcxgsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">�ƻ����ⱸע</td>
    <td colspan="3"><%=jhfcxgyy%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" width="20%">ˮ��·��ԭͼֽ�Ƿ���ͬ</td>
    <td width="30%"><%
	cf.radioToken(out, "Y+��ͬ&N+����ͬ",sdlsfxt,true);
%></td>
    <td align="right" width="19%">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">����¼����</td>
    <td width="30%"><%=fcr%> </td>
    <td width="19%" align="right">ʵ����ʱ��</td>
    <td width="31%"> <%=jc_cgdd_sfcsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" bgcolor="#CCFFCC" align="right">���ⱸע</td>
    <td colspan="3"><%=jc_cgdd_fcbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td colspan="4" align="center"> 
      <input type="button" name="Button" value="�鿴��ͬ��" onClick="window.open('ViewJc_cgdtmx.jsp?ddbh=<%=ddbh%>')">
      <input type="button" name="Button3" value="�鿴������" onClick="window.open('ViewJc_cgzjx.jsp?ddbh=<%=ddbh%>')">    </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�����ʽ</td>
    <td width="30%"><%=sdks %></td>
    <td width="19%" align="right">������</td>
    <td width="31%"><%=xtbc%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">����ɫ</td>
    <td width="30%"><%=cghs %></td>
    <td align="right" width="19%"><b></b></td>
    <td width="31%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">̨��Ʒ��</td>
    <td width="30%"><%=tmpp%></td>
    <td align="right" width="19%">̨�滨ɫ</td>
    <td width="31%"><%=tmhs%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">����Ʒ��</td>
    <td><%=dqpp%></td>
    <td align="right">�����ͺ�</td>
    <td><%=dqxh%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">����</td>
    <td width="30%"><%=jiaolian%></td>
    <td align="right" width="19%">��������</td>
    <td width="31%"><%=blcz%></td>
  </tr>
 <tr bgcolor="#FFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFFF">
 <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
 <tr bgcolor="#FFFFFF">
    <td align="right">�ɱ��ܶ�</td>
    <td><%=cbze%></td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="23%" align="right">&nbsp;</td>
    <td width="18%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ԭ��</td>
    <td colspan="4"><%=dzyy %></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>�����ͬ���-��ǰ</strong></td>
    <td width="18%"><%=zqgtbfje%></td>
    <td align="right"><span class="STYLE9">�����ۿ��ʣ�<%=cgzkl %></span></td>
    <td align="right"><span class="STYLE1">�����ͬ���-�ۺ�</span></td>
    <td><%=gtbfje %></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>̨���ͬ���-��ǰ</strong></td>
    <td width="18%"><%=zqtmbfje%></td>
    <td align="right"><span class="STYLE9">̨���ۿ��ʣ�<%=tmzkl %></span></td>
    <td align="right"><span class="STYLE1">̨���ͬ���-�ۺ�</span></td>
    <td><%=tmbfje %></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>����ͬ�ܶ�-��ǰ</strong></td>
    <td width="18%"><%=zqwjhtze%></td>
    <td align="right"><span class="STYLE9">����ۿ��ʣ�<%=wjzkl %></span></td>
    <td align="right"><span class="STYLE1">����ͬ�ܶ�-�ۺ�</span></td>
    <td><%=wjhtze%> </td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>������ͬ�ܶ�-��ǰ</strong></td>
    <td width="18%"><%=zqdqhtze%></td>
    <td align="right"><span class="STYLE9">�����ۿ��ʣ�<%=dqzkl %></span></td>
    <td align="right"><span class="STYLE1">������ͬ�ܶ�-�ۺ�</span></td>
    <td><%=dqhtze%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>δ���ۺ�ͬ��</strong></td>
    <td width="18%"><%=wdzje%></td>
    <td align="right">&nbsp;</td>
    <td align="right"><span class="STYLE1">��ͬ�ܶ�</span></td>
    <td><%=htze%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="5" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>������������-��ǰ</strong></td>
    <td width="18%"><%=zqgtzjje%></td>
    <td align="right">&nbsp;</td>
    <td align="right"><span class="STYLE3"><strong>������������-�ۺ�</strong></span></td>
    <td><%=gtzjje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>̨����������-��ǰ</strong></td>
    <td width="18%"><%=zqtmzjje%></td>
    <td align="right">&nbsp;</td>
    <td align="right"><span class="STYLE3"><strong>̨����������-�ۺ�</strong></span></td>
    <td><%=tmzjje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>�����������-��ǰ</strong></td>
    <td width="18%"><%=zqwjzjje%></td>
    <td align="right">&nbsp;</td>
    <td align="right"><span class="STYLE3"><strong>�����������-�ۺ�</strong></span></td>
    <td><%=wjzjje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>������������-��ǰ</strong></td>
    <td width="18%"><%=zqdqzjje%></td>
    <td align="right">&nbsp;</td>
    <td align="right"><span class="STYLE3"><strong>������������-�ۺ�</strong></span></td>
    <td><%=dqzjje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="23%" align="right"><strong>�������ܶ�-��ǰ</strong></td>
    <td width="18%"><%=zqzjhze%></td>
    <td align="right">&nbsp;</td>
    <td align="right"><span class="STYLE3"><strong>�������ܶ�-�ۺ�</strong></span></td>
    <td><%=zjhze%></td>
  </tr>
 </table>	</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> ǩ��ͬʱ��</td>
    <td width="30%"><%=jc_cgdd_qhtsj%></td>
    <td width="19%" align="right">ǩ��ͬ��</td>
    <td width="31%"><%=jc_cgdd_qhtr%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right" width="20%">�ƻ���װ����</td>
    <td width="30%"><%=jc_cgdd_jhazrq%></td>
    <td align="right" width="19%">�ɼ����ֹʱ��</td>
    <td width="31%"><%=jc_cgdd_jhazrq%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">��ͬ��ע</td>
    <td colspan="3"><%=jc_cgdd_htbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#FFFFCC" width="20%"><b><font color="#CC0000">���ʽ</font></b></td>
    <td bgcolor="#FFFFCC" width="30%"><font color="#CC0000"><%
	cf.selectToken(out,"1+�ѽ������&2+����Ԥ����&3+����Ԥ����&4+�Ҿ�Ԥ����&5+ľ��Ԥ����&9+δ����",fkfs,true);
%></font></td>
    <td align="right" bgcolor="#FFFFCC" width="19%">&nbsp;</td>
    <td bgcolor="#FFFFCC" width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">����ȷ����</td>
    <td bgcolor="#FFFFCC" width="30%"><%=htqrr%></td>
    <td align="right" bgcolor="#FFFFCC" width="19%"> ����ȷ��ʱ��</td>
    <td bgcolor="#FFFFCC" width="31%"><%=htqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">����ȷ��˵��</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=htqrbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ɹ�����</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pgcr%></td>
    <td align="right" bgcolor="#CCCCFF" width="19%">�ɹ���ʱ��</td>
    <td bgcolor="#CCCCFF" width="31%"><%=pgcsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ɹ���˵��</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=pgcsm%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ɵ��������</td>
    <td bgcolor="#CCCCFF" width="30%"><%=pdgc%></td>
    <td align="right" bgcolor="#CCCCFF" width="19%">��������</td>
    <td bgcolor="#CCCCFF" width="31%"><%=pdgcmc%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">��Ӧ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=gys%></td>
    <td align="right" bgcolor="#CCCCFF" width="19%">Ʒ��</td>
    <td bgcolor="#CCCCFF" width="31%"><%=ppmc%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�Ƿ�ɹ���</td>
    <td bgcolor="#CCCCFF" width="30%"><%
	cf.radioToken(out,"Y+�ɹ���&N+�޻�",sfkgh,true);
%></td>
    <td align="right" bgcolor="#CCCCFF" width="19%">&nbsp;</td>
    <td bgcolor="#CCCCFF" width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">����������</td>
    <td bgcolor="#CCCCFF" width="30%"><%=gcjsr%></td>
    <td align="right" bgcolor="#CCCCFF" width="19%">��������ʱ��</td>
    <td bgcolor="#CCCCFF" width="31%"><%=gcjssj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">��������˵��</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=gcjsbz%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">�����</td>
    <td width="30%"><%=jc_cgdd_rkr%> </td>
    <td width="19%" align="right"> ���ʱ��</td>
    <td width="31%"><%=jc_cgdd_rksj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">���˵��</td>
    <td colspan="3"><%=jc_cgdd_rksm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td height="24" colspan="4" align="center" bgcolor="#FFFFCC"> 
      <input type="button"  value="Э�̰�װʱ���¼" onClick="window.open('ViewJc_cgazsjjl.jsp?ddbh=<%=ddbh%>')" >
      <input type="button" value="���Ű�װ��¼"  onClick="window.open('ViewJc_cgazjl.jsp?ddbh=<%=ddbh%>')" >    </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">Э�̰�װʱ��</td>
    <td width="30%"><%=kazsj%></td>
    <td align="right" width="19%">Э�̰�װʱ��¼����</td>
    <td width="31%"><%=kazsjlrr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%"><span class="STYLE8">��װ����</span></td>
    <td colspan="3"><span class="STYLE8"><%=azsjbz%></span></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">����װ֪ͨʱ��</td>
    <td width="30%"><%=aztzsj%></td>
    <td align="right" width="19%">����װ֪ͨ��</td>
    <td width="31%"><%=aztzr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">ʵ��װ¼����</td>
    <td bgcolor="#CCCCFF" width="30%"><%=azr%></td>
    <td align="right" bgcolor="#CCCCFF" width="19%">&nbsp;</td>
    <td bgcolor="#CCCCFF" width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">��ʼ��װʱ�� </td>
    <td bgcolor="#CCCCFF" width="30%"><%=ksazsj%></td>
    <td align="right" bgcolor="#CCCCFF" width="19%">��װ���ʱ��</td>
    <td bgcolor="#CCCCFF" width="31%"><%=sazrq%> </td>
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
    <td align="right" width="19%">��ʵ�ӳ�ԭ��</td>
    <td width="31%"><%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",zsycyybm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">�ӳٴ���״̬</td>
    <td width="30%"> <%
	cf.radioToken(out, "0+δ�ӳ�&1+�ӳ�δ��ʵ&2+�ӳ�ԭ����ʵ&3+�ӳ�ԭ����ʵ",ycclzt,true);
%> </td>
    <td align="right" width="19%">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ӳٺ�ʵ���</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=ychsqk%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�ӳٺ�ʵ��</td>
    <td bgcolor="#CCCCFF" width="30%"><%=ychsr%></td>
    <td align="right" bgcolor="#CCCCFF" width="19%">�ӳٺ�ʵʱ��</td>
    <td bgcolor="#CCCCFF" width="31%"><%=ychssj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">��֧��ΥԼ��</td>
    <td bgcolor="#CCCCFF" width="30%"> <%
	cf.radioToken(out, "Y+��Ҫ&N+����Ҫ",sfxwyj,true);
%> </td>
    <td align="right" bgcolor="#CCCCFF" width="19%">ΥԼ��</td>
    <td bgcolor="#CCCCFF" width="31%"><%=wyj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#CCCCFF" width="20%">�������</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=jjfa%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">���ʱ��</td>
    <td bgcolor="#FFFFCC" width="30%"><%=wjsj%></td>
    <td align="right" bgcolor="#FFFFCC" width="19%">���¼����</td>
    <td bgcolor="#FFFFCC" width="31%"><%=wjlrr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">�Ƿ��빤������</td>
    <td bgcolor="#FFFFCC" width="30%"> <%
	cf.selectToken(out,"N+δ����&Y+�ѽ���",sfjs,true);
%> </td>
    <td align="right" bgcolor="#FFFFCC" width="19%">&nbsp;</td>
    <td bgcolor="#FFFFCC" width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" bgcolor="#FFFFCC" width="20%">��������</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=jstx%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�۲�����</td>
    <td width="30%"><%=kclf%> </td>
    <td width="19%" align="right">�˵�ԭ��</td>
    <td width="31%"><%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm where jctdyybm='"+jctdyybm+"'",jctdyybm,false);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�˵�ʱ��</td>
    <td width="30%"> <%=jc_cgdd_tdsj%> </td>
    <td width="19%" align="right">�˵�������</td>
    <td width="31%"> <%=jc_cgdd_tdblr%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">�˵�˵��</td>
    <td colspan="3"><%=jc_cgdd_tdsm%></td>
  </tr>
</table>

</body>
</html>
