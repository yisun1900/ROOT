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
	String tslxbm=null;
	String tslxmc=null;
	String tsdl=null;
	String px=null;
	tslxbm=request.getParameter("tslxbm");
	if (tslxbm!=null)
	{
		tslxbm=cf.GB2Uni(tslxbm);
		if (!(tslxbm.equals("")))	wheresql+=" and  (tslxbm='"+tslxbm+"')";
	}
	tslxmc=request.getParameter("tslxmc");
	if (tslxmc!=null)
	{
		tslxmc=cf.GB2Uni(tslxmc);
		if (!(tslxmc.equals("")))	wheresql+=" and  (tslxmc='"+tslxmc+"')";
	}
	tsdl=request.getParameter("tsdl");
	if (tsdl!=null)
	{
		tsdl=cf.GB2Uni(tsdl);
		if (!(tsdl.equals("")))	wheresql+=" and  (tsdl='"+tsdl+"')";
	}
	px=request.getParameter("px");
	if (px!=null)
	{
		px=px.trim();
		if (!(px.equals("")))	wheresql+=" and (px="+px+") ";
	}
	ls_sql="SELECT tslxbm,tslxmc, DECODE(tsdl,'1','����','2','Ͷ��') tsdl,px  ";
	ls_sql+=" FROM dm_tslxbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by tsdl,tslxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_tslxbmList.jsp","SelectDm_tslxbm.jsp","","EditDm_tslxbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"tslxbm","tslxmc","tsdl","px"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tslxbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_tslxbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tsdl","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] tslxbm = request.getParameterValues("tslxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tslxbm,"tslxbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_tslxbm where "+chooseitem;
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
	<td  width="15%">Ͷ�߱��޴������</td>
	<td  width="30%">Ͷ�߱��޴�������</td>
	<td  width="12%">���</td>
	<td  width="12%">����</td>
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