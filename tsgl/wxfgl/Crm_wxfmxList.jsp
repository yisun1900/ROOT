<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,wxrgf,wxcf,wxclf,wxzfy,zrfcdfy,sqyzfy,gscdfy,qtfcdfy,DECODE(sfksj,'Y','是','N','否'),DECODE(jsbz,'N','未结算','Y','已结算'),jsjlh,lrr,lrsj,fysm ";
	ls_sql+=" FROM crm_wxfmx ";
    ls_sql+=" where tsjlh='"+tsjlh+"'";
    ls_sql+=" order by lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditCrm_wxfmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_wxfmx.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">维修费明细（报修记录号：<%=tsjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="4%">录入序号</td>
	<td  width="6%">维修人工费</td>
	<td  width="6%">维修车费</td>
	<td  width="6%">维修材料费</td>
	<td  width="7%">维修总费用</td>

	<td  width="6%">施工队承担费用</td>
	<td  width="6%">业主承担费用</td>
	<td  width="6%">公司承担费用</td>
	<td  width="6%">其它方承担费用</td>
	<td  width="5%">是否开收据</td>
	<td  width="5%">结算标志</td>
	<td  width="7%">结算记录号</td>

	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="12%">费用说明</td>
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