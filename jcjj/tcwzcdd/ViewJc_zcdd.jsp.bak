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
String ckr=null;
String cksj=null;

String jhfcsj=null;
String tzfcsj=null;
String tzfclrr=null;
String fcsj=null;
String fclrr=null;
String fcsm=null;
String rksj=null;
String rklrr=null;
String rksm=null;

String khjl=null;
String jssj=null;
String jsr=null;
double jsje=0;
String jstx=null;
String jssm=null;

try {
	conn=cf.getConnection();
	ls_sql="select zjxcbze,cbze,wdzje,jc_zcdd.hkze,zczkl,dzyy,htcxhdje,zjxcxhdje,zqzjhze,zjhze  ,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh,qddm,jzsjs,gys,ppmc,DECODE(ddlx,'1','代销品订单','2','系统不存在品牌订单','3','补录合同','4','有库存订单') ddlx,gysjslrsj,gysjslrr,jjsjs,shtzsm,tztbhsj,tztbhr,tbhtzry,jhtbhsj,stbhsj,stbhr,tbhqk,wjsj,wjlrr,zjxbh,ddqrr,ddqrsj,shqk,tzry,jhshsj,kclf,jctdyybm,zcdlbm,zcxlbm,ppbm,ztjjgw,jhtzshsj,jc_zcdd.ddbh as jc_zcdd_ddbh,jc_zcdd.khbh as khbh,jc_zcdd.clgw as jc_zcdd_clgw,jc_zcdd.jkxz as jc_zcdd_jkxz,jc_zcdd.jkdd as jc_zcdd_jkdd,jc_zcdd.ddshbz as jc_zcdd_ddshbz,jc_zcdd.kjxsj as jc_zcdd_kjxsj,jc_zcdd.xclbz as jc_zcdd_xclbz,jc_zcdd.tzclsj as jc_zcdd_tzclsj,jc_zcdd.sclsj as jc_zcdd_sclsj,jc_zcdd.htshsj as jc_zcdd_htshsj,jc_zcdd.tzshsj as jc_zcdd_tzshsj,jc_zcdd.sshsj as jc_zcdd_sshsj,jc_zcdd.ycyybm as jc_zcdd_ycyybm,jc_zcdd.ycsm as jc_zcdd_ycsm,jc_zcdd.ycclzt as jc_zcdd_ycclzt,jc_zcdd.zsycyybm as jc_zcdd_zsycyybm,jc_zcdd.ychsqk as jc_zcdd_ychsqk,jc_zcdd.ychsr as jc_zcdd_ychsr,jc_zcdd.ychssj as jc_zcdd_ychssj,jc_zcdd.tdsj as jc_zcdd_tdsj,jc_zcdd.tdblr as jc_zcdd_tdblr,jc_zcdd.tdsm as jc_zcdd_tdsm,jc_zcdd.sfjs as jc_zcdd_sfjs,jc_zcdd.jstx as jc_zcdd_jstx,jssj,jsr,jsje,jssm,jc_zcdd.clzt as jc_zcdd_clzt,jc_zcdd.lrr as jc_zcdd_lrr,jc_zcdd.lrsj as jc_zcdd_lrsj,jc_zcdd.dwbh as jc_zcdd_dwbh,jc_zcdd.bz as jc_zcdd_bz,jc_zcdd.xmzy as jc_zcdd_xmzy,jc_zcdd.qhtsj as jc_zcdd_qhtsj,jc_zcdd.jhclsj as jc_zcdd_jhclsj,jc_zcdd.cltzr as jc_zcdd_cltzr,jc_zcdd.sclr as jc_zcdd_sclr,jc_zcdd.tzshr as jc_zcdd_tzshr,jc_zcdd.sshr as jc_zcdd_sshr ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf";
	ls_sql+=" ,yddjsr,yddjssj,sxhtsfysh,sxhtshr,sxhtshsj,ckr,cksj";
	ls_sql+=" ,jhfcsj,tzfcsj,tzfclrr,fcsj,fclrr,fcsm,rksj,rklrr,rksm,khjl";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where jc_zcdd.ddbh='"+ddbh+"'  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		zqclf=rs.getDouble("zqclf");
		zhclf=rs.getDouble("zhclf");
		ycf=rs.getDouble("ycf");
		qtf=rs.getDouble("qtf");
		zqzjxclf=rs.getDouble("zqzjxclf");
		zhzjxclf=rs.getDouble("zhzjxclf");
		zjxycf=rs.getDouble("zjxycf");
		zjxqtf=rs.getDouble("zjxqtf");

		zjxcbze=rs.getDouble("zjxcbze");
		cbze=rs.getDouble("cbze");
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

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
		jstx=cf.fillNull(rs.getString("jc_zcdd_jstx"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jsje=rs.getDouble("jsje");
		jssm=cf.fillNull(rs.getString("jssm"));

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
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));

		jhfcsj=cf.fillNull(rs.getDate("jhfcsj"));
		tzfcsj=cf.fillNull(rs.getDate("tzfcsj"));
		tzfclrr=cf.fillNull(rs.getString("tzfclrr"));
		fcsj=cf.fillNull(rs.getDate("fcsj"));
		fclrr=cf.fillNull(rs.getString("fclrr"));
		fcsm=cf.fillNull(rs.getString("fcsm"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		rklrr=cf.fillNull(rs.getString("rklrr"));
		rksm=cf.fillNull(rs.getString("rksm"));
	}
	rs.close();
	ps.close();

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


	if (yhjs.equals("G0"))
	{
		qye="&nbsp;";
		sjs="&nbsp;";
		sjsdh="&nbsp;";
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
</head>

<body bgcolor="#FFFFFF">
<div align="center">
<div align="center">主材订单（订单编号：<%=ddbh%>） 
</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF"> 
      客户编号    </td>
    <td width="30%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="290" align="right" bgcolor="#CCCCFF"> 
      合同号    </td>
    <td width="29%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">客户姓名</td>
    <td width="30%"><%=khxm%>（ 
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
      ）</td>
    <td width="290" align="right">质检</td>
    <td width="29%"><%=zjxm%>（<%=zjdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="20%" bgcolor="#CCCCFF" align="right">签约店面</td>
    <td width="30%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="290" bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td width="29%" bgcolor="#CCCCFF"><%=sjs%>（<%=sjsdh%>）</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> 
      施工队    </td>
    <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=dzdh%>） </td>
    <td width="290" align="right"> 
      班长    </td>
    <td width="29%"><%=sgbz%>（<%=bzdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right"> 
      家装签约日期    </td>
    <td width="30%"> <%=qyrq%> </td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">合同开工日期</td>
    <td width="30%"><%=kgrq%></td>
    <td width="290" align="right">合同竣工日期</td>
    <td width="29%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">参加促销活动</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4" bgcolor="#FFFFFF" height="24">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC"><strong> 
      处理状态    </strong></td>
    <td width="30%"> <strong>
      <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt where clzt='"+jc_zcdd_clzt+"'",jc_zcdd_clzt,true);
%> 
    </strong></td>
    <td width="290" align="right"><strong>订单类型</strong></td>
    <td width="29%"><strong><%=ddlx%></strong></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right"><strong>手写合同是否已审核</strong></td>
    <td><%
	cf.selectToken(out,"M+非手写合同&Y+已审核&N+未审核",sxhtsfysh,true);
%></td>
    <td align="right">产品类型</td>
    <td><%
	cf.selectToken(out,"1+非定制式产品&2+定制式产品",jc_zcdd_xclbz,true);
%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">手写合同审核人</td>
    <td><%=sxhtshr%></td>
    <td align="right">手写合同审核时间</td>
    <td><%=sxhtshsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">完结时间</td>
    <td width="30%"><%=wjsj%></td>
    <td width="290" align="right">完结录入人</td>
    <td width="29%"><%=wjlrr%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">订单所属分公司</td>
    <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zcfgsbh+"'",zcfgsbh,true);
%></td>
    <td width="290" align="right">订单所属店面</td>
    <td width="29%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" bgcolor="#CCFFCC" align="right">订单所属设计师</td>
    <td width="30%" bgcolor="#CCFFCC"><%=jzsjs%></td>
    <td width="290" align="right" bgcolor="#CCFFCC">客户经理</td>
    <td width="29%" bgcolor="#CCFFCC"><%=khjl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" bgcolor="#FFFFFF" align="right">主材大类</td>
    <td width="30%"> <%=zcdlbm%> </td>
    <td width="290" align="right">主材小类</td>
    <td width="29%"><%=zcxlbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">子品牌</td>
    <td width="30%"><%=ppbm%></td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">品牌</td>
    <td width="30%"><%=ppmc%></td>
    <td width="290" align="right">供应商</td>
    <td width="29%"><%=gys%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">项目专员</td>
    <td width="30%"><%=jc_zcdd_xmzy%></td>
    <td width="290" align="right">家居设计师</td>
    <td width="29%"><%=jjsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"> 
      驻店家居顾问    </td>
    <td width="30%"> <%=jc_zcdd_clgw%> </td>
    <td width="290" align="right"> 
      展厅家居顾问    </td>
    <td width="29%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">预订单接收人</td>
    <td><%=yddjsr%></td>
    <td align="right">预订单接收时间</td>
    <td><%=yddjssj%></td>
  </tr>
  
  <tr bgcolor="#CCFFCC">
    <td align="right" bgcolor="#CCFFCC">计划测量时间</td>
    <td><%=jc_zcdd_jhclsj%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC"> 
      测量通知录入人    </td>
    <td width="30%"> <%=jc_zcdd_cltzr%></td>
    <td width="290" align="right"> 
      发测量通知时间    </td>
    <td width="29%"><%=jc_zcdd_tzclsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right"> 
      实测量人    </td>
    <td width="30%"> <%=jc_zcdd_sclr%></td>
    <td width="290" align="right"> 
      实测量时间    </td>
    <td width="29%"><%=jc_zcdd_sclsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">计划复尺时间</td>
    <td><%=jhfcsj%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">通知复尺时间</td>
    <td><%=tzfcsj%></td>
    <td align="right">通知复尺录入人</td>
    <td><%=tzfclrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">实复尺时间</td>
    <td><%=fcsj%></td>
    <td align="right">实复尺录入人</td>
    <td><%=fclrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">实复尺说明</td>
    <td colspan="3"><%=fcsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">入库时间</td>
    <td><%=rksj%></td>
    <td align="right">入库录入人</td>
    <td><%=rklrr%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">入库说明</td>
    <td colspan="3"><%=rksm%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">客户交款性质</td>
    <td width="30%"><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jc_zcdd_jkxz,true);
%></td>
    <td width="290" align="right">交款地点</td>
    <td width="29%"><%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jc_zcdd_jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"> 
      签合同时间    </td>
    <td width="30%"><%=jc_zcdd_qhtsj%> </td>
    <td width="290" align="right"> 
      可减项截止时间    </td>
    <td width="29%"><%=jc_zcdd_kjxsj%> </td>
  </tr>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right"><b><font color="#0000FF">订单折扣</font></b></td>
    <td width="30%"><%=zczkl%> </td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right"><b><font color="#0000FF">打折原因</font></b></td>
    <td colspan="3"><%=dzyy%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>折前－合同材料费</strong></td>
    <td><%=zqclf%></td>
    <td align="right"><strong>折后－合同材料费</strong></td>
    <td><%=zhclf%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>合同远程费</strong></td>
    <td><%=ycf%></td>
    <td align="right"><strong>合同其它费</strong></td>
    <td><%=qtf%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><b>折前－合同总额</b></td>
    <td><%=wdzje%></td>
    <td align="right"><b>折后－合同总额</b></td>
    <td><%=hkze%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>折前－增减项材料费</strong></td>
    <td><%=zqzjxclf%></td>
    <td align="right"><strong>折后－增减项材料费</strong></td>
    <td><%=zhzjxclf%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>增减项远程费</strong></td>
    <td><%=zjxycf%></td>
    <td align="right"><strong>增减项其它费</strong></td>
    <td><%=zjxqtf%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><b>折前－增减项总计</b></td>
    <td><%=zqzjhze%></td>
    <td align="right"><b>折后－增减项总计</b></td>
    <td><%=zjhze%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><b>折前－总计</b> </td>
    <td><%=cf.formatDouble(wdzje+zqzjhze)%> </td>
    <td align="right"><b>折后－总计</b> </td>
    <td><%=cf.formatDouble(hkze+zjhze)%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right"><b>计入促销活动金额</b></td>
    <td width="30%"><%=htcxhdje%><font color="#FF0000">（<b>合同</b>）</font></td>
    <td width="290" align="right"><b>计入促销活动金额</b></td>
    <td width="29%"><%=zjxcxhdje%><font color="#FF0000">（<b>增减项</b>）</font></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td width="20%" align="right"><b>计入促销活动金额</b></td>
    <td width="30%"><%=cf.formatDouble(htcxhdje+zjxcxhdje)%>
	<font color="#FF0000">（<b>增减后合计</b>）</font></td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"><font color="#0000FF">品牌是否有优惠</font></td>
    <td width="30%"><%
	cf.radioToken(out,"N+否&Y+是",sfyyh,true);
%></td>
    <td width="290" align="right"><font color="#0000FF">优惠期</font></td>
    <td width="29%">(<%=yhkssj%>)－－(<%=yhjzsj%>)</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"><font color="#0000FF">优惠内容</font></td>
    <td colspan="3"><%=yhnr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">最新增减项编号</td>
    <td width="30%"><%=zjxbh%> 
      <input type="button" value="增减项记录" onClick="window.open('ViewJc_zjxjl.jsp?ddbh=<%=ddbh%>')" name="button3">    </td>
    <td width="290" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">订单确认人</td>
    <td width="30%"><%=ddqrr%></td>
    <td width="290" align="right">订单确认时间</td>
    <td width="29%"><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right" bgcolor="#CCCCFF">供应商接收录入人</td>
    <td width="30%" bgcolor="#CCCCFF"><%=gysjslrr%></td>
    <td width="290" align="right">供应商接收录入时间</td>
    <td width="29%" bgcolor="#CCCCFF"><%=gysjslrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC"> 
      等待送货通知    </td>
    <td width="30%" bgcolor="#CCFFCC"><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",jc_zcdd_ddshbz,true);
%> </td>
    <td width="290" align="right">合同送货时间 </td>
    <td width="29%" bgcolor="#CCFFCC"><%=jc_zcdd_htshsj%> </td>
  </tr>
  
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC">通知送货人员</td>
    <td width="30%" bgcolor="#CCFFCC"><%=tzry%></td>
    <td width="290" align="right">计划送货时间</td>
    <td width="29%" bgcolor="#CCFFCC"><%=jhshsj%> 
      <input type="button" value="送货时间记录" onClick="window.open('ViewJc_zcshsjjl.jsp?ddbh=<%=ddbh%>')" name="button">    </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">送货通知说明</td>
    <td colspan="3" bgcolor="#CCFFCC"><%=shtzsm%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC"> 
      发送货通知人    </td>
    <td width="30%" bgcolor="#CCFFCC"><%=jc_zcdd_tzshr%> </td>
    <td width="290" align="right"> 
      发送货通知时间    </td>
    <td width="29%" bgcolor="#CCFFCC"><%=jc_zcdd_tzshsj%> </td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td align="right">出库人</td>
    <td><%=ckr%></td>
    <td align="right">出库时间</td>
    <td><%=cksj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right" bgcolor="#CCFFCC"> 
      实送货人    </td>
    <td width="30%" bgcolor="#CCFFCC"> <%=jc_zcdd_sshr%></td>
    <td width="290" align="right"> 
      实送货时间    </td>
    <td width="29%" bgcolor="#CCFFCC"> <%=jc_zcdd_sshsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="20%" align="right">送货情况</td>
    <td colspan="3" bgcolor="#CCFFCC"><%=shqk%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="20%" align="right" bgcolor="#E8E8FF">发退补货通知时间</td>
    <td width="30%" bgcolor="#E8E8FF"><%=tztbhsj%> </td>
    <td width="290" align="right">发退补货通知人</td>
    <td width="29%" bgcolor="#E8E8FF"><%=tztbhr%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="20%" align="right" bgcolor="#E8E8FF">退补货通知人员</td>
    <td width="30%" bgcolor="#E8E8FF"><%=tbhtzry%></td>
    <td width="290" align="right">约定退补货时间</td>
    <td width="29%" bgcolor="#E8E8FF"><%=jhtbhsj%> 
      <input type="button" value="退补货记录" onClick="window.open('ViewJc_zctbhjl.jsp?ddbh=<%=ddbh%>')" name="button2">    </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="20%" align="right" bgcolor="#E8E8FF">实退补货时间</td>
    <td width="30%" bgcolor="#E8E8FF"><%=stbhsj%></td>
    <td width="290" align="right">实退补货人</td>
    <td width="29%" bgcolor="#E8E8FF"><%=stbhr%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="20%" align="right">退补货情况</td>
    <td colspan="3" bgcolor="#E8E8FF"><%=tbhqk%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      延迟处理状态    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%
	cf.selectToken(out,"1+延迟未核实&2+延迟原因属实&3+延迟原因不属实&4+延迟已处理",jc_zcdd_ycclzt,true);
%> </td>
    <td width="290" align="right"> 
      真实延迟原因    </td>
    <td width="29%" bgcolor="#FFFFFF"> <%=jc_zcdd_zsycyybm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      延迟原因    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%=jc_zcdd_ycyybm%> </td>
    <td width="290" align="right"> 
      延迟说明    </td>
    <td width="29%" bgcolor="#FFFFFF"> <%=jc_zcdd_ycsm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      延迟核实情况    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%=jc_zcdd_ychsqk%> </td>
    <td width="290" align="right"> 
      延迟核实人    </td>
    <td width="29%" bgcolor="#FFFFFF"> <%=jc_zcdd_ychsr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      延迟核实时间    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%=jc_zcdd_ychssj%> </td>
    <td width="290" align="right">    </td>
    <td width="29%" bgcolor="#FFFFFF">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      退单时间    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%=jc_zcdd_tdsj%> </td>
    <td width="290" align="right"> 
      退单办理人    </td>
    <td width="29%" bgcolor="#FFFFFF"> <%=jc_zcdd_tdblr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      退单原因    </td>
    <td width="30%" bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm where jctdyybm='"+jctdyybm+"'",jctdyybm,true);
%> </td>
    <td width="290" align="right"> 
      扣测量费    </td>
    <td width="29%" bgcolor="#FFFFFF"><%=kclf%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">退单说明</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=jc_zcdd_tdsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFCC"> 
      是否已结算    </td>
    <td width="30%" bgcolor="#FFFFCC"> <%
	cf.selectToken(out,"N+未结算&Y+已结算",jc_zcdd_sfjs,true);
%> </td>
    <td width="290" align="right" bgcolor="#FFFFCC">结算金额</td>
    <td width="29%" bgcolor="#FFFFCC"><%=jsje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">结算人</td>
    <td bgcolor="#FFFFCC"><%=jsr%></td>
    <td align="right" bgcolor="#FFFFCC">结算时间</td>
    <td bgcolor="#FFFFCC"><%=jssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">结算提醒</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=jstx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">结算说明</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=jssm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      录入人    </td>
    <td width="30%" bgcolor="#FFFFFF"><%=jc_zcdd_lrr%></td>
    <td width="290" align="right"> 
      录入时间    </td>
    <td width="29%" bgcolor="#FFFFFF"><%=jc_zcdd_lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right" bgcolor="#FFFFFF"> 
      录入部门    </td>
    <td width="30%" bgcolor="#FFFFFF"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jc_zcdd_dwbh+"'",jc_zcdd_dwbh,true);
%> </td>
    <td width="290" align="right">    </td>
    <td width="29%" bgcolor="#FFFFFF">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">备注</td>
    <td colspan="3" bgcolor="#FFFFFF"><%=jc_zcdd_bz%></td>
  </tr>
</table>
<center>
  <b>订单明细</b> 
</center>
<table border="1" width="340%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50px">类型</td>
	<td  width="80px">手写标志</td>
	<td  width="110px">主材编码</td>
	<td  width="280px" bgcolor="#CCCCCC">主材名称</td>
	<td  width="280px">型号</td>
	<td  width="280px">规格</td>
	<td  width="110px" >最小起订量</td>
	<td  width="140px" bgcolor="#CC99FF">铺装位置</td>
	<td  width="140px" bgcolor="#CC99FF">颜色</td>
	<td  width="90px">折前实销单价</td>
	<td  width="90px">折扣</td>
	<td  width="90px">折后实销单价</td>
	<td  width="110px">单位</td>
	<td  width="80px" bgcolor="#CC99FF">计入活动比率</td>
	<td  width="110px">合同数量</td>
	<td  width="130px">折前合同材料费</td>
	<td  width="130px">折后合同材料费</td>
	<td  width="130px">合同远程费</td>
	<td  width="130px">其它费用</td>
	<td  width="130px">合同其它费</td>
	<td  width="130px" bgcolor="#CCCCCC"><font color="#0000CC"><strong>折前合同小计</strong></font></td>
	<td  width="130px" bgcolor="#CCCCCC"><font color="#0000CC"><strong>折后合同小计</strong></font></td>
	<td  width="130px">合同计入促销活动金额</td>
	<td  width="130px" bgcolor="#CC99FF">增减后数量</td>
	<td  width="130px" bgcolor="#CC99FF">折前增减后材料费</td>
	<td  width="130px" bgcolor="#CC99FF">折后增减后材料费</td>
	<td  width="130px" bgcolor="#CC99FF">增减后远程费</td>
	<td  width="130px" bgcolor="#CC99FF">增减后其它费</td>
	<td  width="130px" bgcolor="#CC99FF"><font color="#0000CC"><strong>折前增减后小计</strong></font></td>
	<td  width="130px" bgcolor="#CC99FF"><font color="#0000CC"><strong>折后增减后小计</strong></font></td>
	<td  width="130px" bgcolor="#CC99FF">增减后计入促销活动金额</td>
	<td  width="130px">市场标价</td>
	<td  width="130px">销售限价</td>
	<td  width="120px">标准计入活动比例</td>
	<td  width="90px">有促销</td>
	<td  width="170px">促销开始时间</td>
	<td  width="170px">促销结束时间</td>
	<td  width="130px">促销价</td>
	<td  width="130px">促销计入活动比例</td>
	<td  width="130px">配件数</td>
	<td  width="380px">系列</td>
	<td  width="130px" bgcolor="#CC99FF">选择价格</td>
	<td  width="130px">是否参加促销活动</td>
	<td  width="200px">手写合同原因</td>
	<td  width="480px">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','合同','2','增项') lx,DECODE(jc_zcddmx.sxbz,'1','否','2','手写') sxbz,jc_zcddmx.zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,TO_CHAR(jc_zcddmx.zxqdl),zcpzwzbm,jc_zcddmx.zcysbm";
	ls_sql+=" ,TO_CHAR(jc_zcddmx.zqdj) zqdj,TO_CHAR(jc_zcddmx.dpzk) dpzk,TO_CHAR(jc_zcddmx.dj) dj,jldwbm,cxhdbl||'%' cxhdbl,jc_zcddmx.sl";
	ls_sql+=" ,jc_zcddmx.zqje,jc_zcddmx.je,ycf,DECODE(qtfy,'1','安装费','2','加工费','3','其它收费'),qtfyje,zqje+ycf+qtfyje zqhtxj,je+ycf+qtfyje zhhtxj,cxhdje";
	ls_sql+=" ,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy,zqzjhje+zjhycf+zjhqtfy zqzjhxj,zjhje+zjhycf+zjhqtfy zhzjhxj,zjhcxhdje";
	ls_sql+=" ,TO_CHAR(jc_zcddmx.lsj),TO_CHAR(jc_zcddmx.yhj),bzcxhdbl||'%',DECODE(sfycx,'N','无','Y','<font color=\"#FF0000\">有</font>'),cxkssj,cxjzsj,cxj,lscxhdbl||'%'";
	ls_sql+=" ,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs,zclbbm";
	ls_sql+=" ,DECODE(xzjg,'0','手写','1','销售价','3','市场标价','2','<font color=\"#FF0000\">促销价</font>') xzjg,decode(cxhdbz,'Y','参加','N','不参加')";
	ls_sql+=" ,jc_zcddmx.sxhtyy,jc_zcddmx.bz";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcddmx.xinghao";
	
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
