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
	String jc_jjpjbj_gtpjbh=null;
	String jc_jjpjbj_gtpjmc=null;
	String jc_jjpjbj_xinghao=null;
	String jc_jjpjbj_guige=null;
	String jc_jjpjbj_dj=null;
	String jc_jjpjbj_bz=null;
	String jc_jjpjbj_jjpjflbm=null;
	String jc_jjpjbj_jldwbm=null;
	jc_jjpjbj_gtpjbh=request.getParameter("jc_jjpjbj_gtpjbh");
	if (jc_jjpjbj_gtpjbh!=null)
	{
		jc_jjpjbj_gtpjbh=cf.GB2Uni(jc_jjpjbj_gtpjbh);
		if (!(jc_jjpjbj_gtpjbh.equals("")))	wheresql+=" and  (jc_jjpjbj.gtpjbh='"+jc_jjpjbj_gtpjbh+"')";
	}
	jc_jjpjbj_gtpjmc=request.getParameter("jc_jjpjbj_gtpjmc");
	if (jc_jjpjbj_gtpjmc!=null)
	{
		jc_jjpjbj_gtpjmc=cf.GB2Uni(jc_jjpjbj_gtpjmc);
		if (!(jc_jjpjbj_gtpjmc.equals("")))	wheresql+=" and  (jc_jjpjbj.gtpjmc='"+jc_jjpjbj_gtpjmc+"')";
	}
	jc_jjpjbj_xinghao=request.getParameter("jc_jjpjbj_xinghao");
	if (jc_jjpjbj_xinghao!=null)
	{
		jc_jjpjbj_xinghao=cf.GB2Uni(jc_jjpjbj_xinghao);
		if (!(jc_jjpjbj_xinghao.equals("")))	wheresql+=" and  (jc_jjpjbj.xinghao='"+jc_jjpjbj_xinghao+"')";
	}
	jc_jjpjbj_guige=request.getParameter("jc_jjpjbj_guige");
	if (jc_jjpjbj_guige!=null)
	{
		jc_jjpjbj_guige=cf.GB2Uni(jc_jjpjbj_guige);
		if (!(jc_jjpjbj_guige.equals("")))	wheresql+=" and  (jc_jjpjbj.guige='"+jc_jjpjbj_guige+"')";
	}
	jc_jjpjbj_dj=request.getParameter("jc_jjpjbj_dj");
	if (jc_jjpjbj_dj!=null)
	{
		jc_jjpjbj_dj=jc_jjpjbj_dj.trim();
		if (!(jc_jjpjbj_dj.equals("")))	wheresql+=" and  (jc_jjpjbj.dj="+jc_jjpjbj_dj+") ";
	}
	jc_jjpjbj_bz=request.getParameter("jc_jjpjbj_bz");
	if (jc_jjpjbj_bz!=null)
	{
		jc_jjpjbj_bz=cf.GB2Uni(jc_jjpjbj_bz);
		if (!(jc_jjpjbj_bz.equals("")))	wheresql+=" and  (jc_jjpjbj.bz='"+jc_jjpjbj_bz+"')";
	}
	jc_jjpjbj_jjpjflbm=request.getParameter("jc_jjpjbj_jjpjflbm");
	if (jc_jjpjbj_jjpjflbm!=null)
	{
		jc_jjpjbj_jjpjflbm=cf.GB2Uni(jc_jjpjbj_jjpjflbm);
		if (!(jc_jjpjbj_jjpjflbm.equals("")))	wheresql+=" and  (jc_jjpjbj.jjpjflbm='"+jc_jjpjbj_jjpjflbm+"')";
	}
	jc_jjpjbj_jldwbm=request.getParameter("jc_jjpjbj_jldwbm");
	if (jc_jjpjbj_jldwbm!=null)
	{
		jc_jjpjbj_jldwbm=cf.GB2Uni(jc_jjpjbj_jldwbm);
		if (!(jc_jjpjbj_jldwbm.equals("")))	wheresql+=" and  (jc_jjpjbj.jldwbm='"+jc_jjpjbj_jldwbm+"')";
	}
	ls_sql="SELECT jdm_jjpjflbm.jjpjflmc,jc_jjpjbj.gtpjbh,jc_jjpjbj.gtpjmc,jc_jjpjbj.xinghao,jc_jjpjbj.guige,jdm_jldwbm.jldwmc,jc_jjpjbj.dj,jc_jjpjbj.bz";
	ls_sql+=" FROM jc_jjpjbj,jdm_jjpjflbm,jdm_jldwbm  ";
    ls_sql+=" where jc_jjpjbj.jjpjflbm=jdm_jjpjflbm.jjpjflbm(+) and jc_jjpjbj.jldwbm=jdm_jldwbm.jldwbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_jjpjbj.jjpjflbm,jc_jjpjbj.gtpjbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_jjpjbjCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gtpjbh","jc_jjpjbj_gtpjmc","jc_jjpjbj_xinghao","jc_jjpjbj_guige","jc_jjpjbj_dj","jc_jjpjbj_bz","jdm_jjpjflbm_jjpjflmc","jdm_jldwbm_jldwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gtpjbh"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jjpjflmc","1");//�в����������Hash��
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
  <B><font size="3">�Ҿ�������۱�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�������</td>
	<td  width="7%">������</td>
	<td  width="13%">�������</td>
	<td  width="19%">�ͺ�</td>
	<td  width="12%">���</td>
	<td  width="7%">������λ</td>
	<td  width="7%">����</td>
	<td  width="27%">��ע</td>
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