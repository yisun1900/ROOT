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
	String dm_shxmxlbm_shxmxlbm=null;
	String dm_shxmxlbm_shxmxlmc=null;
	String dm_shxmxlbm_shxmdlbm=null;
	dm_shxmxlbm_shxmxlbm=request.getParameter("dm_shxmxlbm_shxmxlbm");
	if (dm_shxmxlbm_shxmxlbm!=null)
	{
		dm_shxmxlbm_shxmxlbm=cf.GB2Uni(dm_shxmxlbm_shxmxlbm);
		if (!(dm_shxmxlbm_shxmxlbm.equals("")))	wheresql+=" and  (dm_shxmxlbm.shxmxlbm='"+dm_shxmxlbm_shxmxlbm+"')";
	}
	dm_shxmxlbm_shxmxlmc=request.getParameter("dm_shxmxlbm_shxmxlmc");
	if (dm_shxmxlbm_shxmxlmc!=null)
	{
		dm_shxmxlbm_shxmxlmc=cf.GB2Uni(dm_shxmxlbm_shxmxlmc);
		if (!(dm_shxmxlbm_shxmxlmc.equals("")))	wheresql+=" and  (dm_shxmxlbm.shxmxlmc='"+dm_shxmxlbm_shxmxlmc+"')";
	}
	dm_shxmxlbm_shxmdlbm=request.getParameter("dm_shxmxlbm_shxmdlbm");
	if (dm_shxmxlbm_shxmdlbm!=null)
	{
		dm_shxmxlbm_shxmdlbm=cf.GB2Uni(dm_shxmxlbm_shxmdlbm);
		if (!(dm_shxmxlbm_shxmdlbm.equals("")))	wheresql+=" and  (dm_shxmxlbm.shxmdlbm='"+dm_shxmxlbm_shxmdlbm+"')";
	}
	ls_sql="SELECT shxmdlmc,dm_shxmxlbm.shxmxlbm,dm_shxmxlbm.shxmxlmc ";
	ls_sql+=" FROM dm_shxmdlbm,dm_shxmxlbm  ";
    ls_sql+=" where dm_shxmxlbm.shxmdlbm=dm_shxmdlbm.shxmdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_shxmxlbm.shxmdlbm,shxmxlbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_shxmxlbmList.jsp","SelectDm_shxmxlbm.jsp","","EditDm_shxmxlbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"shxmxlbm","dm_shxmxlbm_shxmxlmc","dm_shxmdlbm_shxmdlmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"shxmxlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_shxmxlbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("shxmdlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] shxmxlbm = request.getParameterValues("shxmxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shxmxlbm,"shxmxlbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_shxmxlbm where "+chooseitem;
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
	<td  width="20%">�����Ŀ����</td>
	<td  width="19%">�����ĿС�����</td>
	<td  width="29%">�����ĿС������</td>
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