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
	String bcpp=null;
	String bchd=null;
	String dj=null;
	bcpp=request.getParameter("bcpp");
	if (bcpp!=null)
	{
		bcpp=cf.GB2Uni(bcpp);
		if (!(bcpp.equals("")))	wheresql+=" and  (bcpp='"+bcpp+"')";
	}
	bchd=request.getParameter("bchd");
	if (bchd!=null)
	{
		bchd=bchd.trim();
		if (!(bchd.equals("")))	wheresql+=" and (bchd="+bchd+") ";
	}
	dj=request.getParameter("dj");
	if (dj!=null)
	{
		dj=dj.trim();
		if (!(dj.equals("")))	wheresql+=" and  (dj="+dj+") ";
	}
	ls_sql="SELECT bcpp,bclx,bchd,dj  ";
	ls_sql+=" FROM jc_jjbjbj  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by bcpp,bclx,bchd";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_jjbjbjCxList.jsp","SelectCxJc_jjbjbj.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"bcpp","bchd","dj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bcpp","bchd"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("bcpp","1");//�в����������Hash��
	spanColHash.put("bclx","1");//�в����������Hash��
	spanColHash.put("bchd","1");//�в����������Hash��
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
	<td  width="35%">���Ʒ��</td>
	<td  width="35%">�������</td>
	<td  width="15%">��ĺ�ȣ�mm��</td>
	<td  width="15%">����</td>
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