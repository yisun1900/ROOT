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
	String bj_jzbjb_dqbm=null;
	String bj_jzbjb_xmbh=null;
	String bj_jzbjb_xmmc=null;
	String[] bj_jzbjb_xmdlbm=null;
	String[] bj_jzbjb_xmxlbm=null;
	String bj_jzbjb_smbm=null;
	String bj_jzbjb_jldwbm=null;

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		if (!(sfbxx.equals("")))	wheresql+=" and  (bj_gzbjb.sfbxx='"+sfbxx+"')";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_gzbjb.bjjbbm='"+bjjbbm+"')";
	}
	
	String bjlx=null;
	bjlx=request.getParameter("bjlx");
	if (bjlx!=null)
	{
		if (!(bjlx.equals("")))	wheresql+=" and  (bj_gzbjb.bjlx='"+bjlx+"')";
	}
	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		if (!(shbz.equals("")))	wheresql+=" and  (bj_gzbjb.shbz='"+shbz+"')";
	}
	
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_gzbjb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_gzbjb.gycl like '%"+gycl+"%')";
	}
	
	bj_jzbjb_dqbm=request.getParameter("bj_jzbjb_dqbm");
	if (!(bj_jzbjb_dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+bj_jzbjb_dqbm+"')";


	bj_jzbjb_xmbh=request.getParameter("bj_jzbjb_xmbh");
	if (bj_jzbjb_xmbh!=null)
	{
		bj_jzbjb_xmbh=cf.GB2Uni(bj_jzbjb_xmbh);
		if (!(bj_jzbjb_xmbh.equals("")))	wheresql+=" and  (bj_gzbjb.xmbh='"+bj_jzbjb_xmbh+"')";
	}
	bj_jzbjb_xmmc=request.getParameter("bj_jzbjb_xmmc");
	if (bj_jzbjb_xmmc!=null)
	{
		bj_jzbjb_xmmc=cf.GB2Uni(bj_jzbjb_xmmc);
		if (!(bj_jzbjb_xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc like '%"+bj_jzbjb_xmmc+"%')";
	}
	bj_jzbjb_xmdlbm=request.getParameterValues("bj_jzbjb_xmdlbm");
	if (bj_jzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmdlbm,"bj_gzbjb.xmdlbm");
	}
	bj_jzbjb_xmxlbm=request.getParameterValues("bj_jzbjb_xmxlbm");
	if (bj_jzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmxlbm,"bj_gzbjb.xmxlbm");
	}
	bj_jzbjb_smbm=request.getParameter("bj_jzbjb_smbm");
	if (bj_jzbjb_smbm!=null)
	{
		bj_jzbjb_smbm=cf.GB2Uni(bj_jzbjb_smbm);
		if (!(bj_jzbjb_smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+bj_jzbjb_smbm+"')";
	}
	bj_jzbjb_jldwbm=request.getParameter("bj_jzbjb_jldwbm");
	if (bj_jzbjb_jldwbm!=null)
	{
		bj_jzbjb_jldwbm=cf.GB2Uni(bj_jzbjb_jldwbm);
		if (!(bj_jzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_gzbjb.jldwbm='"+bj_jzbjb_jldwbm+"')";
	}

	ls_sql="SELECT bj_gzbjb.xmbh,bj_gzbjb.xmmc,DECODE(bj_gzbjb.sfbxx,'1','<font color=\"#FF0000\">��ѡ</font>','2','�Ǳ�ѡ','3','<font color=\"#0000FF\">����ѡ</font>') sfbxx,xmdlmc,xmxlmc,dqmc,DECODE(sfxycl,'1','��Ҫ','2','����Ҫ') sfxycl,jdm_jldwbm.jldwmc,smmc,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,bjjbmc,bj_gzbjb.bj,zcmc,zcgg,zcf,clf,rgf,jjf,glfbl||'%',gycl,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,bj_gzbjb.xh";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm  ";
	ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_gzbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	if (zwbm.equals("04"))//��װ���ʦ
	{
		ls_sql+=" and bj_gzbjb.bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"')";
	}
	ls_sql+=wheresql;
	ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh,bj_gzbjb.bjjbbm";
	
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_gzbjbCxList.jsp","SelectCxBj_gzbjb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
//	String[] disColName={"dqmc","xmdlmc","xmxlmc","xh","xmbh","bj_jzbjb_xmmc","smmc","jdm_jldwbm_jldwmc","bj_jzbjb_bj","bj_jzbjb_bbj","bj_jzbjb_cbj","bjlx","lrr","lrsj","shbz","gycl","bgycl","cgycl"};
//	pageObj.setDisColName(disColName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xmbh","1");//�в����������Hash��
	spanColHash.put("xmmc","1");//�в����������Hash��
	spanColHash.put("sfbxx","1");//�в����������Hash��
	spanColHash.put("xmdlmc","1");//�в����������Hash��
	spanColHash.put("xmxlmc","1");//�в����������Hash��
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("sfxycl","1");//�в����������Hash��
	spanColHash.put("jldwmc","1");//�в����������Hash��
	spanColHash.put("smmc","1");//�в����������Hash��
	spanColHash.put("bjlx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
	pageObj.alignStr[18]="align='left'";
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);

%>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��Ŀ���</td>
	<td  width="7%">��Ŀ����</td>
	<td  width="3%">�Ƿ��ѡ��</td>
	<td  width="4%">��Ŀ����</td>
	<td  width="4%">��ĿС��</td>
	<td  width="3%">����</td>
	<td  width="2%">�Ƿ���Ҫ����</td>
	<td  width="2%">������λ</td>
	<td  width="4%">����</td>
	<td  width="2%">��������</td>
	<td  width="3%">���ۼ���</td>

	<td  width="3%">�ͻ�����</td>
	<td  width="7%">��������</td>
	<td  width="7%">���Ĺ��</td>
	<td  width="3%">���ķ�</td>
	<td  width="3%">���ķ�</td>
	<td  width="3%">�˹���</td>
	<td  width="3%">��е��</td>
	<td  width="2%">����Ѱٷֱ�</td>
	<td  width="22%">���ղ��ϼ��</td>

	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">��˱�־</td>
	<td  width="2%">���</td>
	</tr>
<%

	pageObj.displayDate();
	pageObj.printPageLinkTr();
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
</script>
</html>