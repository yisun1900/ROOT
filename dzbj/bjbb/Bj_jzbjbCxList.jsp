<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String kkbbz=(String)session.getAttribute("kkbbz");
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_jzbjb1_dqbm=null;
	String bj_jzbjb1_xmbh=null;
	String bj_jzbjb1_xmmc=null;
	String[] bj_jzbjb1_xmdlbm=null;
	String[] bj_jzbjb1_xmxlbm=null;
	String bj_jzbjb1_smbm=null;
	String bj_jzbjb1_jldwbm=null;

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzbjb1.bjbbh='"+bjbbh+"')";
	}

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		if (!(sfbxx.equals("")))	wheresql+=" and  (bj_jzbjb1.sfbxx='"+sfbxx+"')";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzbjb1.bjjbbm='"+bjjbbm+"')";
	}

	
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_jzbjb1.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (bj_jzbjb1.lrsj=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_jzbjb1.gycl like '%"+gycl+"%')";
	}
	bj_jzbjb1_dqbm=request.getParameter("bj_jzbjb1_dqbm");
	if (!(bj_jzbjb1_dqbm.equals("")))	wheresql+=" and  (bj_jzbjb1.dqbm='"+bj_jzbjb1_dqbm+"')";


	bj_jzbjb1_xmbh=request.getParameter("bj_jzbjb1_xmbh");
	if (bj_jzbjb1_xmbh!=null)
	{
		bj_jzbjb1_xmbh=cf.GB2Uni(bj_jzbjb1_xmbh);
		if (!(bj_jzbjb1_xmbh.equals("")))	wheresql+=" and  (bj_jzbjb1.xmbh='"+bj_jzbjb1_xmbh+"')";
	}
	bj_jzbjb1_xmmc=request.getParameter("bj_jzbjb1_xmmc");
	if (bj_jzbjb1_xmmc!=null)
	{
		bj_jzbjb1_xmmc=cf.GB2Uni(bj_jzbjb1_xmmc);
		if (!(bj_jzbjb1_xmmc.equals("")))	wheresql+=" and  (bj_jzbjb1.xmmc like '%"+bj_jzbjb1_xmmc+"%')";
	}
	bj_jzbjb1_xmdlbm=request.getParameterValues("bj_jzbjb1_xmdlbm");
	if (bj_jzbjb1_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb1_xmdlbm,"bj_jzbjb1.xmdlbm");
	}
	bj_jzbjb1_xmxlbm=request.getParameterValues("bj_jzbjb1_xmxlbm");
	if (bj_jzbjb1_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb1_xmxlbm,"bj_jzbjb1.xmxlbm");
	}
	bj_jzbjb1_smbm=request.getParameter("bj_jzbjb1_smbm");
	if (bj_jzbjb1_smbm!=null)
	{
		bj_jzbjb1_smbm=cf.GB2Uni(bj_jzbjb1_smbm);
		if (!(bj_jzbjb1_smbm.equals("")))	wheresql+=" and  (bj_jzbjb1.smbm='"+bj_jzbjb1_smbm+"')";
	}
	bj_jzbjb1_jldwbm=request.getParameter("bj_jzbjb1_jldwbm");
	if (bj_jzbjb1_jldwbm!=null)
	{
		bj_jzbjb1_jldwbm=cf.GB2Uni(bj_jzbjb1_jldwbm);
		if (!(bj_jzbjb1_jldwbm.equals("")))	wheresql+=" and  (bj_jzbjb1.jldwbm='"+bj_jzbjb1_jldwbm+"')";
	}


	ls_sql="SELECT bj_jzbjb1.bjbbh,bj_jzbjb1.xmbh,bj_jzbjb1.xmmc,jdm_jldwbm.jldwmc,DECODE(bj_jzbjb1.sfbxx,'1','<font color=\"#FF0000\">�ر���</font>','2','<font color=\"#CC00CC\">������</font>','3','��ѡ��','9','<font color=\"#0000FF\">������</font>') sfbxx,bjjbmc,bj_jzbjb1.bj,glxmbh,xmxlmc,xmdlmc,smmc,gycl,lrr,lrsj,bj_jzbjb1.xh,dqmc";
	ls_sql+=" FROM bj_jzbjb1,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm  ";
	ls_sql+=" where bj_jzbjb1.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_jzbjb1.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_jzbjb1.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_jzbjb1.smbm=bdm_smbm.smbm(+) and bj_jzbjb1.dqbm=dm_dqbm.dqbm(+) and bj_jzbjb1.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_jzbjb1.bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"')";
	ls_sql+=wheresql;

	ls_sql+=" order by bj_jzbjb1.bjbbh,bj_jzbjb1.dqbm,bj_jzbjb1.xmdlbm,bj_jzbjb1.xmxlbm,bj_jzbjb1.xh,bj_jzbjb1.xmbh,bj_jzbjb1.bjjbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_jzbjbCxList.jsp","","","");
//	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��


	pageObj.alignStr[11]="align='left'";
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<title>��׼��Ŀ��ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>

<%
if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;'>
	<%
}
else{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>


<CENTER >
  <B><font size="3">��׼��Ŀ��ѯ</font></B>
</CENTER>

<div style="height:100%;width:100%;overflow:auto;">

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200,2,2);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���۰汾��</td>
	<td  width="6%">��Ŀ���</td>
	<td  width="12%">��Ŀ����</td>
	<td  width="3%">������λ</td>
	<td  width="3%">�Ƿ��ѡ��</td>
	<td  width="4%">���ۼ���</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="10%">������Ŀ���</td>
	<td  width="6%">��ĿС��</td>
	<td  width="5%">��Ŀ����</td>
	<td  width="4%">����</td>
	<td  width="25%">���ղ��ϼ��</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="2%">���</td>
	<td  width="3%">����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printPageLinkTr();
	pageObj.displayFoot();
%> 
</div>

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}

//-->
</SCRIPT>

</html>