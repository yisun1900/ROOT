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
	String pjxmbm=null;
	String pjxm=null;
	String spjrybm=null;
	String xmflbm=null;
	String xsfs=null;
	String xh=null;
	pjxmbm=request.getParameter("pjxmbm");
	if (pjxmbm!=null)
	{
		pjxmbm=cf.GB2Uni(pjxmbm);
		if (!(pjxmbm.equals("")))	wheresql+=" and  (pjxmbm='"+pjxmbm+"')";
	}
	pjxm=request.getParameter("pjxm");
	if (pjxm!=null)
	{
		pjxm=cf.GB2Uni(pjxm);
		if (!(pjxm.equals("")))	wheresql+=" and  (pjxm='"+pjxm+"')";
	}
	spjrybm=request.getParameter("spjrybm");
	if (spjrybm!=null)
	{
		spjrybm=cf.GB2Uni(spjrybm);
		if (!(spjrybm.equals("")))	wheresql+=" and  (spjrybm='"+spjrybm+"')";
	}
	xmflbm=request.getParameter("xmflbm");
	if (xmflbm!=null)
	{
		xmflbm=cf.GB2Uni(xmflbm);
		if (!(xmflbm.equals("")))	wheresql+=" and  (xmflbm='"+xmflbm+"')";
	}
	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (xsfs='"+xsfs+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ls_sql="SELECT spjrybm,spjry,xmflbm,xmfl,xh,pjxmbm,pjxm, DECODE(xsfs,'1','��ѡ','2','��Ŀ���൥ѡ')  ";
	ls_sql+=" FROM crm_pjxmbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by spjrybm,xmflbm,pjxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_pjxmbmCxList.jsp","SelectCxCrm_pjxmbm.jsp","","");
	pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pjxmbm","pjxm","spjrybm","spjry","xmflbm","xmfl","xsfs","xh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pjxmbm"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("spjrybm","1");//�в����������Hash��
	spanColHash.put("spjry","1");//�в����������Hash��
	spanColHash.put("xmflbm","1");//�в����������Hash��
	spanColHash.put("xmfl","1");//�в����������Hash��
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">��������Ա����</td>
	<td  width="13%">��������Ա</td>
	<td  width="9%">��Ŀ�������</td>
	<td  width="14%">��Ŀ����</td>
	<td  width="6%">���</td>
	<td  width="9%">������Ŀ����(6λ)</td>
	<td  width="28%">������Ŀ</td>
	<td  width="12%">��ʾ��ʽ</td>
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