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
	String jdm_cpjjhs_cpjjhsbm=null;
	String jdm_cpjjhs_cpjjhs=null;
	String jdm_cpjjhs_cpjjczbm=null;
	jdm_cpjjhs_cpjjhsbm=request.getParameter("jdm_cpjjhs_cpjjhsbm");
	if (jdm_cpjjhs_cpjjhsbm!=null)
	{
		jdm_cpjjhs_cpjjhsbm=cf.GB2Uni(jdm_cpjjhs_cpjjhsbm);
		if (!(jdm_cpjjhs_cpjjhsbm.equals("")))	wheresql+=" and  (jdm_cpjjhs.cpjjhsbm='"+jdm_cpjjhs_cpjjhsbm+"')";
	}
	jdm_cpjjhs_cpjjhs=request.getParameter("jdm_cpjjhs_cpjjhs");
	if (jdm_cpjjhs_cpjjhs!=null)
	{
		jdm_cpjjhs_cpjjhs=cf.GB2Uni(jdm_cpjjhs_cpjjhs);
		if (!(jdm_cpjjhs_cpjjhs.equals("")))	wheresql+=" and  (jdm_cpjjhs.cpjjhs='"+jdm_cpjjhs_cpjjhs+"')";
	}
	jdm_cpjjhs_cpjjczbm=request.getParameter("jdm_cpjjhs_cpjjczbm");
	if (jdm_cpjjhs_cpjjczbm!=null)
	{
		jdm_cpjjhs_cpjjczbm=cf.GB2Uni(jdm_cpjjhs_cpjjczbm);
		if (!(jdm_cpjjhs_cpjjczbm.equals("")))	wheresql+=" and  (jdm_cpjjhs.cpjjczbm='"+jdm_cpjjhs_cpjjczbm+"')";
	}
	ls_sql="SELECT jdm_cpjjcz.cpjjcz,jdm_cpjjhs.cpjjhs  ";
	ls_sql+=" FROM jdm_cpjjcz,jdm_cpjjhs  ";
    ls_sql+=" where jdm_cpjjhs.cpjjczbm=jdm_cpjjcz.cpjjczbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_cpjjhs.cpjjczbm,jdm_cpjjhs.cpjjhsbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_cpjjhsCxList.jsp","SelectCxJdm_cpjjhs.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cpjjhsbm","jdm_cpjjhs_cpjjhs","jdm_cpjjhs_cpjjczbm","jdm_cpjjcz_cpjjcz"};
	pageObj.setDisColName(disColName);
*/


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cpjjcz","1");//�в����������Hash��
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
  <B><font size="3">��Ʒ�Ҿ߻�ɫ�����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(70);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="30%">��Ʒ�Ҿ߲���</td>
	<td  width="40%">��Ʒ�Ҿ߻�ɫ</td>
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