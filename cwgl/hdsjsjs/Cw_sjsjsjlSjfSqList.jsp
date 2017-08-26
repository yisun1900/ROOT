<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

	String ls_sql=null;
	String wheresql="";

	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;
    String sjs=null;
	String fgs=null;
	String crm_khxx_qyrq=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}
    sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (sjs='"+sjs+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}
    crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
    sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (sjs='"+sjs+"')";
	}
	ls_sql="SELECT hth,khxm,fwdz,sfyjqk,fkcsmc,qye,zjxje,sfke,sfkl,qyrq,sjjgrq,sbdm,sgd,sjs,zjxm,khbh ";
    ls_sql+=" from (";
	ls_sql+=" SELECT khbh,hth,khxm,DECODE(sfyjqk,'N','未交','Y','已交') sfyjqk,fkcsmc,qye,zjxje,sfke,ROUND(sfke/(qye+NVL(zjxje,0))*100,2)||'%' sfkl,fwdz,qyrq,sjjgrq,a.dwmc sbdm,sgdmc sgd,sjs,zjxm ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,cw_fkcs";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+))";
    ls_sql+=" and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
	ls_sql+=" and zt!='5' and qye>0";
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    ls_sql+=" )";
    ls_sql+=" where rownum<50 ";
	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","InsertCw_sjfjssqb.jsp");
	pageObj.setPageRow(50);//设置每页显示记录数
	pageObj.setEditStr("申请");
	pageObj.setEditBolt("");
/*
//设置显示列
	String[] disColName={"jsjlh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_hth","crm_khxx_dwbh","crm_khxx_sgd","cw_jsjl_fkqx","cw_jsjl_fkbz","cw_jsjl_gcqye","cw_jsjl_yfkze","cw_jsjl_ljyfkze","cw_jsjl_bqyfgck","cw_jsjl_bqyfmmk","cw_jsjl_bqyfcgk","cw_jsjl_bqyfzck","cw_jsjl_bqyfkze","cw_jsjl_bqljyfgck","cw_jsjl_bqljyfmmk","cw_jsjl_bqljyfcgk","cw_jsjl_bqljyfzck","cw_jsjl_bqljyfkze","cw_jsjl_bqyfkbl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设计费结算申请</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">合同号</td>
	<td  width="4%">姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="4%">是否交全款</td>
	<td  width="4%">收款期数</td>
	<td  width="7%">签约额</td>
	<td  width="5%">增减项</td>
	<td  width="6%">实收款额</td>
	<td  width="5%">实收款率</td>
	<td  width="6%">签约日期</td>
	<td  width="6%">实竣工日期</td>
	<td  width="9%">签约店面</td>
	<td  width="4%">施工队</td>
	<td  width="4%">设计师</td>
	<td  width="4%">质检员</td>
	<td  width="5%">客户编号</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>