<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";
	String crm_hfjl_hfjlh=null;
	String crm_hfjl_hflxbm=null;
	String crm_hfjl_khbh=null;
	String crm_hfjl_sjfa=null;
	String crm_hfjl_hqfw=null;
	String crm_hfjl_jdqk=null;
	String crm_hfjl_zjyfw=null;
	String crm_hfjl_zjydw=null;
	String crm_hfjl_zjyjz=null;
	String crm_hfjl_fwsz=null;
	String crm_hfjl_sgzl=null;
	String crm_hfjl_grsz=null;
	String sfjxhf=null;
	String crm_hfjl_xchfrq=null;
	String crm_hfjl_xchflxbm=null;
	String crm_hfjl_clfs=null;
	String crm_hfjl_dwbh=null;
	String crm_hfjl_hfsj=null;
	String crm_hfjl_hfsj2=null;
	String crm_hfjl_hfr=null;
	String crm_khxx_sjs=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_sgd=null;
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (crm_khxx.xmzy='"+xmzy+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}

	String jglxbm=null;
	jglxbm=request.getParameter("jglxbm");
	if (jglxbm!=null)
	{
		jglxbm=cf.GB2Uni(jglxbm);
		if (!(jglxbm.equals("")))	wheresql+=" and  (crm_hfjl.jglxbm='"+jglxbm+"')";
	}


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";

	String hfbm=null;
	hfbm=request.getParameter("hfbm");
	if (hfbm!=null)
	{
		if (!(hfbm.equals("")))	wheresql+=" and  (crm_hfjl.hfbm='"+hfbm+"')";
	}


	String jcjjsjs=null;
	jcjjsjs=request.getParameter("jcjjsjs");
	if (jcjjsjs!=null)
	{
		if (!(jcjjsjs.equals("")))	wheresql+=" and  (crm_hfjl.jcjjsjs='"+jcjjsjs+"')";
	}
	String jsjjgw=null;
	jsjjgw=request.getParameter("jsjjgw");
	if (jsjjgw!=null)
	{
		if (!(jsjjgw.equals("")))	wheresql+=" and  (crm_hfjl.jsjjgw='"+jsjjgw+"')";
	}
	String jcxmzy=null;
	jcxmzy=request.getParameter("jcxmzy");
	if (jcxmzy!=null)
	{
		if (!(jcxmzy.equals("")))	wheresql+=" and  (crm_hfjl.jcxmzy='"+jcxmzy+"')";
	}
	String jcshaz=null;
	jcshaz=request.getParameter("jcshaz");
	if (jcshaz!=null)
	{
		if (!(jcshaz.equals("")))	wheresql+=" and  (crm_hfjl.jcshaz='"+jcshaz+"')";
	}
	String jccpzl=null;
	jccpzl=request.getParameter("jccpzl");
	if (jccpzl!=null)
	{
		if (!(jccpzl.equals("")))	wheresql+=" and  (crm_hfjl.jccpzl='"+jccpzl+"')";
	}


	String sjshfnr=null;
	sjshfnr=request.getParameter("sjshfnr");
	if (sjshfnr!=null)
	{
		sjshfnr=cf.GB2Uni(sjshfnr);
		if (!(sjshfnr.equals("")))	wheresql+=" and  (crm_hfjl.sjshfnr like '%"+sjshfnr+"%')";
	}
	String zjyhfnr=null;
	zjyhfnr=request.getParameter("zjyhfnr");
	if (zjyhfnr!=null)
	{
		zjyhfnr=cf.GB2Uni(zjyhfnr);
		if (!(zjyhfnr.equals("")))	wheresql+=" and  (crm_hfjl.zjyhfnr like '%"+zjyhfnr+"%')";
	}
	String sgdhfnr=null;
	sgdhfnr=request.getParameter("sgdhfnr");
	if (sgdhfnr!=null)
	{
		sgdhfnr=cf.GB2Uni(sgdhfnr);
		if (!(sgdhfnr.equals("")))	wheresql+=" and  (crm_hfjl.sgdhfnr like '%"+sgdhfnr+"%')";
	}
	String jchfnr=null;
	jchfnr=request.getParameter("jchfnr");
	if (jchfnr!=null)
	{
		jchfnr=cf.GB2Uni(jchfnr);
		if (!(jchfnr.equals("")))	wheresql+=" and  (crm_hfjl.jchfnr like '%"+jchfnr+"%')";
	}

	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		if (!(clzt.equals("")))	wheresql+=" and  (crm_gchffkbm.clzt='"+clzt+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}

	crm_hfjl_hfjlh=request.getParameter("crm_hfjl_hfjlh");
	if (crm_hfjl_hfjlh!=null)
	{
		crm_hfjl_hfjlh=crm_hfjl_hfjlh.trim();
		if (!(crm_hfjl_hfjlh.equals("")))	wheresql+=" and (crm_hfjl.hfjlh="+crm_hfjl_hfjlh+") ";
	}
	crm_hfjl_hflxbm=request.getParameter("crm_hfjl_hflxbm");
	if (crm_hfjl_hflxbm!=null)
	{
		crm_hfjl_hflxbm=cf.GB2Uni(crm_hfjl_hflxbm);
		if (!(crm_hfjl_hflxbm.equals("")))	wheresql+=" and  (crm_hfjl.hflxbm='"+crm_hfjl_hflxbm+"')";
	}
	crm_hfjl_khbh=request.getParameter("crm_hfjl_khbh");
	if (crm_hfjl_khbh!=null)
	{
		crm_hfjl_khbh=cf.GB2Uni(crm_hfjl_khbh);
		if (!(crm_hfjl_khbh.equals("")))	wheresql+=" and  (crm_hfjl.khbh='"+crm_hfjl_khbh+"')";
	}
	crm_hfjl_sjfa=request.getParameter("crm_hfjl_sjfa");
	if (crm_hfjl_sjfa!=null)
	{
		crm_hfjl_sjfa=cf.GB2Uni(crm_hfjl_sjfa);
		if (!(crm_hfjl_sjfa.equals("")))	wheresql+=" and  (crm_hfjl.sjfa='"+crm_hfjl_sjfa+"')";
	}
	crm_hfjl_hqfw=request.getParameter("crm_hfjl_hqfw");
	if (crm_hfjl_hqfw!=null)
	{
		crm_hfjl_hqfw=cf.GB2Uni(crm_hfjl_hqfw);
		if (!(crm_hfjl_hqfw.equals("")))	wheresql+=" and  (crm_hfjl.hqfw='"+crm_hfjl_hqfw+"')";
	}
	crm_hfjl_jdqk=request.getParameter("crm_hfjl_jdqk");
	if (crm_hfjl_jdqk!=null)
	{
		crm_hfjl_jdqk=cf.GB2Uni(crm_hfjl_jdqk);
		if (!(crm_hfjl_jdqk.equals("")))	wheresql+=" and  (crm_hfjl.jdqk='"+crm_hfjl_jdqk+"')";
	}
	crm_hfjl_zjyfw=request.getParameter("crm_hfjl_zjyfw");
	if (crm_hfjl_zjyfw!=null)
	{
		crm_hfjl_zjyfw=cf.GB2Uni(crm_hfjl_zjyfw);
		if (!(crm_hfjl_zjyfw.equals("")))	wheresql+=" and  (crm_hfjl.zjyfw='"+crm_hfjl_zjyfw+"')";
	}
	crm_hfjl_zjydw=request.getParameter("crm_hfjl_zjydw");
	if (crm_hfjl_zjydw!=null)
	{
		crm_hfjl_zjydw=cf.GB2Uni(crm_hfjl_zjydw);
		if (!(crm_hfjl_zjydw.equals("")))	wheresql+=" and  (crm_hfjl.zjydw='"+crm_hfjl_zjydw+"')";
	}
	crm_hfjl_zjyjz=request.getParameter("crm_hfjl_zjyjz");
	if (crm_hfjl_zjyjz!=null)
	{
		crm_hfjl_zjyjz=cf.GB2Uni(crm_hfjl_zjyjz);
		if (!(crm_hfjl_zjyjz.equals("")))	wheresql+=" and  (crm_hfjl.zjyjz='"+crm_hfjl_zjyjz+"')";
	}
	crm_hfjl_fwsz=request.getParameter("crm_hfjl_fwsz");
	if (crm_hfjl_fwsz!=null)
	{
		crm_hfjl_fwsz=cf.GB2Uni(crm_hfjl_fwsz);
		if (!(crm_hfjl_fwsz.equals("")))	wheresql+=" and  (crm_hfjl.fwsz='"+crm_hfjl_fwsz+"')";
	}
	crm_hfjl_sgzl=request.getParameter("crm_hfjl_sgzl");
	if (crm_hfjl_sgzl!=null)
	{
		crm_hfjl_sgzl=cf.GB2Uni(crm_hfjl_sgzl);
		if (!(crm_hfjl_sgzl.equals("")))	wheresql+=" and  (crm_hfjl.sgzl='"+crm_hfjl_sgzl+"')";
	}
	crm_hfjl_grsz=request.getParameter("crm_hfjl_grsz");
	if (crm_hfjl_grsz!=null)
	{
		crm_hfjl_grsz=cf.GB2Uni(crm_hfjl_grsz);
		if (!(crm_hfjl_grsz.equals("")))	wheresql+=" and  (crm_hfjl.grsz='"+crm_hfjl_grsz+"')";
	}
	sfjxhf=request.getParameter("sfjxhf");
	if (sfjxhf!=null)
	{
		sfjxhf=cf.GB2Uni(sfjxhf);
		if (!(sfjxhf.equals("")))	wheresql+=" and  (crm_hfjl.sfjxhf='"+sfjxhf+"')";
	}
	crm_hfjl_xchfrq=request.getParameter("crm_hfjl_xchfrq");
	if (crm_hfjl_xchfrq!=null)
	{
		crm_hfjl_xchfrq=crm_hfjl_xchfrq.trim();
		if (!(crm_hfjl_xchfrq.equals("")))	wheresql+="  and (crm_hfjl.xchfrq>=TO_DATE('"+crm_hfjl_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_hfjl_xchfrq=request.getParameter("crm_hfjl_xchfrq2");
	if (crm_hfjl_xchfrq!=null)
	{
		crm_hfjl_xchfrq=crm_hfjl_xchfrq.trim();
		if (!(crm_hfjl_xchfrq.equals("")))	wheresql+="  and (crm_hfjl.xchfrq<=TO_DATE('"+crm_hfjl_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_hfjl_xchflxbm=request.getParameter("crm_hfjl_xchflxbm");
	if (crm_hfjl_xchflxbm!=null)
	{
		crm_hfjl_xchflxbm=cf.GB2Uni(crm_hfjl_xchflxbm);
		if (!(crm_hfjl_xchflxbm.equals("")))	wheresql+=" and  (crm_hfjl.xchflxbm='"+crm_hfjl_xchflxbm+"')";
	}
	crm_hfjl_clfs=request.getParameter("crm_hfjl_clfs");
	if (crm_hfjl_clfs!=null)
	{
		crm_hfjl_clfs=cf.GB2Uni(crm_hfjl_clfs);
		if (!(crm_hfjl_clfs.equals("")))	wheresql+=" and  (crm_hfjl.clfs='"+crm_hfjl_clfs+"')";
	}
	crm_hfjl_dwbh=request.getParameter("crm_hfjl_dwbh");
	if (crm_hfjl_dwbh!=null)
	{
		if (!(crm_hfjl_dwbh.equals("")))	wheresql+=" and  (crm_gchffkbm.dwbh='"+crm_hfjl_dwbh+"')";
	}

	
	crm_hfjl_hfsj=request.getParameter("crm_hfjl_hfsj");
	if (crm_hfjl_hfsj!=null)
	{
		crm_hfjl_hfsj=crm_hfjl_hfsj.trim();
		if (!(crm_hfjl_hfsj.equals("")))	wheresql+="  and (crm_hfjl.hfsj>=TO_DATE('"+crm_hfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_hfjl_hfsj2=request.getParameter("crm_hfjl_hfsj2");
	if (crm_hfjl_hfsj2!=null)
	{
		crm_hfjl_hfsj2=crm_hfjl_hfsj2.trim();
		if (!(crm_hfjl_hfsj2.equals("")))	wheresql+="  and (crm_hfjl.hfsj<=TO_DATE('"+crm_hfjl_hfsj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}
	crm_hfjl_hfr=request.getParameter("crm_hfjl_hfr");
	if (crm_hfjl_hfr!=null)
	{
		crm_hfjl_hfr=cf.GB2Uni(crm_hfjl_hfr);
		if (!(crm_hfjl_hfr.equals("")))	wheresql+=" and  (crm_hfjl.hfr='"+crm_hfjl_hfr+"')";
	}


	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+crm_hfjl_hflxbm+"'");
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">回访明细（<%=cf.fillNull(hflxmc)%>）
  <BR>(<%=crm_hfjl_hfsj%>--<%=crm_hfjl_hfsj2%>)</font></B> 
</CENTER>
<table border="1"  cellspacing="0" cellpadding="1"  style='FONT-SIZE:12px' width="1107">
  <tr align="center"> 
    <td width="20" >&nbsp;</td>
    <td width="45"  >&nbsp;</td>
    <td colspan="10" >设计师满意度</td>
    <td colspan="10" >工程担当满意度</td>
    <td colspan="10" >工程质量满意度</td>
    <td rowspan="3" width="98">回访问题</td>
  </tr>
  <tr align="center"> 
    <td width="20" >&nbsp;</td>
    <td width="45"  >客户</td>
    <td width="45" >设计师</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
    <td width="45" >工程担当</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
    <td width="45" >施工队</td>
    <td colspan="3" bgcolor="#FF66FF" >满意</td>
    <td colspan="3" bgcolor="#9999FF" >较满意</td>
    <td colspan="3" bgcolor="#00CC00" >不满意</td>
  </tr>
  <tr align="center"> 
    <td  width="20">序号</td>
    <td  width="45">姓名</td>
    <td width="45">姓名</td>
    <td width="25" bgcolor="#FF66FF">设计方案</td>
    <td width="25" bgcolor="#FF66FF">后期服务</td>
    <td width="25" bgcolor="#FF66FF">交底清楚</td>
    <td width="25" bgcolor="#9999FF">设计方案</td>
    <td width="25" bgcolor="#9999FF">后期服务</td>
    <td width="25" bgcolor="#9999FF">交底清楚</td>
    <td width="25" bgcolor="#00CC00">设计方案</td>
    <td width="25" bgcolor="#00CC00">后期服务</td>
    <td width="25" bgcolor="#00CC00">交底清楚</td>
    <td width="45" >姓名</td>
    <td width="25" bgcolor="#FF66FF" >服务</td>
    <td width="25" bgcolor="#FF66FF" >到位</td>
    <td width="25" bgcolor="#FF66FF" >尽责</td>
    <td width="25" bgcolor="#9999FF" >服务</td>
    <td width="25" bgcolor="#9999FF" >到位</td>
    <td width="25" bgcolor="#9999FF" >尽责</td>
    <td width="25" bgcolor="#00CC00" >服务</td>
    <td width="25" bgcolor="#00CC00" >到位</td>
    <td width="25" bgcolor="#00CC00" >尽责</td>
    <td width="45" >姓名</td>
    <td width="25" bgcolor="#FF66FF" >服务态度</td>
    <td width="25" bgcolor="#FF66FF" >施工质量</td>
    <td width="25" bgcolor="#FF66FF" >工人素质</td>
    <td width="25" bgcolor="#9999FF" >服务态度</td>
    <td width="25" bgcolor="#9999FF" >施工质量</td>
    <td width="25" bgcolor="#9999FF" >工人素质</td>
    <td width="25" bgcolor="#00CC00" >服务态度</td>
    <td width="25" bgcolor="#00CC00" >施工质量</td>
    <td width="25" bgcolor="#00CC00" >工人素质</td>
  </tr>
  <%
	ls_sql="SELECT rownum,khxm";
	ls_sql+=" ,sjs,DECODE(sjfa,'21','<font color=\"#FF66FF\">★</font>'),DECODE(hqfw,'21','<font color=\"#FF66FF\">★</font>'),DECODE(jdqk,'21','<font color=\"#FF66FF\">★</font>'),DECODE(sjfa,'22','<font color=\"#9999FF\">◆</font>'),DECODE(hqfw,'22','<font color=\"#9999FF\">◆</font>'),DECODE(jdqk,'22','<font color=\"#9999FF\">◆</font>'),DECODE(sjfa,'23','<font color=\"#00CC00\">▲</font>'),DECODE(hqfw,'23','<font color=\"#00CC00\">▲</font>'),DECODE(jdqk,'23','<font color=\"#00CC00\">▲</font>')";
	ls_sql+=" ,zjxm,DECODE(zjyfw,'21','<font color=\"#FF66FF\">★</font>'),DECODE(zjydw,'21','<font color=\"#FF66FF\">★</font>'),DECODE(zjyjz,'21','<font color=\"#FF66FF\">★</font>'),DECODE(zjyfw,'22','<font color=\"#9999FF\">◆</font>'),DECODE(zjydw,'22','<font color=\"#9999FF\">◆</font>'),DECODE(zjyjz,'22','<font color=\"#9999FF\">◆</font>'),DECODE(zjyfw,'23','<font color=\"#00CC00\">▲</font>'),DECODE(zjydw,'23','<font color=\"#00CC00\">▲</font>'),DECODE(zjyjz,'23','<font color=\"#00CC00\">▲</font>')";
	ls_sql+=" ,sgdmc,DECODE(fwsz,'21','<font color=\"#FF66FF\">★</font>'),DECODE(sgzl,'21','<font color=\"#FF66FF\">★</font>'),DECODE(grsz,'21','<font color=\"#FF66FF\">★</font>'),DECODE(fwsz,'22','<font color=\"#9999FF\">◆</font>'),DECODE(sgzl,'22','<font color=\"#9999FF\">◆</font>'),DECODE(grsz,'22','<font color=\"#9999FF\">◆</font>'),DECODE(fwsz,'23','<font color=\"#00CC00\">▲</font>'),DECODE(sgzl,'23','<font color=\"#00CC00\">▲</font>'),DECODE(grsz,'23','<font color=\"#00CC00\">▲</font>')";
	ls_sql+=" ,DECODE(sjshfnr,null,'',sjshfnr,'[设计师]：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[工程担当]：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[施工队]：'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'；<BR>[集成]：'||jchfnr)||DECODE(crm_hfjl.bz,null,'',crm_hfjl.bz,'<BR>[备注]：'||crm_hfjl.bz) as hfnr";
	ls_sql+=" FROM crm_hfjl,sq_sgd,crm_khxx   ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.alignStr[32]="align='left'";

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>