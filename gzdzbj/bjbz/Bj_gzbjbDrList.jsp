<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//���ӱ����м�����
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//���ӱ����и߼�����
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//���ӱ��۸߼�����

String dybjjb=(String)session.getAttribute("bjjb");
if (dybjjb==null)
{
	dybjjb="";
}

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
	String bgycl=null;
	bgycl=request.getParameter("bgycl");
	if (bgycl!=null)
	{
		bgycl=cf.GB2Uni(bgycl);
		if (!(bgycl.equals("")))	wheresql+=" and  (bj_gzbjb.bgycl like '%"+bgycl+"%')";
	}
	String cgycl=null;
	cgycl=request.getParameter("cgycl");
	if (cgycl!=null)
	{
		cgycl=cf.GB2Uni(cgycl);
		if (!(cgycl.equals("")))	wheresql+=" and  (bj_gzbjb.cgycl like '%"+cgycl+"%')";
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

	if (dybjjb.equals("A"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bj as bj_jzbjb_bj,clf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,gycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else if (dybjjb.equals("B"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bj as bj_jzbjb_bj,clf,bj_gzbjb.bbj as bj_jzbjb_bbj,bclf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,gycl,bgycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else if (dybjjb.equals("C"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.cbj as bj_jzbjb_cbj,cclf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,cgycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else if (dybjjb.equals("D"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bj as bj_jzbjb_bj,clf,bj_gzbjb.bbj as bj_jzbjb_bbj,bclf,bj_gzbjb.cbj as bj_jzbjb_cbj,cclf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,gycl,bgycl,cgycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else if (dybjjb.equals("E"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bbj as bj_jzbjb_bbj,bclf,bj_gzbjb.cbj as bj_jzbjb_cbj,cclf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,bgycl,cgycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bj as bj_jzbjb_bj,clf,bj_gzbjb.bbj as bj_jzbjb_bbj,bclf,bj_gzbjb.cbj as bj_jzbjb_cbj,cclf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,gycl,bgycl,cgycl";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_jzbjbDrList.jsp","SelectDrBj_jzbjb.jsp","","DrBj_jzbjb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("����");


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("xmdlmc","1");//�в����������Hash��
	spanColHash.put("xmxlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//	pageObj.alignStr[15]="align='left'";
//	pageObj.alignStr[16]="align='left'";
//	pageObj.alignStr[17]="align='left'";
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
  <B><font size="3">�ӱ�׼��Ŀ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(340);


	if (dybjjb.equals("A"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">����</td>
			<td  width="3%">��Ŀ����</td>
			<td  width="3%">��ĿС��</td>
			<td  width="2%">���</td>
			<td  width="3%">��Ŀ���</td>
			<td  width="5%">��Ŀ����</td>
			<td  width="3%">����</td>
			<td  width="2%"><%=dzbjzjmc%>����</td>
			<td  width="2%"><%=dzbjzjmc%>���Ϸ�</td>
			<td  width="2%">��������</td>
			<td  width="2%">������������λ</td>
			<td  width="2%">¼����</td>
			<td  width="3%">¼��ʱ��</td>
			<td  width="2%">��˱�־</td>
			<td  width="22%"><%=dzbjzjmc%>���ղ��ϼ��</td>
			<td  width="2%">���</td>
		</tr>
		<%
	}
	else if (dybjjb.equals("B"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">����</td>
			<td  width="3%">��Ŀ����</td>
			<td  width="3%">��ĿС��</td>
			<td  width="2%">���</td>
			<td  width="3%">��Ŀ���</td>
			<td  width="5%">��Ŀ����</td>
			<td  width="3%">����</td>
			<td  width="2%"><%=dzbjzjmc%>����</td>
			<td  width="2%"><%=dzbjzjmc%>���Ϸ�</td>
			<td  width="2%"><%=dzbjzgjmc%>����</td>
			<td  width="2%"><%=dzbjzgjmc%>��������</td>
			<td  width="2%"><%=dzbjzgjmc%>���Ϸ�</td>
			<td  width="2%">��������</td>
			<td  width="2%">������������λ</td>
			<td  width="2%">¼����</td>
			<td  width="3%">¼��ʱ��</td>
			<td  width="2%">��˱�־</td>
			<td  width="21%"><%=dzbjzjmc%>���ղ��ϼ��</td>
			<td  width="21%"><%=dzbjzgjmc%>���ղ��ϼ��</td>
			<td  width="2%">���</td>
		</tr>
		<%
	}
	else if (dybjjb.equals("C"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">����</td>
			<td  width="3%">��Ŀ����</td>
			<td  width="3%">��ĿС��</td>
			<td  width="2%">���</td>
			<td  width="3%">��Ŀ���</td>
			<td  width="5%">��Ŀ����</td>
			<td  width="3%">����</td>
			<td  width="2%"><%=dzbjgjmc%>����</td>
			<td  width="2%"><%=dzbjgjmc%>���Ϸ�</td>
			<td  width="2%">��������</td>
			<td  width="2%">������������λ</td>
			<td  width="2%">¼����</td>
			<td  width="3%">¼��ʱ��</td>
			<td  width="2%">��˱�־</td>
			<td  width="22%"><%=dzbjgjmc%>���ղ��ϼ��</td>
			<td  width="2%">���</td>
		</tr>
		<%
	}
	else if (dybjjb.equals("D"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="2%">&nbsp;</td>
			<td  width="2%">����</td>
			<td  width="3%">��Ŀ����</td>
			<td  width="3%">��ĿС��</td>
			<td  width="1%">���</td>
			<td  width="2%">��Ŀ���</td>
			<td  width="5%">��Ŀ����</td>
			<td  width="3%">����</td>
			<td  width="2%"><%=dzbjzjmc%>����</td>
			<td  width="2%"><%=dzbjzjmc%>���Ϸ�</td>
			<td  width="2%"><%=dzbjzgjmc%>����</td>
			<td  width="2%"><%=dzbjzgjmc%>���Ϸ�</td>
			<td  width="2%"><%=dzbjgjmc%>����</td>
			<td  width="2%"><%=dzbjgjmc%>���Ϸ�</td>
			<td  width="2%">��������</td>
			<td  width="2%">������������λ</td>
			<td  width="2%">¼����</td>
			<td  width="3%">¼��ʱ��</td>
			<td  width="2%">��˱�־</td>
			<td  width="16%"><%=dzbjzjmc%>���ղ��ϼ��</td>
			<td  width="16%"><%=dzbjzgjmc%>���ղ��ϼ��</td>
			<td  width="16%"><%=dzbjgjmc%>���ղ��ϼ��</td>
			<td  width="2%">���</td>
		</tr>
		<%
	}
	else if (dybjjb.equals("E"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">����</td>
			<td  width="3%">��Ŀ����</td>
			<td  width="3%">��ĿС��</td>
			<td  width="2%">���</td>
			<td  width="3%">��Ŀ���</td>
			<td  width="5%">��Ŀ����</td>
			<td  width="3%">����</td>
			<td  width="2%"><%=dzbjzgjmc%>����</td>
			<td  width="2%"><%=dzbjzgjmc%>��������</td>
			<td  width="2%"><%=dzbjzgjmc%>���Ϸ�</td>
			<td  width="2%"><%=dzbjgjmc%>����</td>
			<td  width="2%"><%=dzbjgjmc%>���Ϸ�</td>
			<td  width="2%">��������</td>
			<td  width="2%">������������λ</td>
			<td  width="2%">¼����</td>
			<td  width="3%">¼��ʱ��</td>
			<td  width="2%">��˱�־</td>
			<td  width="21%"><%=dzbjzgjmc%>���ղ��ϼ��</td>
			<td  width="21%"><%=dzbjgjmc%>���ղ��ϼ��</td>
			<td  width="2%">���</td>
		</tr>
		<%
	}
	else 
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">����</td>
			<td  width="3%">��Ŀ����</td>
			<td  width="3%">��ĿС��</td>
			<td  width="1%">���</td>
			<td  width="2%">��Ŀ���</td>
			<td  width="5%">��Ŀ����</td>
			<td  width="3%">����</td>
			<td  width="2%"><%=dzbjzjmc%>����</td>
			<td  width="2%"><%=dzbjzjmc%>���Ϸ�</td>
			<td  width="2%"><%=dzbjzgjmc%>����</td>
			<td  width="2%"><%=dzbjzgjmc%>���Ϸ�</td>
			<td  width="2%"><%=dzbjgjmc%>����</td>
			<td  width="2%"><%=dzbjgjmc%>���Ϸ�</td>
			<td  width="2%">��������</td>
			<td  width="2%">������������λ</td>
			<td  width="2%">¼����</td>
			<td  width="3%">¼��ʱ��</td>
			<td  width="2%">��˱�־</td>
			<td  width="16%"><%=dzbjzjmc%>���ղ��ϼ��</td>
			<td  width="16%"><%=dzbjzgjmc%>���ղ��ϼ��</td>
			<td  width="16%"><%=dzbjgjmc%>���ղ��ϼ��</td>
			<td  width="2%">���</td>
		</tr>
		<%
	}


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