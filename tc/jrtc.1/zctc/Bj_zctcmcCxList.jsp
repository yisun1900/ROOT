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
	String bj_zctcmc_tcbm=null;
	String bj_zctcmc_dqbm=null;
	String bj_zctcmc_tcmc=null;
	String bj_zctcmc_yj=null;
	String bj_zctcmc_tcj=null;

	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=lx.trim();
		if (!(lx.equals("")))	wheresql+=" and (bj_zctcmc.lx="+lx+") ";
	}

	bj_zctcmc_tcbm=request.getParameter("bj_zctcmc_tcbm");
	if (bj_zctcmc_tcbm!=null)
	{
		bj_zctcmc_tcbm=bj_zctcmc_tcbm.trim();
		if (!(bj_zctcmc_tcbm.equals("")))	wheresql+=" and (bj_zctcmc.tcbm="+bj_zctcmc_tcbm+") ";
	}
	bj_zctcmc_dqbm=request.getParameter("bj_zctcmc_dqbm");
	if (bj_zctcmc_dqbm!=null)
	{
		bj_zctcmc_dqbm=cf.GB2Uni(bj_zctcmc_dqbm);
		if (!(bj_zctcmc_dqbm.equals("")))	wheresql+=" and  (bj_zctcmc.dqbm='"+bj_zctcmc_dqbm+"')";
	}
	bj_zctcmc_tcmc=request.getParameter("bj_zctcmc_tcmc");
	if (bj_zctcmc_tcmc!=null)
	{
		bj_zctcmc_tcmc=cf.GB2Uni(bj_zctcmc_tcmc);
		if (!(bj_zctcmc_tcmc.equals("")))	wheresql+=" and  (bj_zctcmc.tcmc like '%"+bj_zctcmc_tcmc+"%')";
	}
	bj_zctcmc_yj=request.getParameter("bj_zctcmc_yj");
	if (bj_zctcmc_yj!=null)
	{
		bj_zctcmc_yj=bj_zctcmc_yj.trim();
		if (!(bj_zctcmc_yj.equals("")))	wheresql+=" and  (bj_zctcmc.yj="+bj_zctcmc_yj+") ";
	}
	bj_zctcmc_tcj=request.getParameter("bj_zctcmc_tcj");
	if (bj_zctcmc_tcj!=null)
	{
		bj_zctcmc_tcj=bj_zctcmc_tcj.trim();
		if (!(bj_zctcmc_tcj.equals("")))	wheresql+=" and  (bj_zctcmc.tcj="+bj_zctcmc_tcj+") ";
	}

	ls_sql="SELECT bj_zctcmc.tcbm,dm_dqbm.dqmc,DECODE(bj_zctcmc.lx,'1','�Ҿ��ײ�','2','�����ƻ�'),bj_zctcmc.tcmc,bj_zctcmc.yj,bj_zctcmc.tcj,bj_zctcmc.bz  ";
	ls_sql+=" FROM dm_dqbm,bj_zctcmc  ";
    ls_sql+=" where bj_zctcmc.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_zctcmc.dqbm,bj_zctcmc.tcmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_zctcmcCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"tcbm","dm_dqbm_dqmc","bj_zctcmc_tcmc","bj_zctcmc_yj","bj_zctcmc_tcj","bj_zctcmc_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tcbm"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"tcbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewBj_zctcmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tcbm",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�ײͱ���</td>
	<td  width="8%">����</td>
	<td  width="8%">����</td>
	<td  width="24%">�ײ�����</td>
	<td  width="11%">ԭ��</td>
	<td  width="11%">�ײͼ�</td>
	<td  width="38%">��ע</td>
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