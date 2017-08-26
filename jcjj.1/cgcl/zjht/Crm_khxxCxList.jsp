<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String cxhdmc=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	String zt=null;
	zt=request.getParameter("zt");
	if (zt!=null)
	{
		if (!(zt.equals("")))	wheresql+=" and  (crm_khxx.zt='"+zt+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	cxhdmc=request.getParameter("cxhdmc");
	if (cxhdmc!=null)
	{
		cxhdmc=cf.GB2Uni(cxhdmc);
		if (!(cxhdmc.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm = '"+cxhdmc+"')";
	}

	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}

	String qyrq1=null;

	qyrq1=request.getParameter("qyrq1");
	if (qyrq1!=null)
	{
		if (!(qyrq1.equals(""))){
		qyrq1+=" 00:00:00";
		wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq1+"','YYYY/MM/DD hh24:mi:ss'))";
		}
	}
	String qyrq2=request.getParameter("qyrq2");
	if (qyrq2!=null)
	{
		if (!(qyrq2.equals(""))){
		qyrq2+=" 23:59:59";
		wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq2+"','YYYY/MM/DD hh24:mi:ss'))";
		}
	}

	String lrsj1=null;
	lrsj1=request.getParameter("lrsj1");
	if (lrsj1!=null)
	{
		if (!(lrsj1.equals(""))){
		lrsj1+=" 00:00:00";
		wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+lrsj1+"','YYYY/MM/DD hh24:mi:ss'))";
		}
	}
	String lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals(""))){
		lrsj2+=" 23:59:59";
		wheresql+="  and (crm_khxx.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD hh24:mi:ss'))";
		}
	}

	ls_sql="SELECT hth,khxm,fwdz,a.dwmc sbdm,sgdmc sgd,sjs,zjxm,ysgcjdmc,kgrq,jgrq,khbh ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm ";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" and crm_khxx.gcjdbm!='5'";
    ls_sql+=" and rownum<50 ";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("","","InsertJc_cgdd.jsp?zt="+zt,"");
	pageObj.setPageRow(50);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","sbrq","hdbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("录入");
	pageObj.setViewBolt("");
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">直接录入合同</font></B>
</CENTER>
<form method="POST" name="listform">
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="8%">合同号</td>
	<td  width="6%">姓名</td>
	<td  width="24%">房屋地址</td>
	<td  width="11%">签约店面</td>
	<td  width="6%">施工队</td>
	<td  width="7%">设计师</td>
	<td  width="6%">质检员</td>
	<td  width="6%">工程进度</td>
	<td  width="8%">应开工日期</td>
	<td  width="8%">应竣工日期</td>
	<td  width="6%">客户编号</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>
