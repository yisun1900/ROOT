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
	String bj_wntcmc_dqbm=null;
	String tcmc=null;
	String bj_wntcmc_hxbm=null;
	String bj_wntcmc_bzmj=null;
	String bj_wntcmc_tcjg=null;
	String bj_wntcmc_pmzjdj=null;

	String mjsfkzj=null;
	mjsfkzj=request.getParameter("mjsfkzj");
	if (mjsfkzj!=null)
	{
		mjsfkzj=cf.GB2Uni(mjsfkzj);
		if (!(mjsfkzj.equals("")))	wheresql+=" and  (bj_wntcmc.mjsfkzj='"+mjsfkzj+"')";
	}
	String zcsfxxz=null;
	zcsfxxz=request.getParameter("zcsfxxz");
	if (zcsfxxz!=null)
	{
		zcsfxxz=cf.GB2Uni(zcsfxxz);
		if (!(zcsfxxz.equals("")))	wheresql+=" and  (bj_wntcmc.zcsfxxz='"+zcsfxxz+"')";
	}
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (bj_wntcmc.lx='"+lx+"')";
	}

	bj_wntcmc_dqbm=request.getParameter("bj_wntcmc_dqbm");
	if (bj_wntcmc_dqbm!=null)
	{
		bj_wntcmc_dqbm=cf.GB2Uni(bj_wntcmc_dqbm);
		if (!(bj_wntcmc_dqbm.equals("")))	wheresql+=" and  (bj_wntcmc.dqbm='"+bj_wntcmc_dqbm+"')";
	}

	tcmc=request.getParameter("tcmc");
	if (tcmc!=null)
	{
		tcmc=cf.GB2Uni(tcmc);
		if (!(tcmc.equals("")))	wheresql+=" and  (bj_wntcmc.tcmc like '%"+tcmc+"%')";
	}

	bj_wntcmc_hxbm=request.getParameter("bj_wntcmc_hxbm");
	if (bj_wntcmc_hxbm!=null)
	{
		bj_wntcmc_hxbm=cf.GB2Uni(bj_wntcmc_hxbm);
		if (!(bj_wntcmc_hxbm.equals("")))	wheresql+=" and  (bj_wntcmc.hxbm='"+bj_wntcmc_hxbm+"')";
	}
	bj_wntcmc_bzmj=request.getParameter("bj_wntcmc_bzmj");
	if (bj_wntcmc_bzmj!=null)
	{
		bj_wntcmc_bzmj=bj_wntcmc_bzmj.trim();
		if (!(bj_wntcmc_bzmj.equals("")))	wheresql+=" and (bj_wntcmc.bzmj="+bj_wntcmc_bzmj+") ";
	}
	bj_wntcmc_tcjg=request.getParameter("bj_wntcmc_tcjg");
	if (bj_wntcmc_tcjg!=null)
	{
		bj_wntcmc_tcjg=bj_wntcmc_tcjg.trim();
		if (!(bj_wntcmc_tcjg.equals("")))	wheresql+=" and  (bj_wntcmc.tcjg="+bj_wntcmc_tcjg+") ";
	}
	bj_wntcmc_pmzjdj=request.getParameter("bj_wntcmc_pmzjdj");
	if (bj_wntcmc_pmzjdj!=null)
	{
		bj_wntcmc_pmzjdj=bj_wntcmc_pmzjdj.trim();
		if (!(bj_wntcmc_pmzjdj.equals("")))	wheresql+=" and  (bj_wntcmc.pmzjdj="+bj_wntcmc_pmzjdj+") ";
	}

	ls_sql="SELECT bj_wntcmc.dqbm,dm_dqbm.dqmc,bj_wntcmc.tcmc,bj_wntcmc.hxbm,hxmc,bj_wntcmc.bzmj,bj_wntcmc.tcjg,bj_wntcmc.pmzjdj,DECODE(bj_wntcmc.mjsfkzj,'1','��������','2','���ӼӼ�') mjsfkzj,DECODE(bj_wntcmc.zcsfxxz,'1','�Զ�ѡ��','2','�˹�ѡ��') zcsfxxz,DECODE(bj_wntcmc.lx,'1','��ů�ײ�','2','�����ײ�') lx  ";
	ls_sql+=" FROM dm_dqbm,bj_wntcmc,dm_hxbm  ";
    ls_sql+=" where bj_wntcmc.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_wntcmc.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_wntcmc.dqbm,bj_wntcmc.hxbm,bj_wntcmc.tcmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_wntcmcCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dqmc","hxmc","tcmc","bzmj","tcjg","pmzjdj","mjsfkzj","zcsfxxz","lx"};
	pageObj.setDisColName(disColName);


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dqbm","tcmc","hxbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewBj_wntczcmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tcmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">��ů�ײͣ���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����</td>
	<td  width="13%">����</td>
	<td  width="29%">�ײ�����</td>
	<td  width="9%">��׼���</td>
	<td  width="9%">�ײͼ۸�</td>
	<td  width="9%">ƽ�����ӵ���</td>
	<td  width="7%">����Ƿ������</td>
	<td  width="7%">�����Ƿ���ѡ��</td>
	<td  width="7%">����</td>
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