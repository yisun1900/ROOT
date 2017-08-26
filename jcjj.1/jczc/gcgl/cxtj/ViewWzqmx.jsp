<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>工程监察表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String tjrq=request.getParameter("tjrq");
	String tjrq2=request.getParameter("tjrq2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	String ls_sql=null;
%>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<center>
  中期延期列表（计划中期验收时间：<%=tjrq%>----<%=tjrq2%>） 
</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="7%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="22%">房屋地址</td>
	<td  width="6%">设计师</td>
	<td  width="6%">施工队</td>
	<td  width="6%">质检</td>
	<td  width="9%">签约日期</td>
	<td  width="9%">签约店面</td>
	<td  width="9%">计划中期验收</td>
	<td  width="9%">实际中期验收</td>
	<td  width="7%">目前进度</td>
</tr>
<%
	//未办理中期手续数
	ls_sql="SELECT '',khbh,khxm, fwdz,sjs,sgdmc sgd,zjxm,qyrq,a.dwmc sbdm,jhzqsj,szqsj,gcjdmc   ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm ";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.zt='2' and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

	ls_sql+=" and jhzqsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and jhzqsj<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and (jhzqsj<szqsj or (szqsj is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ls_sql+=" order by jhzqsj";

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