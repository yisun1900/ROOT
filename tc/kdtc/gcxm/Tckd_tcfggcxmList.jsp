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
	String tckd_tcfggcxm_dqbm=null;
	String tckd_tcfggcxm_bjjbbm=null;
	String tckd_tcfggcxm_xmbh=null;
	String tckd_tcfggcxm_lrr=null;
	String tckd_tcfggcxm_lrsj=null;

	String fgmc=null;
	fgmc=request.getParameter("fgmc");
	if (fgmc!=null)
	{
		fgmc=cf.GB2Uni(fgmc);
		if (!(fgmc.equals("")))	wheresql+=" and  (tckd_tcfggcxm.fgmc='"+fgmc+"')";
	}

	String hxbm=null;
	hxbm=request.getParameter("hxbm");
	if (hxbm!=null)
	{
		hxbm=cf.GB2Uni(hxbm);
		if (!(hxbm.equals("")))	wheresql+=" and  (tckd_tcfggcxm.hxbm='"+hxbm+"')";
	}

	String xmmc=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}
	
	tckd_tcfggcxm_dqbm=request.getParameter("tckd_tcfggcxm_dqbm");
	if (tckd_tcfggcxm_dqbm!=null)
	{
		tckd_tcfggcxm_dqbm=cf.GB2Uni(tckd_tcfggcxm_dqbm);
		if (!(tckd_tcfggcxm_dqbm.equals("")))	wheresql+=" and  (tckd_tcfggcxm.dqbm='"+tckd_tcfggcxm_dqbm+"')";
	}
	tckd_tcfggcxm_bjjbbm=request.getParameter("tckd_tcfggcxm_bjjbbm");
	if (tckd_tcfggcxm_bjjbbm!=null)
	{
		tckd_tcfggcxm_bjjbbm=cf.GB2Uni(tckd_tcfggcxm_bjjbbm);
		if (!(tckd_tcfggcxm_bjjbbm.equals("")))	wheresql+=" and  (tckd_tcfggcxm.bjjbbm='"+tckd_tcfggcxm_bjjbbm+"')";
	}
	tckd_tcfggcxm_xmbh=request.getParameter("tckd_tcfggcxm_xmbh");
	if (tckd_tcfggcxm_xmbh!=null)
	{
		tckd_tcfggcxm_xmbh=cf.GB2Uni(tckd_tcfggcxm_xmbh);
		if (!(tckd_tcfggcxm_xmbh.equals("")))	wheresql+=" and  (tckd_tcfggcxm.xmbh='"+tckd_tcfggcxm_xmbh+"')";
	}
	tckd_tcfggcxm_lrr=request.getParameter("tckd_tcfggcxm_lrr");
	if (tckd_tcfggcxm_lrr!=null)
	{
		tckd_tcfggcxm_lrr=cf.GB2Uni(tckd_tcfggcxm_lrr);
		if (!(tckd_tcfggcxm_lrr.equals("")))	wheresql+=" and  (tckd_tcfggcxm.lrr='"+tckd_tcfggcxm_lrr+"')";
	}
	tckd_tcfggcxm_lrsj=request.getParameter("tckd_tcfggcxm_lrsj");
	if (tckd_tcfggcxm_lrsj!=null)
	{
		tckd_tcfggcxm_lrsj=tckd_tcfggcxm_lrsj.trim();
		if (!(tckd_tcfggcxm_lrsj.equals("")))	wheresql+="  and (tckd_tcfggcxm.lrsj>=TO_DATE('"+tckd_tcfggcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tckd_tcfggcxm_lrsj=request.getParameter("tckd_tcfggcxm_lrsj2");
	if (tckd_tcfggcxm_lrsj!=null)
	{
		tckd_tcfggcxm_lrsj=tckd_tcfggcxm_lrsj.trim();
		if (!(tckd_tcfggcxm_lrsj.equals("")))	wheresql+="  and (tckd_tcfggcxm.lrsj<=TO_DATE('"+tckd_tcfggcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tckd_tcfggcxm.dqbm,dm_dqbm.dqmc,tckd_tcfggcxm.bjjbbm,bjjbmc,fgmc,tckd_tcfggcxm.hxbm,hxmc,jgwzbm,tckd_tcfggcxm.xmbh,tckd_tcfggcxm.bzsl,tckd_tcfggcxm.lrr,tckd_tcfggcxm.lrsj  ";
	ls_sql+=" FROM tckd_tcfggcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where tckd_tcfggcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcfggcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfggcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckd_tcfggcxm.dqbm,tckd_tcfggcxm.bjjbbm,fgmc,tckd_tcfggcxm.hxbm,jgwzbm,tckd_tcfggcxm.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tckd_tcfggcxmList.jsp","","","EditTckd_tcfggcxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dqmc","bjjbmc","fgmc","hxmc","jgwzbm","xmbh","bzsl","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"dqbm","bjjbbm","fgmc","hxbm","jgwzbm","xmbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tckd_tcfggcxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from tckd_tcfggcxm where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ײͱ�׼������Ŀ��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="7%">����</td>
	<td  width="9%">���ۼ���</td>
	<td  width="9%">�������</td>
	<td  width="8%">����</td>
	<td  width="8%">�ṹλ��</td>
	<td  width="10%">��Ŀ���</td>
	<td  width="6%">��׼����</td>
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