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
	String bdm_xmxlbm_xmxlbm=null;
	String bdm_xmxlbm_xmxlmc=null;
	String bdm_xmxlbm_xmdlbm=null;
	bdm_xmxlbm_xmxlbm=request.getParameter("bdm_xmxlbm_xmxlbm");
	if (bdm_xmxlbm_xmxlbm!=null)
	{
		bdm_xmxlbm_xmxlbm=cf.GB2Uni(bdm_xmxlbm_xmxlbm);
		if (!(bdm_xmxlbm_xmxlbm.equals("")))	wheresql+=" and  (bdm_xmxlbm.xmxlbm='"+bdm_xmxlbm_xmxlbm+"')";
	}
	bdm_xmxlbm_xmxlmc=request.getParameter("bdm_xmxlbm_xmxlmc");
	if (bdm_xmxlbm_xmxlmc!=null)
	{
		bdm_xmxlbm_xmxlmc=cf.GB2Uni(bdm_xmxlbm_xmxlmc);
		if (!(bdm_xmxlbm_xmxlmc.equals("")))	wheresql+=" and  (bdm_xmxlbm.xmxlmc='"+bdm_xmxlbm_xmxlmc+"')";
	}
	bdm_xmxlbm_xmdlbm=request.getParameter("bdm_xmxlbm_xmdlbm");
	if (bdm_xmxlbm_xmdlbm!=null)
	{
		bdm_xmxlbm_xmdlbm=cf.GB2Uni(bdm_xmxlbm_xmdlbm);
		if (!(bdm_xmxlbm_xmdlbm.equals("")))	wheresql+=" and  (bdm_xmxlbm.xmdlbm='"+bdm_xmxlbm_xmdlbm+"')";
	}
	ls_sql="SELECT xmdlmc,xmxlbm,bdm_xmxlbm.xmxlmc  ";
	ls_sql+=" FROM bdm_xmdlbm,bdm_xmxlbm  ";
    ls_sql+=" where bdm_xmxlbm.xmdlbm=bdm_xmdlbm.xmdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by bdm_xmxlbm.xmdlbm,bdm_xmxlbm.xmxlbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bdm_xmxlbmList.jsp","SelectBdm_xmxlbm.jsp","","EditBdm_xmxlbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xmxlbm","bdm_xmxlbm_xmxlmc","bdm_xmxlbm_xmdlbm","bdm_xmdlbm_xmdlmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xmxlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bdm_xmxlbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xmdlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xmxlbm = request.getParameterValues("xmxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmxlbm,"xmxlbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bdm_xmxlbm where "+chooseitem;
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
	<td  width="28%">��Ŀ��������</td>
	<td  width="12%">��ĿС�����</td>
	<td  width="42%">��ĿС������</td>
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