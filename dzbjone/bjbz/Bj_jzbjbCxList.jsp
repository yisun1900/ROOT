<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

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
	String bj_jzbjb_dqbm=null;
	String bj_jzbjb_xmbh=null;
	String bj_jzbjb_xmmc=null;
	String[] bj_jzbjb_xmdlbm=null;
	String[] bj_jzbjb_xmxlbm=null;
	String bj_jzbjb_smbm=null;
	String bj_jzbjb_jldwbm=null;

	String xmflbm=null;
	xmflbm=request.getParameter("xmflbm");
	if (xmflbm!=null)
	{
		xmflbm=cf.GB2Uni(xmflbm);
		if (!(xmflbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmflbm='"+xmflbm+"')";
	}

	String sfxycl=null;
	sfxycl=request.getParameter("sfxycl");
	if (sfxycl!=null)
	{
		sfxycl=cf.GB2Uni(sfxycl);
		if (!(sfxycl.equals("")))	wheresql+=" and  (bj_jzbjb.sfxycl='"+sfxycl+"')";
	}
	String sfxyyjd=null;
	sfxyyjd=request.getParameter("sfxyyjd");
	if (sfxyyjd!=null)
	{
		sfxyyjd=cf.GB2Uni(sfxyyjd);
		if (!(sfxyyjd.equals("")))	wheresql+=" and  (bj_jzbjb.sfxyyjd='"+sfxyyjd+"')";
	}

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzbjb.bjbbh='"+bjbbh+"')";
	}

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		if (!(sfbxx.equals("")))	wheresql+=" and  (bj_jzbjb.sfbxx='"+sfbxx+"')";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzbjb.bjjbbm='"+bjjbbm+"')";
	}

	
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_jzbjb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (bj_jzbjb.lrsj=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_jzbjb.gycl like '%"+gycl+"%')";
	}
	bj_jzbjb_dqbm=request.getParameter("bj_jzbjb_dqbm");
	if (!(bj_jzbjb_dqbm.equals("")))	wheresql+=" and  (bj_jzbjb.dqbm='"+bj_jzbjb_dqbm+"')";


	bj_jzbjb_xmbh=request.getParameter("bj_jzbjb_xmbh");
	if (bj_jzbjb_xmbh!=null)
	{
		bj_jzbjb_xmbh=cf.GB2Uni(bj_jzbjb_xmbh);
		if (!(bj_jzbjb_xmbh.equals("")))	wheresql+=" and  (bj_jzbjb.xmbh='"+bj_jzbjb_xmbh+"')";
	}
	bj_jzbjb_xmmc=request.getParameter("bj_jzbjb_xmmc");
	if (bj_jzbjb_xmmc!=null)
	{
		bj_jzbjb_xmmc=cf.GB2Uni(bj_jzbjb_xmmc);
		if (!(bj_jzbjb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+bj_jzbjb_xmmc+"%')";
	}
	bj_jzbjb_xmdlbm=request.getParameterValues("bj_jzbjb_xmdlbm");
	if (bj_jzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmdlbm,"bj_jzbjb.xmdlbm");
	}
	bj_jzbjb_xmxlbm=request.getParameterValues("bj_jzbjb_xmxlbm");
	if (bj_jzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmxlbm,"bj_jzbjb.xmxlbm");
	}
	bj_jzbjb_smbm=request.getParameter("bj_jzbjb_smbm");
	if (bj_jzbjb_smbm!=null)
	{
		bj_jzbjb_smbm=cf.GB2Uni(bj_jzbjb_smbm);
		if (!(bj_jzbjb_smbm.equals("")))	wheresql+=" and  (bj_jzbjb.smbm='"+bj_jzbjb_smbm+"')";
	}
	bj_jzbjb_jldwbm=request.getParameter("bj_jzbjb_jldwbm");
	if (bj_jzbjb_jldwbm!=null)
	{
		bj_jzbjb_jldwbm=cf.GB2Uni(bj_jzbjb_jldwbm);
		if (!(bj_jzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_jzbjb.jldwbm='"+bj_jzbjb_jldwbm+"')";
	}


	ls_sql="SELECT bj_jzbjb.bjbbh,bj_jzbjb.xmbh,bj_jzbjb.xmmc,jdm_jldwbm.jldwmc,DECODE(bj_jzbjb.sfbxx,'1','<font color=\"#FF0000\">�ر���</font>','2','<font color=\"#CC00CC\">������</font>','3','��ѡ��','9','<font color=\"#0000FF\">������</font>') sfbxx,bjjbmc,bj_jzbjb.bj,DECODE(bj_jzbjb.sfyxdz,'Y','����','N','��') sfyxdz,bj_jzbjb.zdzk,DECODE(bj_jzbjb.sfxycl,'Y','��Ҫ','N','��') sfxycl,DECODE(bj_jzbjb.sfxyyjd,'Y','��Ҫ','N','��') sfxyyjd,glxmbh,xmxlmc,xmdlmc,xmflmc,smmc,gycl,flmcgg,bz,lrr,lrsj,bj_jzbjb.xh,dqmc";
	ls_sql+=" FROM bj_jzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm,bdm_xmflbm  ";
	ls_sql+=" where bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_jzbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_jzbjb.smbm=bdm_smbm.smbm(+) and bj_jzbjb.dqbm=dm_dqbm.dqbm(+) and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_jzbjb.bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"')";
	ls_sql+=" and bj_jzbjb.xmflbm=bdm_xmflbm.xmflbm(+)"; 	

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and bj_jzbjb.dqbm in(select sq_dwxx.dqbm from sq_sqfgs,sq_dwxx where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and bj_jzbjb.dqbm in(select sq_dwxx.dqbm from sq_sqbm,sq_dwxx where sq_sqbm.dwbh=sq_dwxx.dwbh and ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;

	ls_sql+=" order by bj_jzbjb.bjbbh,bj_jzbjb.dqbm,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xh,bj_jzbjb.xmbh,bj_jzbjb.bjjbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_jzbjbCxList.jsp","","","");
//	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��


	pageObj.alignStr[16]="align='left'";
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<title>��׼��Ŀ��ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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
	pageObj.printPageLink(340,2,2);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���۰汾��</td>
	<td  width="3%">��Ŀ���</td>
	<td  width="8%">��Ŀ����</td>
	<td  width="2%">������λ</td>
	<td  width="2%">�Ƿ��ѡ��</td>
	<td  width="3%">���ۼ���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">�Ƿ��������</td>
	<td  width="2%">����ۿ�</td>
	<td  width="2%">�Ƿ���Ҫ����</td>
	<td  width="2%">�Ƿ���Ԥ����</td>
	<td  width="7%">������Ŀ���</td>
	<td  width="3%">��ĿС��</td>
	<td  width="3%">��Ŀ����</td>
	<td  width="3%">��Ŀ����</td>
	<td  width="3%">����</td>
	<td  width="22%">���ղ��ϼ��</td>
	<td  width="11%">�������ƹ��</td>
	<td  width="9%">��ע</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">���</td>
	<td  width="2%">����</td>
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