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
	String bj_tcbzgcxm_bjbbh=null;
	String bj_tcbzgcxm_dqbm=null;
	String bj_tcbzgcxm_bjjbbm=null;
	String bj_tcbzgcxm_xmbh=null;
	String sfxzsl=null;
	String bj_tcbzgcxm_lrr=null;
	String bj_tcbzgcxm_lrsj=null;

	String hxbm=null;
	hxbm=request.getParameter("hxbm");
	if (hxbm!=null)
	{
		hxbm=cf.GB2Uni(hxbm);
		if (!(hxbm.equals("")))	wheresql+=" and  (bj_tcbzgcxm.hxbm='"+hxbm+"')";
	}

	String xmmc=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}
	
	bj_tcbzgcxm_bjbbh=request.getParameter("bj_tcbzgcxm_bjbbh");
	if (bj_tcbzgcxm_bjbbh!=null)
	{
		bj_tcbzgcxm_bjbbh=cf.GB2Uni(bj_tcbzgcxm_bjbbh);
		if (!(bj_tcbzgcxm_bjbbh.equals("")))	wheresql+=" and  (bj_tcbzgcxm.bjbbh='"+bj_tcbzgcxm_bjbbh+"')";
	}
	bj_tcbzgcxm_dqbm=request.getParameter("bj_tcbzgcxm_dqbm");
	if (bj_tcbzgcxm_dqbm!=null)
	{
		bj_tcbzgcxm_dqbm=cf.GB2Uni(bj_tcbzgcxm_dqbm);
		if (!(bj_tcbzgcxm_dqbm.equals("")))	wheresql+=" and  (bj_tcbzgcxm.dqbm='"+bj_tcbzgcxm_dqbm+"')";
	}
	bj_tcbzgcxm_bjjbbm=request.getParameter("bj_tcbzgcxm_bjjbbm");
	if (bj_tcbzgcxm_bjjbbm!=null)
	{
		bj_tcbzgcxm_bjjbbm=cf.GB2Uni(bj_tcbzgcxm_bjjbbm);
		if (!(bj_tcbzgcxm_bjjbbm.equals("")))	wheresql+=" and  (bj_tcbzgcxm.bjjbbm='"+bj_tcbzgcxm_bjjbbm+"')";
	}
	bj_tcbzgcxm_xmbh=request.getParameter("bj_tcbzgcxm_xmbh");
	if (bj_tcbzgcxm_xmbh!=null)
	{
		bj_tcbzgcxm_xmbh=cf.GB2Uni(bj_tcbzgcxm_xmbh);
		if (!(bj_tcbzgcxm_xmbh.equals("")))	wheresql+=" and  (bj_tcbzgcxm.xmbh='"+bj_tcbzgcxm_xmbh+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (bj_tcbzgcxm.sfxzsl='"+sfxzsl+"')";
	}
	bj_tcbzgcxm_lrr=request.getParameter("bj_tcbzgcxm_lrr");
	if (bj_tcbzgcxm_lrr!=null)
	{
		bj_tcbzgcxm_lrr=cf.GB2Uni(bj_tcbzgcxm_lrr);
		if (!(bj_tcbzgcxm_lrr.equals("")))	wheresql+=" and  (bj_tcbzgcxm.lrr='"+bj_tcbzgcxm_lrr+"')";
	}
	bj_tcbzgcxm_lrsj=request.getParameter("bj_tcbzgcxm_lrsj");
	if (bj_tcbzgcxm_lrsj!=null)
	{
		bj_tcbzgcxm_lrsj=bj_tcbzgcxm_lrsj.trim();
		if (!(bj_tcbzgcxm_lrsj.equals("")))	wheresql+="  and (bj_tcbzgcxm.lrsj>=TO_DATE('"+bj_tcbzgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tcbzgcxm_lrsj=request.getParameter("bj_tcbzgcxm_lrsj2");
	if (bj_tcbzgcxm_lrsj!=null)
	{
		bj_tcbzgcxm_lrsj=bj_tcbzgcxm_lrsj.trim();
		if (!(bj_tcbzgcxm_lrsj.equals("")))	wheresql+="  and (bj_tcbzgcxm.lrsj<=TO_DATE('"+bj_tcbzgcxm_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT bj_tcbzgcxm.bjbbh,bj_tcbzgcxm.dqbm,dm_dqbm.dqmc,bj_tcbzgcxm.bjjbbm,bjjbmc,bj_tcbzgcxm.hxbm,hxmc,bj_tcbzgcxm.xmbh,bj_jzbjb.xmmc,bj_tcbzgcxm.bzsl, DECODE(bj_tcbzgcxm.sfxzsl,'1','������','2','��������','3','������') sfxzsl,bj_tcbzgcxm.ccbfjj,bj_tcbzgcxm.lrr,bj_tcbzgcxm.lrsj  ";
	ls_sql+=" FROM bj_tcbzgcxm,dm_dqbm,bdm_bjjbbm,bj_jzbjb,dm_hxbm  ";
    ls_sql+=" where bj_tcbzgcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcbzgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcbzgcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcbzgcxm.bjbbh=bj_jzbjb.bjbbh(+) and bj_tcbzgcxm.dqbm=bj_jzbjb.dqbm(+) and bj_tcbzgcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and bj_tcbzgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcbzgcxm.dqbm,bj_tcbzgcxm.bjbbh,bj_tcbzgcxm.bjjbbm,bj_tcbzgcxm.hxbm,bj_tcbzgcxm.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_tcbzgcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","xmbh","xmmc","sfxzsl","bzsl","ccbfjj","lrr","lrsj"};
	pageObj.setDisColName(disColName);

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
  <B><font size="3">�ײͱ�׼������Ŀ����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">���۰汾��</td>
	<td  width="7%">����</td>
	<td  width="9%">���ۼ���</td>
	<td  width="8%">����</td>
	<td  width="10%">��Ŀ���</td>
	<td  width="26%">��Ŀ����</td>
	<td  width="6%">�Ƿ���������</td>
	<td  width="6%">��׼����</td>
	<td  width="6%">�������ּӼ�</td>
	<td  width="5%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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