<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sqxh=request.getParameter("sqxh");

	ls_sql="SELECT oa_xcplqmx.xcpbm,DECODE(sfxsp,'N','不需要','Y','需要'),oa_xcplqmx.xcpmc,oa_xcpflbm.xcpflmc,oa_xcplqmx.jldw,oa_xcplqmx.jhlqsl,oa_xcplqmx.slqsl  ";
	ls_sql+=" FROM oa_xcpflbm,oa_xcplqmx  ";
    ls_sql+=" where oa_xcplqmx.xcpflbm=oa_xcpflbm.xcpflbm(+)";
    ls_sql+=" and oa_xcplqmx.sqxh="+sqxh;
    ls_sql+=" order by oa_xcplqmx.xcpbm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditOa_xcplqmxMain.jsp?sqxh="+sqxh);
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"xcpbm","oa_xcplqmx_xcpmc","oa_xcpflbm_xcpflmc","oa_xcplqmx_jldw","oa_xcplqmx_dj","oa_xcplqmx_jhlqsl","oa_xcplqmx_slqsl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xcpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteOa_xcplqmx.jsp?sqxh="+sqxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">印刷品领取明细（申请序号：<%=sqxh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="9%">印刷品编码</td>
	<td  width="10%">是否需审批</td>
	<td  width="22%">印刷品名称</td>
	<td  width="22%">印刷品分类</td>
	<td  width="10%">计量单位</td>
	<td  width="8%">计划领取数量</td>
	<td  width="8%">实领取数量</td>
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