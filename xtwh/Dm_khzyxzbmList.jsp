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
	String khzyxzbm=null;
	String khzyxz=null;
	khzyxzbm=request.getParameter("khzyxzbm");
	if (khzyxzbm!=null)
	{
		khzyxzbm=cf.GB2Uni(khzyxzbm);
		if (!(khzyxzbm.equals("")))	wheresql+=" and  (khzyxzbm='"+khzyxzbm+"')";
	}
	khzyxz=request.getParameter("khzyxz");
	if (khzyxz!=null)
	{
		khzyxz=cf.GB2Uni(khzyxz);
		if (!(khzyxz.equals("")))	wheresql+=" and  (khzyxz='"+khzyxz+"')";
	}
	ls_sql="SELECT khzyxzbm,khzyxz  ";
	ls_sql+=" FROM dm_khzyxzbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by khzyxzbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_khzyxzbmList.jsp","SelectDm_khzyxzbm.jsp","","EditDm_khzyxzbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzyxzbm","khzyxz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khzyxzbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_khzyxzbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] khzyxzbm = request.getParameterValues("khzyxzbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khzyxzbm,"khzyxzbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_khzyxzbm where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="22%">�ͻ���Դ���ʱ���</td>
	<td  width="68%">�ͻ���Դ����</td>
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