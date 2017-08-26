<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String jc_mmydd_yddbh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_kgrq=null;
String crm_khxx_jgrq=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String jc_mmydd_wjqk=null;
String jc_mmydd_sqdj=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jc_mmydd_pdgc=null;
String jc_mmydd_mmcljs=null;
String jc_mmydd_jhccsj=null;
String jc_mmydd_sccsj=null;
String jc_mmydd_ccsm=null;
String jc_mmydd_htrq=null;
String jc_mmydd_htqdr=null;
String jc_mmydd_htbz=null;
String jc_mmydd_wjsgsbz=null;
String jc_mmydd_swjsj=null;
String jc_mmydd_wjjsr=null;
String jc_mmydd_wjjsqk=null;
String jc_mmydd_srksj=null;
String jc_mmydd_rkr=null;
String jc_mmydd_rksm=null;
String jc_mmydd_jhazsj=null;
String jc_mmydd_sshsj=null;
String jc_mmydd_azkssj=null;
String jc_mmydd_azjssj=null;
String jc_mmydd_mmycyybm=null;
String jc_mmydd_ycsm=null;
String jc_mmydd_zsycyybm=null;
String jc_mmydd_ychsqk=null;
String jc_mmydd_ychsr=null;
String jc_mmydd_ychssj=null;
String jc_mmydd_sfjs=null;
String jc_mmydd_clzt=null;
String jc_mmydd_lrr=null;
String jc_mmydd_lrsj=null;
String sq_dwxx_dwmc=null;
String jc_mmydd_bz=null;
String kazsj=null;
String aztz=null;
String aztzr=null;
String aztzsj=null;
String cclrr=null;
String cclrsj=null;

String tdsj=null;
String tdlrr=null;
String kclf=null;
String jctdyybm=null;
String tdsm=null;

String sgbz=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh="";
String lxfs=null;
String cxhdbm=null;

String paidr=null;
String paidsj=null;
String ycclzt=null;

String ssfgs=null;

double fwf=0;
double wdzje=0;
double htje=0;
double mmhtje=0;
double wjhtje=0;
double blhtje=0;
double zqmmhtje=0;
double zqwjhtje=0;
double zqblhtje=0;

double zjhmmje=0;
double zjhwjje=0;
double zjhblje=0;
double zqzjhmmje=0;
double zqzjhwjje=0;
double zqzjhblje=0;
double zqzjhze=0;
double zjhze=0;

double mmzkl=0;
String dzyy=null;

String jhccxgr=null;
String jhccxgsj=null;
String jhccxgyy=null;
String wjsj=null;
String wjlrr=null;
String sfxwyj=null;
String wyj=null;
String jjfa=null;
String azsjbz=null;
String gcjslrr=null;
String gcjslrsj=null;
String skqrr=null;
String skqrsj=null;
String dwbh=null;
String pdgcmc=null;
String gys=null;
String ppmc=null;

String mmfgsbh=null;
String qddm=null;
String jzsjs=null;
String dqbm=null;
String aztxbz=null;

String jc_mmydd_cljsdh="";

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.fgsbh ssfgs,jc_mmydd.fgsbh mmfgsbh,jc_mmydd.qddm,jc_mmydd.jzsjs,jc_mmydd.pdgcmc,jc_mmydd.gys,jc_mmydd.ppmc,jc_mmydd.dwbh,cclrsj,cclrr,skqrr,skqrsj,gcjslrsj,gcjslrr,azsjbz,sfxwyj,wyj,jjfa,wjsj,wjlrr,kazsj,aztz,aztzr,aztzsj,jc_mmydd.tdsj,tdlrr,kclf,jctdyybm,tdsm,jhccxgr,jhccxgsj,jhccxgyy,cxhdbm,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.pdgc as jc_mmydd_pdgc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" ,fwf,jc_mmydd.wdzje,jc_mmydd.htje,jc_mmydd.mmhtje,jc_mmydd.wjhtje,jc_mmydd.blhtje,zqmmhtje,zqwjhtje,zqblhtje";
	ls_sql+=" ,zjhmmje,zjhwjje,zjhblje,zqzjhmmje,zqzjhwjje,zqzjhblje,jc_mmydd.zqzjhze,jc_mmydd.zjhze,mmzkl,dzyy,aztxbz ";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		aztxbz=cf.fillNull(rs.getString("aztxbz"));
		fwf=rs.getDouble("fwf");
		wdzje=rs.getDouble("wdzje");
		htje=rs.getDouble("htje");
		mmhtje=rs.getDouble("mmhtje");
		wjhtje=rs.getDouble("wjhtje");
		blhtje=rs.getDouble("blhtje");
		zqmmhtje=rs.getDouble("zqmmhtje");
		zqwjhtje=rs.getDouble("zqwjhtje");
		zqblhtje=rs.getDouble("zqblhtje");

		zjhmmje=rs.getDouble("zjhmmje");
		zjhwjje=rs.getDouble("zjhwjje");
		zjhblje=rs.getDouble("zjhblje");
		zqzjhmmje=rs.getDouble("zqzjhmmje");
		zqzjhwjje=rs.getDouble("zqzjhwjje");
		zqzjhblje=rs.getDouble("zqzjhblje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		mmzkl=rs.getDouble("mmzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));

		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		mmfgsbh=cf.fillNull(rs.getString("mmfgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		pdgcmc=cf.fillNull(rs.getString("pdgcmc"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		cclrr=cf.fillNull(rs.getString("cclrr"));
		cclrsj=cf.fillNull(rs.getDate("cclrsj"));
		skqrsj=cf.fillNull(rs.getDate("skqrsj"));
		skqrr=cf.fillNull(rs.getString("skqrr"));
		gcjslrsj=cf.fillNull(rs.getDate("gcjslrsj"));
		gcjslrr=cf.fillNull(rs.getString("gcjslrr"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		sfxwyj=cf.fillNull(rs.getString("sfxwyj"));
		wyj=cf.fillNull(rs.getString("wyj"));
		jjfa=cf.fillNull(rs.getString("jjfa"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		aztz=cf.fillNull(rs.getString("aztz"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdlrr=cf.fillNull(rs.getString("tdlrr"));
		kclf=cf.fillNull(rs.getString("kclf"));
		jctdyybm=cf.fillNull(rs.getString("jctdyybm"));
		tdsm=cf.fillNull(rs.getString("tdsm"));

		jhccxgr=cf.fillNull(rs.getString("jhccxgr"));
		jhccxgsj=cf.fillNull(rs.getDate("jhccxgsj"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		paidr=cf.fillNull(rs.getString("paidr"));
		paidsj=cf.fillNull(rs.getDate("paidsj"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
		lxfs=cf.fillNull(rs.getString("lxfs"));

		jc_mmydd_yddbh=cf.fillNull(rs.getString("jc_mmydd_yddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_kgrq=cf.fillNull(rs.getDate("crm_khxx_kgrq"));
		crm_khxx_jgrq=cf.fillNull(rs.getDate("crm_khxx_jgrq"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		jc_mmydd_wjqk=cf.fillNull(rs.getString("jc_mmydd_wjqk"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("jc_mmydd_sqdj"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jc_mmydd_pdgc=cf.fillNull(rs.getString("jc_mmydd_pdgc"));
		jc_mmydd_mmcljs=cf.fillNull(rs.getString("jc_mmydd_mmcljs"));
		jc_mmydd_jhccsj=cf.fillNull(rs.getDate("jc_mmydd_jhccsj"));
		jc_mmydd_sccsj=cf.fillNull(rs.getDate("jc_mmydd_sccsj"));
		jc_mmydd_ccsm=cf.fillNull(rs.getString("jc_mmydd_ccsm"));

		jc_mmydd_htrq=cf.fillNull(rs.getDate("jc_mmydd_htrq"));
		jc_mmydd_htqdr=cf.fillNull(rs.getString("jc_mmydd_htqdr"));
		jc_mmydd_htbz=cf.fillNull(rs.getString("jc_mmydd_htbz"));
		jc_mmydd_wjsgsbz=cf.fillNull(rs.getString("jc_mmydd_wjsgsbz"));
		jc_mmydd_swjsj=cf.fillNull(rs.getDate("jc_mmydd_swjsj"));
		jc_mmydd_wjjsr=cf.fillNull(rs.getString("jc_mmydd_wjjsr"));
		jc_mmydd_wjjsqk=cf.fillNull(rs.getString("jc_mmydd_wjjsqk"));
		jc_mmydd_srksj=cf.fillNull(rs.getDate("jc_mmydd_srksj"));
		jc_mmydd_rkr=cf.fillNull(rs.getString("jc_mmydd_rkr"));
		jc_mmydd_rksm=cf.fillNull(rs.getString("jc_mmydd_rksm"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("jc_mmydd_jhazsj"));
		jc_mmydd_sshsj=cf.fillNull(rs.getDate("jc_mmydd_sshsj"));
		jc_mmydd_azkssj=cf.fillNull(rs.getDate("jc_mmydd_azkssj"));
		jc_mmydd_azjssj=cf.fillNull(rs.getDate("jc_mmydd_azjssj"));
		jc_mmydd_mmycyybm=cf.fillNull(rs.getString("jc_mmydd_mmycyybm"));
		jc_mmydd_ycsm=cf.fillNull(rs.getString("jc_mmydd_ycsm"));
		jc_mmydd_zsycyybm=cf.fillNull(rs.getString("jc_mmydd_zsycyybm"));
		jc_mmydd_ychsqk=cf.fillNull(rs.getString("jc_mmydd_ychsqk"));
		jc_mmydd_ychsr=cf.fillNull(rs.getString("jc_mmydd_ychsr"));
		jc_mmydd_ychssj=cf.fillNull(rs.getDate("jc_mmydd_ychssj"));
		jc_mmydd_sfjs=cf.fillNull(rs.getString("jc_mmydd_sfjs"));
		jc_mmydd_clzt=cf.fillNull(rs.getString("jc_mmydd_clzt"));
		jc_mmydd_lrr=cf.fillNull(rs.getString("jc_mmydd_lrr"));
		jc_mmydd_lrsj=cf.fillNull(rs.getDate("jc_mmydd_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		jc_mmydd_bz=cf.fillNull(rs.getString("jc_mmydd_bz"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dqbm from sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();



	//装修设计师
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+crm_khxx_dwbh+"' and yhmc ='"+crm_khxx_sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//测量技师电话
	ls_sql=" select sq_gyslxr.sj ";
	ls_sql+=" from sq_gyslxr,sq_gysbm,jxc_gyssqfgs";
	ls_sql+=" where sq_gyslxr.gysbm=jxc_gyssqfgs.gysbm and sq_gyslxr.gysbm=sq_gysbm.gysbm";
	ls_sql+=" and jxc_gyssqfgs.ssfgs='"+ssfgs+"' and sq_gysbm.gys='"+gys+"' ";
	ls_sql+=" and sq_gyslxr.zw='木门测量师' and sq_gyslxr.lxrxm ='"+jc_mmydd_mmcljs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jc_mmydd_cljsdh=cf.fillNull(rs.getString("sj"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"' and bzmc ='"+sgbz+"'";
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
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+crm_khxx_zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	if (yhjs.equals("G0"))
	{
		crm_khxx_sjs="&nbsp;";
		sjsdh="&nbsp;";
	}
	if (yhjs.equals("A0"))
	{
		pdgcmc="（工厂："+pdgcmc+"）（品牌："+ppmc+"）（供应商："+gys+"）";
	}
	else{
		pdgcmc="";
	}
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #000099;
	font-weight: bold;
}
.STYLE2 {color: #000099}
.STYLE3 {	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">木门预订单（订单编号：<%=jc_mmydd_yddbh%>）
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right"> 
              客户编号            </td>
            <td width="33%"> <%=khbh%></td>
            <td width="17%" align="right"> 
              合同号            </td>
            <td width="33%"><%=crm_khxx_hth%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right"> 
              客户姓名            </td>
            <td width="33%"> <%=crm_khxx_khxm%>（
              <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
              ） </td>
            <td width="17%" align="right">房屋地址 </td>
            <td width="33%"><%=crm_khxx_fwdz%> </td>
          </tr>
          
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right" bgcolor="#CCCCFF">签约店面</td>
            <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
            <td width="17%" align="right">&nbsp;</td>
            <td width="33%">&nbsp;</td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right"> 
              施工队            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>（<%=dzdh%>） </td>
            <td width="17%" align="right"> 
              班长            </td>
            <td width="33%"><%=sgbz%>（<%=bzdh%>） </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right"> 
              家装签约日期            </td>
            <td width="33%"> <%=crm_khxx_qyrq%> </td>
            <td width="17%" align="right"> 
              质检            </td>
            <td width="33%"><%=crm_khxx_zjxm%>（<%=zjdh%>） </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right"> 
              合同开工日期            </td>
            <td width="33%"> <%=crm_khxx_kgrq%> </td>
            <td width="17%" align="right"> 
              合同竣工日期            </td>
            <td width="33%"> <%=crm_khxx_jgrq%> </td>
          </tr>
          <tr bgcolor="#CCFFCC"> 
            <td width="17%" align="right">参加促销活动</td>
            <td colspan="3"> <%=cxhdbm%> </td>
          </tr>
          <tr bgcolor="#99CCFF">
            <td colspan="4" align="right" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right"> 
              订单状态            </td>
            <td width="33%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
            <td width="17%" align="right">订单所属设计师 </td>
            <td width="33%"><%=jzsjs%> </td>
          </tr>
          <tr bgcolor="#99CCFF">
            <td align="right">订单所属分公司</td>
            <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+mmfgsbh+"'",mmfgsbh,true);
%>            </td>
            <td align="right">订单所属店面</td>
            <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%>            </td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right"> 
              单项完结录入人            </td>
            <td width="33%"> <%=wjlrr%> </td>
            <td width="17%" align="right"> 
              单项完结时间            </td>
            <td width="33%"> <%=wjsj%> </td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" bgcolor="#99CCFF" align="right">项目专员</td>
            <td width="33%"><%=xmzy%></td>
            <td width="17%" align="right">木门订金</td>
            <td width="33%"><%=jc_mmydd_sqdj%></td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right" bgcolor="#99CCFF"> 
              驻店家居顾问            </td>
            <td width="33%"> <%=clgw%></td>
            <td width="17%" align="right"> 
              展厅家居顾问            </td>
            <td width="33%"><%=ztjjgw%> </td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right"> 
              录入人            </td>
            <td width="33%"> <%=jc_mmydd_lrr%> </td>
            <td width="17%" align="right"> 
              录入时间            </td>
            <td width="33%"> <%=jc_mmydd_lrsj%> </td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right"> 
              录入部门            </td>
            <td width="33%"> <%=sq_dwxx_dwmc%> </td>
            <td width="17%" align="right">            </td>
            <td width="33%"></td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" bgcolor="#99CCFF" align="right">备注</td>
            <td colspan="3"><%=jc_mmydd_bz%></td>
          </tr>
          <tr bgcolor="#99CCFF">
            <td align="right">五金情况</td>
            <td><%
	cf.radioToken(out, "1+客户自购&2+公司购买",jc_mmydd_wjqk,true);
%></td>
            <td align="right">自购五金件送到公司 </td>
            <td><%
	cf.selectToken(out,"Y+已送公司&N+未送公司",jc_mmydd_wjsgsbz,true);
%></td>
          </tr>
          <tr bgcolor="#99CCFF">
            <td align="right"> 送五金时间 </td>
            <td bgcolor="#99CCFF"><%=jc_mmydd_swjsj%> </td>
            <td align="right"> 五金接收人 </td>
            <td><%=jc_mmydd_wjjsr%> </td>
          </tr>
          <tr bgcolor="#99CCFF">
            <td align="right">五金接收情况</td>
            <td colspan="3"><%=jc_mmydd_wjjsqk%></td>
          </tr>
          <tr align="right" bgcolor="#FFFFFF">
            <td colspan="4" align="center" bgcolor="#FFFFFF"><div align="center">
                <input type="button" value="合同明细" onClick="window.open('/jcjj/mmdd/ViewGcJc_mmdgdmx.jsp?yddbh=<%=yddbh%>')">
                <input type="button" value="增减项" onClick="window.open('/jcjj/mmdd/ViewGcJc_mmzjx.jsp?yddbh=<%=yddbh%>')" >            </td>
          </tr>
          <tr bgcolor="#CCCCFF">
            <td align="right">服务费</td>
            <td><%=fwf%></td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          
          <tr bgcolor="#CCCCFF">
            <td colspan="4" bgcolor="#CCCCFF">
			<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                
                <tr align="center" bgcolor="#FFFFFF">
                  <td><span class="STYLE1"><strong>合同金额</strong></span></td>
                  <td><span class="STYLE2"><strong>增减后总额</strong></span></td>
                </tr>
                <tr align="center" bgcolor="#FFFFFF">
                  <td bgcolor="#FFFFFF" class="STYLE2"><U>合同金额：<%=htje%></U></td>
                  <td bgcolor="#FFFFFF"><span class="STYLE1"><U>增减后总额：<%=zjhze%></U></span></td>
                </tr>
                <tr align="center" bgcolor="#FFFFFF">
                  <td width="25%"><span class="STYLE2"> 木门合同金额：<%=mmhtje%> </span></td>
                  <td width="25%"><span class="STYLE2">增减后木门金额：<%=zjhmmje%></span></td>
                </tr>
                <tr align="center" bgcolor="#FFFFFF">
                  <td><span class="STYLE2">五金合同金额：<%=wjhtje%></span></td>
                  <td><span class="STYLE2">增减后五金金额：<%=zjhwjje%></span></td>
                </tr>
                <tr align="center" bgcolor="#FFFFFF">
                  <td width="25%"><span class="STYLE2"> 玻璃合同金额：<%=blhtje%> </span></td>
                  <td width="25%"><span class="STYLE2">增减后玻璃金额：<%=zjhblje%></span></td>
                </tr>
            </table></td>
          </tr>
          <tr bgcolor="#CCCCFF">
            <td align="right" bgcolor="#CCCCFF">签合同日期</td>
            <td><%=jc_mmydd_htrq%> </td>
            <td align="right">合同签定人</td>
            <td><%=jc_mmydd_htqdr%> </td>
          </tr>
          <tr bgcolor="#CCCCFF">
            <td align="right" bgcolor="#CCCCFF">合同备注</td>
            <td colspan="3"><%=jc_mmydd_htbz%></td>
          </tr>

		  <tr align="right" bgcolor="#FFFFFF"> 
            <td colspan="4" align="center"> 
              <div align="center"> 
                <input type="button" value="木门初测单" onClick="window.open('/jcjj/mmdd/ViewJc_mmccd.jsp?yddbh=<%=yddbh%>')">
            <input type="button" value="木门复测单" onClick="window.open('/jcjj/mmdd/ViewJc_mmfcd.jsp?yddbh=<%=yddbh%>')" name="button3">            </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="17%" align="right"> 
              派单工厂            </td>
            <td width="33%"> <%=jc_mmydd_pdgc%> </td>
            <td width="17%" align="right">木门测量技师</td>
            <td width="33%"><%=jc_mmydd_mmcljs%>（<%=jc_mmydd_cljsdh%>）</td>
          </tr>
          
          <tr bgcolor="#FFFFCC">
            <td align="right">派单工厂</td>
            <td colspan="3"><%=pdgcmc%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="17%" align="right">派单人</td>
            <td width="33%"><%=paidr%></td>
            <td width="17%" align="right">派单时间</td>
            <td width="33%"><%=paidsj%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="17%" align="right" bgcolor="#FFFFCC"> 
              计划初测时间            </td>
            <td width="33%"><%=jc_mmydd_jhccsj%> </td>
            <td width="17%" align="right"> 
              实初测时间            </td>
            <td width="33%"><%=jc_mmydd_sccsj%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="17%" align="right" bgcolor="#FFFFCC">初测说明</td>
            <td colspan="3"><%=jc_mmydd_ccsm%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="17%" bgcolor="#FFFFCC" align="right">初测录入人</td>
            <td width="33%"><%=cclrr%></td>
            <td width="17%" align="right">初测录入时间</td>
            <td width="33%"><%=cclrsj%></td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right">计划初测时间修改人</td>
            <td width="33%"><%=jhccxgr%></td>
            <td width="17%" align="right">修改时间</td>
            <td width="33%"><%=jhccxgsj%></td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right">修改原因</td>
            <td colspan="3"><%=jhccxgyy%></td>
          </tr>

          
          <tr align="right" bgcolor="#FFFFFF"> 
            <td colspan="4" align="center" bgcolor="#FFFFFF"><input type="button"  value="安装时间记录" onClick="window.open('/jcjj/mmdd/ViewJc_mmazsjjl.jsp?yddbh=<%=yddbh%>')" name="button2">
                <input type="button" value="安装记录"  onClick="window.open('/jcjj/mmdd/ViewJc_mmazjl.jsp?yddbh=<%=yddbh%>')" name="button">
                <input type="button" value="安装反馈单"  onClick="window.open('/jcjj/mmdd/ViewJc_mmazfkd.jsp?yddbh=<%=yddbh%>')">            </td>
          </tr>
          <tr bgcolor="#FFFFCC">
            <td align="right">收款确认时间</td>
            <td><%=skqrsj%></td>
            <td align="right">收款确认人</td>
            <td><%=skqrr%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td align="right">工厂接收录入时间</td>
            <td><%=gcjslrsj%></td>
            <td align="right">工厂接收录入人</td>
            <td><%=gcjslrr%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="17%" align="right"> 实入库时间</td>
            <td width="33%"><%=jc_mmydd_srksj%> </td>
            <td width="17%" align="right"> 入库人</td>
            <td width="33%"><%=jc_mmydd_rkr%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="17%" align="right">入库说明</td>
            <td colspan="3"><%=jc_mmydd_rksm%></td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right"> 合同安装时间</td>
            <td width="33%"> <%=jc_mmydd_jhazsj%> </td>
            <td width="17%" align="right"> 协商安装时间</td>
            <td width="33%"><%=kazsj%> </td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td bgcolor="#99CCFF" align="right">安装时间备注</td>
            <td colspan="3"><%=azsjbz%></td>
          </tr>
          <tr bgcolor="#99CCFF">
            <td bgcolor="#99CCFF" align="right"><span class="STYLE3">安装提醒</span></td>
            <td><%=aztxbz%></td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" bgcolor="#99CCFF" align="right">是否发安装通知</td>
            <td width="33%"> <%
	cf.selectToken(out,"Y+是&N+否",aztz,true);
%> </td>
            <td width="17%" align="right">发安装通知人</td>
            <td width="33%"><%=aztzr%></td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" bgcolor="#99CCFF" align="right">发安装通知时间</td>
            <td width="33%"><%=aztzsj%></td>
            <td width="17%" align="right">实送货时间</td>
            <td width="33%"><%=jc_mmydd_sshsj%></td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right" bgcolor="#99CCFF"> 
              安装开始时间            </td>
            <td width="33%"> <%=jc_mmydd_azkssj%> </td>
            <td width="17%" align="right"> 
              安装结束时间            </td>
            <td width="33%"> <%=jc_mmydd_azjssj%> </td>
          </tr>
          <tr bgcolor="#CCCCFF">
            <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right"> 
              延迟原因            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm where mmycyybm='"+jc_mmydd_mmycyybm+"' ",jc_mmydd_mmycyybm,true);
%> </td>
            <td width="17%" align="right"> 
              延迟处理状态            </td>
            <td width="33%"> <%
	cf.radioToken(out, "1+延迟未核实&2+延迟原因属实&3+延迟原因不属实&4+延迟已处理",ycclzt,true);
%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right" height="20">延迟说明</td>
            <td colspan="3" height="20"><%=jc_mmydd_ycsm%></td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right">真实延迟原因</td>
            <td width="33%"><%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm where mmycyybm='"+jc_mmydd_zsycyybm+"' ",jc_mmydd_zsycyybm,true);
%></td>
            <td width="17%" align="right">&nbsp;</td>
            <td width="33%">&nbsp;</td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="17%" align="right">延迟核实情况</td>
            <td colspan="3"><%=jc_mmydd_ychsqk%></td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td align="right"> 延迟核实人</td>
            <td><%=jc_mmydd_ychsr%> </td>
            <td align="right"> 延迟核实时间</td>
            <td><%=jc_mmydd_ychssj%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td align="right">否支付违约金</td>
            <td> <%
	cf.radioToken(out, "Y+需要&N+不需要",sfxwyj,true);
%> </td>
            <td align="right">违约金</td>
            <td><%=wyj%></td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td align="right">解决方案</td>
            <td colspan="3"><%=jjfa%></td>
          </tr>
          <tr bgcolor="#99CCFF">
            <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right">退单时间</td>
            <td width="33%"><%=tdsj%></td>
            <td width="17%" align="right">退单录入人</td>
            <td width="33%"><%=tdlrr%></td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right">扣测量费</td>
            <td width="33%"><%=kclf%></td>
            <td width="17%" align="right">退单原因</td>
            <td width="33%"> <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm where jctdyybm='"+jctdyybm+"'",jctdyybm,false);
%> </td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right">退单说明</td>
            <td colspan="3"><%=tdsm%></td>
          </tr>
          <tr bgcolor="#99CCFF"> 
            <td width="17%" align="right"> 
              是否与工厂结算            </td>
            <td width="33%"> <%
	cf.selectToken(out,"N+未结算&Y+已结算",jc_mmydd_sfjs,true);
%> </td>
            <td width="17%">&nbsp; </td>
            <td width="33%">&nbsp; </td>
          </tr>
      </table>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>

