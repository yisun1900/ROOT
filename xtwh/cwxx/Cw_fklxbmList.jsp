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
	String fklxbm=null;
	String fklxmc=null;
	String fkdl=null;
	String pzfl=null;
	fklxbm=request.getParameter("fklxbm");
	if (fklxbm!=null)
	{
		fklxbm=cf.GB2Uni(fklxbm);
		if (!(fklxbm.equals("")))	wheresql+=" and  (fklxbm='"+fklxbm+"')";
	}
	fklxmc=request.getParameter("fklxmc");
	if (fklxmc!=null)
	{
		fklxmc=cf.GB2Uni(fklxmc);
		if (!(fklxmc.equals("")))	wheresql+=" and  (fklxmc='"+fklxmc+"')";
	}
	fkdl=request.getParameter("fkdl");
	if (fkdl!=null)
	{
		fkdl=cf.GB2Uni(fkdl);
		if (!(fkdl.equals("")))	wheresql+=" and  (fkdl='"+fkdl+"')";
	}
	pzfl=request.getParameter("pzfl");
	if (pzfl!=null)
	{
		pzfl=cf.GB2Uni(pzfl);
		if (!(pzfl.equals("")))	wheresql+=" and  (pzfl='"+pzfl+"')";
	}
	ls_sql="SELECT fklxbm,fklxmc, DECODE(fkdl,'1','��װ��','2','���ɿ�','3','���ɶ���','4','��ѯ�տ�','5','Ԥ����','9','�����տ�') fkdl, DECODE(pzfl,'1','���̿�','2','���ɿ�') pzfl ";
	ls_sql+=" FROM cw_fklxbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by pzfl,fkdl,fklxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_fklxbmList.jsp","SelectCw_fklxbm.jsp","","EditCw_fklxbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fklxbm","fklxmc","fkdl","pzfl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fklxbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_fklxbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("fkdl","1");//�в����������Hash��
	spanColHash.put("pzfl","2");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] fklxbm = request.getParameterValues("fklxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fklxbm,"fklxbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_fklxbm where "+chooseitem;
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
	<td  width="15%">�������ͱ���</td>
	<td  width="30%">������������</td>
	<td  width="20%">�������</td>
	<td  width="20%">ƾ֤����</td>
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