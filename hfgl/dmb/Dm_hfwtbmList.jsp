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
	String dm_hfwtbm_hfwtbm=null;
	String dm_hfwtbm_hfwtmc=null;
	String dm_hfwtbm_hflxbm=null;

	dm_hfwtbm_hfwtbm=request.getParameter("dm_hfwtbm_hfwtbm");
	if (dm_hfwtbm_hfwtbm!=null)
	{
		dm_hfwtbm_hfwtbm=cf.GB2Uni(dm_hfwtbm_hfwtbm);
		if (!(dm_hfwtbm_hfwtbm.equals("")))	wheresql+=" and  (dm_hfwtbm.hfwtbm='"+dm_hfwtbm_hfwtbm+"')";
	}
	dm_hfwtbm_hfwtmc=request.getParameter("dm_hfwtbm_hfwtmc");
	if (dm_hfwtbm_hfwtmc!=null)
	{
		dm_hfwtbm_hfwtmc=cf.GB2Uni(dm_hfwtbm_hfwtmc);
		if (!(dm_hfwtbm_hfwtmc.equals("")))	wheresql+=" and  (dm_hfwtbm.hfwtmc='"+dm_hfwtbm_hfwtmc+"')";
	}
	dm_hfwtbm_hflxbm=request.getParameter("dm_hfwtbm_hflxbm");
	if (dm_hfwtbm_hflxbm!=null)
	{
		dm_hfwtbm_hflxbm=cf.GB2Uni(dm_hfwtbm_hflxbm);
		if (!(dm_hfwtbm_hflxbm.equals("")))	wheresql+=" and  (dm_hfwtbm.hflxbm='"+dm_hfwtbm_hflxbm+"')";
	}

	ls_sql="SELECT dm_hfwtbm.hfwtbm,dm_hfwtbm.hfwtmc,dm_hflxbm.hflxmc";
	ls_sql+=" FROM dm_hflxbm,dm_hfwtbm  ";
    ls_sql+=" where dm_hfwtbm.hflxbm=dm_hflxbm.hflxbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_hfwtbm.hflxbm,dm_hfwtbm.hfwtbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_hfwtbmList.jsp","","","EditDm_hfwtbm.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"hfwtbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_hfwtbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//�в����������Hash��

	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] hfwtbm = request.getParameterValues("hfwtbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hfwtbm,"hfwtbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_hfwtbm where "+chooseitem;
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
	<td  width="20%">�ط��������</td>
	<td  width="32%">�ط���������</td>
	<td  width="32%">�ط���������</td>
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