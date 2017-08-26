<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String crm_khxx_khxm=null;
	String crm_khxx_ywy=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_ywy=request.getParameter("crm_khxx_ywy");
	if (crm_khxx_ywy!=null)
	{
		crm_khxx_ywy=cf.GB2Uni(crm_khxx_ywy);
		if (!(crm_khxx_ywy.equals("")))	wheresql+=" and  (crm_khxx.ywy='"+crm_khxx_ywy+"')";
	}

	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+crm_khxx_qye+") ";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye2");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+crm_khxx_qye+") ";
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
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
			//**********************************
	//根据用户属性，附加分公司查询条件
	//********************************

	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}

	ls_sql="SELECT crm_khxx.ywy as crm_khxx_ywy,crm_khxx.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.fwmj  as crm_khxx_femj,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qye as crm_khxx_qye,crm_khxx.qyrq as crm_khxx_qyrq,sq_dwxx.dwmc as crm_khxx_dwbh,crm_khxx.lrsj as crm_khxx_lrsj,crm_khxx.bz as crm_khxx_bz  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.ywy is not null";
	ls_sql+="  order by crm_khxx.dwbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_qye","crm_khxx_qyrq","crm_khxx_dwbh","crm_khxx_lrsj","crm_khxx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">签约客户资料统计</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">业务员</td>
	<td  width="8%">客户编号</td>
	<td  width="8%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="8%">房屋面积</td>
	<td  width="8%">联系方式</td>
	<td  width="8%">设计师</td>
	<td  width="8%">工程签约额</td>
	<td  width="8%">签约日期</td>
	<td  width="8%">签约店面</td>
	<td  width="8%">录入时间</td>
	<td  width="8%">备注</td>
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