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
	String bj_tcbzzcxm_dqbm=null;
	String bj_tcbzzcxm_bjjbbm=null;
	String bj_tcbzzcxm_hxbm=null;
	String bj_tcbzzcxm_jgwzbm=null;
	String bj_tcbzzcxm_tccplbbm=null;
	String sfxzsl=null;
	String bj_tcbzzcxm_lrr=null;
	String bj_tcbzzcxm_lrsj=null;

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_tcbzzcxm.bjbbh='"+bjbbh+"')";
	}

	String sfkjm=null;
	sfkjm=request.getParameter("sfkjm");
	if (sfkjm!=null)
	{
		sfkjm=cf.GB2Uni(sfkjm);
		if (!(sfkjm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfkjm='"+sfkjm+"')";
	}
	String yxjmzdsl=null;
	yxjmzdsl=request.getParameter("yxjmzdsl");
	if (yxjmzdsl!=null)
	{
		yxjmzdsl=cf.GB2Uni(yxjmzdsl);
		if (!(yxjmzdsl.equals("")))	wheresql+=" and  (bj_tcbzzcxm.yxjmzdsl>="+yxjmzdsl+")";
	}
	yxjmzdsl=request.getParameter("yxjmzdsl2");
	if (yxjmzdsl!=null)
	{
		yxjmzdsl=cf.GB2Uni(yxjmzdsl);
		if (!(yxjmzdsl.equals("")))	wheresql+=" and  (bj_tcbzzcxm.yxjmzdsl<="+yxjmzdsl+")";
	}

	String sfkgh=null;
	sfkgh=request.getParameter("sfkgh");
	if (sfkgh!=null)
	{
		sfkgh=cf.GB2Uni(sfkgh);
		if (!(sfkgh.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfkgh='"+sfkgh+"')";
	}
	String khzdsl=null;
	khzdsl=request.getParameter("khzdsl");
	if (khzdsl!=null)
	{
		khzdsl=cf.GB2Uni(khzdsl);
		if (!(khzdsl.equals("")))	wheresql+=" and  (bj_tcbzzcxm.khzdsl>="+khzdsl+")";
	}
	khzdsl=request.getParameter("khzdsl2");
	if (khzdsl!=null)
	{
		khzdsl=cf.GB2Uni(khzdsl);
		if (!(khzdsl.equals("")))	wheresql+=" and  (bj_tcbzzcxm.khzdsl<="+khzdsl+")";
	}

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
	ls_sql="SELECT bj_tcbzzcxm.bjbbh,bj_tcbzzcxm.dqbm,dm_dqbm.dqmc,bj_tcbzzcxm.bjjbbm,bjjbmc,bj_tcbzzcxm.hxbm,hxmc,bj_tcbzzcxm.jgwzbm,bj_tcbzzcxm.tccplbbm,clxlmc,bj_tcbzzcxm.jldw,bj_tcbzzcxm.bzsl,DECODE(bj_tcbzzcxm.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,DECODE(bj_tcbzzcxm.sfbxx,'Y','ѡ��','N','��') sfbxx,DECODE(bj_tcbzzcxm.sfyxsj,'Y','�շ�','N','��') sfyxsj,tcsjflmc,DECODE(bj_tcbzzcxm.sfyqxtpp,'Y','Ҫ��','N','��') sfyqxtpp,DECODE(bj_tcbzzcxm.sfkjm,'1','���ɼ���','2','�ɼ���') sfkjm,jmfl,jmjldw,bj_tcbzzcxm.yxjmzdsl,jmdj,DECODE(bj_tcbzzcxm.sfkgh,'1','���ɻ�','2','�ɻ�') sfkgh,khzdsl,ghzj,bj_tcbzzcxm.lrr,bj_tcbzzcxm.lrsj  ";
	ls_sql+=" FROM bj_tcbzzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcbzzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcbzzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcbzzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcbzzcxm.bjbbh,bj_tcbzzcxm.dqbm,bj_tcbzzcxm.bjjbbm,bj_tcbzzcxm.hxbm,bj_tcbzzcxm.jgwzbm,bj_tcbzzcxm.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_tcbzzcxmCxList.jsp","","","");
//	pageObj.setPageRow(13);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","jgwzbm","clxlmc","jldw","sfxzsl","bzsl","sfbxx","sfyxsj","tcsjflmc","sfyqxtpp","sfkjm","jmfl","jmjldw","yxjmzdsl","jmdj","sfkgh","khzdsl","ghzj","lrr","lrsj"};
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
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">���۰汾��</td>
	<td  width="4%">����</td>
	<td  width="4%">���ۼ���</td>
	<td  width="5%">����</td>
	<td  width="6%">�ṹλ��</td>
	<td  width="8%">��Ʒ���</td>
	<td  width="3%">������λ</td>
	<td  width="5%">�Ƿ���������</td>
	<td  width="4%">��׼����</td>
	<td  width="3%">�Ƿ��ѡ��</td>
	<td  width="3%">�����Ƿ��շ�</td>
	<td  width="6%">�ײ���������</td>
	<td  width="4%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="4%">�Ƿ�ɼ���</td>
	<td  width="6%">�������</td>
	<td  width="3%">���������λ</td>
	<td  width="4%">��������������</td>
	<td  width="3%">���ⵥ��</td>
	<td  width="3%">�Ƿ�ɸ���</td>
	<td  width="3%">�ɻ��������</td>
	<td  width="4%">�����ۼ�</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
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