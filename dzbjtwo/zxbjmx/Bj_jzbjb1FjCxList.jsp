<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>

<%
	String yhdlm=(String)session.getAttribute("yhdlm");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");
	String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
	String zdyxmshbz=request.getParameter("zdyxmshbz");
	String bjjb=request.getParameter("bjjb");

	String ls_sql=null;

%>
<FONT COLOR=red><b>[<%=jgwzbm%>]已选择自定义项目：</b></font>
  <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">项目编号</td>
	<td  width="21%">项目名称</td>
	<td  width="10%">项目小类</td>
	<td  width="6%">单位</td>
	<td  width="6%">报价</td>
</tr>
<%

	ls_sql="SELECT bj_zdyxmb.xmbh,bj_zdyxmb.xmmc,xmxlmc,jdm_jldwbm.jldwmc,bj_zdyxmb.bj";
	ls_sql+=" FROM bj_zdyxmb,jdm_jldwbm,bdm_xmxlbm  ";
	ls_sql+=" where bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
	ls_sql+=" and bj_zdyxmb.lrr='"+yhdlm+"' and bj_zdyxmb.bjjbbm='"+bjjb+"' and bj_zdyxmb.zdyxmyxq>SYSDATE-1";
	if (zdyxmshbz.equals("Y"))
	{
		ls_sql+=" and shbz='Y' ";
	}
	ls_sql+=" and bj_zdyxmb.xmbh in(select bj_bjxmmx.xmbh from bj_bjxmmx,bj_gclmx where bj_bjxmmx.khbh='"+khbh+"'  and bj_bjxmmx.xmbh=bj_gclmx.xmbh and bj_bjxmmx.khbh=bj_gclmx.khbh and jgwzbm='"+jgwzbm+"')";
	ls_sql+=" order by bj_zdyxmb.dqbm,bj_zdyxmb.xh,bj_zdyxmb.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列

	pageObj.alignStr[0]="align='left'";
	pageObj.alignStr[1]="align='left'";

	pageObj.out=out;
	pageObj.getDate();

	pageObj.displayDate();
	pageObj.displayFoot();
%>

<%

	ls_sql="SELECT dqbm,bj_zdyxmb.xmbh as xmbh,bj_zdyxmb.xmmc,xmxlmc,jdm_jldwbm.jldwmc,bj_zdyxmb.bj";
	ls_sql+=" FROM bj_zdyxmb,jdm_jldwbm,bdm_xmxlbm  ";
	ls_sql+=" where bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
	ls_sql+=" and bj_zdyxmb.lrr='"+yhdlm+"' and bj_zdyxmb.bjjbbm='"+bjjb+"' and bj_zdyxmb.zdyxmyxq>SYSDATE-1";
	if (zdyxmshbz.equals("Y"))
	{
		ls_sql+=" and shbz='Y' ";
	}
	ls_sql+=" and bj_zdyxmb.xmbh not in(select bj_bjxmmx.xmbh from bj_bjxmmx,bj_gclmx where bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.xmbh=bj_gclmx.xmbh and bj_bjxmmx.khbh=bj_gclmx.khbh and jgwzbm='"+jgwzbm+"')";
	ls_sql+=" order by bj_zdyxmb.dqbm,bj_zdyxmb.xh,bj_zdyxmb.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"xmbh","xmmc","xmxlmc","jldwmc","bj"};
	pageObj.setDisColName(disColName);
//设置主键
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[0]="align='left'";
	pageObj.alignStr[1]="align='left'";
//设置按钮参数
	String[] buttonName={"保存被选项目"};//按钮的显示名称
	String[] buttonLink={"SaveInsertBj_bjxmmx1Fj.jsp?khbh="+khbh+"&jgwzbm="+jgwzbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>


<form method="POST" name="listform">
<FONT COLOR=red><b>[<%=jgwzbm%>]未选自定义项目：</b></font>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<%
	pageObj.displayTopButton();
%> 
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="9%">项目编号</td>
	<td  width="21%">项目名称</td>
	<td  width="10%">项目小类</td>
	<td  width="6%">单位</td>
	<td  width="6%">报价</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 

function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
//-->
</script>
</html>