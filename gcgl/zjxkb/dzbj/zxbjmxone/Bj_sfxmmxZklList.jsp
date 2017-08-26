<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT bj_sfxmmx.khbh,bj_sfxmmx.sfxmbm,sfxmmc,DECODE(bj_sfxmmx.sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金(百分比)','4','固定金额(不可改)','5','管理费(百分比)','6','主材费百分比','7','工程加主材费百分比') sflx,DECODE(bj_sfxmmx.sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','不可打折','Y','可打折') sfkdz,TO_CHAR(zdzk) zdzk,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje,bj_sfxmmx.bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditZklBj_sfxmmx.jsp?khbh="+khbh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"khbh","sfxmmc","sflx","sfjrqye","jrsjbz","jrglfbz","sfkdz","zdzk","sfbfb","zqsfje","dxzkl","sfje","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"sfxmbm"};
	pageObj.setKey(keyName);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">其它收费项目－调单项折扣
  </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">客户编号</td>
	<td  width="12%">收费项目</td>
	<td  width="11%">收费类型</td>
	<td  width="5%">记入签约额</td>
	<td  width="5%">记入税金基数</td>
	<td  width="5%">记入管理费基数</td>
	<td  width="5%">是否可打折</td>
	<td  width="5%">允许最低折扣</td>
	<td  width="5%">收费百分比</td>
	<td  width="7%">折前收费金额</td>
	<td  width="5%">单项折扣率</td>
	<td  width="7%">折后收费金额</td>
	<td  width="24%">备注</td>
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