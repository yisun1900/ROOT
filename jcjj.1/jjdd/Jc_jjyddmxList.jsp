<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT jc_jjyddmx.jjlbbm as jjlbbm,jdm_jjlbbm.jjlbmc as jdm_jjlbbm_jjlbmc,jc_jjyddmx.sl as jc_jjyddmx_sl,jc_jjyddmx.bz as jc_jjyddmx_bz  ";
	ls_sql+=" FROM jdm_jjlbbm,jc_jjyddmx  ";
    ls_sql+=" where jc_jjyddmx.jjlbbm=jdm_jjlbbm.jjlbbm";
    ls_sql+=" and jc_jjyddmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_jjyddmx.jjlbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_jjyddmxList.jsp?ddbh="+ddbh,"","","EditJc_jjyddmx.jsp?ddbh="+ddbh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jdm_jjlbbm_jjlbmc","jc_jjyddmx_sl","jc_jjyddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"jjlbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_jjyddmxList.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] jjlbbm = request.getParameterValues("jjlbbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jjlbbm,"jjlbbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_jjyddmx where ddbh='"+ddbh+"' and ("+chooseitem+")";
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�Ҿ�Ԥ������ϸ��������ţ�<%=ddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="20%">�Ҿ����</td>
	<td  width="10%">����</td>
	<td  width="60%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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