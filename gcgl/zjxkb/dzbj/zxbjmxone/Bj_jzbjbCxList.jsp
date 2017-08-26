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
	String zjxxh=request.getParameter("zjxxh");
	String bjjb=cf.executeQuery("select bjjb from crm_zxkhxx where khbh='"+khbh+"'");
	String jzbz=request.getParameter("jzbz");

	String xmdlbm=request.getParameter("xmdlbm");
	String xmxlbm=request.getParameter("xmxlbm");
	String dqbm=request.getParameter("dqbm");


	String xmxlmc=cf.fillHtml(cf.executeQuery("select xmxlmc from bdm_xmxlbm where xmxlbm='"+xmxlbm+"'"));

	String ls_sql=null;


	String wheresql="";
	String xmmc=null;
	String smbm=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like'%"+xmmc+"%')";
	}
	smbm=request.getParameter("smbm");
	if (smbm!=null)
	{
		smbm=cf.GB2Uni(smbm);
		if (!(smbm.equals("")))	wheresql+=" and  (bj_jzbjb.smbm='"+smbm+"')";
	}
	xmdlbm=request.getParameter("xmdlbm");
	if (xmdlbm!=null)
	{
		xmdlbm=cf.GB2Uni(xmdlbm);
		if (!(xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmdlbm='"+xmdlbm+"')";
	}
	xmxlbm=request.getParameter("xmxlbm");
	if (xmxlbm!=null)
	{
		xmxlbm=cf.GB2Uni(xmxlbm);
		if (!(xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmxlbm='"+xmxlbm+"')";
	}
%>
<FONT COLOR=red><b>已选择的项目（<%=xmxlmc%>）：</b></font>
  <table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">项目编号</td>
	<td  width="17%">项目名称</td>
	<td  width="5%">单位</td>
	<td  width="5%">材料单价</td>
	<td  width="5%">人工单价</td>
	<td  width="5%">类型</td>
	<td  width="30%">工艺做法</td>
	<td  width="23%">备注</td>
</tr>
<%


	ls_sql="SELECT bj_jzbjb.xmbh,bj_jzbjb.xmmc,jdm_jldwbm.jldwmc,bj_jzbjb.clbj,bj_jzbjb.rgbj,DECODE(bjlx,'1','标准','2','自定义') bjlx,gycl,bz";
	ls_sql+=" FROM bj_jzbjb,jdm_jldwbm  ";
    ls_sql+=" where bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm";
    ls_sql+=" and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"'";
    ls_sql+=" and ((bj_jzbjb.bjlx='2' and bj_jzbjb.shbz='Y' and bj_jzbjb.lrr='"+yhdlm+"') or (bj_jzbjb.bjlx='2' and bj_jzbjb.shbz='M') or bj_jzbjb.bjlx='1')";//1:标准项目;2:自定义项目
    ls_sql+=" and bj_jzbjb.xmbh in(select xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"')";
    ls_sql+=wheresql;
	ls_sql+=" order by bj_jzbjb.dqbm,bj_jzbjb.xh,bj_jzbjb.xmbh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列

	pageObj.alignStr[0]="align='left'";
	pageObj.alignStr[1]="align='left'";
	pageObj.alignStr[6]="align='left'";
	pageObj.alignStr[7]="align='left'";

	pageObj.out=out;
	pageObj.getDate();

	pageObj.displayDate();
	pageObj.displayFoot();
%>

<%

	ls_sql="SELECT dqbm,bj_jzbjb.xmbh as xmbh,bj_jzbjb.xmmc,smmc,jdm_jldwbm.jldwmc,bj_jzbjb.clbj,bj_jzbjb.rgbj,DECODE(bjlx,'1','标准','2','自定义') bjlx,gycl,bz";
	ls_sql+=" FROM bj_jzbjb,bdm_smbm,jdm_jldwbm  ";
    ls_sql+=" where bj_jzbjb.smbm=bdm_smbm.smbm(+) and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm";
    ls_sql+=" and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"'";
    ls_sql+=" and ((bj_jzbjb.bjlx='2' and bj_jzbjb.lrr='"+yhdlm+"') or (bj_jzbjb.bjlx='2' and bj_jzbjb.shbz='Y') or (bj_jzbjb.bjlx='1' and bj_jzbjb.sfbxx!='9'))";//1：必报项；2：必列项；3：可选项；9：作废项
//HLBY    ls_sql+=" and ((bj_jzbjb.bjlx='2' and bj_jzbjb.shbz='Y' and bj_jzbjb.lrr='"+yhdlm+"') or (bj_jzbjb.bjlx='1' and bj_jzbjb.sfbxx!='9'))";//1：必报项；2：必列项；3：可选项；9：作废项
    ls_sql+=" and bj_jzbjb.xmbh not in(select xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"')";
    ls_sql+=wheresql;
	ls_sql+=" order by bj_jzbjb.dqbm,bj_jzbjb.xh,bj_jzbjb.xmbh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"xmbh","xmmc","jldwmc","clbj","rgbj","bjlx","gycl","bz"};
	pageObj.setDisColName(disColName);
//设置主键
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[0]="align='left'";
	pageObj.alignStr[1]="align='left'";
	pageObj.alignStr[6]="align='left'";
	pageObj.alignStr[7]="align='left'";
//设置按钮参数
	String[] buttonName={"保存被选项目"};//按钮的显示名称
	String[] buttonLink={"SaveInsertBj_bjxmmx.jsp?zjxxh="+zjxxh+"&khbh="+khbh+"&jzbz="+jzbz+"&dqbm="+dqbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
<FONT COLOR=red><b>未选项目（<%=xmxlmc%>）：</b></font>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<%
	pageObj.displayTopButton();
%> 
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">项目编号</td>
	<td  width="17%">项目名称</td>
	<td  width="5%">单位</td>
	<td  width="5%">材料单价</td>
	<td  width="5%">人工单价</td>
	<td  width="5%">类型</td>
	<td  width="30%">工艺做法</td>
	<td  width="23%">备注</td>
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