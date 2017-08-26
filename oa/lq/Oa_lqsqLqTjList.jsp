<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	Hashtable spanColHash=new Hashtable();
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>

<CENTER >计划领取种类统计(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">办公用品</td>
	<td  width="8%">计划领取数量</td>
	<td  width="5%">单价</td>
	<td  width="7%">采购金额</td>
</tr>
<%
	ls_sql="SELECT oa_bgypbm.bgypmc,sum(oa_lqsq.jhlqsl),TO_CHAR(dj) dj,sum(oa_lqsq.jhlqsl*dj) sjje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq  ";
    ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm and oa_lqsq.lqzt='N'";
    ls_sql+=" and jhlqrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and jhlqrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" group by oa_bgypbm.bgypmc,dj";
	ls_sql+=" order by oa_bgypbm.bgypmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

<P><CENTER >已领取种类统计(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">办公用品</td>
	<td  width="8%">领取数量</td>
	<td  width="5%">单价</td>
	<td  width="7%">领取金额</td>
</tr>
<%
	ls_sql="SELECT oa_bgypbm.bgypmc,sum(oa_lqsq.slqsl),TO_CHAR(dj) dj,sum(oa_lqsq.slqsl*dj) sjje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq  ";
    ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm and oa_lqsq.lqzt='Y'";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" group by oa_bgypbm.bgypmc,dj";
	ls_sql+=" order by oa_bgypbm.bgypmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

<P><CENTER >个人领取情况统计(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">部门</td>
	<td  width="5%">申领人</td>
	<td  width="5%">领取数量</td>
	<td  width="7%">标准金额(元)</td>
	<td  width="7%">领取金额(元)</td>
	<td  width="7%">剩余金额(元)</td>
</tr>
<%
	ls_sql=" SELECT dwmc,slr,sl,bz,je,syje";
	ls_sql+=" from ( ";

	ls_sql+=" SELECT dwmc,slr,sum(oa_lqsq.slqsl) sl,je bz,sum(oa_lqsq.slqsl*dj) je,je-sum(oa_lqsq.slqsl*dj) syje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx,oa_bgypbz  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and oa_lqsq.dwbh=oa_bgypbz.dwbh and oa_lqsq.slr=oa_bgypbz.xm";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" group by dwmc,slr,je";


	ls_sql+=" union ";

	ls_sql+=" SELECT dwmc,xm slr,0 sl,je bz,0 je,je syje";
	ls_sql+=" FROM sq_dwxx,oa_bgypbz  ";
    ls_sql+=" where oa_bgypbz.dwbh=sq_dwxx.dwbh and oa_bgypbz.xm not in ";
	ls_sql+=" (SELECT slr";
	ls_sql+=" FROM oa_lqsq";
    ls_sql+=" where lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD'))";
	

	ls_sql+=" ) ";

	
	ls_sql+=" order by dwmc,slr";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//设置每页显示记录数


//设置显示合并列
	spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("slr","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

<P><CENTER >部门领取情况统计(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">部门</td>
	<td  width="5%">领取数量</td>
	<td  width="7%">标准金额(元)</td>
	<td  width="7%">领取金额(元)</td>
	<td  width="7%">剩余金额(元)</td>
</tr>
<%
	ls_sql="SELECT dwmc,sl,(select sum(je) from oa_bgypbz where oa_bgypbz.dwbh=abc.dwbh) ,abc.je,(select sum(je) from oa_bgypbz where oa_bgypbz.dwbh=abc.dwbh)-syje";
	ls_sql+=" from ( ";

	ls_sql+=" SELECT dwmc,sum(oa_lqsq.slqsl) sl,oa_lqsq.dwbh dwbh,sum(oa_lqsq.slqsl*dj) je,sum(oa_lqsq.slqsl*dj) syje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx,oa_bgypbz  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and oa_lqsq.dwbh=oa_bgypbz.dwbh and oa_lqsq.slr=oa_bgypbz.xm";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" group by dwmc,oa_lqsq.dwbh";

	ls_sql+=" union ";

	ls_sql+=" SELECT dwmc,0 sl,oa_bgypbz.dwbh dwbh,0 je,0";
	ls_sql+=" FROM sq_dwxx,oa_bgypbz  ";
    ls_sql+=" where oa_bgypbz.dwbh=sq_dwxx.dwbh and oa_bgypbz.dwbh not in ";
	ls_sql+=" (SELECT dwbh";
	ls_sql+=" FROM oa_lqsq";
    ls_sql+=" where lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD'))";
	ls_sql+=" group by dwmc,oa_bgypbz.dwbh";
	

	ls_sql+=" ) abc";
	ls_sql+=" order by dwmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//设置每页显示记录数


//设置显示合并列
	spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

<P><CENTER >个人领取统计(<%=sjfw%>---<%=sjfw2%>)</CENTER>
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
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
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