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
	String cgbm=request.getParameter("cgbm");

	ls_sql="SELECT cgbm as cgbm,jc_dgjgb.dggdbm as dggdbm,jdm_dggdbm.dggdmc as jdm_dggdbm_dggdmc,jc_dgjgb.dgjsbm as dgjsbm,jdm_dgjsbm.dgjsmc as jdm_dgjsbm_dgjsmc,jc_dgjgb.lsj as jc_dgjgb_lsj,jc_dgjgb.yhj as jc_dgjgb_yhj  ";
	ls_sql+=" FROM jdm_dgjsbm,jdm_dggdbm,jc_dgjgb  ";
    ls_sql+=" where jc_dgjgb.dgjsbm=jdm_dgjsbm.dgjsbm and jc_dgjgb.dggdbm=jdm_dggdbm.dggdbm";
    ls_sql+=" and jc_dgjgb.cgbm='"+cgbm+"'";
    ls_sql+=" order by jc_dgjgb.dgjsbm,jc_dgjgb.dggdbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_dgjgbList.jsp","","","EditJc_dgjgb.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jdm_dgjsbm_dgjsmc","jdm_dggdbm_dggdmc","jc_dgjgb_lsj","jc_dgjgb_yhj"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"cgbm","dggdbm","dgjsbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_dgjgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jdm_dgjsbm_dgjsmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_dgjgb where "+chooseitem;
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
  <B><font size="3">����۸��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="25%">�����������</td>
	<td  width="35%">����߶�����</td>
	<td  width="12%">���ۼ�</td>
	<td  width="12%">�Żݼ�</td>
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