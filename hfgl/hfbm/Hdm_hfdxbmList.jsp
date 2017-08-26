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
	String hfdxbm=null;
	String hfdxmc=null;
	String hfdxflbm=null;
	String xh=null;
	hfdxbm=request.getParameter("hfdxbm");
	if (hfdxbm!=null)
	{
		hfdxbm=cf.GB2Uni(hfdxbm);
		if (!(hfdxbm.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxbm='"+hfdxbm+"')";
	}
	hfdxmc=request.getParameter("hfdxmc");
	if (hfdxmc!=null)
	{
		hfdxmc=cf.GB2Uni(hfdxmc);
		if (!(hfdxmc.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxmc='"+hfdxmc+"')";
	}
	hfdxflbm=request.getParameter("hfdxflbm");
	if (hfdxflbm!=null)
	{
		hfdxflbm=cf.GB2Uni(hfdxflbm);
		if (!(hfdxflbm.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxflbm='"+hfdxflbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ls_sql="SELECT hdm_hfdxbm.xh,hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc,hfdxflmc  ";
	ls_sql+=" FROM hdm_hfdxbm,hdm_hfdxflbm  ";
    ls_sql+=" where hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm(+)  ";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_hfdxbm.hfdxflbm,hdm_hfdxbm.hfdxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hdm_hfdxbmList.jsp","","","EditHdm_hfdxbm.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hfdxbm","hfdxmc","hfdxflbm","hflxbm","xh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hfdxbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Hdm_hfdxbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfdxflmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] hfdxbm = request.getParameterValues("hfdxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hfdxbm,"hfdxbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from hdm_hfdxbm where "+chooseitem;
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
  <B><font size="3">�طö��󣭣�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">���</td>
	<td  width="12%">�طö������</td>
	<td  width="42%">�طö�������</td>
	<td  width="32%">�طö������</td>
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