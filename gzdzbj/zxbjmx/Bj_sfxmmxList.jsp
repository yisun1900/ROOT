<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT bj_sfxmmx.khbh,bj_sfxmmx.sfxmbm,sfxmmc,DECODE(bj_sfxmmx.sflx,'1','百分比','2','固定金额') sflx,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.sfje,bj_sfxmmx.bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditBj_sfxmmx.jsp?khbh="+khbh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"khbh","sfxmmc","sflx","sfbfb","sfje","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"sfxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteBj_sfxmmx.jsp?khbh="+khbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">其它收费项目明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">客户编号</td>
	<td  width="15%">收费项目</td>
	<td  width="10%">收费类型</td>
	<td  width="10%">收费百分比</td>
	<td  width="15%">收费金额</td>
	<td  width="30%">备注</td>
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