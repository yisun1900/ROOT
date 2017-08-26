<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT crm_dmjdjl.dmjdjlh,DECODE(crm_dmjdjl.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过'),crm_dmjdjl.khbh,a.dwmc ssfgs,b.dwmc zxdm,kssj,kslrr,jssj,jslrr,dm_sbyybm.sbyymc,crm_dmjdjl.sbyyxs";
	ls_sql+=" FROM crm_dmjdjl,dm_sbyybm,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where crm_dmjdjl.ssfgs=a.dwbh(+) and crm_dmjdjl.zxdm=b.dwbh(+)";
    ls_sql+=" and crm_dmjdjl.sbyybm=dm_sbyybm.sbyybm(+) and  crm_dmjdjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_dmjdjl.dmjdjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">店面接单记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">客户服务记录号</td>
	<td  width="7%">咨询状态</td>
	<td  width="5%">客户编号</td>
	<td  width="9%">所属分公司</td>
	<td  width="10%">咨询店面</td>
	<td  width="8%">开始时间</td>
	<td  width="6%">开始录入人</td>
	<td  width="8%">结束时间</td>
	<td  width="6%">结束录入人</td>
	<td  width="10%">失败原因</td>
	<td  width="19%">失败原因详述</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>