<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckjgbz=(String)session.getAttribute("ckjgbz");

String khxm=null;
String xb=null;
String cqbm=null;
String xqbm=null;
String fwdz=null;
String lxfs=null;
String nlqjbm=null;
String zybm=null;
String fj=null;
String sjs=null;
String khlxbm=null;
String yjzxsj=null;
String zxysbm=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String hdbz=null;
String cgdz=null;
String yzxxbz=null;
String hdsfss=null;
String zxhfsj=null;
String hfjlh=null;
String sfxhf=null;
String hfrq=null;
String lfsj=null;
String ctsj=null;
String shbz=null;
String shsj=null;
String shr=null;
String qdsj=null;

String zxdm=null;
String zxzt=null;
String sbyybm=null;
String zxdjbm=null;
String lrr=null;
String lrsj=null;
String bz=null;

String bjjb=null;
String ywy=null;
String ssfgs=null;
String lfbz=null;
String ctbz=null;

String sjsfpsj=null;
String jhjfsj=null;
String hdr=null;
String zxdmfpsj=null;
String jzbz=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String sbyyxs=null;
String sbsj=null;
String louhao=null;
String sfzdzbj=null;
String dzbjze=null;
String khfwjlh=null;
String sjsjdjlh=null;
String dmjdjlh=null;

String sfjczjz=null;
String lfdjbz=null;
String lfdj=null;
String jlfdjsj=null;
String cxhdbm=null;
String hddjbz=null;
String hddj=null;
String jhddjsj=null;
String hth=null;
String lrkhxm=null;
String lrfwdz=null;
String lrlxfs=null;

String sjfbz=null;
String sjf=null;
String jsjfsj=null;
String email=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

String cxgtbz=null;
String cxgtsj=null;
String csgtbz=null;
String csgtsj=null;
String sczbjsj=null;
String zjzbjsj=null;
String qsjhtbz=null;
String qsjhtsj=null;
String sjhtje=null;
String ysshbz=null;
String ysshsj=null;
String ysshr=null;
String ysshyj=null;

String bjdysq=null;
String bjdysqsj=null;
String bjdysqr=null;
String tcmc=null;
String yxtxdz=null;
String sshybm=null;
String gmyx=null;
String ybjyx=null;
String zzystybj=null;
String zzydlgj=null;
String scbkhbh=null;
String khjl=null;
String xxlysm=null;

String jhctsj=null;
String jhcxgtsj=null;
String jhcsgtsj=null;
String jhzbjsj=null;
String khzyxz=null;
String sjhth=null;
String bjbbh=null;
String ysy=null;
String sgdmc=null;
String sgbz=null;
String hty=null;
String clgw=null;
String sfyckh=null;


double ysshdf=0;

String xxly="";
String jzsjs="";
String djbbh=null;
String zjxm=null;
String hyh=null;
String xqlx=null;
String sjsbh=null;
String pdqybm=null;

String sbkhlx=null;
String zxkhyxbm=null;
String hfcs=null;
String smcs=null;
String scsmsj=null;
String zjsmsj=null;
String xclfsj=null;

String scfksj=null;
String zjfksj=null;
double fkze=0;


String ywyssxz=null;
String ywybm=null;
String dianz=null;
String scbjl=null;

String hfwhkh=null;
String hfsbyybm=null;
String hfsbkhlx=null;
String hfsbyyxs=null;
String hfsbsj=null;

String sjhfsbyybm=null;
String sjhfsbkhlx=null;
String sjhfsbyyxs=null;
String sjhfsbsj=null;
String sjfjryjsj=null;

String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select pdqybm,clgw,sgbz,hty,xqlx,ysy,DECODE(crm_zxkhxx.bjdysq,'0','δ��Ȩ','1','�ɵ���') bjdysq,crm_zxkhxx.bjdysqr,crm_zxkhxx.bjdysqsj,ysshyj,ysshbz,ysshsj,ysshr,crm_zxkhxx.email,cxhdbmxq,cxhdbmzh,DECODE(sjfbz,'N','δ����Ʒ�','Y','�ѽ���Ʒ�','T','����Ʒ�') sjfbz,sjf,jsjfsj,lrlxfs,lrkhxm,lrfwdz,hth,DECODE(lfdjbz,'N','δ������','Y','�ѽ�����','T','�˶���') lfdjbz,lfdj,jlfdjsj,cxhdbm,DECODE(hddjbz,'N','δ������','Y','�ѽ�����','T','�˶���') hddjbz,hddj,jhddjsj,sfjczjz,sfzdzbj,dzbjze,khfwjlh,sjsjdjlh,dmjdjlh,louhao,sbsj,sbyyxs,ysrbm,rddqbm,hxwzbm,sjsbh,jzbz,sjsfpsj,jhjfsj,hdr,zxdmfpsj,lfbz,ctbz,crm_zxkhxx.ssfgs,ywy,bjjb,crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm as khxm,crm_zxkhxx.xb as xb,crm_zxkhxx.cqbm as cqbm,crm_zxkhxx.xqbm as xqbm,crm_zxkhxx.fwdz as fwdz,crm_zxkhxx.lxfs as lxfs,crm_zxkhxx.nlqjbm as nlqjbm,crm_zxkhxx.zybm as zybm,crm_zxkhxx.fj as fj,crm_zxkhxx.sjs as sjs,crm_zxkhxx.khlxbm as khlxbm,crm_zxkhxx.yjzxsj as yjzxsj,crm_zxkhxx.zxysbm as zxysbm,crm_zxkhxx.fwlxbm as fwlxbm,crm_zxkhxx.hxbm as hxbm,crm_zxkhxx.fwmj as fwmj,crm_zxkhxx.fgyqbm as fgyqbm,crm_zxkhxx.hdbz as hdbz,crm_zxkhxx.cgdz as cgdz,crm_zxkhxx.yzxxbz as yzxxbz,crm_zxkhxx.hdsfss as hdsfss,crm_zxkhxx.zxhfsj as zxhfsj,crm_zxkhxx.hfjlh as hfjlh,crm_zxkhxx.sfxhf as sfxhf,crm_zxkhxx.hfrq as hfrq,crm_zxkhxx.lfsj as lfsj,crm_zxkhxx.ctsj as ctsj,crm_zxkhxx.shbz as shbz,crm_zxkhxx.shsj as shsj,crm_zxkhxx.shr as shr,crm_zxkhxx.qdsj as qdsj,crm_zxkhxx.zxdm as zxdm,crm_zxkhxx.zxzt as zxzt,crm_zxkhxx.sbyybm as sbyybm,crm_zxkhxx.zxdjbm as zxdjbm,crm_zxkhxx.lrr as lrr,crm_zxkhxx.lrsj as lrsj,crm_zxkhxx.bz as bz ";
	ls_sql+=" ,crm_zxkhxx.cxgtbz,crm_zxkhxx.cxgtsj,crm_zxkhxx.csgtbz,crm_zxkhxx.csgtsj,crm_zxkhxx.sczbjsj,crm_zxkhxx.zjzbjsj,crm_zxkhxx.qsjhtbz,crm_zxkhxx.qsjhtsj,crm_zxkhxx.sjhtje";
	ls_sql+=" ,crm_zxkhxx.tcmc,yxtxdz,sshybm,gmyx,ybjyx,zzystybj,zzydlgj,scbkhbh,khjl,xxlysm";
	ls_sql+=" ,jhctsj,jhcxgtsj,jhcsgtsj,jhzbjsj,khzyxz,sjhth,bjbbh,ysshdf,sgdmc,djbbh,zjxm,hyh";
	ls_sql+=" ,sbkhlx,zxkhyxbm,hfcs,smcs,scsmsj,zjsmsj,xclfsj,scfksj,zjfksj,fkze,decode(sfyckh,'Y','��','N','��')sfyckh";
	ls_sql+=" ,crm_zxkhxx.ywybm,crm_zxkhxx.ywyssxz,crm_zxkhxx.dianz,crm_zxkhxx.scbjl";
	ls_sql+=" ,crm_zxkhxx.hfwhkh,crm_zxkhxx.hfsbyybm,crm_zxkhxx.hfsbkhlx,crm_zxkhxx.hfsbyyxs,crm_zxkhxx.hfsbsj";
	ls_sql+=" ,crm_zxkhxx.sjhfsbyybm,crm_zxkhxx.sjhfsbkhlx,crm_zxkhxx.sjhfsbyyxs,crm_zxkhxx.sjhfsbsj,crm_zxkhxx.sjfjryjsj";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_zxkhxx.zxdjbm=sq_dwxx.dwbh(+) and  crm_zxkhxx.khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.sgd=sq_sgd.sgd(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hfwhkh=cf.fillNull(rs.getString("hfwhkh"));
		hfsbyybm=cf.fillNull(rs.getString("hfsbyybm"));
		hfsbkhlx=cf.fillNull(rs.getString("hfsbkhlx"));
		hfsbyyxs=cf.fillNull(rs.getString("hfsbyyxs"));
		hfsbsj=cf.fillNull(rs.getDate("hfsbsj"));
		sjfjryjsj=cf.fillNull(rs.getDate("sjfjryjsj"));

		sjhfsbyybm=cf.fillNull(rs.getString("sjhfsbyybm"));
		sjhfsbkhlx=cf.fillNull(rs.getString("sjhfsbkhlx"));
		sjhfsbyyxs=cf.fillNull(rs.getString("sjhfsbyyxs"));
		sjhfsbsj=cf.fillNull(rs.getDate("sjhfsbsj"));

		ywybm=cf.fillNull(rs.getString("ywybm"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		dianz=cf.fillNull(rs.getString("dianz"));
		scbjl=cf.fillNull(rs.getString("scbjl"));

		scfksj=cf.fillNull(rs.getDate("scfksj"));
		zjfksj=cf.fillNull(rs.getDate("zjfksj"));
		fkze=rs.getDouble("fkze");
		sbkhlx=cf.fillNull(rs.getString("sbkhlx"));
		zxkhyxbm=cf.fillNull(rs.getString("zxkhyxbm"));
		hfcs=cf.fillNull(rs.getString("hfcs"));
		smcs=cf.fillNull(rs.getString("smcs"));
		scsmsj=cf.fillNull(rs.getDate("scsmsj"));
		zjsmsj=cf.fillNull(rs.getDate("zjsmsj"));
		xclfsj=cf.fillNull(rs.getDate("xclfsj"));

		pdqybm=cf.fillNull(rs.getString("pdqybm"));
		clgw=cf.fillNull(rs.getString("clgw"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		hty=cf.fillNull(rs.getString("hty"));
		xqlx=cf.fillNull(rs.getString("xqlx"));
		hyh=cf.fillNull(rs.getString("hyh"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		djbbh=cf.fillNull(rs.getString("djbbh"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		ysshdf=rs.getDouble("ysshdf");
		ysy=cf.fillNull(rs.getString("ysy"));
		jhctsj=cf.fillNull(rs.getDate("jhctsj"));
		jhcxgtsj=cf.fillNull(rs.getDate("jhcxgtsj"));
		jhcsgtsj=cf.fillNull(rs.getDate("jhcsgtsj"));
		jhzbjsj=cf.fillNull(rs.getDate("jhzbjsj"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));
		sjhth=cf.fillNull(rs.getString("sjhth"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));

		khjl=cf.fillNull(rs.getString("khjl"));
		xxlysm=cf.fillNull(rs.getString("xxlysm"));
		yxtxdz=cf.fillNull(rs.getString("yxtxdz"));
		sshybm=cf.fillNull(rs.getString("sshybm"));
		gmyx=cf.fillNull(rs.getString("gmyx"));
		ybjyx=cf.fillNull(rs.getString("ybjyx"));
		zzystybj=cf.fillNull(rs.getString("zzystybj"));
		zzydlgj=cf.fillNull(rs.getString("zzydlgj"));

		tcmc=cf.fillNull(rs.getString("tcmc"));
		bjdysq=cf.fillNull(rs.getString("bjdysq"));
		bjdysqr=cf.fillNull(rs.getString("bjdysqr"));
		bjdysqsj=cf.fillNull(rs.getString("bjdysqsj"));
		ysshyj=cf.fillNull(rs.getString("ysshyj"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshsj=cf.fillNull(rs.getDate("ysshsj"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		cxgtbz=cf.fillNull(rs.getString("cxgtbz"));
		cxgtsj=cf.fillNull(rs.getDate("cxgtsj"));
		csgtbz=cf.fillNull(rs.getString("csgtbz"));
		csgtsj=cf.fillNull(rs.getDate("csgtsj"));
		sczbjsj=cf.fillNull(rs.getDate("sczbjsj"));
		zjzbjsj=cf.fillNull(rs.getDate("zjzbjsj"));
		qsjhtbz=cf.fillNull(rs.getString("qsjhtbz"));
		qsjhtsj=cf.fillNull(rs.getDate("qsjhtsj"));
		sjhtje=cf.fillNull(rs.getString("sjhtje"));

		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		sjfbz=cf.fillNull(rs.getString("sjfbz"));
		sjf=cf.fillNull(rs.getString("sjf"));
		jsjfsj=cf.fillNull(rs.getDate("jsjfsj"));

		lrlxfs=cf.fillNull(rs.getString("lrlxfs"));
		lrkhxm=cf.fillNull(rs.getString("lrkhxm"));
		lrfwdz=cf.fillNull(rs.getString("lrfwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		lfdjbz=cf.fillNull(rs.getString("lfdjbz"));
		lfdj=cf.fillNull(rs.getString("lfdj"));
		jlfdjsj=cf.fillNull(rs.getDate("jlfdjsj"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		hddjbz=cf.fillNull(rs.getString("hddjbz"));
		hddj=cf.fillNull(rs.getString("hddj"));
		jhddjsj=cf.fillNull(rs.getDate("jhddjsj"));
		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));

		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		dzbjze=cf.fillNull(rs.getString("dzbjze"));
		khfwjlh=cf.fillNull(rs.getString("khfwjlh"));
		sjsjdjlh=cf.fillNull(rs.getString("sjsjdjlh"));
		dmjdjlh=cf.fillNull(rs.getString("dmjdjlh"));
		louhao=cf.fillNull(rs.getString("louhao"));
		sbsj=cf.fillNull(rs.getDate("sbsj"));
		sbyyxs=cf.fillNull(rs.getString("sbyyxs"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		sjsfpsj=cf.fillNull(rs.getDate("sjsfpsj"));
		jhjfsj=cf.fillNull(rs.getDate("jhjfsj"));
		hdr=cf.fillNull(rs.getString("hdr"));
		zxdmfpsj=cf.fillNull(rs.getDate("zxdmfpsj"));

		lfbz=cf.fillNull(rs.getString("lfbz"));
		ctbz=cf.fillNull(rs.getString("ctbz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		yzxxbz=cf.fillNull(rs.getString("yzxxbz"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		zxhfsj=cf.fillNull(rs.getDate("zxhfsj"));
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		lfsj=cf.fillNull(rs.getDate("lfsj"));
		ctsj=cf.fillNull(rs.getDate("ctsj"));
		shbz=cf.fillNull(rs.getString("shbz"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shr=cf.fillNull(rs.getString("shr"));
		qdsj=cf.fillNull(rs.getDate("qdsj"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		scbkhbh=cf.fillNull(rs.getString("scbkhbh"));
		sfyckh=cf.fillNull(rs.getString("sfyckh"));
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jzsjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select xxlymc";
	ls_sql+=" from  crm_khxxly,dm_xxlybm";
	ls_sql+=" where crm_khxxly.xxlybm=dm_xxlybm.xxlybm and crm_khxxly.khbh='"+khbh+"' and crm_khxxly.khlx='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xxly+=cf.fillNull(rs.getString("xxlymc"))+"��";
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
</head>

<body bgcolor="#FFFFFF">
<div align="center">��ѯ�ͻ���Ϣ</div> 
<div align="center">
  <input type="button" value="��ѯ�ط�" onClick="window.open('ViewZxhf.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input type="button" value="���ʦ��ѯ" onClick="window.open('ViewSjszx.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input type="button" value="�����ι�����" onClick="window.open('ViewYbj_cgsq.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input name="button6" type="button" onClick="window.open('/dhzx/dhzx/ViewYx_lqlpdj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="��ȡ��Ʒ">
  <input name="button2" type="button" onClick="window.open('ViewCwxx.jsp?khbh=<%=khbh%>')" value="������Ϣ">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_zxkhfwjl.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="�ͻ������¼">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_sjsjdjl.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="���ʦ�ӵ���¼">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_dmjdjl.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="����ӵ���¼">
  <BR>

  <input type="button" onClick="window.open('/dhzx/sjszxone/dybj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="���ӱ���">
  <input type="button" value="���Ϸ���" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxGlfxList.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input type="button" value="����ͳ��" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxYltjList.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewFjxx.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="������Ϣ">
  <input type="button" onClick="window.open('/dhzx/dhzx/ViewBjxm.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="������Ŀ">
  <input type="button" onClick="window.open('/dzbj/zxbjmx/ViewHbzbBj_fjxx.jsp?khbh=<%=khbh%>')"  value="����ָ��">
  <input type="button" onClick="window.open('/dhzx/dhzx/YyCpddCxList.jsp?khbh=<%=khbh%>')" value="��Ʒ����">
  <input name="button" type="button" onClick="window.open('/dhzx/dhzx/zkzsxx.jsp?khbh=<%=khbh%>')" value="�ۿ�����">
<%--  <input name="button" type="button" onClick="window.open('/dyht/dysjhtfj.jsp?khbh=<%=khbh%>')" value="��ƺ�ͬ��ӡ">
  <input name="button" type="button" onClick="window.open('/dyht/dytchtfj.jsp?khbh=<%=khbh%>')" value="�ײͺ�ͬ��ӡ">--%>
</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      ��ѯ״̬    </td>
    <td width="29%"> <%
	cf.selectToken(out,"0+δ�������&1+�������&2+�ύ�ɵ�&3+��ǩԼ&4+�ɵ�&5+�ɵ����δͨ��",zxzt,true);
%></td>
    <td width="21%" align="right"> 
      �ͻ����    </td>
    <td width="29%"><%=khbh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF">С������</td>
    <td><%=xqlx%></td>
    <td align="right">�ͻ���Դ����</td>
    <td><%=khzyxz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" bgcolor="#CCCCFF"> 
      <font color="#FF0000">*</font><b>�ͻ�����</b>    </td>
    <td width="29%"><%=khxm%>��<%cf.radioToken(out, "M+��&W+Ů",xb,true);%>��</td>
    <td width="21%" align="right"> 
      <font color="#FF0000">*</font><b><font color="#0000FF">�״�¼��ͻ�����</font></b>    </td>
    <td width="29%"><%=lrkhxm%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"><font color="#FF0000">*</font><b>�绰</b></td>
    <td width="29%"> 
      <input type="button" value="�鿴�绰" onClick="window.open('ViewZxDh.jsp?khbh=<%=khbh%>')">    </td>
    <td width="21%" align="right">�����ʼ�</td>
    <td width="29%"><%=email%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"><font color="#FF0000">*</font><b>���ݵ�ַ</b></td>
    <td width="29%" bgcolor="#CCCCFF"><%=fwdz%></td>
    <td width="21%" align="right"><font color="#FF0000">*</font><b><font color="#0000FF">�״�¼�뷿�ݵ�ַ</font></b></td>
    <td width="29%"><%=lrfwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF">�ͻ������ֹ�˾</td>
    <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%></td>
    <td align="right" bgcolor="#CCCCFF">�г����ͻ����</td>
    <td bgcolor="#CCCCFF"><%=scbkhbh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF"><strong>��ѯ����</strong></td>
    <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",zxdm,true);
%></td>
    <td align="right" bgcolor="#CCCCFF"><strong>�곤</strong></td>
    <td bgcolor="#CCCCFF"><%=dianz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF"><strong>�г���</strong></td>
    <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywybm+"'",ywybm,true);
	%></td>
    <td align="right" bgcolor="#CCCCFF"><strong>�г�������</strong></td>
    <td bgcolor="#CCCCFF"><%=scbjl%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF"><strong>���ʦ</strong></td>
    <td bgcolor="#CCCCFF"><%=sjs%><%=jzsjs%></td>
    <td align="right" bgcolor="#CCCCFF"><strong>���������</strong></td>
    <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
	%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF"><strong>ҵ��Ա</strong></td>
    <td bgcolor="#CCCCFF"><%=ywy%></td>
    <td align="right" bgcolor="#CCCCFF"><strong>�г���С��</strong></td>
    <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"'",ywyssxz,true);
	%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF">�ͻ�����</td>
    <td bgcolor="#CCCCFF"><%=khjl%></td>
    <td align="right" bgcolor="#CCCCFF">�ɵ����� </td>
    <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select pdqybm,pdqymc from dm_pdqybm where pdqybm='"+pdqybm+"'",pdqybm,true);
	%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">Ԥ��Ա</td>
    <td><%=ysy%></td>
    <td align="right">��ͼԱ</td>
    <td><%=hty%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���Ϲ���</td>
    <td><%=clgw%></td>
    <td align="right">�ʼ�</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ʩ����</td>
    <td><%=sgdmc%></td>
    <td align="right">�೤</td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Ա����</td>
    <td><%=hyh%></td>
    <td align="right">�ǼǱ����</td>
    <td><%=djbbh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Чͨ�ŵ�ַ</td>
    <td><%=yxtxdz%></td>
    <td align="right"><font color="#FF0000"><strong>�Ƿ�Զ�̿ͻ�</strong></font></td>
    <td><font color="#FF0000"><strong><%=sfyckh%></strong></font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��������</td>
    <td colspan="3"><%=gmyx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���������</td>
    <td colspan="3"><%=ybjyx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�������ʵ�������</td>
    <td><%=zzystybj%></td>
    <td align="right">������Ķ�������</td>
    <td><%=zzydlgj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Ϣ��Դ</td>
    <td colspan="3"><%=xxly%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Ϣ��Դ˵��</td>
    <td colspan="3"><%=xxlysm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��Ч��Ϣ��־</td>
    <td width="29%"><%
	cf.selectToken(out,"Y+��Ч��Ϣ&N+��Ч��Ϣ",yzxxbz,true);
%></td>
    <td width="21%" align="right">��װ��־</td>
    <td width="29%"><%
	cf.selectToken(out,"1+��װ&2+��װ",jzbz,true);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">�������</td>
    <td colspan="3"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">�ۿ���Ʒ</td>
    <td colspan="3"><%=cxhdbmxq%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" height="19">��������</td>
    <td colspan="3" height="19"><%=cxhdbmzh%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">�ײ�����</td>
    <td><%=tcmc%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><strong>�״θ���ʱ��</strong></font></td>
    <td><%=scfksj%></td>
    <td align="right"><strong><font color="#FF0000">�������ʱ��</font></strong></td>
    <td><%=zjfksj%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><strong>�����ܶ�</strong></font></td>
    <td><%=fkze%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><b>*</b></font><strong>ǩ��ƺ�ͬ��־</strong></td>
    <td><%
	cf.selectToken(out,"N+δǩ&Y+ǩ��ͬ",qsjhtbz,true);
%></td>
    <td align="right">��ͬ��</td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">ǩ��ƺ�ͬʱ��</td>
    <td><%=qsjhtsj%></td>
    <td align="right">��ƺ�ͬ���</td>
    <td><%=sjhtje%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#FF0000"><b>*</b></font><b>��Ʒѱ�־</b></td>
    <td><%=sjfbz%></td>
    <td align="right">ʵ����Ʒ�</td>
    <td><%=sjf%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">����Ʒ�ʱ��</td>
    <td><%=jsjfsj%></td>
    <td align="right"><strong><font color="#FF0000">��ƷѼ���ҵ��ʱ��</font></strong></td>
    <td><%=sjfjryjsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"><font color="#FF0000"><b>*</b></font><b>�Ƿ������ӱ���</b></td>
    <td width="29%"><%
	cf.selectToken(out,"N+δ��&Y+����",sfzdzbj,true);
%></td>
    <td width="21%" align="right">�ƻ������ӱ���ʱ��</td>
    <td width="29%"><%=jhzbjsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right" bgcolor="#FFFFCC">���ۼ���</td>
    <td width="29%"><%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%> </td>
    <td width="21%" align="right">���ӱ����ܶ�</td>
    <td width="29%"><%=dzbjze%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">���ӱ��۰汾��</td>
    <td colspan="3"><%=bjbbh%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">�״������ӱ���ʱ��</td>
    <td><%=sczbjsj%></td>
    <td align="right">��������ӱ���ʱ��</td>
    <td><%=zjzbjsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"><font color="#FF0000"><b>*</b></font><b>���������־</b></td>
    <td width="29%"><%=lfdjbz%></td>
    <td width="21%" align="right">��������</td>
    <td width="29%"><%=lfdj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">����������ʱ��</td>
    <td width="29%"><%=jlfdjsj%></td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"><font color="#FF0000"><b>*</b></font><b>������־</b></td>
    <td width="29%"><%=hddjbz%></td>
    <td width="21%" align="right">�����</td>
    <td width="29%"><%=hddj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">�������ʱ��</td>
    <td width="29%"><%=jhddjsj%></td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"> ������־ </td>
    <td><%
	cf.selectToken(out,"N+δ����&Y+������",lfbz,true);
%>    </td>
    <td align="right"> ����ʱ�� </td>
    <td><%=lfsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"> ��ƽ��ͼ��־ </td>
    <td><%
	cf.selectToken(out,"N+δ��ͼ&Y+�ѳ�ͼ",ctbz,true);
%>    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">�ƻ���ƽ��ͼʱ��</td>
    <td><%=jhctsj%></td>
    <td align="right">��ƽ��ͼʱ��</td>
    <td><%=ctsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">��Ч��ͼ��־</td>
    <td><%
	cf.selectToken(out,"N+δ��ͼ&Y+�ѳ�ͼ",cxgtbz,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">�ƻ���Ч��ͼʱ��</td>
    <td><%=jhcxgtsj%></td>
    <td align="right">��Ч��ͼʱ��</td>
    <td><%=cxgtsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">��ʩ��ͼ��־</td>
    <td><%
	cf.selectToken(out,"N+δ��ͼ&Y+�ѳ�ͼ",csgtbz,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#CCFFCC">�ƻ���ʩ��ͼʱ��</td>
    <td bgcolor="#CCFFCC"><%=jhcsgtsj%></td>
    <td align="right" bgcolor="#CCFFCC">��ʩ��ͼʱ��</td>
    <td bgcolor="#CCFFCC"><%=csgtsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#CCFFCC"> Ԥ����˱�־ </td>
    <td bgcolor="#CCFFCC"><%
	cf.selectToken(out,"N+δ����&B+�������&C+��������&Y+���ͨ��&M+���δͨ��&S+�޸ķ�����Ȩ",ysshbz,true);
%>    </td>
    <td align="right" bgcolor="#CCFFCC">Ԥ����˵÷�</td>
    <td bgcolor="#CCFFCC"><%=ysshdf%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"> Ԥ������� </td>
    <td><%=ysshr%> </td>
    <td align="right">Ԥ�����ʱ��</td>
    <td><%=ysshsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">Ԥ��������</td>
    <td colspan="3"><%=ysshyj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#FFFFCC"> ��Ϣ��˱�־ </td>
    <td bgcolor="#FFFFCC"><%
	cf.selectToken(out,"N+δ���&Y+�����",shbz,true);
%>    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"> ��Ϣ����� </td>
    <td><%=shr%> </td>
    <td align="right">��Ϣ���ʱ��</td>
    <td><%=shsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      �Ƿ���ط�    </td>
    <td width="29%"><%
	cf.selectToken(out,"Y+��ط�&N+����ط�",sfxhf,true);
%> </td>
    <td width="21%" align="right"> 
      �ط�����    </td>
    <td width="29%"><%=hfrq%> </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">�ط�����</td>
    <td><%
	cf.selectItem(out,"select zxkhyxbm,zxkhyxmc from dm_zxkhyxbm where zxkhyxbm='"+zxkhyxbm+"'",zxkhyxbm,true);
%></td>
    <td align="right">�طô���</td>
    <td><%=hfcs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" bgcolor="#CCCCFF"> 
      ���»ط�ʱ��    </td>
    <td width="29%"> <%=zxhfsj%> </td>
    <td width="21%" align="right"> 
      �طü�¼��    </td>
    <td width="29%"> <%=hfjlh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      ��ϵ�ͻ�    </td>
    <td width="29%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
    <td width="21%" align="right"> 
      ��������    </td>
    <td width="29%"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"> 
      С��/�ֵ�    </td>
    <td width="29%"><%=xqbm%> </td>
    <td width="21%" align="right" bgcolor="#CCCCFF"> 
      ¥��/���ƺ�    </td>
    <td width="29%"><%=louhao%> </td>
  </tr>
  <tr> 
    <td width="21%" bgcolor="#CCCCFF" align="right">�ȵ����</td>
    <td width="29%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where rddqbm='"+rddqbm+"'",rddqbm,true);
%> </td>
    <td width="21%" bgcolor="#CCCCFF" align="right">����λ��</td>
    <td width="29%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where hxwzbm='"+hxwzbm+"'",hxwzbm,true);
%> </td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">������ҵ</td>
    <td><%
	cf.selectItem(out,"select sshybm,sshymc from dm_sshybm order by sshybm",sshybm,true);
%></td>
    <td align="right">ְҵ</td>
    <td><%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm,true);
%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
    <td width="21%" align="right"> 
      ��������    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="21%" align="right" bgcolor="#CCFFCC"> 
      ������    </td>
    <td width="29%" bgcolor="#CCFFCC"><%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm where ysrbm='"+ysrbm+"'",ysrbm,true);
%> </td>
    <td width="21%" align="right"> 
      ����    </td>
    <td width="29%"> <%=fj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">�ƻ�����ʱ��</td>
    <td width="29%"><%=jhjfsj%></td>
    <td width="21%" align="right">Ԥ��װ��ʱ��</td>
    <td width="29%"><%=yjzxsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      װ��Ԥ��    </td>
    <td width="29%"><%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm,true);
%> </td>
    <td width="21%" align="right"> 
      ��������    </td>
    <td width="29%"><%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      ����    </td>
    <td width="29%"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
    <td width="21%" align="right"> 
      ���ڽ������    </td>
    <td width="29%"><%=fwmj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      ���Ҫ��    </td>
    <td width="29%"><%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm,true);
%> </td>
    <td width="21%" align="right"> 
      �ص��Ƿ���ʵ    </td>
    <td width="29%"><%
	cf.selectToken(out,"0+δ��ʵ&Y+��ʵ&N+����ʵ",hdsfss,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      �ص���־    </td>
    <td width="29%" bgcolor="#FFFFFF"> <%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz,true);
%> </td>
    <td width="21%" align="right"> 
      �ص���    </td>
    <td width="29%"><%=hdr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      �ص�װ�޵�ַ    </td>
    <td colspan="3"><%=cgdz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right"> 
      ��ѯ�������ʱ��    </td>
    <td width="29%" bgcolor="#FFFFCC"><%=zxdmfpsj%> </td>
    <td width="21%" align="right"> 
      ���ʦ����ʱ��    </td>
    <td width="29%"><%=sjsfpsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right" bgcolor="#FFFFCC"> 
      �ɵ�ԭ��    </td>
    <td width="29%"><%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm",sbyybm,true);
%> </td>
    <td width="21%" align="right"> 
      �ɵ�ʱ��    </td>
    <td width="29%"><%=sbsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">�ɵ��ͻ�����</td>
    <td colspan="3"><%=sbkhlx%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">�ɵ�ԭ������</td>
    <td colspan="3"><%=sbyyxs%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"> ��˷ɵ�ԭ�� </td>
    <td><%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm",hfsbyybm,true);
%>    </td>
    <td align="right"> ���ʱ�� </td>
    <td><%=hfsbsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">��˷ɵ��ͻ�����</td>
    <td colspan="3"><%=hfsbkhlx%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">��˷ɵ�ԭ������</td>
    <td colspan="3"><%=hfsbyyxs%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">�ط���طɵ��ͻ�</td>
    <td><%cf.radioToken(out,"Y+���&N+��",hfwhkh,true);%></td>
    <td align="right">�ط�ʱ��</td>
    <td><%=sjhfsbsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"> �ط÷ɵ�ԭ�� </td>
    <td><%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm",sjhfsbyybm,true);
%>    </td>
    <td align="right">�ط÷ɵ��ͻ�����</td>
    <td><%=sjhfsbkhlx%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right">�ط÷ɵ�ԭ������</td>
    <td colspan="3"><%=sjhfsbyyxs%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      ��ѯ�Ǽǲ���    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
%> </td>
    <td width="21%" align="right"> 
      ǩ��ʱ��    </td>
    <td width="29%"><%=qdsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right" bgcolor="#FFFFFF"> 
      ¼��ʱ��    </td>
    <td width="29%"> <%=lrsj%> </td>
    <td width="21%" align="right"> 
      ��Ϣ¼����    </td>
    <td width="29%"><%=lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">���۴�ӡ��Ȩ</td>
    <td><%=bjdysq%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">���۴�ӡ��Ȩʱ��</td>
    <td><%=bjdysqsj%></td>
    <td align="right">���۴�ӡ��Ȩ��</td>
    <td><%=bjdysqr%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">�ͻ������¼��</td>
    <td width="29%"><%=khfwjlh%></td>
    <td width="21%" align="right">���ʦ�ӵ���¼��</td>
    <td width="29%"><%=sjsjdjlh%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="21%" align="right">����ӵ���¼��</td>
    <td width="29%"><%=dmjdjlh%> </td>
    <td width="21%" align="right">�Ƿ񼯳ɿͻ�</td>
    <td width="29%"><%cf.radioToken(out, "1+��&2+��",sfjczjz,true);%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ԤԼ����ʱ��</td>
    <td><%=xclfsj%></td>
    <td align="right">���Ŵ���</td>
    <td><%=smcs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�״�����ʱ��</td>
    <td><%=scsmsj%></td>
    <td align="right">�������ʱ��</td>
    <td><%=zjsmsj%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td bgcolor="#FFFFFF" align="right">��ע</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
  </tr>
</table>

</body>
</html>