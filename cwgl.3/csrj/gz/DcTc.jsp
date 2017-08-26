<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">员工序号</td>
	<td  width="4%">工号</td>
	<td  width="4%">员工姓名</td>
	<td  width="4%">行政职务</td>
	<td  width="4%">工种</td>
	<td  width="6%">所属部门</td>
	<td  width="4%">签单提成金额</td>
	<td  width="4%">结算提成金额</td>
	<td  width="4%">退单提成金额</td>
	<td  width="4%">设计费提成金额</td>
	<td  width="4%">主材提成金额</td>
	<td  width="4%">其他款项</td>
	<td  width="4%">应发提成</td>
	<td  width="4%">扣质保金</td>
	<td  width="4%">扣个税</td>
	<td  width="4%">实发提成</td>
	<td  width="4%">备注</td>
</tr>
<%
	String ssfgs=request.getParameter("ssfgs");
	String khzq=request.getParameter("khzq");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT ygbh,bianhao,yhmc,xzzwbm,zwmc,dwmc,qdtcje,jstcje,tdtcje,sjftcje,zctcje,qtkk,yftc,kzbj,ksk,sftc,rs_tcmxb.bz  ";
	ls_sql+=" from rs_tcmxb,sq_dwxx,dm_zwbm";
	ls_sql+=" where rs_tcmxb.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_tcmxb.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and rs_tcmxb.khzq='"+khzq+"' and rs_tcmxb.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_tcmxb.dwbh,rs_tcmxb.xzzwbm,rs_tcmxb.ygbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
	pageObj.printFoot();
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