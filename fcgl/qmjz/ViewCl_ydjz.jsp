<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String jzph=request.getParameter("jzph");


	ls_sql="SELECT clbm,clmc,clgg,cldlmc,jldwmc,sqkcsl,rksl,cksl,kcsl  ";
	ls_sql+=" FROM cl_ydjzmx ";
    ls_sql+=" where jzph='"+jzph+"' ";
    ls_sql+=" order by clbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);//设置每页显示记录数
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果（结转批号：<%=jzph%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">材料编码</td>
	<td  width="10%">材料名称</td>
	<td  width="6%">材料规格</td>
	<td  width="8%">材料大类</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">上期库存数量</td>
	<td  width="6%">入库数量</td>
	<td  width="6%">出库数量</td>
	<td  width="6%">库存数量</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>