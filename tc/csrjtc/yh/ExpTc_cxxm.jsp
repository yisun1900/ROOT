<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjjbbm=null;
	String dqbm=null;

	bjjbbm=request.getParameter("bjjbbm");
	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT cxxmbm,xmmc,ppmc,xh,jdm_jldwbm.jldwbm,dj,bz ";
	ls_sql+=" FROM tc_cxxm,jdm_jldwbm  ";
    ls_sql+=" WHERE tc_cxxm.dqbm='"+dqbm+"' and tc_cxxm.bjjbbm='"+bjjbbm+"'";
	ls_sql+=" and tc_cxxm.jldw=jdm_jldwbm.jldwbm(+)" ;
    ls_sql+=" and tc_cxxm.bjjbbm='"+bjjbbm+"' and tc_cxxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_cxxm.cxxmbm,tc_cxxm.xmmc ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	  <td width="15%">促销项目编码</td>
      <td width="15%">项目名称</td>
      <td width="15%">品牌</td>
	  <td width="18%">型号</td>
      <td width="12%">计量单位</td>
      <td width="10%">单价</td>
      <td width="15%">备注及工艺说明</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>