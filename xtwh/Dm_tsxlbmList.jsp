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
	String dm_tsxlbm_tsxlbm=null;
	String dm_tsxlbm_tsxlmc=null;
	String dm_tsxlbm_tslxbm=null;
	String dm_tsxlbm_px=null;
	dm_tsxlbm_tsxlbm=request.getParameter("dm_tsxlbm_tsxlbm");
	if (dm_tsxlbm_tsxlbm!=null)
	{
		dm_tsxlbm_tsxlbm=cf.GB2Uni(dm_tsxlbm_tsxlbm);
		if (!(dm_tsxlbm_tsxlbm.equals("")))	wheresql+=" and  (dm_tsxlbm.tsxlbm='"+dm_tsxlbm_tsxlbm+"')";
	}
	dm_tsxlbm_tsxlmc=request.getParameter("dm_tsxlbm_tsxlmc");
	if (dm_tsxlbm_tsxlmc!=null)
	{
		dm_tsxlbm_tsxlmc=cf.GB2Uni(dm_tsxlbm_tsxlmc);
		if (!(dm_tsxlbm_tsxlmc.equals("")))	wheresql+=" and  (dm_tsxlbm.tsxlmc='"+dm_tsxlbm_tsxlmc+"')";
	}
	dm_tsxlbm_tslxbm=request.getParameter("dm_tsxlbm_tslxbm");
	if (dm_tsxlbm_tslxbm!=null)
	{
		dm_tsxlbm_tslxbm=cf.GB2Uni(dm_tsxlbm_tslxbm);
		if (!(dm_tsxlbm_tslxbm.equals("")))	wheresql+=" and  (dm_tsxlbm.tslxbm='"+dm_tsxlbm_tslxbm+"')";
	}
	dm_tsxlbm_px=request.getParameter("dm_tsxlbm_px");
	if (dm_tsxlbm_px!=null)
	{
		dm_tsxlbm_px=dm_tsxlbm_px.trim();
		if (!(dm_tsxlbm_px.equals("")))	wheresql+=" and (dm_tsxlbm.px="+dm_tsxlbm_px+") ";
	}
	ls_sql="SELECT dm_tsxlbm.tsxlbm,dm_tsxlbm.tsxlmc,dm_tslxbm.tslxmc,dm_tsxlbm.px  ";
	ls_sql+=" FROM dm_tslxbm,dm_tsxlbm  ";
    ls_sql+=" where dm_tsxlbm.tslxbm=dm_tslxbm.tslxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_tsxlbm.tslxbm,dm_tsxlbm.tsxlbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_tsxlbmList.jsp","SelectDm_tsxlbm.jsp","","EditDm_tsxlbm.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"tsxlbm","dm_tsxlbm_tsxlmc","dm_tslxbm_tslxmc","dm_tsxlbm_px"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tsxlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_tsxlbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tslxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] tsxlbm = request.getParameterValues("tsxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tsxlbm,"tsxlbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_tsxlbm where "+chooseitem;
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
	<td  width="17%">Ͷ�߱���С�����</td>
	<td  width="35%">Ͷ�߱���С������</td>
	<td  width="25%">Ͷ�߱��޴���</td>
	<td  width="13%">����</td>
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