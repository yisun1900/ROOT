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
	String dm_rcjcxm_xmbm=null;
	String dm_rcjcxm_xmmc=null;
	String dm_rcjcxm_rcjcdlbm=null;
	String dm_rcjcxm_jcnr=null;
	String dm_rcjcxm_rcjclxbm=null;
	dm_rcjcxm_xmbm=request.getParameter("dm_rcjcxm_xmbm");
	if (dm_rcjcxm_xmbm!=null)
	{
		dm_rcjcxm_xmbm=cf.GB2Uni(dm_rcjcxm_xmbm);
		if (!(dm_rcjcxm_xmbm.equals("")))	wheresql+=" and  (dm_rcjcxm.xmbm='"+dm_rcjcxm_xmbm+"')";
	}
	dm_rcjcxm_xmmc=request.getParameter("dm_rcjcxm_xmmc");
	if (dm_rcjcxm_xmmc!=null)
	{
		dm_rcjcxm_xmmc=cf.GB2Uni(dm_rcjcxm_xmmc);
		if (!(dm_rcjcxm_xmmc.equals("")))	wheresql+=" and  (dm_rcjcxm.xmmc='"+dm_rcjcxm_xmmc+"')";
	}
	dm_rcjcxm_rcjcdlbm=request.getParameter("dm_rcjcxm_rcjcdlbm");
	if (dm_rcjcxm_rcjcdlbm!=null)
	{
		dm_rcjcxm_rcjcdlbm=cf.GB2Uni(dm_rcjcxm_rcjcdlbm);
		if (!(dm_rcjcxm_rcjcdlbm.equals("")))	wheresql+=" and  (dm_rcjcxm.rcjcdlbm='"+dm_rcjcxm_rcjcdlbm+"')";
	}
	dm_rcjcxm_jcnr=request.getParameter("dm_rcjcxm_jcnr");
	if (dm_rcjcxm_jcnr!=null)
	{
		dm_rcjcxm_jcnr=cf.GB2Uni(dm_rcjcxm_jcnr);
		if (!(dm_rcjcxm_jcnr.equals("")))	wheresql+=" and  (dm_rcjcxm.jcnr='"+dm_rcjcxm_jcnr+"')";
	}
	dm_rcjcxm_rcjclxbm=request.getParameter("dm_rcjcxm_rcjclxbm");
	if (dm_rcjcxm_rcjclxbm!=null)
	{
		dm_rcjcxm_rcjclxbm=cf.GB2Uni(dm_rcjcxm_rcjclxbm);
		if (!(dm_rcjcxm_rcjclxbm.equals("")))	wheresql+=" and  (dm_rcjcxm.rcjclxbm='"+dm_rcjcxm_rcjclxbm+"')";
	}
	ls_sql="SELECT rcjclxmc,rcjcdlmc,dm_rcjcxm.xmbm,dm_rcjcxm.xmmc,dm_rcjcxm.jcnr  ";
	ls_sql+=" FROM dm_rcjclxbm,dm_rcjcdlbm,dm_rcjcxm  ";
    ls_sql+=" where dm_rcjcxm.rcjclxbm=dm_rcjclxbm.rcjclxbm and dm_rcjcxm.rcjcdlbm=dm_rcjcdlbm.rcjcdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_rcjcxm.rcjclxbm,dm_rcjcxm.rcjcdlbm,dm_rcjcxm.xmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_rcjcxmList.jsp","","","EditDm_rcjcxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xmbm","dm_rcjcxm_xmmc","dm_rcjcdlbm_rcjcdlmc","dm_rcjcxm_jcnr","dm_rcjclxbm_rcjclxmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_rcjcxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("rcjclxmc","1");//�в����������Hash��
	spanColHash.put("rcjcdlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xmbm = request.getParameterValues("xmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmbm,"xmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_rcjcxm where "+chooseitem;
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
  <B><font size="3">�ճ������Ŀ��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="10%">�ճ��������</td>
	<td  width="12%">�ճ�������</td>
	<td  width="8%">��Ŀ����</td>
	<td  width="30%">��Ŀ����</td>
	<td  width="34%">�������</td>
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