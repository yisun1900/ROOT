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
	String bj_tcsjcjb_bjbbh=null;
	String bj_tcsjcjb_dqbm=null;
	String bj_tcsjcjb_bjjbbm=null;
	String bj_tcsjcjb_bjjbbm1=null;
	String tcsjflbm=null;
	String bj_tcsjcjb_jldw=null;
	bj_tcsjcjb_bjbbh=request.getParameter("bj_tcsjcjb_bjbbh");
	if (bj_tcsjcjb_bjbbh!=null)
	{
		bj_tcsjcjb_bjbbh=cf.GB2Uni(bj_tcsjcjb_bjbbh);
		if (!(bj_tcsjcjb_bjbbh.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjbbh='"+bj_tcsjcjb_bjbbh+"')";
	}
	bj_tcsjcjb_dqbm=request.getParameter("bj_tcsjcjb_dqbm");
	if (bj_tcsjcjb_dqbm!=null)
	{
		bj_tcsjcjb_dqbm=cf.GB2Uni(bj_tcsjcjb_dqbm);
		if (!(bj_tcsjcjb_dqbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.dqbm='"+bj_tcsjcjb_dqbm+"')";
	}
	bj_tcsjcjb_bjjbbm=request.getParameter("bj_tcsjcjb_bjjbbm");
	if (bj_tcsjcjb_bjjbbm!=null)
	{
		bj_tcsjcjb_bjjbbm=cf.GB2Uni(bj_tcsjcjb_bjjbbm);
		if (!(bj_tcsjcjb_bjjbbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjjbbm='"+bj_tcsjcjb_bjjbbm+"')";
	}
	bj_tcsjcjb_bjjbbm1=request.getParameter("bj_tcsjcjb_bjjbbm1");
	if (bj_tcsjcjb_bjjbbm1!=null)
	{
		bj_tcsjcjb_bjjbbm1=cf.GB2Uni(bj_tcsjcjb_bjjbbm1);
		if (!(bj_tcsjcjb_bjjbbm1.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjjbbm1='"+bj_tcsjcjb_bjjbbm1+"')";
	}
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.tcsjflbm='"+tcsjflbm+"')";
	}
	bj_tcsjcjb_jldw=request.getParameter("bj_tcsjcjb_jldw");
	if (bj_tcsjcjb_jldw!=null)
	{
		bj_tcsjcjb_jldw=cf.GB2Uni(bj_tcsjcjb_jldw);
		if (!(bj_tcsjcjb_jldw.equals("")))	wheresql+=" and  (bj_tcsjcjb.jldw='"+bj_tcsjcjb_jldw+"')";
	}

	ls_sql="SELECT bj_tcsjcjb.bjbbh,bj_tcsjcjb.dqbm,dm_dqbm.dqmc,bj_tcsjcjb.bjjbbm,a.bjjbmc,bj_tcsjcjb.bjjbbm1,b.bjjbmc bjjbmc1,bj_tcsjcjb.tcsjflbm,tcsjflmc,bj_tcsjcjb.jldw,bj_tcsjcjb.sjcj  ";
	ls_sql+=" FROM bj_tcsjcjb,dm_dqbm,bdm_bjjbbm a,bdm_bjjbbm b,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcsjcjb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcsjcjb.bjbbh,bj_tcsjcjb.dqbm,bj_tcsjcjb.tcsjflbm,bj_tcsjcjb.bjjbbm,bj_tcsjcjb.bjjbbm1";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_tcsjcjbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","tcsjflmc","bjjbmc","bjjbmc1","jldw","sjcj"};
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
  <B><font size="3">�ײ�������۱�����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">���۰汾��</td>
	<td  width="12%">����</td>
	<td  width="20%">�ײ���������</td>
	<td  width="16%">ԭ���ۼ���</td>
	<td  width="16%">�������ۼ���</td>
	<td  width="12%">������λ</td>
	<td  width="11%">�������</td>
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