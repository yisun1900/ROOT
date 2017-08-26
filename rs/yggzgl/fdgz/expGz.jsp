<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String xh=request.getParameter("xh");

	ls_sql="SELECT rownum,dwmc,ygbh,bianhao,yhmc,qqts,cqts,glgz,gwgz,jbgz,jtbt,cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,sqgz,ksk,shgz,''";
	ls_sql+=" FROM (";
	ls_sql+=" SELECT dwmc,TO_CHAR(ygbh) ygbh,bianhao,yhmc,qqts,cqts,glgz,gwgz,jbgz,jtbt,mrcb*cqts cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,sqgz,ksk,shgz";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
	ls_sql+=" )";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="7%">所属部门</td>
	<td  width="4%">员工序号</td>
	<td  width="5%">工号</td>
	<td  width="5%">员工姓名</td>
	<td  width="3%">全勤天数</td>
	<td  width="3%">出勤天数</td>
	<td  width="5%">工龄工资</td>
	<td  width="5%">岗位工资</td>
	<td  width="5%">底薪</td>
	<td  width="5%">交通补贴</td>
	<td  width="4%">餐补</td>
	<td  width="4%">电话补</td>
	<td  width="4%">扣保费</td>
	<td  width="5%">奖金</td>
	<td  width="4%">其它补贴</td>
	<td  width="4%">其它扣款</td>
	<td  width="5%">提成</td>
	<td  width="5%">税前工资</td>
	<td  width="5%">扣税款</td>
	<td  width="5%">税后工资</td>
	<td  width="5%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
	pageObj.printSum();
%> 
</table>

</body>
</html>