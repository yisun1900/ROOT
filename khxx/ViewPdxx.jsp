<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;
%>
<body bgcolor="#FFFFFF">
<div align="center">派单记录（客户编号：<%=khbh%>） </div>
<table width="150%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="5%">派单时间</td>
	<td  width="3%">施工队</td>
	<td  width="3%">班组</td>
	<td  width="4%">派单类型</td>
	<td  width="3%">优先级</td>
	<td  width="4%">是否占指标</td>
	<td  width="5%">记入派单额</td>
	<td  width="3%">派单人</td>
	<td  width="18%">派单说明</td>

	<td  width="3%">是否拒单</td>
	<td  width="5%">拒单录入时间</td>
	<td  width="6%">拒单扣除派单指标比例</td>
	<td  width="5%">扣除派单额</td>
	<td  width="3%">拒单录入人</td>
	<td  width="20%">拒单原因</td>
	<td  width="5%">考评派单标志</td>
	<td  width="5%">考评记录号</td>
	
</tr>

<%
	ls_sql="SELECT pd_pdjl.pdsj,sgdmc,pd_pdjl.sgbz";
	ls_sql+=" ,DECODE(pd_pdjl.jlbz,'0','人工派单','1','回单奖励','2','公司奖励','3','设计师指定派单','4','客户指定派单','5','大单抵小单','6','小单抵大单','7','特殊情况','8','电子派单','9','同小区派单') jlbz";
	ls_sql+=" ,TO_CHAR(pd_pdjl.sgdyxj) sgdyxj,DECODE(pd_pdjl.shzzb,'Y','占指标','N','不占') shzzb,pd_pdjl.jrpde";
	ls_sql+=" ,pd_pdjl.pdr,pd_pdjl.pdsm";
	ls_sql+=" ,DECODE(pd_pdjl.hfjl,'0','接受','3','拒单','5','换队') hfjl,pd_pdjl.hfsj,DECODE(pd_pdjl.kczbbl,'0','不扣指标','1','扣除单倍派单额','2','扣除2倍派单额','3','扣除3倍派单额') kczbbl";
	ls_sql+=" ,pd_pdjl.kcpde,pd_pdjl.hfr,pd_pdjl.jjyy,DECODE(pd_pdjl.kppdbz,'1','非考评派单','2','考评派单') kppdbz,pd_pdjl.kpjlh";
	ls_sql+=" FROM crm_khxx,sq_sgd,pd_pdjl ";
    ls_sql+=" where pd_pdjl.khbh=crm_khxx.khbh and pd_pdjl.sgd=sq_sgd.sgd(+)  ";
	ls_sql+=" and pd_pdjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_pdjl.xuhao,pd_pdjl.pdsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>


<div align="center">派单优先级 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2"  width="5%">本次派单施工队</td>
    <td rowspan="2"  width="5%">直属</td>
    <td rowspan="2"  width="6%">施工队</td>
    <td rowspan="2"  width="6%">是否被选施工队</td>
    <td rowspan="2"  width="4%">优先级</td>
    <td rowspan="2"  width="5%">欠单率</td>
    <td colspan="4">本期可接单</td>
    <td colspan="4">已接单</td>
    <td colspan="4">剩余单</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="6%">总额</td>
    <td  width="6%">大单额</td>
    <td  width="6%">中单额</td>
    <td  width="5%">小单额</td>
    <td  width="6%">总额</td>
    <td  width="6%">大单额</td>
    <td  width="6%">中单额</td>
    <td  width="5%">小单额</td>
    <td  width="6%">总额</td>
    <td  width="6%">大单额</td>
    <td  width="6%">中单额</td>
    <td  width="5%">小单额</td>
  </tr>
  <%

	ls_sql="SELECT a.sgdmc pdsgd,DECODE(b.sgdlx,'S0','非直属','S1','直属') sgdlx,b.sgdmc sgd,DECODE(sfbxsgd,'Y','<font color=\"#CC0000\">派单</font>','N','<font color=\"#0000CC\">候选队</font>','M','未候选队'),hxsgdyxj,qdl,bqjdze,bqdde,bqzde,bqxde,yjdze,yjddje,yjzdje,yjxdje,sydze,syddje,syzdje,syxdje";
	ls_sql+=" FROM pd_pdyxjjl,sq_sgd a,sq_sgd b";
    ls_sql+=" where pd_pdyxjjl.pdsgd=a.sgd(+) and pd_pdyxjjl.sgd=b.sgd(+)";
    ls_sql+=" and pd_pdyxjjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_pdyxjjl.pdsgd,b.sgdlx desc,hxsgdyxj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("pdsgd","1");//列参数对象加入Hash表
	spanColHash.put("sgdlx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>

<div align="center">换施工队记录 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">换施工队时间</td>
	<td  width="7%">原施工队</td>
	<td  width="7%">原施工班长</td>
	<td  width="7%">新施工队</td>
	<td  width="7%">新施工班长</td>
	<td  width="8%">扣原施工队派单指标百分比</td>
	<td  width="8%">扣新施工队派单指标百分比</td>
	<td  width="7%">操作人</td>
	<td  width="40%">换施工队原因</td>
</tr>

<%

	ls_sql="SELECT pd_hsgdjl.lrsj,b.sgdmc oldsgd,pd_hsgdjl.oldsgbz,a.sgdmc newsgd,pd_hsgdjl.newsgbz";
	ls_sql+=" ,pd_hsgdjl.oldkzbbfb||'%' oldkzbbfb,pd_hsgdjl.newkzbbfb||'%' newkzbbfb,pd_hsgdjl.lrr,pd_hsgdjl.hsgdyy";
	ls_sql+=" FROM sq_sgd a,sq_sgd b,pd_hsgdjl ";
    ls_sql+=" where pd_hsgdjl.newsgd=a.sgd(+) and pd_hsgdjl.oldsgd=b.sgd(+) ";
    ls_sql+=" and pd_hsgdjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_hsgdjl.xuhao";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>


</body>
</html>
