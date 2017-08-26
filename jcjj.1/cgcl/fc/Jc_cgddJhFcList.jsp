<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String ddbh=null;
	String khbh=null;
	String dwbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String cgsjs=null;
	String clzt=null;
	String khlx=null;
	String fgs=null;

	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (jc_cgdd.dwbh='"+dwbh+"')";
	}
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+ddbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (jc_cgdd.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (jc_cgdd.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (jc_cgdd.lxfs='"+lxfs+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (jc_cgdd.hth='"+hth+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
	}
	cgsjs=request.getParameter("cgsjs");
	if (cgsjs!=null)
	{
		cgsjs=cf.GB2Uni(cgsjs);
		if (!(cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs='"+cgsjs+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+clzt+"')";
	}
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		khlx=cf.GB2Uni(khlx);
		if (!(khlx.equals("")))	wheresql+=" and  (jc_cgdd.khlx='"+khlx+"')";
	}

	ls_sql="SELECT jc_cgdd.ddbh as ddbh,jc_cgdd.khbh as khbh,jc_cgdd.khxm as khxm,jc_cgdd.fwdz as fwdz,jc_cgdd.hth as hth,clgw,jc_cgdd.xmzy,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs, DECODE(jc_cgdd.clzt,'00','预订单未完成','01','预订单已完成','02','已派单','03','已初测','04','已复测','05','签订合同','06','合同已确认','07','已入库','08','已安装') as jc_cgdd_clzt, DECODE(jc_cgdd.khlx,'1','装修客户','2','橱柜客户') as jc_cgdd_khlx,jc_cgdd.jhfcsj,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_cgdd,sq_dwxx";
    ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh ";
    ls_sql+=" and jc_cgdd.clzt in('01','02','03')";
	ls_sql+=wheresql;
    ls_sql+=" order by jc_cgdd.pdsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","XgJhFcJc_cgdd.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditStr("修改");//设置每页显示记录数
//设置显示列
	String[] disColName={"ddbh","jc_cgdd_clzt","jc_cgdd_cgsjs","jhfcsj","khxm","fwdz","hth","clgw","xmzy","jc_cgdd_dj","jc_cgdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jc_cgdd_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改计划复测时间</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%">订单编号</td>
	<td  width="7%">处理状态</td>
	<td  width="6%">家居设计师</td>
	<td  width="8%">计划复测时间</td>
	<td  width="6%">客户姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="8%">合同号</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="6%">项目专员</td>
	<td  width="7%">橱柜订金</td>
	<td  width="7%">客户类型</td>
	<td  width="10%">录入部门</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>