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
	String scsbm=null;
	String scsmc=null;
	String scslb=null;
	scslb=request.getParameter("scslb");
	if (scslb!=null)
	{
		scslb=cf.GB2Uni(scslb);
		if (!(scslb.equals("")))	wheresql+=" and  (scslb='"+scslb+"')";
	}
	scsbm=request.getParameter("scsbm");
	if (scsbm!=null)
	{
		scsbm=cf.GB2Uni(scsbm);
		if (!(scsbm.equals("")))	wheresql+=" and  (scsbm='"+scsbm+"')";
	}
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (scsmc like '%"+scsmc+"%')";
	}

	ls_sql="SELECT scsbm,scsmc,DECODE(scslb,'1','����','2','������','3','ͨ�����') scslb  ";
	ls_sql+=" FROM jxc_scsxx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by scslb,scsmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_scsxxCxList.jsp","","","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"scsbm"};
	pageObj.setKey(keyName);
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
	<td  width="20%">Ʒ�Ʊ���</td>
	<td  width="60%">Ʒ������</td>
	<td  width="20%">Ʒ�����</td>
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