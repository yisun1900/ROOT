<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>

<%
	String yhdlm=(String)session.getAttribute("yhdlm");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String bjjb=request.getParameter("bjjb");
	String jzbz=request.getParameter("jzbz");

	String khbh=request.getParameter("khbh");
	String xmdlbm=request.getParameter("xmdlbm");
	String xmxlbm=request.getParameter("xmxlbm");
	String dqbm=request.getParameter("dqbm");

	if (xmdlbm.equals(""))
	{
		return;
	}

	String ls_sql=null;


	String wheresql="";
	String xmmc=null;
	String smbm=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc like'%"+xmmc+"%')";
	}
	smbm=request.getParameter("smbm");
	if (smbm!=null)
	{
		smbm=cf.GB2Uni(smbm);
		if (!(smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+smbm+"')";
	}
%>
<FONT COLOR=red><b>已选择的项目：</b></font>
  <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="9%">项目编号</td>
	<td  width="29%">项目名称</td>
	<td  width="11%">饰面</td>
	<td  width="6%">单位</td>
	<td  width="7%">综合单价</td>
	<td  width="7%">主材费</td>
	<td  width="6%">类型</td>
</tr>
<%


  if (bjjb.equals("A"))//A:普通;B:精品;C:乐华梅兰
	{
		ls_sql="SELECT '<font color=\"#FF3300\">已选择</font>',bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.abj as bj,azcf zcf,DECODE(bjlx,'1','标准','2','自定义') bjlx";
	}
	else if (bjjb.equals("B"))
	{
		ls_sql="SELECT '<font color=\"#FF3300\">已选择</font>',bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.bbj as bj,bzcf zcf,DECODE(bjlx,'1','标准','2','自定义') bjlx";
	}
	else if (bjjb.equals("C"))
	{
		ls_sql="SELECT '<font color=\"#FF3300\">已选择</font>',bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.cbj as bj,czcf zcf,DECODE(bjlx,'1','标准','2','自定义') bjlx";
	}

	ls_sql+=" FROM bj_gzbjb,bdm_smbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm";
    ls_sql+=" and bj_gzbjb.xmdlbm='"+xmdlbm+"' and bj_gzbjb.xmxlbm='"+xmxlbm+"' and bj_gzbjb.dqbm='"+dqbm+"'";
    ls_sql+=" and ((bj_gzbjb.bjlx='2' and bj_gzbjb.lrr='"+yhdlm+"') or (bj_gzbjb.bjlx='2' and bj_gzbjb.shbz='Y') or bj_gzbjb.bjlx='1')";//1:标准项目;2:自定义项目
    ls_sql+=" and bj_gzbjb.xmbh  in(select xmbh from bj_bjxmmx where khbh='"+khbh+"')";
//	out.print(ls_sql);
//    ls_sql+=wheresql;
	ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列


	pageObj.out=out;
	pageObj.getDate();

	pageObj.displayDate();
%>
</table>

<%

	if (bjjb.equals("A"))//A:普通;B:精品;C:乐华梅兰
	{
		ls_sql="SELECT dqbm,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.abj as bj,azcf zcf,aclf clf,argf rgf,ajjf jjf,DECODE(bjlx,'1','标准','2','自定义') bjlx";
	}
	else if (bjjb.equals("B"))
	{
		ls_sql="SELECT dqbm,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.bbj as bj,bzcf zcf,bclf clf,brgf rgf,bjjf jjf,DECODE(bjlx,'1','标准','2','自定义') bjlx";
	}
	else if (bjjb.equals("C"))
	{
		ls_sql="SELECT dqbm,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,bj_gzbjb.cbj as bj,czcf zcf,cclf clf,crgf rgf,cjjf jjf,DECODE(bjlx,'1','标准','2','自定义') bjlx";
	}

	ls_sql+=" FROM bj_gzbjb,bdm_smbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm";
    ls_sql+=" and bj_gzbjb.xmdlbm='"+xmdlbm+"' and bj_gzbjb.xmxlbm='"+xmxlbm+"' and bj_gzbjb.dqbm='"+dqbm+"'";
    ls_sql+=" and ((bj_gzbjb.bjlx='2' and bj_gzbjb.lrr='"+yhdlm+"') or (bj_gzbjb.bjlx='2' and bj_gzbjb.shbz='Y') or bj_gzbjb.bjlx='1')";//1:标准项目;2:自定义项目
    ls_sql+=" and bj_gzbjb.xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"')";
//	out.print(ls_sql);
    ls_sql+=wheresql;
	ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"xmbh","bj_gzbjb_xmmc","smmc","jdm_jldwbm_jldwmc","bj","zcf","bjlx"};
	pageObj.setDisColName(disColName);
//设置主键
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[1]="align='left'";
//设置按钮参数
	String[] buttonName={"保存被选项目"};//按钮的显示名称
	String[] buttonLink={"SaveInsertBj_bjxmmx.jsp?khbh="+khbh+"&bjjb="+bjjb+"&jzbz="+jzbz+"&dqbm="+dqbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("xmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("xmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表


%>

<form method="POST" name="listform">
<input type="hidden" name="xmdlbm" value="<%=xmdlbm%>" >
<input type="hidden" name="xmxlbm" value="<%=xmxlbm%>" >
<FONT COLOR=red><b>未选项目：</b></font>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="9%">项目编号</td>
	<td  width="30%">项目名称</td>
	<td  width="11%">饰面</td>
	<td  width="6%">单位</td>
	<td  width="7%">综合单价</td>
	<td  width="7%">主材费</td>
	<td  width="6%">类型</td>
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