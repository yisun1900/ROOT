<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String jc_zcdd_ddbh=null;
String khbh=null;
String jc_zcdd_clgw=null;
String jc_zcdd_jkxz=null;
String jc_zcdd_jkdd=null;
String jc_zcdd_ddshbz=null;
String jc_zcdd_kjxsj=null;
String jc_zcdd_xclbz=null;
String jc_zcdd_tzclsj=null;
String jc_zcdd_sclsj=null;
String jc_zcdd_htshsj=null;
String jc_zcdd_tzshsj=null;
String jc_zcdd_sshsj=null;
String jc_zcdd_ycyybm=null;
String jc_zcdd_ycsm=null;
String jc_zcdd_ycclzt=null;
String jc_zcdd_zsycyybm=null;
String jc_zcdd_ychsqk=null;
String jc_zcdd_ychsr=null;
String jc_zcdd_ychssj=null;
String jc_zcdd_tdsj=null;
String jc_zcdd_tdblr=null;
String jc_zcdd_tdsm=null;
String jc_zcdd_sfjs=null;
String jc_zcdd_jstx=null;
String jc_zcdd_clzt=null;
String jc_zcdd_lrr=null;
String jc_zcdd_lrsj=null;
String jc_zcdd_dwbh=null;
String jc_zcdd_bz=null;
String jc_zcdd_xmzy=null;
String jc_zcdd_qhtsj=null;
String jc_zcdd_jhclsj=null;
String jc_zcdd_cltzr=null;
String jc_zcdd_sclr=null;
String jc_zcdd_tzshr=null;
String jc_zcdd_sshr=null;
String jhtzshsj=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String ddqrr=null;
String ddqrsj=null;
String zjxbh=null;
String wjlrr=null;
String wjsj=null;
String gysjslrr=null;
String gysjslrsj=null;

String kclf=null;
String jctdyybm=null;

String tzry=null;
String jhshsj=null;
String shqk=null;

String ztjjgw=null;

String shtzsm=null;
String tztbhsj=null;
String tztbhr=null;
String tbhtzry=null;
String jhtbhsj=null;
String stbhsj=null;
String stbhr=null;
String tbhqk=null;

String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;

double wdzje=0;
double hkze=0;
double zczkl=0;
double cbze=0;
double zjxcbze=0;
String dzyy=null;
double htcxhdje=0;
double zjxcxhdje=0;
double zqzjhze=0;
double zjhze=0;

double zqclf=0;
double zhclf=0;
double ycf=0;
double qtf=0;

double zqzjxclf=0;
double zhzjxclf=0;
double zjxycf=0;
double zjxqtf=0;

double htjsbl=0;
double zjxjsbl=0;
double alljsbl=0;

double zsje=0;
double zjxzsje=0;

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String ssfgs=null;
String ddlx=null;
String gys=null;
String ppmc=null;

String fkje=null;
String sqdj="";
String jjsjs="";
String zcfgsbh="";
String qddm="";
String jzsjs="";

String yddjsr=null;
String yddjssj=null;
String sxhtsfysh=null;
String sxhtshr=null;
String sxhtshsj=null;

String khjl=null;
String jsr=null;
String jssj=null;
String jstx=null;
String jssm=null;
double jsje=0;
double kcfy=0;

String sfck=null;
String cksj=null;
String ckr=null;
double ycksl=0;
double yckje=0;
double jmje=0;
String zctclx=null;
String zctcmc=null;
double zctcje=0;

double zcpclf=0;
double tjpclf=0;
double fdbl=0;
double khfdbl=0;
double tcjrbl=0;
double tjpfdbl=0;
double tjpkhfdbl=0;
double tjptcjrbl=0;

double azfjsbl=0;
double ycfjsbl=0;

double zcfk=0;
double htyjjrje=0;
double sskje=0;
String yjjzsj=null;
String tdjryjsj=null;

try {
	conn=cf.getConnection();
	ls_sql="select zsje,zjxzsje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh,qddm,jzsjs,gys,ppmc,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材','E','散客') ddlx,gysjslrsj,gysjslrr,jjsjs,shtzsm,tztbhsj,tztbhr,tbhtzry,jhtbhsj,stbhsj,stbhr,tbhqk,wjsj,wjlrr,zjxbh,ddqrr,ddqrsj,shqk,tzry,jhshsj,kclf,jctdyybm,zcdlbm,zcxlbm,ppbm,ztjjgw,jhtzshsj,jc_zcdd.ddbh as jc_zcdd_ddbh,jc_zcdd.khbh as khbh,jc_zcdd.clgw as jc_zcdd_clgw,jc_zcdd.jkxz as jc_zcdd_jkxz,jc_zcdd.jkdd as jc_zcdd_jkdd,jc_zcdd.ddshbz as jc_zcdd_ddshbz,jc_zcdd.kjxsj as jc_zcdd_kjxsj,jc_zcdd.xclbz as jc_zcdd_xclbz,jc_zcdd.tzclsj as jc_zcdd_tzclsj,jc_zcdd.sclsj as jc_zcdd_sclsj,jc_zcdd.htshsj as jc_zcdd_htshsj,jc_zcdd.tzshsj as jc_zcdd_tzshsj,jc_zcdd.sshsj as jc_zcdd_sshsj,jc_zcdd.ycyybm as jc_zcdd_ycyybm,jc_zcdd.ycsm as jc_zcdd_ycsm,jc_zcdd.ycclzt as jc_zcdd_ycclzt,jc_zcdd.zsycyybm as jc_zcdd_zsycyybm,jc_zcdd.ychsqk as jc_zcdd_ychsqk,jc_zcdd.ychsr as jc_zcdd_ychsr,jc_zcdd.ychssj as jc_zcdd_ychssj,jc_zcdd.tdsj as jc_zcdd_tdsj,jc_zcdd.tdblr as jc_zcdd_tdblr,jc_zcdd.tdsm as jc_zcdd_tdsm,jc_zcdd.sfjs as jc_zcdd_sfjs,jc_zcdd.jstx as jc_zcdd_jstx,jc_zcdd.clzt as jc_zcdd_clzt,jc_zcdd.lrr as jc_zcdd_lrr,jc_zcdd.lrsj as jc_zcdd_lrsj,jc_zcdd.dwbh as jc_zcdd_dwbh,jc_zcdd.bz as jc_zcdd_bz,jc_zcdd.xmzy as jc_zcdd_xmzy,jc_zcdd.qhtsj as jc_zcdd_qhtsj,jc_zcdd.jhclsj as jc_zcdd_jhclsj,jc_zcdd.cltzr as jc_zcdd_cltzr,jc_zcdd.sclr as jc_zcdd_sclr,jc_zcdd.tzshr as jc_zcdd_tzshr,jc_zcdd.sshr as jc_zcdd_sshr ";
	ls_sql+=" ,zczkl,dzyy,wdzje,jc_zcdd.hkze,cbze,zjxcbze,htcxhdje,zjxcxhdje,zqzjhze,zjhze ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,zqzjxclf,zhzjxclf,zjxycf,zjxqtf  ";
	ls_sql+=" ,yddjsr,yddjssj,sxhtsfysh,sxhtshr,sxhtshsj,khjl,kcfy,jc_zcdd.jstx,jssj,jsr,jsje,kcfy,jssm";
	ls_sql+=" ,DECODE(sfck,'1','未出库','2','部分出库','3','已出库') sfck,cksj,ckr,ycksl,yckje,jmje";
	ls_sql+=" ,zcpclf,tjpclf,fdbl,khfdbl,tcjrbl,tjpfdbl,tjpkhfdbl,tjptcjrbl,azfjsbl,ycfjsbl";
	ls_sql+=" ,htyjjrje,sskje,yjjzsj,tdjryjsj";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where jc_zcdd.ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htyjjrje=rs.getDouble("htyjjrje");
		sskje=rs.getDouble("sskje");
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdjryjsj=cf.fillNull(rs.getDate("tdjryjsj"));

		zcpclf=rs.getDouble("zcpclf");
		tjpclf=rs.getDouble("tjpclf");
		fdbl=rs.getDouble("fdbl");
		khfdbl=rs.getDouble("khfdbl");
		tcjrbl=rs.getDouble("tcjrbl");
		tjpfdbl=rs.getDouble("tjpfdbl");
		tjpkhfdbl=rs.getDouble("tjpkhfdbl");
		tjptcjrbl=rs.getDouble("tjptcjrbl");
		azfjsbl=rs.getDouble("azfjsbl");
		ycfjsbl=rs.getDouble("ycfjsbl");

		jmje=rs.getDouble("jmje");
		sfck=cf.fillNull(rs.getString("sfck"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		ckr=cf.fillNull(rs.getString("ckr"));
		ycksl=rs.getDouble("ycksl");
		yckje=rs.getDouble("yckje");

		zsje=rs.getDouble("zsje");
		zjxzsje=rs.getDouble("zjxzsje");
		khjl=cf.fillNull(rs.getString("khjl"));
		jstx=cf.fillNull(rs.getString("jc_zcdd_jstx"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jsje=rs.getDouble("jsje");
		jssm=cf.fillNull(rs.getString("jssm"));
		kcfy=rs.getDouble("kcfy");

		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		cbze=rs.getDouble("cbze");
		zjxcbze=rs.getDouble("zjxcbze");
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		zqclf=rs.getDouble("zqclf");
		zhclf=rs.getDouble("zhclf");
		ycf=rs.getDouble("ycf");
		qtf=rs.getDouble("qtf");
		zqzjxclf=rs.getDouble("zqzjxclf");
		zhzjxclf=rs.getDouble("zhzjxclf");
		zjxycf=rs.getDouble("zjxycf");
		zjxqtf=rs.getDouble("zjxqtf");

		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		zcfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
		gysjslrr=cf.fillNull(rs.getString("gysjslrr"));
		gysjslrsj=cf.fillNull(rs.getString("gysjslrsj"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		shtzsm=cf.fillNull(rs.getString("shtzsm"));
		tztbhsj=cf.fillNull(rs.getString("tztbhsj"));
		tztbhr=cf.fillNull(rs.getString("tztbhr"));
		tbhtzry=cf.fillNull(rs.getString("tbhtzry"));
		jhtbhsj=cf.fillNull(rs.getString("jhtbhsj"));
		stbhsj=cf.fillNull(rs.getString("stbhsj"));
		stbhr=cf.fillNull(rs.getString("stbhr"));
		tbhqk=cf.fillNull(rs.getString("tbhqk"));

		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		wjsj=cf.fillNull(rs.getString("wjsj"));
		zjxbh=cf.fillNull(rs.getString("zjxbh"));
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getString("ddqrsj"));

		shqk=cf.fillNull(rs.getString("shqk"));
		tzry=cf.fillNull(rs.getString("tzry"));
		jhshsj=cf.fillNull(rs.getString("jhshsj"));
		kclf=cf.fillNull(rs.getString("kclf"));
		jctdyybm=cf.fillNull(rs.getString("jctdyybm"));

		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		jhtzshsj=cf.fillNull(rs.getString("jhtzshsj"));
		jc_zcdd_ddbh=cf.fillNull(rs.getString("jc_zcdd_ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		jc_zcdd_clgw=cf.fillNull(rs.getString("jc_zcdd_clgw"));
		jc_zcdd_jkxz=cf.fillNull(rs.getString("jc_zcdd_jkxz"));
		jc_zcdd_jkdd=cf.fillNull(rs.getString("jc_zcdd_jkdd"));
		jc_zcdd_ddshbz=cf.fillNull(rs.getString("jc_zcdd_ddshbz"));
		jc_zcdd_kjxsj=cf.fillNull(rs.getString("jc_zcdd_kjxsj"));
		jc_zcdd_xclbz=cf.fillNull(rs.getString("jc_zcdd_xclbz"));
		jc_zcdd_tzclsj=cf.fillNull(rs.getString("jc_zcdd_tzclsj"));
		jc_zcdd_sclsj=cf.fillNull(rs.getString("jc_zcdd_sclsj"));
		jc_zcdd_htshsj=cf.fillNull(rs.getString("jc_zcdd_htshsj"));
		jc_zcdd_tzshsj=cf.fillNull(rs.getString("jc_zcdd_tzshsj"));
		jc_zcdd_sshsj=cf.fillNull(rs.getString("jc_zcdd_sshsj"));
		jc_zcdd_ycyybm=cf.fillNull(rs.getString("jc_zcdd_ycyybm"));
		jc_zcdd_ycsm=cf.fillNull(rs.getString("jc_zcdd_ycsm"));
		jc_zcdd_ycclzt=cf.fillNull(rs.getString("jc_zcdd_ycclzt"));
		jc_zcdd_zsycyybm=cf.fillNull(rs.getString("jc_zcdd_zsycyybm"));
		jc_zcdd_ychsqk=cf.fillNull(rs.getString("jc_zcdd_ychsqk"));
		jc_zcdd_ychsr=cf.fillNull(rs.getString("jc_zcdd_ychsr"));
		jc_zcdd_ychssj=cf.fillNull(rs.getString("jc_zcdd_ychssj"));
		jc_zcdd_tdsj=cf.fillNull(rs.getString("jc_zcdd_tdsj"));
		jc_zcdd_tdblr=cf.fillNull(rs.getString("jc_zcdd_tdblr"));
		jc_zcdd_tdsm=cf.fillNull(rs.getString("jc_zcdd_tdsm"));
		jc_zcdd_sfjs=cf.fillNull(rs.getString("jc_zcdd_sfjs"));
		jc_zcdd_jstx=cf.fillNull(rs.getString("jc_zcdd_jstx"));
		jc_zcdd_clzt=cf.fillNull(rs.getString("jc_zcdd_clzt"));
		jc_zcdd_lrr=cf.fillNull(rs.getString("jc_zcdd_lrr"));
		jc_zcdd_lrsj=cf.fillNull(rs.getString("jc_zcdd_lrsj"));
		jc_zcdd_dwbh=cf.fillNull(rs.getString("jc_zcdd_dwbh"));
		jc_zcdd_bz=cf.fillNull(rs.getString("jc_zcdd_bz"));
		jc_zcdd_xmzy=cf.fillNull(rs.getString("jc_zcdd_xmzy"));
		jc_zcdd_qhtsj=cf.fillNull(rs.getString("jc_zcdd_qhtsj"));
		jc_zcdd_jhclsj=cf.fillNull(rs.getString("jc_zcdd_jhclsj"));
		jc_zcdd_cltzr=cf.fillNull(rs.getString("jc_zcdd_cltzr"));
		jc_zcdd_sclr=cf.fillNull(rs.getString("jc_zcdd_sclr"));
		jc_zcdd_tzshr=cf.fillNull(rs.getString("jc_zcdd_tzshr"));
		jc_zcdd_sshr=cf.fillNull(rs.getString("jc_zcdd_sshr"));

		yddjsr=cf.fillNull(rs.getString("yddjsr"));
		yddjssj=cf.fillNull(rs.getDate("yddjssj"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		sxhtshr=cf.fillNull(rs.getString("sxhtshr"));
		sxhtshsj=cf.fillNull(rs.getDate("sxhtshsj"));
	}
	rs.close();
	ps.close();

	if (zhclf!=0)
	{
		htjsbl=cf.round(100-cbze*100/zhclf,2);
	}
	else{
		htjsbl=0;
	}



	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
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

	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dmdwbh+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and fklxbm='23' and gysbh='"+ppbm+"'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">
<div align="center">主材订单（订单编号：<%=ddbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      客户编号    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%=khbh%> </td>
    <td width="21%" align="right" bgcolor="#FFFFFF"> 
      合同号    </td>
    <td width="29%" bgcolor="#FFFFFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF">客户姓名</td>
    <td width="30%" bgcolor="#FFFFFF"><%=khxm%>（ 
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
    ）</td>
    <td width="21%" align="right" bgcolor="#FFFFFF">质检</td>
    <td width="29%" bgcolor="#FFFFFF"><%=zjxm%>（<%=zjdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF">房屋地址</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="20%" bgcolor="#FFFFFF" align="right">签约店面</td>
    <td width="30%" bgcolor="#FFFFFF"><%=dwmc%></td>
    <td width="21%" bgcolor="#FFFFFF" align="right">家装设计师</td>
    <td width="29%" bgcolor="#FFFFFF"><%=sjs%>（<%=sjsdh%>）</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      施工队    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=dzdh%>） </td>
    <td width="21%" align="right" bgcolor="#FFFFFF">家装签约日期</td>
    <td width="29%" bgcolor="#FFFFFF"><%=qyrq%></td>
  </tr>
  
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF">合同开工日期</td>
    <td width="30%" bgcolor="#FFFFFF"><%=kgrq%></td>
    <td width="21%" align="right" bgcolor="#FFFFFF">合同竣工日期</td>
    <td width="29%" bgcolor="#FFFFFF"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#FFFFFF">参加促销活动</td>
    <td colspan="3" bgcolor="#FFFFFF"> <%=cxhdbm%></td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4" bgcolor="#FFFFFF" height="24">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"><strong> 
      处理状态    </strong></td>
    <td width="30%" bgcolor="#FFFFFF"> <strong>
      <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt where clzt='"+jc_zcdd_clzt+"'",jc_zcdd_clzt,true);
%> 
    </strong></td>
    <td width="21%" align="right" bgcolor="#FFFFFF"><strong>订单类型</strong></td>
    <td width="29%" bgcolor="#FFFFFF"><strong><%=ddlx%></strong></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" bgcolor="#FFFFFF" align="right">主材大类</td>
    <td width="30%" bgcolor="#FFFFFF"> <%=zcdlbm%> </td>
    <td width="21%" align="right" bgcolor="#FFFFFF">子品牌</td>
    <td width="29%" bgcolor="#FFFFFF"><%=ppbm%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF">品牌</td>
    <td width="30%" bgcolor="#FFFFFF"><%=ppmc%></td>
    <td width="21%" align="right" bgcolor="#FFFFFF">供应商</td>
    <td width="29%" bgcolor="#FFFFFF"><%=gys%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      家居顾问    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%=jc_zcdd_clgw%></td>
    <td width="21%" align="right" bgcolor="#FFFFFF">签合同时间</td>
    <td width="29%" bgcolor="#FFFFFF"><%=jc_zcdd_qhtsj%></td>
  </tr>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF">订单确认人</td>
    <td><%=ddqrr%></td>
    <td align="right">订单确认时间</td>
    <td><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#FFFFFF">完结时间</td>
    <td bgcolor="#FFFFFF"><%=wjsj%></td>
    <td align="right" bgcolor="#FFFFFF">完结录入人</td>
    <td bgcolor="#FFFFFF"><%=wjlrr%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">远程费</td>
    <td bgcolor="#FFFFFF"><%=ycf%></td>
    <td align="right" bgcolor="#FFFFFF">安装辅料加工费</td>
    <td bgcolor="#FFFFFF"><%=qtf%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">正常品材料费</td>
    <td bgcolor="#FFFFFF"><%=zcpclf%></td>
    <td align="right" bgcolor="#FFFFFF">特价品材料费</td>
    <td bgcolor="#FFFFFF"><%=tjpclf%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">材料费</td>
    <td bgcolor="#FFFFFF"><%=zhclf%></td>
    <td align="right" bgcolor="#FFFFFF"><strong>合同总额</strong></td>
    <td bgcolor="#FFFFFF"><strong><%=hkze%></strong></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF"><strong>付款金额</strong></td>
    <td bgcolor="#FFFFFF"><strong><%=zcfk%>
      <input name="button5" type="button" onClick="window.open('/jcjj/zcdd/Cw_khfkjlCxList.jsp?ddbh=<%=ddbh%>')" value="订单付款信息"   >
    </strong></td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">财务审核付款金额</span></td>
    <td bgcolor="#FFFFFF"><strong><%=sskje%></strong></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">记入业绩时间</span></td>
    <td bgcolor="#FFFFFF"><strong><%=yjjzsj%></strong></td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">退单记入业绩时间</span></td>
    <td bgcolor="#FFFFFF"><strong><%=tdjryjsj%></strong></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">正常品结算比例</td>
    <td bgcolor="#FFFFFF"><%=fdbl%>％</td>
    <td align="right" bgcolor="#FFFFFF">特价品结算比例</td>
    <td bgcolor="#FFFFFF"><%=tjpfdbl%>％</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">远程费结算比例</td>
    <td bgcolor="#FFFFFF"><%=ycfjsbl%>％</td>
    <td align="right" bgcolor="#FFFFFF">安装辅料加工费结算比例</td>
    <td bgcolor="#FFFFFF"><%=azfjsbl%>％</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">材料成本金额</td>
    <td bgcolor="#FFFFFF"><%=cbze%></td>
    <td align="right" bgcolor="#FFFFFF">(材料费-成本)/材料费</td>
    <td bgcolor="#FFFFFF"><%=htjsbl%>％</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">结算总额</td>
    <td bgcolor="#FFFFFF"><%=cf.round(cbze+cf.round(ycf*ycfjsbl/100,2)+cf.round(qtf*azfjsbl/100,2),2)%></td>
    <td align="right" bgcolor="#FFFFFF">是否已结算</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectToken(out,"N+未结算&C+已选择结算&Y+已结算&M+结算已审核",jc_zcdd_sfjs,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">结算人</td>
    <td bgcolor="#FFFFFF"><%=jsr%></td>
    <td align="right" bgcolor="#FFFFFF">结算时间</td>
    <td bgcolor="#FFFFFF"><%=jssj%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right" bgcolor="#FFFFFF">正常品客户返点比例</td>
    <td width="30%" bgcolor="#FFFFFF"><%=khfdbl%>％</td>
    <td width="21%" align="right" bgcolor="#FFFFFF">特价品客户返点比例</td>
    <td width="29%" bgcolor="#FFFFFF"><%=tjpkhfdbl%>％</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">客户优惠金额</td>
    <td bgcolor="#FFFFFF"><%=cf.round(zcpclf*khfdbl/100+tjpclf*tjpkhfdbl/100,2)%></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">正常品提成记入比例</td>
    <td bgcolor="#FFFFFF"><%=tcjrbl%>％</td>
    <td align="right" bgcolor="#FFFFFF">特价品提成记入比例</td>
    <td bgcolor="#FFFFFF"><%=tjptcjrbl%>％</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">业绩记入金额</td>
    <td bgcolor="#FFFFFF"><%=htyjjrje%></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      退单时间    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%=jc_zcdd_tdsj%> </td>
    <td width="21%" align="right"> 
      退单办理人    </td>
    <td width="29%" bgcolor="#FFFFFF"> <%=jc_zcdd_tdblr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      退单原因    </td>
    <td width="30%" bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm where jctdyybm='"+jctdyybm+"'",jctdyybm,true);
%> </td>
    <td width="21%" align="right"> 
      扣测量费    </td>
    <td width="29%" bgcolor="#FFFFFF"><%=kclf%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">退单说明</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=jc_zcdd_tdsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      录入人    </td>
    <td width="30%" bgcolor="#FFFFFF"><%=jc_zcdd_lrr%></td>
    <td width="21%" align="right"> 
      录入时间    </td>
    <td width="29%" bgcolor="#FFFFFF"><%=jc_zcdd_lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      录入部门    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jc_zcdd_dwbh+"'",jc_zcdd_dwbh,true);
%> </td>
    <td width="21%" align="right">    </td>
    <td width="29%" bgcolor="#FFFFFF">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#FFFFFF">订单所属分公司</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zcfgsbh+"'",zcfgsbh,true);
%></td>
    <td align="right" bgcolor="#FFFFFF">订单所属店面</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">订单所属设计师</td>
    <td bgcolor="#FFFFFF"><%=jzsjs%></td>
    <td align="right" bgcolor="#FFFFFF">客户经理</td>
    <td bgcolor="#FFFFFF"><%=khjl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">备注</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=jc_zcdd_bz%></td>
  </tr>
</table>


</body>
</html>
