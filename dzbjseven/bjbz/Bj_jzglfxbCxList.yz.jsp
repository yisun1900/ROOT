<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_jzglfxb_glbxh=null;

	String bj_jzglfxb_dqbm=null;
	String bj_jzglfxb_xmbh=null;
	String bj_jzglfxb_xmmc=null;
	String bj_jzglfxb_xmdlbm=null;
	String bj_jzglfxb_xmxlbm=null;
	String bj_jzglfxb_glflbm=null;
	String bj_jzglfxb_glmc=null;
	String bj_jzglfxb_pp=null;
	String bj_jzglfxb_xhgg=null;
	String bj_jzglfxb_jldwbm=null;
	String bj_jzglfxb_xhl=null;
	String bj_jzglfxb_dj=null;
	String bj_jzglfxb_lrr=null;
	String bj_jzglfxb_lrsj=null;

	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		if (!(bjjb.equals("")))	wheresql+=" and (bj_jzglfxb.bjjb='"+bjjb+"') ";
	}


	bj_jzglfxb_glbxh=request.getParameter("bj_jzglfxb_glbxh");
	if (bj_jzglfxb_glbxh!=null)
	{
		bj_jzglfxb_glbxh=bj_jzglfxb_glbxh.trim();
		if (!(bj_jzglfxb_glbxh.equals("")))	wheresql+=" and (bj_jzglfxb.glbxh="+bj_jzglfxb_glbxh+") ";
	}

	bj_jzglfxb_dqbm=request.getParameter("bj_jzglfxb_dqbm");
	if (bj_jzglfxb_dqbm!=null)
	{
		bj_jzglfxb_dqbm=cf.GB2Uni(bj_jzglfxb_dqbm);
		if (!(bj_jzglfxb_dqbm.equals("")))	wheresql+=" and  (bj_jzglfxb.dqbm='"+bj_jzglfxb_dqbm+"')";
	}
	bj_jzglfxb_xmbh=request.getParameter("bj_jzglfxb_xmbh");
	if (bj_jzglfxb_xmbh!=null)
	{
		bj_jzglfxb_xmbh=cf.GB2Uni(bj_jzglfxb_xmbh);
		if (!(bj_jzglfxb_xmbh.equals("")))	wheresql+=" and  (bj_jzglfxb.xmbh='"+bj_jzglfxb_xmbh+"')";
	}
	bj_jzglfxb_xmmc=request.getParameter("bj_jzglfxb_xmmc");
	if (bj_jzglfxb_xmmc!=null)
	{
		bj_jzglfxb_xmmc=cf.GB2Uni(bj_jzglfxb_xmmc);
		if (!(bj_jzglfxb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc='"+bj_jzglfxb_xmmc+"')";
	}
	bj_jzglfxb_xmdlbm=request.getParameter("bj_jzglfxb_xmdlbm");
	if (bj_jzglfxb_xmdlbm!=null)
	{
		bj_jzglfxb_xmdlbm=cf.GB2Uni(bj_jzglfxb_xmdlbm);
		if (!(bj_jzglfxb_xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmdlbm='"+bj_jzglfxb_xmdlbm+"')";
	}
	bj_jzglfxb_xmxlbm=request.getParameter("bj_jzglfxb_xmxlbm");
	if (bj_jzglfxb_xmxlbm!=null)
	{
		bj_jzglfxb_xmxlbm=cf.GB2Uni(bj_jzglfxb_xmxlbm);
		if (!(bj_jzglfxb_xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmxlbm='"+bj_jzglfxb_xmxlbm+"')";
	}
	bj_jzglfxb_glflbm=request.getParameter("bj_jzglfxb_glflbm");
	if (bj_jzglfxb_glflbm!=null)
	{
		bj_jzglfxb_glflbm=cf.GB2Uni(bj_jzglfxb_glflbm);
		if (!(bj_jzglfxb_glflbm.equals("")))	wheresql+=" and  (bj_jzglfxb.glflbm='"+bj_jzglfxb_glflbm+"')";
	}
	bj_jzglfxb_glmc=request.getParameter("bj_jzglfxb_glmc");
	if (bj_jzglfxb_glmc!=null)
	{
		bj_jzglfxb_glmc=cf.GB2Uni(bj_jzglfxb_glmc);
		if (!(bj_jzglfxb_glmc.equals("")))	wheresql+=" and  (bj_jzglfxb.glmc='"+bj_jzglfxb_glmc+"')";
	}
	bj_jzglfxb_pp=request.getParameter("bj_jzglfxb_pp");
	if (bj_jzglfxb_pp!=null)
	{
		bj_jzglfxb_pp=cf.GB2Uni(bj_jzglfxb_pp);
		if (!(bj_jzglfxb_pp.equals("")))	wheresql+=" and  (bj_jzglfxb.pp='"+bj_jzglfxb_pp+"')";
	}
	bj_jzglfxb_xhgg=request.getParameter("bj_jzglfxb_xhgg");
	if (bj_jzglfxb_xhgg!=null)
	{
		bj_jzglfxb_xhgg=cf.GB2Uni(bj_jzglfxb_xhgg);
		if (!(bj_jzglfxb_xhgg.equals("")))	wheresql+=" and  (bj_jzglfxb.xhgg='"+bj_jzglfxb_xhgg+"')";
	}
	bj_jzglfxb_jldwbm=request.getParameter("bj_jzglfxb_jldwbm");
	if (bj_jzglfxb_jldwbm!=null)
	{
		bj_jzglfxb_jldwbm=cf.GB2Uni(bj_jzglfxb_jldwbm);
		if (!(bj_jzglfxb_jldwbm.equals("")))	wheresql+=" and  (bj_jzglfxb.jldwbm='"+bj_jzglfxb_jldwbm+"')";
	}
	bj_jzglfxb_xhl=request.getParameter("bj_jzglfxb_xhl");
	if (bj_jzglfxb_xhl!=null)
	{
		bj_jzglfxb_xhl=bj_jzglfxb_xhl.trim();
		if (!(bj_jzglfxb_xhl.equals("")))	wheresql+=" and  (bj_jzglfxb.xhl="+bj_jzglfxb_xhl+") ";
	}
	bj_jzglfxb_dj=request.getParameter("bj_jzglfxb_dj");
	if (bj_jzglfxb_dj!=null)
	{
		bj_jzglfxb_dj=bj_jzglfxb_dj.trim();
		if (!(bj_jzglfxb_dj.equals("")))	wheresql+=" and  (bj_jzglfxb.dj="+bj_jzglfxb_dj+") ";
	}
	bj_jzglfxb_lrr=request.getParameter("bj_jzglfxb_lrr");
	if (bj_jzglfxb_lrr!=null)
	{
		bj_jzglfxb_lrr=cf.GB2Uni(bj_jzglfxb_lrr);
		if (!(bj_jzglfxb_lrr.equals("")))	wheresql+=" and  (bj_jzglfxb.lrr='"+bj_jzglfxb_lrr+"')";
	}
	bj_jzglfxb_lrsj=request.getParameter("bj_jzglfxb_lrsj");
	if (bj_jzglfxb_lrsj!=null)
	{
		bj_jzglfxb_lrsj=bj_jzglfxb_lrsj.trim();
		if (!(bj_jzglfxb_lrsj.equals("")))	wheresql+="  and (bj_jzglfxb.lrsj=TO_DATE('"+bj_jzglfxb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT dm_dqbm.dqmc,xmdlmc,xmxlmc,bj_jzglfxb.xmbh,xmmc,bjjbmc,bdm_glflbm.glflmc,bj_jzglfxb.glbxh,bj_jzglfxb.glmc,jdm_jldwbm.jldwmc,bj_jzglfxb.xhl,bj_jzglfxb.dj,bj_jzglfxb.pp,bj_jzglfxb.xhgg,bj_jzglfxb.lrr,bj_jzglfxb.lrsj  ";
	ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bdm_xmdlbm,bdm_xmxlbm,bj_jzglfxb,bj_jzbjb,dm_dqbm,bdm_bjjbbm  ";
    ls_sql+=" where bj_jzglfxb.dqbm=bj_jzbjb.dqbm(+) and bj_jzglfxb.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=" and bj_jzglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_jzglfxb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+)";
    ls_sql+=" and bj_jzglfxb.jldwbm=jdm_jldwbm.jldwbm(+) and bj_jzglfxb.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjb.dqbm,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh,bj_jzglfxb.bjjb,bj_jzglfxb.glflbm,bj_jzglfxb.glbxh";
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_jzglfxbCxList.jsp","SelectCxBj_jzglfxb.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"glbxh","bj_jzglfxb_wybh","dm_dqbm_dqmc","bj_jzglfxb_xmbh","bj_jzglfxb_xmmc","bdm_xmdlbm_xmdlmc","bdm_xmxlbm_xmxlmc","bdm_glflbm_glflmc","bj_jzglfxb_glmc","bj_jzglfxb_pp","bj_jzglfxb_xhgg","_cljldwmc","bj_jzglfxb_xhl","bj_jzglfxb_dj","bj_jzglfxb_lrr","bj_jzglfxb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"glbxh"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("xmdlmc","1");//�в����������Hash��
	spanColHash.put("xmxlmc","1");//�в����������Hash��
	spanColHash.put("xmbh","1");//�в����������Hash��
	spanColHash.put("xmmc","1");//�в����������Hash��
	spanColHash.put("bjjbmc","1");//�в����������Hash��
	spanColHash.put("glflmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.alignStr[4]="align='left'";
	pageObj.alignStr[8]="align='left'";
	pageObj.alignStr[12]="align='left'";
	pageObj.alignStr[13]="align='left'";
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">����</td>
	<td  width="7%">��Ŀ����</td>
	<td  width="8%">��ĿС��</td>
	<td  width="6%">��Ŀ���</td>
	<td  width="12%">��Ŀ����</td>
	<td  width="4%">���ۼ���</td>
	<td  width="4%">���Ϸ���</td>
	<td  width="3%">���ϱ����</td>
	<td  width="13%">��������</td>
	<td  width="4%">������λ</td>
	<td  width="5%">������</td>
	<td  width="5%">����</td>
	<td  width="8%">Ʒ��</td>
	<td  width="10%">�ͺŹ��</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
</tr>
<%
	pageObj.displayDate();
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