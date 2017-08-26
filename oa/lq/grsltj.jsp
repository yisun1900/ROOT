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
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	Hashtable spanColHash=new Hashtable();
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>

<P><CENTER >个人申领统计（包括已领取和计划领取）(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">部门</td>
	<td  width="5%">申领人</td>
	<td  width="7%">领取状态</td>
	<td  width="12%">办公用品</td>
	<td  width="5%">单价</td>
	<td  width="5%">数量</td>
	<td  width="7%">金额</td>
</tr>
<%
	ls_sql="SELECT dwmc,slr,lx,bgypmc,TO_CHAR(dj),sl,sjje";
	ls_sql+=" from ( ";

	ls_sql+=" SELECT dwmc,slr,bgypmc,'领取' lx,dj,sum(slqsl) sl,sum(slqsl*dj) sjje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" and oa_lqsq.lqzt='Y'";
	ls_sql+=" group by dwmc,slr,bgypmc,dj";

	ls_sql+=" union ";

	ls_sql+=" SELECT dwmc,slr,bgypmc,'计划领取' lx,dj dj,sum(jhlqsl) sl,sum(jhlqsl*dj) sjje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=" and jhlqrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and jhlqrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" and oa_lqsq.lqzt='N'";
	ls_sql+=" group by dwmc,slr,bgypmc,dj";
/*
*/

	ls_sql+=" ) ";

	ls_sql+=" order by dwmc,slr,lx,bgypmc";
	
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//设置每页显示记录数


//设置显示合并列
	spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("slr","1");//列参数对象加入Hash表
	spanColHash.put("lx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>


</body>
</html>