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
	ls_sql="SELECT jdm_cpjjhs.cpjjhsbm,jdm_cpjjhs.cpjjhs,jdm_cpjjhs.cpjjczbm,jdm_cpjjcz.cpjjcz  ";
	ls_sql+=" FROM jdm_cpjjcz,jdm_cpjjhs  ";
    ls_sql+=" where jdm_cpjjhs.cpjjczbm=jdm_cpjjcz.cpjjczbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_cpjjhs.cpjjczbm,jdm_cpjjhs.cpjjhsbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_cpjjhsList.jsp","SelectJdm_cpjjhs.jsp","","EditJdm_cpjjhs.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cpjjhsbm","jdm_cpjjhs_cpjjhs","jdm_cpjjhs_cpjjczbm","jdm_cpjjcz_cpjjcz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cpjjhsbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_cpjjhsList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cpjjczbm","1");//�в����������Hash��
	spanColHash.put("cpjjcz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] cpjjhsbm = request.getParameterValues("cpjjhsbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpjjhsbm,"cpjjhsbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_cpjjhs where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="14%">��Ʒ�Ҿ߻�ɫ����</td>
	<td  width="30%">��Ʒ�Ҿ߻�ɫ</td>
	<td  width="14%">��Ʒ�Ҿ߲��ʱ���</td>
	<td  width="30%">��Ʒ�Ҿ߲���</td>
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