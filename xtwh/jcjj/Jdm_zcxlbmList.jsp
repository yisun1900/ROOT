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
	String zcxlbm=null;
	String zcxlmc=null;
	String zcdlmc=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jdm_zcxlbm.zcxlbm='"+zcxlbm+"')";
	}
	zcxlmc=request.getParameter("zcxlmc");
	if (zcxlmc!=null)
	{
		zcxlmc=cf.GB2Uni(zcxlmc);
		if (!(zcxlmc.equals("")))	wheresql+=" and  (jdm_zcxlbm.zcxlmc='"+zcxlmc+"')";
	}
	zcdlmc=request.getParameter("zcdlmc");
	if (zcdlmc!=null)
	{
		zcdlmc=cf.GB2Uni(zcdlmc);
		if (!(zcdlmc.equals("")))	wheresql+=" and  (jdm_zcxlbm.zcdlmc='"+zcdlmc+"')";
	}
	ls_sql="SELECT zcxlbm,zcxlmc,jdm_zcdlbm.zcdlbm,jdm_zcxlbm.zcdlmc  ";
	ls_sql+=" FROM jdm_zcxlbm,jdm_zcdlbm  ";
    ls_sql+=" where jdm_zcxlbm.zcdlmc=jdm_zcdlbm.zcdlmc(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by zcxlbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_zcxlbmList.jsp","SelectJdm_zcxlbm.jsp","","EditJdm_zcxlbm.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zcxlbm","zcxlmc","zcdlmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zcxlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_zcxlbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zcdlbm","1");//�в����������Hash��
	spanColHash.put("zcdlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] zcxlbm = request.getParameterValues("zcxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zcxlbm,"zcxlbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_zcxlbm where "+chooseitem;
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
	<td  width="12%">����С�����</td>
	<td  width="33%">����С������</td>
	<td  width="12%">�������</td>
	<td  width="33%">����</td>
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