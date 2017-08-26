<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT bj_sfxmmx.sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflxmc,DECODE(sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','4','公司购主材间接费','5','工程管理费','6','工程税金','7','公司购主材管理费','8','公司购主材税金','A','自购主材管理费','B','自购主材税金','C','自购主材间接费','D','水电路','9','其它') sfxmlxmc,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.sfbfb||'%' sfbfb,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.zqsfje,bj_sfxmmx.sfje,DECODE(bj_sfxmmx.sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','收取','2','不收取') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','收取','2','不收取') jrglfbz,DECODE(bj_sfxmmx.sfssjf,'1','收取','2','不收取') sfssjf,bj_sfxmmx.bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by sfxmlx,bj_sfxmmx.sfxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditBj_sfxmmx.jsp?khbh="+khbh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"sfxmbm","sfxmmc","sflxmc","sfxmlxmc","sfbfb","jldw","sl","dj","dxzkl","zqsfje","sfje","sfjrqye","jrsjbz","jrglfbz","sfssjf","bz"};
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
  <B><font size="3">其它收费项目明细（客户编号：<%=khbh%>）
  </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="4%">项目编码</td>
	<td  width="12%">收费项目</td>
	<td  width="9%">收费计算方式</td>
	<td  width="6%">收费类型</td>
	<td  width="4%">收费百分比</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">数量</td>
	<td  width="5%">单价</td>
	<td  width="4%">单项折扣</td>
	<td  width="6%">折前金额</td>
	<td  width="6%">折后金额</td>
	<td  width="4%">是否记入业绩</td>
	<td  width="4%">收税金</td>
	<td  width="4%">收管理费</td>
	<td  width="4%">收设计费</td>
	<td  width="22%">备注</td>
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