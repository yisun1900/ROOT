<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	String ls_sql=null;

	ls_sql="SELECT cw_gdjkjl.gdjkjlh as gdjkjlh,cw_gdjkjl.khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.zjxm as crm_khxx_zjxm,sgdmc as sgd, DECODE(cw_gdjkjl.jklx,'1','生活费','2','材料款','9','其它') as cw_gdjkjl_jklx,cw_gdjkjl.jkje as cw_gdjkjl_jkje,cw_gdjkjl.jkblr as cw_gdjkjl_jkblr,cw_gdjkjl.jkblsj as cw_gdjkjl_jkblsj,cw_gdjkjl.lrr,cw_gdjkjl.lrsj,dwmc,DECODE(cw_gdjkjl.gdjsjd,'0','未结算','1','已结算') gdjsjd,cw_gdjkjl.gdjsjlh,cw_gdjkjl.bz as cw_gdjkjl_bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdjkjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjkjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and cw_gdjkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and cw_gdjkjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_khxx.sgd,cw_gdjkjl.gdjkjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"sgd","crm_khxx_khxm","gdjkjlh","cw_gdjkjl_jklx","cw_gdjkjl_jkje","cw_gdjkjl_jkblr","cw_gdjkjl_jkblsj","lrr","lrsj","dwmc","gdjsjd","gdjsjlh","cw_gdjkjl_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"gdjkjlh"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_khxm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">借款记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">施工队</td>
	<td  width="4%">客户姓名</td>
	<td  width="5%">施工队借款记录号</td>
	<td  width="5%">借款类型</td>
	<td  width="6%">借款金额</td>
	<td  width="4%">办理人</td>
	<td  width="6%">办理时间</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="4%">结算标志</td>
	<td  width="5%">结算记录号</td>
	<td  width="10%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>