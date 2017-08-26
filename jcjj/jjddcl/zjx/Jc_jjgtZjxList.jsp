<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT jc_jjgtmx.gtxh,DECODE(jc_gtzjxmx.ysl-jc_gtzjxmx.xsl,1,'减项',-1,'增项+'),jc_jjgtmx.gtmc,jc_jjgtmx.jjazwz,jc_jjgtmx.guige,jc_jjgtmx.jjlx,jc_jjgtmx.bclx,jc_jjgtmx.bcys,(jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*jc_jjgtmx.zj,(jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*zqzj";
	ls_sql+=" FROM jc_jjgtmx,jc_gtzjxmx  ";
    ls_sql+=" where jc_jjgtmx.gtxh=jc_gtzjxmx.gtxh and jc_gtzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by gtxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_jjgtmx.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//	pageObj.setEditBolt("");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gtxh","ddbh","gtmc","jjazwz","guige","jjlx","bcpp","bcys","bcbfje","pjbfje","zj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gtxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除增减项"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_jjgtmx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"gtxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjddcl/ht/ViewJc_jjgtmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gtxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">柜体增减项（增减项序号：<%=zjxxh%>）</font></B> 
  </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">柜体序号</td>
	<td  width="5%">标志</td>
	<td  width="9%">柜体名称</td>
	<td  width="8%">安装位置</td>
	<td  width="10%">规格</td>
	<td  width="12%">家具系列</td>
	<td  width="16%">板材类型</td>
	<td  width="8%">板材颜色</td>
	<td  width="8%"><span class="STYLE1">总价-折后</span></td>
	<td  width="8%"><strong>总价-折前</strong></td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
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