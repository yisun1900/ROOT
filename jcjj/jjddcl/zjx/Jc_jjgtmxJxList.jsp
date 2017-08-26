<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT gtxh,gtmc,jjazwz,guige,jjlx,bclx,bcys,bcbfje,pjbfje,zj,zqbcbfje,zqpjbfje,zqzj  ";
	ls_sql+=" FROM jc_jjgtmx  ";
    ls_sql+=" where ddbh='"+ddbh+"' and zjhsl>0 ";
    ls_sql+=" and gtxh not in(select gtxh from jc_gtzjxmx where zjxxh='"+zjxxh+"')";
    ls_sql+=" order by gtxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gtxh","ddbh","gtmc","jjazwz","guige","jjlx","bcpp","bcys","bcbfje","pjbfje","zj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gtxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"减项选中柜体"};//按钮的显示名称
	String[] buttonLink={"Jc_jjgtmxJx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
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
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">柜体减项（订单编号：<%=ddbh%>）</font></B> 
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">柜体序号</td>
	<td  width="7%">柜体名称</td>
	<td  width="6%">安装位置</td>
	<td  width="8%">规格</td>
	<td  width="8%">家具系列</td>
	<td  width="13%">板材类型</td>
	<td  width="6%">板材颜色</td>
	<td  width="7%"><span class="STYLE1">板材金额-折后</span></td>
	<td  width="7%"><span class="STYLE1">配件金额-折后</span></td>
	<td  width="7%"><span class="STYLE1">总价-折后</span></td>
	<td  width="7%"><strong>板材金额-折前</strong></td>
	<td  width="7%"><strong>配件金额-折前</strong></td>
	<td  width="7%"><strong>总价-折前</strong></td>
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