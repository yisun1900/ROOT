<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//���ӱ����м�����
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//���ӱ����и߼�����
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//���ӱ��۸߼�����

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_gzbjb_dqbm=null;
	String bj_gzbjb_xmbh=null;
	String bj_gzbjb_xmmc=null;
	String[] bj_gzbjb_xmdlbm=null;
	String[] bj_gzbjb_xmxlbm=null;
	String bj_gzbjb_smbm=null;
	String bj_gzbjb_jldwbm=null;


	String bjlx=null;
	bjlx=request.getParameter("bjlx");
	if (!(bjlx.equals("")))	wheresql+=" and  (bj_gzbjb.bjlx='"+bjlx+"')";

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
	
	
	bj_gzbjb_dqbm=request.getParameter("bj_gzbjb_dqbm");
	if (bj_gzbjb_dqbm!=null)
	{
		bj_gzbjb_dqbm=cf.GB2Uni(bj_gzbjb_dqbm);
		if (!(bj_gzbjb_dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+bj_gzbjb_dqbm+"')";
	}
	bj_gzbjb_xmbh=request.getParameter("bj_gzbjb_xmbh");
	if (bj_gzbjb_xmbh!=null)
	{
		bj_gzbjb_xmbh=cf.GB2Uni(bj_gzbjb_xmbh);
		if (!(bj_gzbjb_xmbh.equals("")))	wheresql+=" and  (bj_gzbjb.xmbh='"+bj_gzbjb_xmbh+"')";
	}
	bj_gzbjb_xmmc=request.getParameter("bj_gzbjb_xmmc");
	if (bj_gzbjb_xmmc!=null)
	{
		bj_gzbjb_xmmc=cf.GB2Uni(bj_gzbjb_xmmc);
		if (!(bj_gzbjb_xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc like '%"+bj_gzbjb_xmmc+"%')";
	}
	bj_gzbjb_xmdlbm=request.getParameterValues("bj_gzbjb_xmdlbm");
	if (bj_gzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_gzbjb_xmdlbm,"bj_gzbjb.xmdlbm");
	}
	bj_gzbjb_xmxlbm=request.getParameterValues("bj_gzbjb_xmxlbm");
	if (bj_gzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_gzbjb_xmxlbm,"bj_gzbjb.xmxlbm");
	}
	bj_gzbjb_smbm=request.getParameter("bj_gzbjb_smbm");
	if (bj_gzbjb_smbm!=null)
	{
		bj_gzbjb_smbm=cf.GB2Uni(bj_gzbjb_smbm);
		if (!(bj_gzbjb_smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+bj_gzbjb_smbm+"')";
	}
	bj_gzbjb_jldwbm=request.getParameter("bj_gzbjb_jldwbm");
	if (bj_gzbjb_jldwbm!=null)
	{
		bj_gzbjb_jldwbm=cf.GB2Uni(bj_gzbjb_jldwbm);
		if (!(bj_gzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_gzbjb.jldwbm='"+bj_gzbjb_jldwbm+"')";
	}

	ls_sql="SELECT bj_gzbjb.dqbm as dqbm,dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,cbenj,sgdbj,bj_gzbjb.bj as bj_gzbjb_bj,bj_gzbjb.bbj as bj_gzbjb_bbj,bj_gzbjb.cbj as bj_gzbjb_cbj,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,gycl,bgycl,cgycl";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_gzbjbLrList.jsp","SelectLrBj_gzbjb.jsp","InsertBj_gzglfxb.jsp","EditBj_gzglfxb.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"dqmc","xmdlmc","xmxlmc","xmbh","bj_gzbjb_xmmc","smmc","cbenj","sgdbj","bj_gzbjb_bj","bj_gzbjb_bbj","bj_gzbjb_cbj","bjlx","jdm_jldwbm_jldwmc","lrr","lrsj","shbz","gycl","bgycl","cgycl"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xmbh","dqbm"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("¼��");
	pageObj.setEditStr("ά��");

//	pageObj.alignStr[11]="align='left'";
//������ʾ�ϲ���

	pageObj.alignStr[16]="align='left'";
	pageObj.alignStr[17]="align='left'";
	pageObj.alignStr[18]="align='left'";

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">¼�빤�Ϸ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(370);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">����</td>
	<td  width="2%">��Ŀ����</td>
	<td  width="3%">��ĿС��</td>
	<td  width="3%">��Ŀ���</td>
	<td  width="6%">��Ŀ����</td>
	<td  width="2%">����</td>
	<td  width="2%">�ɱ���</td>
	<td  width="2%">ʩ���ӱ���</td>
	<td  width="2%"><%=dzbjzjmc%>����</td>
	<td  width="2%"><%=dzbjzgjmc%>����</td>
	<td  width="2%"><%=dzbjgjmc%>����</td>
	<td  width="2%">��������</td>
	<td  width="2%">������������λ</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">��˱�־</td>
	<td  width="15%"><%=dzbjzjmc%>���ղ��ϼ��</td>
	<td  width="14%"><%=dzbjzgjmc%>���ղ��ϼ��</td>
	<td  width="14%"><%=dzbjgjmc%>���ղ��ϼ��</td>
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
//-->
</script>
</html>