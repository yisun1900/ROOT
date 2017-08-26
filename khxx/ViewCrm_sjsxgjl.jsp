<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">修改记录 </div>
<table width="500%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">修改记录号</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">合同号</td>
	<td  width="3%">修改前分公司</td>
	<td  width="3%">修改前签约店面</td>
	<td  width="2%">修改前设计室</td>
	<td  width="2%">修改前设计师</td>
	<td  width="2%">修改前设计师工号</td>
	<td  width="3%">修改前工程原报价</td>
	<td  width="3%">修改前签约额</td>
	<td  width="2%">修改前税金</td>
	<td  width="2%">修改前税金百分比</td>
	<td  width="3%">修改前设计费</td>
	<td  width="2%">修改前管理费</td>
	<td  width="2%">修改前折扣率</td>
	<td  width="3%">修改前公司促销活动</td>
	<td  width="3%">修改前小区促销活动</td>
	<td  width="2%">修改前展会促销活动</td>
	<td  width="2%">修改后分公司</td>
	<td  width="2%">修改后签约店面</td>
	<td  width="2%">修改后设计室</td>
	<td  width="2%">修改后设计师</td>
	<td  width="2%">修改后设计师工号</td>
	<td  width="3%">修改后工程原报价</td>
	<td  width="3%">修改后签约额</td>
	<td  width="2%">修改后税金</td>
	<td  width="2%">修改后税金百分比</td>
	<td  width="3%">修改后设计费</td>
	<td  width="2%">修改后管理费</td>
	<td  width="2%">修改后折扣率</td>
	<td  width="3%">修改后促销活动</td>
	<td  width="3%">修改后小区促销活动</td>
	<td  width="2%">修改后展会促销活动</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="2%">删除标志</td>
	<td  width="2%">删除人</td>
	<td  width="2%">删除时间</td>
	<td  width="4%">备注</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_qyexgjl.xgjlh,crm_qyexgjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,a.dwmc xgqfgsbh,b.dwmc xgqdwbh,xgqsjsbh,xgqsjs,xgqsjsgh,xgqwdzgce,xgqqye,xgqsuijin,xgqsuijinbfb,xgqsjf,xgqglf,xgqzkl,xgqcxhd,xgqcxhdbmxq,xgqcxhdbmzh,c.dwmc xghfgsbh,d.dwmc xghdwbh,xghsjsbh,xghsjs,xghsjsgh,xghwdzgce,xghqye,xghsuijin,xghsuijinbfb,xghsjf,xghglf,xghzkl,xghcxhd,xghcxhdbmxq,xghcxhdbmzh,crm_qyexgjl.lrr,crm_qyexgjl.lrsj, DECODE(crm_qyexgjl.scbz,'N','未删除','Y','删除'),crm_qyexgjl.scr,crm_qyexgjl.scsj,crm_qyexgjl.bz  ";
	ls_sql+=" FROM crm_qyexgjl,crm_khxx,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d  ";
    ls_sql+=" where crm_qyexgjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_qyexgjl.xgqfgsbh=a.dwbh(+) and crm_qyexgjl.xgqdwbh=b.dwbh(+)";
    ls_sql+=" and crm_qyexgjl.xghfgsbh=c.dwbh(+) and crm_qyexgjl.xghdwbh=d.dwbh(+)";
    ls_sql+=" and crm_qyexgjl.khbh='"+khbh+"'";
    ls_sql+=" order by lrsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>
</body>
</html>
