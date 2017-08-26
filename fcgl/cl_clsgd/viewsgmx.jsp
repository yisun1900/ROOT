<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String sgph=request.getParameter("sgph");

	ls_sql="SELECT cl_clsgmx.clbm,cl_clsgmx.clmc,cl_clsgmx.clgg,cl_clsgmx.cldlmc,jldwmc,TO_CHAR(fgsdj),sgsl,ROUND(fgsdj*sgsl,2),shsl,ROUND(fgsdj*shsl,2)  ";
	ls_sql+=" FROM cl_clsgmx  ";
    ls_sql+=" where sgph='"+sgph+"'";
    ls_sql+=" order by cl_clsgmx.cldlmc,cl_clsgmx.clbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料申购明细（申购批号：<%=sgph%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">材料编码</td>
	<td  width="14%">材料名称</td>
	<td  width="14%">材料规格</td>
	<td  width="14%">材料大类</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">分公司材料单价</td>
	<td  width="8%">申购数量</td>
	<td  width="10%">申购金额</td>
	<td  width="8%">审核数量</td>
	<td  width="10%">审核金额</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>