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
	String wlbm=null;
	String jswlbm=null;
	String glmc=null;
	String cldlbm=null;
	String dqbm=null;

	String qrbz=null;
	qrbz=request.getParameter("qrbz");
	if (qrbz!=null)
	{
		qrbz=cf.GB2Uni(qrbz);
		if (!(qrbz.equals("")))	wheresql+=" and  (bj_jzcljgb.qrbz='"+qrbz+"')";
	}

	wlbm=request.getParameter("wlbm");
	if (wlbm!=null)
	{
		wlbm=cf.GB2Uni(wlbm);
		if (!(wlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.wlbm='"+wlbm+"')";
	}
	jswlbm=request.getParameter("jswlbm");
	if (jswlbm!=null)
	{
		jswlbm=cf.GB2Uni(jswlbm);
		if (!(jswlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.jswlbm='"+jswlbm+"')";
	}
	glmc=request.getParameter("glmc");
	if (glmc!=null)
	{
		glmc=cf.GB2Uni(glmc);
		if (!(glmc.equals("")))	wheresql+=" and  (bj_jzcljgb.glmc like '%"+glmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.cldlbm='"+cldlbm+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzcljgb.dqbm='"+dqbm+"')";
	}
	ls_sql="SELECT dqmc,DECODE(qrbz,'N','δȷ��','Y','ȷ��'),cldlmc,bj_jzcljgb.wlbm,bj_jzcljgb.glmc,bj_jzcljgb.xhgg,bj_jzcljgb.pp,a.cljldwmc jldwbm,bj_jzcljgb.dj,bj_jzcljgb.jswlbm,bj_jscljgb.glmc||NVL2(bj_jscljgb.pp,'('||bj_jscljgb.pp||')',''),b.cljldwmc jsjldwbm,bj_jzcljgb.wljsbz,bj_jzcljgb.lrr,bj_jzcljgb.lrsj ";
	ls_sql+=" FROM bj_jzcljgb,dm_dqbm,bdm_cldlbm,bdm_cljldwbm a,bdm_cljldwbm b,bj_jscljgb ";
	ls_sql+=" where bj_jzcljgb.dqbm=dm_dqbm.dqbm and  bj_jzcljgb.cldlbm=bdm_cldlbm.cldlbm(+)";
	ls_sql+=" and bj_jzcljgb.jldwbm=a.cljldwbm(+) and bj_jzcljgb.jsjldwbm=b.cljldwbm(+) and bj_jzcljgb.jswlbm=bj_jscljgb.wlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzcljgb.dqbm,bj_jzcljgb.wlbm";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_bjmbCxList.jsp","SelectCxBj_gzcljgb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqmc","cldlbm","wlbm","glmc","pp","xhgg","cljldwmc","dj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/
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
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��������</td>
	<td  width="3%">ȷ�ϱ�־</td>
	<td  width="9%">�������</td>
	<td  width="6%">�������ϱ���</td>
    <td  width="13%">������������</td>
	<td  width="10%">�ͺŹ��</td>
	<td  width="12%">Ʒ��</td>
	<td  width="3%">����������λ</td>
	<td  width="4%">����</td>
	<td  width="4%">������ϱ���</td>
	<td  width="17%">������������</td>
	<td  width="3%">���������λ</td>
	<td  width="4%">�������������λ��</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
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