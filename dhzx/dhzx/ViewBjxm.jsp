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
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");

	String ls_sql=null;


	String wheresql="";

%>
<FONT COLOR=red><b>已选择项目</b></font>
  <table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">是否必选项</td>
	<td  width="8%">项目编号</td>
	<td  width="18%">项目名称</td>
	<td  width="5%">饰面</td>
	<td  width="5%">单位</td>
	<td  width="5%">报价</td>
	<td  width="12%">关联项目编号</td>
	<td  width="6%">自定义项目有效期</td>
	<td  width="6%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="24%">工艺做法</td>
</tr>

<%

	ls_sql="SELECT DECODE(bj_bjxmmx.sfbxx,'1','必报项','2','必列项','3','可选项','4','自定义','9','作废项') sfbxx";
	ls_sql+=" ,bj_bjxmmx.xmbh,bj_bjxmmx.xmmc,smmc,jdm_jldwbm.jldwmc,bj_bjxmmx.dj,glxmbh,zdyxmyxq,lrr,lrsj,gycl  ";
	ls_sql+=" FROM bj_bjxmmx,bdm_smbm,jdm_jldwbm  ";
	ls_sql+=" where bj_bjxmmx.smbm=bdm_smbm.smbm(+) and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.sfbxx!='4'";
	ls_sql+=" order by bj_bjxmmx.xh,bj_bjxmmx.xmbh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//设置每页显示记录数
//设置显示列

	pageObj.alignStr[10]="align='left'";


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