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
	String bj_tcbzzcxm_bjbbh=null;
	String bj_tcbzzcxm_dqbm=null;
	String bj_tcbzzcxm_bjjbbm=null;
	String bj_tcbzzcxm_hxbm=null;
	String bj_tcbzzcxm_jgwzbm=null;
	String bj_tcbzzcxm_tccplbbm=null;
	String sfxzsl=null;
	String bj_tcbzzcxm_lrr=null;
	String bj_tcbzzcxm_lrsj=null;

	String sfyqxtpp=null;
	sfyqxtpp=request.getParameter("sfyqxtpp");
	if (sfyqxtpp!=null)
	{
		sfyqxtpp=cf.GB2Uni(sfyqxtpp);
		if (!(sfyqxtpp.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfyqxtpp='"+sfyqxtpp+"')";
	}

	String tcsjflbm=null;
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.tcsjflbm='"+tcsjflbm+"')";
	}

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		sfbxx=cf.GB2Uni(sfbxx);
		if (!(sfbxx.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfbxx='"+sfbxx+"')";
	}
	String sfyxsj=null;
	sfyxsj=request.getParameter("sfyxsj");
	if (sfyxsj!=null)
	{
		sfyxsj=cf.GB2Uni(sfyxsj);
		if (!(sfyxsj.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfyxsj='"+sfyxsj+"')";
	}

	bj_tcbzzcxm_bjbbh=request.getParameter("bj_tcbzzcxm_bjbbh");
	if (bj_tcbzzcxm_bjbbh!=null)
	{
		bj_tcbzzcxm_bjbbh=cf.GB2Uni(bj_tcbzzcxm_bjbbh);
		if (!(bj_tcbzzcxm_bjbbh.equals("")))	wheresql+=" and  (bj_tcbzzcxm.bjbbh='"+bj_tcbzzcxm_bjbbh+"')";
	}
	bj_tcbzzcxm_dqbm=request.getParameter("bj_tcbzzcxm_dqbm");
	if (bj_tcbzzcxm_dqbm!=null)
	{
		bj_tcbzzcxm_dqbm=cf.GB2Uni(bj_tcbzzcxm_dqbm);
		if (!(bj_tcbzzcxm_dqbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.dqbm='"+bj_tcbzzcxm_dqbm+"')";
	}
	bj_tcbzzcxm_bjjbbm=request.getParameter("bj_tcbzzcxm_bjjbbm");
	if (bj_tcbzzcxm_bjjbbm!=null)
	{
		bj_tcbzzcxm_bjjbbm=cf.GB2Uni(bj_tcbzzcxm_bjjbbm);
		if (!(bj_tcbzzcxm_bjjbbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.bjjbbm='"+bj_tcbzzcxm_bjjbbm+"')";
	}
	bj_tcbzzcxm_hxbm=request.getParameter("bj_tcbzzcxm_hxbm");
	if (bj_tcbzzcxm_hxbm!=null)
	{
		bj_tcbzzcxm_hxbm=cf.GB2Uni(bj_tcbzzcxm_hxbm);
		if (!(bj_tcbzzcxm_hxbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.hxbm='"+bj_tcbzzcxm_hxbm+"')";
	}
	bj_tcbzzcxm_jgwzbm=request.getParameter("bj_tcbzzcxm_jgwzbm");
	if (bj_tcbzzcxm_jgwzbm!=null)
	{
		bj_tcbzzcxm_jgwzbm=cf.GB2Uni(bj_tcbzzcxm_jgwzbm);
		if (!(bj_tcbzzcxm_jgwzbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.jgwzbm='"+bj_tcbzzcxm_jgwzbm+"')";
	}
	bj_tcbzzcxm_tccplbbm=request.getParameter("bj_tcbzzcxm_tccplbbm");
	if (bj_tcbzzcxm_tccplbbm!=null)
	{
		bj_tcbzzcxm_tccplbbm=cf.GB2Uni(bj_tcbzzcxm_tccplbbm);
		if (!(bj_tcbzzcxm_tccplbbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.tccplbbm='"+bj_tcbzzcxm_tccplbbm+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfxzsl='"+sfxzsl+"')";
	}
	bj_tcbzzcxm_lrr=request.getParameter("bj_tcbzzcxm_lrr");
	if (bj_tcbzzcxm_lrr!=null)
	{
		bj_tcbzzcxm_lrr=cf.GB2Uni(bj_tcbzzcxm_lrr);
		if (!(bj_tcbzzcxm_lrr.equals("")))	wheresql+=" and  (bj_tcbzzcxm.lrr='"+bj_tcbzzcxm_lrr+"')";
	}
	bj_tcbzzcxm_lrsj=request.getParameter("bj_tcbzzcxm_lrsj");
	if (bj_tcbzzcxm_lrsj!=null)
	{
		bj_tcbzzcxm_lrsj=bj_tcbzzcxm_lrsj.trim();
		if (!(bj_tcbzzcxm_lrsj.equals("")))	wheresql+="  and (bj_tcbzzcxm.lrsj>=TO_DATE('"+bj_tcbzzcxm_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tcbzzcxm_lrsj=request.getParameter("bj_tcbzzcxm_lrsj2");
	if (bj_tcbzzcxm_lrsj!=null)
	{
		bj_tcbzzcxm_lrsj=bj_tcbzzcxm_lrsj.trim();
		if (!(bj_tcbzzcxm_lrsj.equals("")))	wheresql+="  and (bj_tcbzzcxm.lrsj<=TO_DATE('"+bj_tcbzzcxm_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT bj_tcbzzcxm.bjbbh,bj_tcbzzcxm.dqbm,dm_dqbm.dqmc,bj_tcbzzcxm.bjjbbm,bjjbmc,bj_tcbzzcxm.hxbm,hxmc,bj_tcbzzcxm.jgwzbm,bj_tcbzzcxm.tccplbbm,clxlmc,bj_tcbzzcxm.bzsl,DECODE(bj_tcbzzcxm.sfxzsl,'1','������','2','��������','3','������') sfxzsl,bj_tcbzzcxm.ccbfjj,DECODE(bj_tcbzzcxm.sfbxx,'Y','��','N','��') sfbxx,DECODE(bj_tcbzzcxm.sfyxsj,'Y','��','N','��') sfyxsj,tcsjflmc,DECODE(bj_tcbzzcxm.sfyqxtpp,'Y','��','N','��') sfyqxtpp,bj_tcbzzcxm.lrr,bj_tcbzzcxm.lrsj  ";
	ls_sql+=" FROM bj_tcbzzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcbzzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcbzzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcbzzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcbzzcxm.dqbm,bj_tcbzzcxm.bjbbh,bj_tcbzzcxm.bjjbbm,bj_tcbzzcxm.hxbm,bj_tcbzzcxm.jgwzbm,bj_tcbzzcxm.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_tcbzzcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","jgwzbm","clxlmc","sfxzsl","bzsl","ccbfjj","sfbxx","sfyxsj","tcsjflmc","sfyqxtpp","lrr","lrsj"};
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">���۰汾��</td>
	<td  width="6%">����</td>
	<td  width="7%">���ۼ���</td>
	<td  width="7%">����</td>
	<td  width="7%">�ṹλ��</td>
	<td  width="12%">��Ʒ���</td>
	<td  width="6%">�Ƿ���������</td>
	<td  width="6%">��׼����</td>
	<td  width="6%">�������ּӼ�</td>
	<td  width="4%">�Ƿ��ѡ��</td>
	<td  width="5%">�����Ƿ��շ�</td>
	<td  width="12%">�ײ���������</td>
	<td  width="5%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
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