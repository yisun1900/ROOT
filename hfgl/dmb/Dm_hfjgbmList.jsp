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
	String dm_hfjgbm_hfjgbm=null;
	String dm_hfjgbm_hfjgmc=null;

	dm_hfjgbm_hfjgbm=request.getParameter("dm_hfjgbm_hfjgbm");
	if (dm_hfjgbm_hfjgbm!=null)
	{
		dm_hfjgbm_hfjgbm=cf.GB2Uni(dm_hfjgbm_hfjgbm);
		if (!(dm_hfjgbm_hfjgbm.equals("")))	wheresql+=" and  (dm_hfjgbm.hfjgbm='"+dm_hfjgbm_hfjgbm+"')";
	}
	dm_hfjgbm_hfjgmc=request.getParameter("dm_hfjgbm_hfjgmc");
	if (dm_hfjgbm_hfjgmc!=null)
	{
		dm_hfjgbm_hfjgmc=cf.GB2Uni(dm_hfjgbm_hfjgmc);
		if (!(dm_hfjgbm_hfjgmc.equals("")))	wheresql+=" and  (dm_hfjgbm.hfjgmc='"+dm_hfjgbm_hfjgmc+"')";
	}

	ls_sql="SELECT dm_hfjgbm.hfjgbm,dm_hfjgbm.hfjgmc";
	ls_sql+=" FROM dm_hfjgbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_hfjgbm.hfjgbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_hfjgbmList.jsp","","","EditDm_hfjgbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"hfjgbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_hfjgbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] hfjgbm = request.getParameterValues("hfjgbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hfjgbm,"hfjgbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_hfjgbm where "+chooseitem;
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
	<td  width="22%">�طý������</td>
	<td  width="42%">�طý������</td>
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