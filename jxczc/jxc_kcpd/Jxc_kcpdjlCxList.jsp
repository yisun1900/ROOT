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
	String pdph=null;
	String dqbm=null;
	String ckbh=null;
	String pdzt=null;
	String pdr=null;
	String pdrssbm=null;
	String pdrssfgs=null;
	String pdsj=null;
	String bz=null;
	String pdlb=null;
	pdlb=request.getParameter("pdlb");
	if (pdlb!=null)
	{
		pdlb=pdlb.trim();
		if (!(pdlb.equals("")))	wheresql+=" and (pdlb="+pdlb+") ";
	}
	pdph=request.getParameter("pdph");
	if (pdph!=null)
	{
		pdph=pdph.trim();
		if (!(pdph.equals("")))	wheresql+=" and (jxc_kcpdjl.pdph="+pdph+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_kcpdjl.dqbm='"+dqbm+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_kcpdjl.ckbh='"+ckbh+"')";
	}
	pdzt=request.getParameter("pdzt");
	if (pdzt!=null)
	{
		pdzt=cf.GB2Uni(pdzt);
		if (!(pdzt.equals("")))	wheresql+=" and  (jxc_kcpdjl.pdzt='"+pdzt+"')";
	}
	pdr=request.getParameter("pdr");
	if (pdr!=null)
	{
		pdr=cf.GB2Uni(pdr);
		if (!(pdr.equals("")))	wheresql+=" and  (jxc_kcpdjl.pdr='"+pdr+"')";
	}
	pdrssbm=request.getParameter("pdrssbm");
	if (pdrssbm!=null)
	{
		pdrssbm=cf.GB2Uni(pdrssbm);
		if (!(pdrssbm.equals("")))	wheresql+=" and  (jxc_kcpdjl.pdrssbm='"+pdrssbm+"')";
	}
	pdrssfgs=request.getParameter("pdrssfgs");
	if (pdrssfgs!=null)
	{
		pdrssfgs=cf.GB2Uni(pdrssfgs);
		if (!(pdrssfgs.equals("")))	wheresql+=" and  (jxc_kcpdjl.pdrssfgs='"+pdrssfgs+"')";
	}
	pdsj=request.getParameter("pdsj");
	if (pdsj!=null)
	{
		pdsj=pdsj.trim();
		if (!(pdsj.equals("")))	wheresql+="  and (jxc_kcpdjl.pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		pdsj=pdsj.trim();
		if (!(pdsj.equals("")))	wheresql+="  and (jxc_kcpdjl.pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_kcpdjl.bz='"+bz+"')";
	}
	ls_sql=" select pdph,dm_dqbm.dqmc dqbm,ckmc ckbh,DECODE(pdzt,'1','�����̵�','2','�̵����') pdzt,pdr,a.dwmc pdrssbm,b.dwmc pdrssfgs,pdsj,jxc_kcpdjl.bz bz ";
	ls_sql+=" from jxc_kcpdjl,dm_dqbm,jxc_ckmc,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where jxc_kcpdjl.dqbm=dm_dqbm.dqbm and jxc_kcpdjl.ckbh=jxc_ckmc.ckbh and jxc_kcpdjl.pdrssbm=a.dwbh and  jxc_kcpdjl.pdrssfgs=b.dwbh ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_kcpdjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pdph","dqbm","ckbh","pdzt","pdr","pdrssbm","pdrssfgs","pdsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pdph"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"pdph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_kcpdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("pdph",coluParm);//�в����������Hash��
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
	<td  width="7%">����</td>
	<td  width="9%">����</td>
	<td  width="15%">�ֿ�</td>
	<td  width="8%">�̵�״̬</td>
	<td  width="7%">�̵���</td>
	<td  width="11%">�̵�����������</td>
	<td  width="11%">�̵��������ֹ�˾</td>
	<td  width="9%">�̵�ʱ��</td>
	<td  width="29%">��ע</td>
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