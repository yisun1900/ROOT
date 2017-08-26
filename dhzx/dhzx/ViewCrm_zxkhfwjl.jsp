<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT crm_zxkhfwjl.lrsj,crm_zxkhfwjl.lrr,DECODE(crm_zxkhfwjl.czlx,'1','总部客户录入','2','分公司客户录入','3','店面客户录入','4','分配分公司','5','分配店面','6','换店面','7','分配设计师','8','换设计师','9','设计师咨询','A','设回访时间','B','客户回访','C','签单登记','D','失败登记'), DECODE(crm_zxkhfwjl.xzxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过'),crm_zxkhfwjl.khbh,a.dwmc ssfgs,b.dwmc zxdm,crm_zxkhfwjl.sjs,d.dwmc yzxdm,crm_zxkhfwjl.ysjs,dm_sbyybm.sbyymc,crm_zxkhfwjl.sbyyxs,c.dwmc lrbm,crm_zxkhfwjl.khfwjlh  ";
	ls_sql+=" FROM crm_zxkhfwjl,dm_sbyybm,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d ";
    ls_sql+=" where crm_zxkhfwjl.ssfgs=a.dwbh(+) and crm_zxkhfwjl.zxdm=b.dwbh(+) and crm_zxkhfwjl.lrbm=c.dwbh(+) and crm_zxkhfwjl.yzxdm=d.dwbh(+)";
    ls_sql+=" and crm_zxkhfwjl.sbyybm=dm_sbyybm.sbyybm(+) and  crm_zxkhfwjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_zxkhfwjl.khfwjlh";
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
  <B><font size="3">咨询客户服务记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">录入时间</td>
	<td  width="4%">录入人</td>
	<td  width="7%">操作类型</td>
	<td  width="7%">新咨询状态</td>
	<td  width="5%">客户编号</td>
	<td  width="8%">所属分公司</td>
	<td  width="8%">新咨询店面</td>
	<td  width="4%">新设计师</td>
	<td  width="8%">原咨询店面</td>
	<td  width="4%">原设计师</td>
	<td  width="9%">失败原因</td>
	<td  width="16%">情况说明</td>
	<td  width="8%">录入部门</td>
	<td  width="6%">客户服务记录号</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>