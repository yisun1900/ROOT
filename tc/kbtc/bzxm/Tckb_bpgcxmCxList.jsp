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
	String tckb_bpgcxm_dqbm=null;
	String tckb_bpgcxm_bjjbbm=null;
	String tckb_bpgcxm_xmbh=null;
	String tckb_bpgcxm_lrr=null;
	String tckb_bpgcxm_lrsj=null;

	String sfksc=null;
	sfksc=request.getParameter("sfksc");
	if (sfksc!=null)
	{
		sfksc=cf.GB2Uni(sfksc);
		if (!(sfksc.equals("")))	wheresql+=" and  (tckb_bpgcxm.sfksc='"+sfksc+"')";
	}

	String sfkth=null;
	sfkth=request.getParameter("sfkth");
	if (sfkth!=null)
	{
		sfkth=cf.GB2Uni(sfkth);
		if (!(sfkth.equals("")))	wheresql+=" and  (tckb_bpgcxm.sfkth='"+sfkth+"')";
	}

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (tckb_bpgcxm.bjbbh='"+bjbbh+"')";
	}

	String jldw=null;
	jldw=request.getParameter("jldw");
	if (jldw!=null)
	{
		jldw=cf.GB2Uni(jldw);
		if (!(jldw.equals("")))	wheresql+=" and  (tckb_bpgcxm.jldw='"+jldw+"')";
	}

	String hxbm=null;
	hxbm=request.getParameter("hxbm");
	if (hxbm!=null)
	{
		hxbm=cf.GB2Uni(hxbm);
		if (!(hxbm.equals("")))	wheresql+=" and  (tckb_bpgcxm.hxbm='"+hxbm+"')";
	}

	String xmmc=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}
	
	tckb_bpgcxm_dqbm=request.getParameter("tckb_bpgcxm_dqbm");
	if (tckb_bpgcxm_dqbm!=null)
	{
		tckb_bpgcxm_dqbm=cf.GB2Uni(tckb_bpgcxm_dqbm);
		if (!(tckb_bpgcxm_dqbm.equals("")))	wheresql+=" and  (tckb_bpgcxm.dqbm='"+tckb_bpgcxm_dqbm+"')";
	}
	tckb_bpgcxm_bjjbbm=request.getParameter("tckb_bpgcxm_bjjbbm");
	if (tckb_bpgcxm_bjjbbm!=null)
	{
		tckb_bpgcxm_bjjbbm=cf.GB2Uni(tckb_bpgcxm_bjjbbm);
		if (!(tckb_bpgcxm_bjjbbm.equals("")))	wheresql+=" and  (tckb_bpgcxm.bjjbbm='"+tckb_bpgcxm_bjjbbm+"')";
	}
	tckb_bpgcxm_xmbh=request.getParameter("tckb_bpgcxm_xmbh");
	if (tckb_bpgcxm_xmbh!=null)
	{
		tckb_bpgcxm_xmbh=cf.GB2Uni(tckb_bpgcxm_xmbh);
		if (!(tckb_bpgcxm_xmbh.equals("")))	wheresql+=" and  (tckb_bpgcxm.xmbh='"+tckb_bpgcxm_xmbh+"')";
	}
	tckb_bpgcxm_lrr=request.getParameter("tckb_bpgcxm_lrr");
	if (tckb_bpgcxm_lrr!=null)
	{
		tckb_bpgcxm_lrr=cf.GB2Uni(tckb_bpgcxm_lrr);
		if (!(tckb_bpgcxm_lrr.equals("")))	wheresql+=" and  (tckb_bpgcxm.lrr='"+tckb_bpgcxm_lrr+"')";
	}
	tckb_bpgcxm_lrsj=request.getParameter("tckb_bpgcxm_lrsj");
	if (tckb_bpgcxm_lrsj!=null)
	{
		tckb_bpgcxm_lrsj=tckb_bpgcxm_lrsj.trim();
		if (!(tckb_bpgcxm_lrsj.equals("")))	wheresql+="  and (tckb_bpgcxm.lrsj>=TO_DATE('"+tckb_bpgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tckb_bpgcxm_lrsj=request.getParameter("tckb_bpgcxm_lrsj2");
	if (tckb_bpgcxm_lrsj!=null)
	{
		tckb_bpgcxm_lrsj=tckb_bpgcxm_lrsj.trim();
		if (!(tckb_bpgcxm_lrsj.equals("")))	wheresql+="  and (tckb_bpgcxm.lrsj<=TO_DATE('"+tckb_bpgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tckb_bpgcxm.bjbbh,tckb_bpgcxm.dqbm,dm_dqbm.dqmc,tckb_bpgcxm.bjjbbm,bjjbmc,tckb_bpgcxm.hxbm,hxmc,jgwzbm,tckb_bpgcxm.xmbh,bj_jzbjb.xmmc,jldw,tckb_bpgcxm.sl,tckb_bpgcxm.dj,DECODE(tckb_bpgcxm.sfksc,'Y','��ɾ��','N','��') sfksc,DECODE(tckb_bpgcxm.sfkth,'Y','���滻','N','��') sfkth,tckb_bpgcxm.lrr,tckb_bpgcxm.lrsj  ";
	ls_sql+=" FROM tckb_bpgcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,bj_jzbjb  ";
    ls_sql+=" where tckb_bpgcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckb_bpgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_bpgcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckb_bpgcxm.bjbbh=bj_jzbjb.bjbbh(+)";
    ls_sql+=" and tckb_bpgcxm.dqbm=bj_jzbjb.dqbm(+)";
    ls_sql+=" and tckb_bpgcxm.bjjbbm=bj_jzbjb.bjjbbm(+)";
    ls_sql+=" and tckb_bpgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_bpgcxm.dqbm,tckb_bpgcxm.bjjbbm,jldw,tckb_bpgcxm.hxbm,jgwzbm,tckb_bpgcxm.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tckb_bpgcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","jgwzbm","xmbh","xmmc","jldw","sl","dj","sfksc","sfkth","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"bjbbh","dqbm","bjjbbm","hxbm","jgwzbm","xmbh"};
	pageObj.setKey(keyName);

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
  <B><font size="3">�ײͱ��乤����Ŀ����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">���۰汾��</td>
	<td  width="5%">����</td>
	<td  width="6%">���ۼ���</td>
	<td  width="7%">����</td>
	<td  width="7%">�ṹλ��</td>
	<td  width="8%">��Ŀ���</td>
	<td  width="24%">��Ŀ����</td>
	<td  width="5%">������λ</td>
	<td  width="6%">��������</td>
	<td  width="6%">����</td>
	<td  width="4%">�Ƿ��ɾ��</td>
	<td  width="4%">�Ƿ���滻</td>
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