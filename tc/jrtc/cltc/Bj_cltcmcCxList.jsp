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
	String bj_cltcmc_dqbm=null;
	String tcmc=null;
	String bj_cltcmc_hxbm=null;
	String bj_cltcmc_tcjg=null;

	String zcsfxxz=null;
	zcsfxxz=request.getParameter("zcsfxxz");
	if (zcsfxxz!=null)
	{
		zcsfxxz=cf.GB2Uni(zcsfxxz);
		if (!(zcsfxxz.equals("")))	wheresql+=" and  (bj_cltcmc.zcsfxxz='"+zcsfxxz+"')";
	}
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (bj_cltcmc.lx='"+lx+"')";
	}

	bj_cltcmc_dqbm=request.getParameter("bj_cltcmc_dqbm");
	if (bj_cltcmc_dqbm!=null)
	{
		bj_cltcmc_dqbm=cf.GB2Uni(bj_cltcmc_dqbm);
		if (!(bj_cltcmc_dqbm.equals("")))	wheresql+=" and  (bj_cltcmc.dqbm='"+bj_cltcmc_dqbm+"')";
	}

	tcmc=request.getParameter("tcmc");
	if (tcmc!=null)
	{
		tcmc=cf.GB2Uni(tcmc);
		if (!(tcmc.equals("")))	wheresql+=" and  (bj_cltcmc.tcmc like '%"+tcmc+"%')";
	}

	bj_cltcmc_hxbm=request.getParameter("bj_cltcmc_hxbm");
	if (bj_cltcmc_hxbm!=null)
	{
		bj_cltcmc_hxbm=cf.GB2Uni(bj_cltcmc_hxbm);
		if (!(bj_cltcmc_hxbm.equals("")))	wheresql+=" and  (bj_cltcmc.hxbm='"+bj_cltcmc_hxbm+"')";
	}
	bj_cltcmc_tcjg=request.getParameter("bj_cltcmc_tcjg");
	if (bj_cltcmc_tcjg!=null)
	{
		bj_cltcmc_tcjg=bj_cltcmc_tcjg.trim();
		if (!(bj_cltcmc_tcjg.equals("")))	wheresql+=" and  (bj_cltcmc.tcjg="+bj_cltcmc_tcjg+") ";
	}

	ls_sql="SELECT bj_cltcmc.dqbm,dm_dqbm.dqmc,bj_cltcmc.tcmc,bj_cltcmc.hxbm,hxmc,bj_cltcmc.tcjg,DECODE(bj_cltcmc.zcsfxxz,'1','�Զ�ѡ��','2','�˹�ѡ��') zcsfxxz,DECODE(bj_cltcmc.lx,'1','�����ײ�') lx  ";
	ls_sql+=" FROM dm_dqbm,bj_cltcmc,dm_hxbm  ";
    ls_sql+=" where bj_cltcmc.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_cltcmc.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_cltcmc.dqbm,bj_cltcmc.hxbm,bj_cltcmc.tcmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_cltcmcCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dqmc","hxmc","tcmc","tcjg","zcsfxxz","lx"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"dqbm","tcmc","hxbm"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dqbm","tcmc","hxbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewBj_cltczcmx.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">�����ײͣ���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����</td>
	<td  width="13%">����</td>
	<td  width="21%">�ײ�����</td>
	<td  width="9%">�ײͼ۸�</td>
	<td  width="9%">�����Ƿ���ѡ��</td>
	<td  width="9%">����</td>
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