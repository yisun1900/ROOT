<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>工程监察表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String px=request.getParameter("px");
	String tjrq=request.getParameter("tjrq");
	String tjrq2=request.getParameter("tjrq2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	String ls_sql=null;
%>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="4%">客户姓名</td>
	<td  width="19%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">施工队</td>
	<td  width="4%">质检</td>
	<td  width="7%">签约日期</td>
	<td  width="9%">签约店面</td>
	<td  width="7%">合同开工日期</td>
	<td  width="7%">合同竣工日期</td>
	<td  width="4%">合同工期</td>
	<td  width="7%">实开工日期</td>
	<td  width="7%">实竣工日期</td>
	<td  width="4%">实际工期</td>
	<td  width="4%">延期天数</td>
	<td  width="6%">目前进度</td>
</tr>
<%

	//未按期竣工数
	ls_sql="SELECT '',khxm, fwdz,sjs,sgdmc sgd,zjxm,qyrq,a.dwmc sbdm,kgrq,jgrq,TRUNC(jgrq-kgrq),sjkgrq,sjjgrq,TRUNC(sjjgrq-sjkgrq),TRUNC((sjjgrq-sjkgrq)-(jgrq-kgrq)) yqts,gcjdmc   ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm ";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khxx.zt='2'and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

	ls_sql+=" and jgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and jgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and ((jgrq<sjjgrq and crm_khxx.gcjdbm='5') or (crm_khxx.gcjdbm!='5'))";
	ls_sql+=wheresql;
	ls_sql+=" order by "+px;

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
%> 
</table>
</body>
</html>