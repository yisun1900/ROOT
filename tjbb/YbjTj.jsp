<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>样板间汇总表<BR>
  (可参观截止时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">项目经理</td>
  <td  width="10%">第一周</td>
  <td  width="10%">第二周</td>
  <td  width="10%">第三周</td>
  <td  width="10%">第四周</td>
  <td  width="10%">合计</td>
</tr>
<%
	String all=null;


	ls_sql=" SELECT sgdmc,sum(yz),sum(ez),sum(sz),sum(siz),sum(zj)";
	ls_sql+=" FROM ";
	ls_sql+=" (";

	ls_sql+=" SELECT sgdmc,count(*) yz,0 ez,0 sz,0 siz,count(*) zj";
	ls_sql+=" FROM crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and ybjyxq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw+"','YYYY-MM-DD')+7";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by sgdmc";

	ls_sql+=" union ";

	ls_sql+=" SELECT sgdmc,0 yz,count(*) ez,0 sz,0 siz,count(*) zj";
	ls_sql+=" FROM crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and ybjyxq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')+8";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw+"','YYYY-MM-DD')+14";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by sgdmc";

	ls_sql+=" union ";

	ls_sql+=" SELECT sgdmc,0 yz,0 ez,count(*) sz,0 siz,count(*) zj";
	ls_sql+=" FROM crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and ybjyxq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')+15";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw+"','YYYY-MM-DD')+21";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by sgdmc";

	ls_sql+=" union ";

	ls_sql+=" SELECT sgdmc,0 yz,0 ez,0 sz,count(*) siz,count(*) zj";
	ls_sql+=" FROM crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and ybjyxq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')+22";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw+"','YYYY-MM-DD')+31";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by sgdmc";

	ls_sql+=" )";
	ls_sql+=" group by sgdmc";

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
	pageObj.printFoot();

%>
</table>


</body>
</html>