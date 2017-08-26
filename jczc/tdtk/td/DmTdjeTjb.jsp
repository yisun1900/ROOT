<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String txlx=cf.GB2Uni(request.getParameter("txlx"));

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>店面退单统计<BR>
  (<%=sjfw%>--<%=sjfw2%>)</B> 
  <BR> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr align="center">
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr align="center"> 
          <td width="15%">分公司</td>
		  <td  width="8%">排名</td>
          <td width="20%">店面</td>
          <td width="10%">退单（起） </td>
          <td width="15%">退单金额（元）</td>
          <td width="30%">退单金额（元）</td>
        </tr>
<%
	String all=null;

	//获取总数
	ls_sql="SELECT max(sum(stje))";
	ls_sql+=" FROM crm_tddj,sq_dwxx ";
	ls_sql+=" where crm_tddj.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_tddj.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_tddj.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by dwmc";

	all=cf.executeQuery(ls_sql);

	ls_sql=" SELECT fgs,TO_CHAR(rownum),dm,sl,je,tx";
	ls_sql+=" FROM (";
	ls_sql+=" SELECT b.dwmc fgs,a.dwmc dm,count(*) sl,sum(stje) je,'<A HREF=\"ViewDmtd.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&dwbh='||crm_tddj.dwbh||'\" target=\"_blank\"><img src=\"/images/ColuGif.gif\" width='||sum(stje)*200/"+all+"||' height=14></A>' as tx";
	ls_sql+=" FROM crm_tddj,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_tddj.dwbh=a.dwbh and a.ssdw=b.dwbh";
	ls_sql+=" and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_tddj.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_tddj.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by b.dwmc,crm_tddj.dwbh,a.dwmc";
	ls_sql+=" order by count(*) desc";
	ls_sql+=" )";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[5]="align='left'";

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("fgs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>
</table>
</body>
</html>
