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
	String bj_tcjgb_bjbbh=null;
	String bj_tcjgb_dqbm=null;
	String bj_tcjgb_bjjbbm=null;
	String bj_tcjgb_hxbm=null;
	String bj_tcjgb_tcmc=null;
	bj_tcjgb_bjbbh=request.getParameter("bj_tcjgb_bjbbh");
	if (bj_tcjgb_bjbbh!=null)
	{
		bj_tcjgb_bjbbh=cf.GB2Uni(bj_tcjgb_bjbbh);
		if (!(bj_tcjgb_bjbbh.equals("")))	wheresql+=" and  (bj_tcjgb.bjbbh='"+bj_tcjgb_bjbbh+"')";
	}
	bj_tcjgb_dqbm=request.getParameter("bj_tcjgb_dqbm");
	if (bj_tcjgb_dqbm!=null)
	{
		bj_tcjgb_dqbm=cf.GB2Uni(bj_tcjgb_dqbm);
		if (!(bj_tcjgb_dqbm.equals("")))	wheresql+=" and  (bj_tcjgb.dqbm='"+bj_tcjgb_dqbm+"')";
	}
	bj_tcjgb_bjjbbm=request.getParameter("bj_tcjgb_bjjbbm");
	if (bj_tcjgb_bjjbbm!=null)
	{
		bj_tcjgb_bjjbbm=cf.GB2Uni(bj_tcjgb_bjjbbm);
		if (!(bj_tcjgb_bjjbbm.equals("")))	wheresql+=" and  (bj_tcjgb.bjjbbm='"+bj_tcjgb_bjjbbm+"')";
	}
	bj_tcjgb_hxbm=request.getParameter("bj_tcjgb_hxbm");
	if (bj_tcjgb_hxbm!=null)
	{
		bj_tcjgb_hxbm=cf.GB2Uni(bj_tcjgb_hxbm);
		if (!(bj_tcjgb_hxbm.equals("")))	wheresql+=" and  (bj_tcjgb.hxbm='"+bj_tcjgb_hxbm+"')";
	}
	bj_tcjgb_tcmc=request.getParameter("bj_tcjgb_tcmc");
	if (bj_tcjgb_tcmc!=null)
	{
		bj_tcjgb_tcmc=cf.GB2Uni(bj_tcjgb_tcmc);
		if (!(bj_tcjgb_tcmc.equals("")))	wheresql+=" and  (bj_tcjgb.tcmc='"+bj_tcjgb_tcmc+"')";
	}

	ls_sql="SELECT bj_tcjgb.bjbbh,bj_tcjgb.dqbm,dm_dqbm.dqmc,bj_tcjgb.bjjbbm,bjjbmc,bj_tcjgb.hxbm,hxmc,bj_tcjgb.tcmc,bj_tcjgb.fwmj,bj_tcjgb.tcjg,bj_tcjgb.pmzjdj,bj_tcjgb.tlgbzjj  ";
	ls_sql+=" FROM bj_tcjgb,dm_dqbm,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where bj_tcjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcjgb.bjbbh,bj_tcjgb.dqbm,bj_tcjgb.bjjbbm,bj_tcjgb.hxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_tcjgbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","tcmc","fwmj","tcjg","pmzjdj","tlgbzjj"};
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
  <B><font size="3">�ײͼ۸����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">���۰汾��</td>
	<td  width="10%">����</td>
	<td  width="13%">���ۼ���</td>
	<td  width="13%">����</td>
	<td  width="13%">�ײ�����</td>
	<td  width="10%">���ڻ�׼���</td>
	<td  width="10%">�ײͼ۸�</td>
	<td  width="10%">ƽ�����ӵ���</td>
	<td  width="10%">Ϳ�ϸ�Ϊ��ֽ�Ӽ�</td>
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