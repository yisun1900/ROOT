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
	String bj_gzglfxb_glbxh=null;
	String bj_gzglfxb_dqbm=null;
	String bj_gzglfxb_xmbh=null;
	String bj_gzglfxb_xmmc=null;
	String bj_gzglfxb_xmdlbm=null;
	String bj_gzglfxb_xmxlbm=null;
	String bj_gzglfxb_glflbm=null;
	String bj_gzglfxb_glmc=null;
	String bj_gzglfxb_pp=null;
	String bj_gzglfxb_xhgg=null;
	String bj_gzglfxb_jldwbm=null;
	String bj_gzglfxb_xhl=null;
	String bj_gzglfxb_dj=null;
	String bj_gzglfxb_lrr=null;
	String bj_gzglfxb_lrsj=null;

	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		if (!(bjjb.equals("")))	wheresql+=" and (bj_gzglfxb.bjjb='"+bjjb+"') ";
	}

	bj_gzglfxb_glbxh=request.getParameter("bj_gzglfxb_glbxh");
	if (bj_gzglfxb_glbxh!=null)
	{
		bj_gzglfxb_glbxh=bj_gzglfxb_glbxh.trim();
		if (!(bj_gzglfxb_glbxh.equals("")))	wheresql+=" and (bj_gzglfxb.glbxh="+bj_gzglfxb_glbxh+") ";
	}
	bj_gzglfxb_dqbm=request.getParameter("bj_gzglfxb_dqbm");
	if (bj_gzglfxb_dqbm!=null)
	{
		bj_gzglfxb_dqbm=cf.GB2Uni(bj_gzglfxb_dqbm);
		if (!(bj_gzglfxb_dqbm.equals("")))	wheresql+=" and  (bj_gzglfxb.dqbm='"+bj_gzglfxb_dqbm+"')";
	}
	bj_gzglfxb_xmbh=request.getParameter("bj_gzglfxb_xmbh");
	if (bj_gzglfxb_xmbh!=null)
	{
		bj_gzglfxb_xmbh=cf.GB2Uni(bj_gzglfxb_xmbh);
		if (!(bj_gzglfxb_xmbh.equals("")))	wheresql+=" and  (bj_gzglfxb.xmbh='"+bj_gzglfxb_xmbh+"')";
	}
	bj_gzglfxb_xmmc=request.getParameter("bj_gzglfxb_xmmc");
	if (bj_gzglfxb_xmmc!=null)
	{
		bj_gzglfxb_xmmc=cf.GB2Uni(bj_gzglfxb_xmmc);
		if (!(bj_gzglfxb_xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc='"+bj_gzglfxb_xmmc+"')";
	}
	bj_gzglfxb_xmdlbm=request.getParameter("bj_gzglfxb_xmdlbm");
	if (bj_gzglfxb_xmdlbm!=null)
	{
		bj_gzglfxb_xmdlbm=cf.GB2Uni(bj_gzglfxb_xmdlbm);
		if (!(bj_gzglfxb_xmdlbm.equals("")))	wheresql+=" and  (bj_gzbjb.xmdlbm='"+bj_gzglfxb_xmdlbm+"')";
	}
	bj_gzglfxb_xmxlbm=request.getParameter("bj_gzglfxb_xmxlbm");
	if (bj_gzglfxb_xmxlbm!=null)
	{
		bj_gzglfxb_xmxlbm=cf.GB2Uni(bj_gzglfxb_xmxlbm);
		if (!(bj_gzglfxb_xmxlbm.equals("")))	wheresql+=" and  (bj_gzbjb.xmxlbm='"+bj_gzglfxb_xmxlbm+"')";
	}
	bj_gzglfxb_glflbm=request.getParameter("bj_gzglfxb_glflbm");
	if (bj_gzglfxb_glflbm!=null)
	{
		bj_gzglfxb_glflbm=cf.GB2Uni(bj_gzglfxb_glflbm);
		if (!(bj_gzglfxb_glflbm.equals("")))	wheresql+=" and  (bj_gzglfxb.glflbm='"+bj_gzglfxb_glflbm+"')";
	}
	bj_gzglfxb_glmc=request.getParameter("bj_gzglfxb_glmc");
	if (bj_gzglfxb_glmc!=null)
	{
		bj_gzglfxb_glmc=cf.GB2Uni(bj_gzglfxb_glmc);
		if (!(bj_gzglfxb_glmc.equals("")))	wheresql+=" and  (bj_gzglfxb.glmc='"+bj_gzglfxb_glmc+"')";
	}
	bj_gzglfxb_pp=request.getParameter("bj_gzglfxb_pp");
	if (bj_gzglfxb_pp!=null)
	{
		bj_gzglfxb_pp=cf.GB2Uni(bj_gzglfxb_pp);
		if (!(bj_gzglfxb_pp.equals("")))	wheresql+=" and  (bj_gzglfxb.pp='"+bj_gzglfxb_pp+"')";
	}
	bj_gzglfxb_xhgg=request.getParameter("bj_gzglfxb_xhgg");
	if (bj_gzglfxb_xhgg!=null)
	{
		bj_gzglfxb_xhgg=cf.GB2Uni(bj_gzglfxb_xhgg);
		if (!(bj_gzglfxb_xhgg.equals("")))	wheresql+=" and  (bj_gzglfxb.xhgg='"+bj_gzglfxb_xhgg+"')";
	}
	bj_gzglfxb_jldwbm=request.getParameter("bj_gzglfxb_jldwbm");
	if (bj_gzglfxb_jldwbm!=null)
	{
		bj_gzglfxb_jldwbm=cf.GB2Uni(bj_gzglfxb_jldwbm);
		if (!(bj_gzglfxb_jldwbm.equals("")))	wheresql+=" and  (bj_gzglfxb.jldwbm='"+bj_gzglfxb_jldwbm+"')";
	}
	bj_gzglfxb_xhl=request.getParameter("bj_gzglfxb_xhl");
	if (bj_gzglfxb_xhl!=null)
	{
		bj_gzglfxb_xhl=bj_gzglfxb_xhl.trim();
		if (!(bj_gzglfxb_xhl.equals("")))	wheresql+=" and  (bj_gzglfxb.xhl="+bj_gzglfxb_xhl+") ";
	}
	bj_gzglfxb_dj=request.getParameter("bj_gzglfxb_dj");
	if (bj_gzglfxb_dj!=null)
	{
		bj_gzglfxb_dj=bj_gzglfxb_dj.trim();
		if (!(bj_gzglfxb_dj.equals("")))	wheresql+=" and  (bj_gzglfxb.dj="+bj_gzglfxb_dj+") ";
	}
	bj_gzglfxb_lrr=request.getParameter("bj_gzglfxb_lrr");
	if (bj_gzglfxb_lrr!=null)
	{
		bj_gzglfxb_lrr=cf.GB2Uni(bj_gzglfxb_lrr);
		if (!(bj_gzglfxb_lrr.equals("")))	wheresql+=" and  (bj_gzglfxb.lrr='"+bj_gzglfxb_lrr+"')";
	}
	bj_gzglfxb_lrsj=request.getParameter("bj_gzglfxb_lrsj");
	if (bj_gzglfxb_lrsj!=null)
	{
		bj_gzglfxb_lrsj=bj_gzglfxb_lrsj.trim();
		if (!(bj_gzglfxb_lrsj.equals("")))	wheresql+="  and (bj_gzglfxb.lrsj=TO_DATE('"+bj_gzglfxb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT dqmc,xmdlmc,xmxlmc,bj_gzglfxb.xmbh,xmmc,bjjbmc,bdm_glflbm.glflmc,bj_gzglfxb.glbxh,bj_gzglfxb.glmc,bdm_cljldwbm.cljldwmc,bj_gzglfxb.xhl,bj_gzglfxb.dj,bj_gzglfxb.pp,bj_gzglfxb.xhgg,bj_gzglfxb.lrr,bj_gzglfxb.lrsj  ";
	ls_sql+=" FROM bdm_cljldwbm,bdm_glflbm,bdm_xmdlbm,bdm_xmxlbm,bj_gzglfxb,bj_gzbjb,dm_dqbm,bdm_bjjbbm  ";
	ls_sql+=" where bj_gzglfxb.dqbm=bj_gzbjb.dqbm(+) and bj_gzglfxb.xmbh=bj_gzbjb.xmbh(+) ";
    ls_sql+=" and bj_gzglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_gzglfxb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+)";
    ls_sql+=" and bj_gzglfxb.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_gzglfxb.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xmbh,bj_gzglfxb.bjjb,bj_gzglfxb.glflbm,bj_gzglfxb.glbxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_gzglfxbCxList.jsp","SelectCxBj_gzglfxb.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"glbxh","bj_gzglfxb_wybh","dm_dqbm_dqmc","bj_gzglfxb_xmbh","bj_gzglfxb_xmmc","bdm_xmdlbm_xmdlmc","bdm_xmxlbm_xmxlmc","bdm_glflbm_glflmc","bj_gzglfxb_glmc","bj_gzglfxb_pp","bj_gzglfxb_xhgg","bdm_cljldwbm_cljldwmc","bj_gzglfxb_xhl","bj_gzglfxb_dj","bj_gzglfxb_lrr","bj_gzglfxb_lrsj"};
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
	pageObj.alignStr[13]="align='left'";
	pageObj.alignStr[14]="align='left'";
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
	<td  width="6%">��Ŀ����</td>
	<td  width="7%">��ĿС��</td>
	<td  width="6%">��Ŀ���</td>
	<td  width="11%">��Ŀ����</td>
	<td  width="4%">���ۼ���</td>
	<td  width="4%">���Ϸ���</td>
	<td  width="3%">���ϱ����</td>
	<td  width="12%">��������</td>
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