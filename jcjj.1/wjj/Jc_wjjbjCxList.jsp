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
	String jc_wjjbj_xh=null;
	String jc_wjjbj_wjjbm=null;
	String jc_wjjbj_xinghao=null;
	String jc_wjjbj_jldw=null;
	String jc_wjjbj_dj=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_wjjbj.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_wjjbj.dqbm='"+dqbm+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and (jc_wjjbj.dwbh='"+dwbh+"') ";
	}
	String wjazwzbm=null;
	wjazwzbm=request.getParameter("wjazwzbm");
	if (wjazwzbm!=null)
	{
		if (!(wjazwzbm.equals("")))	wheresql+=" and (jc_wjjbj.wjazwzbm='"+wjazwzbm+"') ";
	}
	jc_wjjbj_xh=request.getParameter("jc_wjjbj_xh");
	if (jc_wjjbj_xh!=null)
	{
		jc_wjjbj_xh=jc_wjjbj_xh.trim();
		if (!(jc_wjjbj_xh.equals("")))	wheresql+=" and (jc_wjjbj.xh="+jc_wjjbj_xh+") ";
	}
	jc_wjjbj_wjjbm=request.getParameter("jc_wjjbj_wjjbm");
	if (jc_wjjbj_wjjbm!=null)
	{
		jc_wjjbj_wjjbm=cf.GB2Uni(jc_wjjbj_wjjbm);
		if (!(jc_wjjbj_wjjbm.equals("")))	wheresql+=" and  (jc_wjjbj.wjjbm='"+jc_wjjbj_wjjbm+"')";
	}
	jc_wjjbj_xinghao=request.getParameter("jc_wjjbj_xinghao");
	if (jc_wjjbj_xinghao!=null)
	{
		jc_wjjbj_xinghao=cf.GB2Uni(jc_wjjbj_xinghao);
		if (!(jc_wjjbj_xinghao.equals("")))	wheresql+=" and  (jc_wjjbj.xinghao='"+jc_wjjbj_xinghao+"')";
	}
	jc_wjjbj_jldw=request.getParameter("jc_wjjbj_jldw");
	if (jc_wjjbj_jldw!=null)
	{
		jc_wjjbj_jldw=cf.GB2Uni(jc_wjjbj_jldw);
		if (!(jc_wjjbj_jldw.equals("")))	wheresql+=" and  (jc_wjjbj.jldw='"+jc_wjjbj_jldw+"')";
	}
	jc_wjjbj_dj=request.getParameter("jc_wjjbj_dj");
	if (jc_wjjbj_dj!=null)
	{
		jc_wjjbj_dj=jc_wjjbj_dj.trim();
		if (!(jc_wjjbj_dj.equals("")))	wheresql+=" and  (jc_wjjbj.dj="+jc_wjjbj_dj+") ";
	}
	ls_sql="SELECT jc_wjjbj.xh,wjmc,jdm_wjjbm.wjjmc,jc_wjjbj.xinghao,jc_wjjbj.jldw,wjazwzmc,jc_wjjbj.dj,gysmc,jc_wjjbj.bz,jc_wjjbj.lrr,jc_wjjbj.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jdm_wjjbm,jc_wjjbj,sq_gysxx,jdm_wjazwzbm,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm(+) and jc_wjjbj.dwbh=sq_gysxx.gysbh(+) and jc_wjjbj.wjazwzbm=jdm_wjazwzbm.wjazwzbm(+)";
    ls_sql+=" and jc_wjjbj.dqbm=dm_dqbm.dqbm(+) and jc_wjjbj.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_wjjbj.dqbm,jc_wjjbj.wjjbm,xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_wjjbjCxList.jsp","SelectCxJc_wjjbj.jsp","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","jdm_wjjbm_wjjmc","jc_wjjbj_xinghao","jc_wjjbj_jldw","jc_wjjbj_dj","jc_wjjbj_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("wjjmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">������</td>
	<td  width="15%">�������</td>
	<td  width="6%">������</td>
	<td  width="15%">�ͺ�</td>
	<td  width="4%">������λ</td>
	<td  width="6%">��װλ��</td>
	<td  width="4%">����</td>
	<td  width="7%">��Ӧ��</td>
	<td  width="17%">��ע</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="4%">��������</td>
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