<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xh=null;
	xh=request.getParameter("xh");
	wheresql+=" and  (xh='"+xh+"')";

	ls_sql="SELECT dwmc,yhmc,xzzwbm,qqts,cqts,sjts,bjts,kgts,jbgz,gwgz,khgz,jxfz,byjxgz,buzhu,glgz,jbf,jtbt,dhbt,mrcb,cb,yjsxe,tc,jf,sjkk,bjkk,cjkk,kgkk,qtkk,ksk,sqgz,shgz,rs_yggzb.bz  ";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yggzb.dwbh,rs_yggzb.yhmc";
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
  <B><font size="3">查看工资（序号:<%=xh%>）</font></B>
</CENTER>
<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="5%" rowspan="3">所属部门</td>
  <td  width="3%" rowspan="3">员工姓名</td>
  <td  width="3%" rowspan="3">职务</td>
  <td  width="2%" rowspan="3">全勤天数</td>
  <td colspan="4">考勤天数</td>
  <td colspan="5">基本</td>
  <td colspan="8">福利</td>
  <td colspan="8">其它</td>
  <td  width="3%" rowspan="3">应发工资</td>
  <td  width="3%" rowspan="3">实发工资</td>
  <td  width="11%" rowspan="3">备注</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%" rowspan="2">出勤天数</td>
  <td  width="2%" rowspan="2">事假天数</td>
  <td  width="2%" rowspan="2">病假天数</td>
  <td  width="2%" rowspan="2">旷工天数</td>
  <td  width="3%" rowspan="2">基本工资</td>
  <td  width="3%" rowspan="2">岗位工资</td>
  <td colspan="3">绩效工资</td>
  <td  width="3%" rowspan="2">津贴</td>
  <td  width="3%" rowspan="2">工龄工资</td>
  <td  width="3%" rowspan="2">加班费</td>
  <td  width="3%" rowspan="2">交通补贴</td>
  <td  width="3%" rowspan="2">通讯补贴</td>
  <td  width="3%" rowspan="2">每日餐补</td>
  <td  width="3%" rowspan="2">餐补</td>
  <td  width="3%" rowspan="2">扣保费</td>
  <td  width="3%" rowspan="2">提成</td>
  <td  width="3%" rowspan="2">奖罚</td>
  <td colspan="4">缺勤扣款</td>
  <td  width="3%" rowspan="2">其他款项</td>
  <td  width="3%" rowspan="2">扣个税</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">绩效工资基数</td>
	<td  width="3%">绩效分值</td>
	<td  width="3%">本月绩效工资</td>
	<td  width="3%">事假扣款</td>
	<td  width="3%">病假扣款</td>
	<td  width="3%">产假扣款</td>
	<td  width="3%">旷工扣款</td>
  </tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
	</table>

</body>

</html>