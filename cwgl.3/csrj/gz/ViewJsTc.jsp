<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">员工姓名</td>
	<td  width="7%">行政职务</td>
	<td  width="8%">所属部门</td>
	<td  width="5%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="15%">地址</td>
	<td  width="7%">家装签约额</td>
	<td  width="7%">主材金额</td>
	<td  width="7%">提成基数</td>
	<td  width="5%">提成比率</td>
	<td  width="7%">提成金额</td>
	<td  width="5%">签单提成比率</td>
	<td  width="5%">业务员扣点</td>
	<td  width="5%">主材考核提成比率</td>
	<td  width="7%">备注</td>
</tr>
<%
	String ssfgs=request.getParameter("ssfgs");
	String khzq=request.getParameter("khzq");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT rs_jstcmx.yhmc,rs_jstcmx.xzzwbm,dwmc,rs_jstcmx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,rs_jstcmx.qye,rs_jstcmx.zcje,tcjs,tcbl||'%',tcje,qdtcbl||'%',ywykd||'%',zckhtcbl||'%',rs_jstcmx.bz  ";
	ls_sql+=" from rs_jstcmx,sq_dwxx,crm_zxkhxx";
	ls_sql+=" where rs_jstcmx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_jstcmx.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=" and rs_jstcmx.khzq='"+khzq+"' and rs_jstcmx.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_jstcmx.dwbh,rs_jstcmx.xzzwbm,rs_jstcmx.ygbh,rs_jstcmx.khbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
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