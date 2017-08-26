<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,clmc,sl,TO_CHAR(dj) dj,clf,llr,llsj,lrr,lrsj,bz  ";
	ls_sql+=" FROM crm_wxclfmx  ";
    ls_sql+=" where tsjlh='"+tsjlh+"'";
    ls_sql+=" order by lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditCrm_wxclfmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lrxh","tsjlh","sxcl","clf","llr","llsj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_wxclfmx.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">维修材料费明细（报修记录号：<%=tsjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">录入序号</td>
	<td  width="17%">材料名称</td>
	<td  width="6%">数量</td>
	<td  width="7%">单价</td>
	<td  width="9%">材料费</td>
	<td  width="6%">领料人</td>
	<td  width="8%">领料时间</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="58%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
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