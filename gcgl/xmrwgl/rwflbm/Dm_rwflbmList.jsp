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
	String rwflbm=null;
	String rwflmc=null;
	String dl=null;
	rwflbm=request.getParameter("rwflbm");
	if (rwflbm!=null)
	{
		rwflbm=cf.GB2Uni(rwflbm);
		if (!(rwflbm.equals("")))	wheresql+=" and  (rwflbm='"+rwflbm+"')";
	}
	rwflmc=request.getParameter("rwflmc");
	if (rwflmc!=null)
	{
		rwflmc=cf.GB2Uni(rwflmc);
		if (!(rwflmc.equals("")))	wheresql+=" and  (rwflmc='"+rwflmc+"')";
	}
	dl=request.getParameter("dl");
	if (dl!=null)
	{
		dl=cf.GB2Uni(dl);
		if (!(dl.equals("")))	wheresql+=" and  (dl='"+dl+"')";
	}
	ls_sql="SELECT rwflbm,rwflmc, DECODE(dl,'1','һ��','2','����','3','����','4','����','5','����','6','�µ�','7','���','8','�ͻ�','9','��װ') dlmc ";
	ls_sql+=" FROM dm_rwflbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by dl,rwflbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_rwflbmList.jsp","","","EditDm_rwflbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"rwflbm","rwflmc","dl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"rwflbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_rwflbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] rwflbm = request.getParameterValues("rwflbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(rwflbm,"rwflbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_rwflbm where "+chooseitem;
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
	<td  width="15%">����������</td>
	<td  width="50%">�����������</td>
	<td  width="25%">����</td>
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