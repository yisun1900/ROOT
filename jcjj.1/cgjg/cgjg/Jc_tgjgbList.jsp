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

	ls_sql="SELECT jc_tgjgb.cgbm as cgbm,jc_tgjgb.tggdbm as tggdbm,jdm_tggdbm.tggdmc as jdm_tggdbm_tggdmc,jc_tgjgb.tgjsbm as tgjsbm,jdm_tgjsbm.tgjsmc as jdm_tgjsbm_tgjsmc,jc_tgjgb.lsj as jc_tgjgb_lsj,jc_tgjgb.yhj as jc_tgjgb_yhj  ";
	ls_sql+=" FROM jdm_tgjsbm,jdm_tggdbm,jc_tgjgb  ";
    ls_sql+=" where jc_tgjgb.tgjsbm=jdm_tgjsbm.tgjsbm and jc_tgjgb.tggdbm=jdm_tggdbm.tggdbm";
    ls_sql+=" and jc_tgjgb.cgbm='"+cgbm+"'";
    ls_sql+=" order by jc_tgjgb.tgjsbm,jc_tgjgb.tggdbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_tgjgbList.jsp","","","EditJc_tgjgb.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jdm_tgjsbm_tgjsmc","jdm_tggdbm_tggdmc","jc_tgjgb_lsj","jc_tgjgb_yhj"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"cgbm","tggdbm","tgjsbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_tgjgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jdm_tgjsbm_tgjsmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_tgjgb where "+chooseitem;
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
  <B><font size="3">�ع�۸��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="25%">�ع��������</td>
	<td  width="35%">�ع�߶�����</td>
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