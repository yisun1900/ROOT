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
	String jdm_zclbbm_zclbbm=null;
	String jdm_zclbbm_zclbmc=null;
	String jdm_zclbbm_ppbm=null;
	jdm_zclbbm_zclbbm=request.getParameter("jdm_zclbbm_zclbbm");
	if (jdm_zclbbm_zclbbm!=null)
	{
		jdm_zclbbm_zclbbm=cf.GB2Uni(jdm_zclbbm_zclbbm);
		if (!(jdm_zclbbm_zclbbm.equals("")))	wheresql+=" and  (jdm_zclbbm.zclbbm='"+jdm_zclbbm_zclbbm+"')";
	}
	jdm_zclbbm_zclbmc=request.getParameter("jdm_zclbbm_zclbmc");
	if (jdm_zclbbm_zclbmc!=null)
	{
		jdm_zclbbm_zclbmc=cf.GB2Uni(jdm_zclbbm_zclbmc);
		if (!(jdm_zclbbm_zclbmc.equals("")))	wheresql+=" and  (jdm_zclbbm.zclbmc='"+jdm_zclbbm_zclbmc+"')";
	}
	jdm_zclbbm_ppbm=request.getParameter("jdm_zclbbm_ppbm");
	if (jdm_zclbbm_ppbm!=null)
	{
		jdm_zclbbm_ppbm=cf.GB2Uni(jdm_zclbbm_ppbm);
		if (!(jdm_zclbbm_ppbm.equals("")))	wheresql+=" and  (jdm_zclbbm.ppbm='"+jdm_zclbbm_ppbm+"')";
	}
	ls_sql="SELECT jdm_ppbm.ppmc,jdm_zclbbm.zclbbm,jdm_zclbbm.zclbmc ";
	ls_sql+=" FROM jdm_zclbbm,jdm_ppbm  ";
    ls_sql+=" where jdm_zclbbm.ppbm=jdm_ppbm.ppbm";
    ls_sql+=wheresql;
	ls_sql+=" order by jdm_zclbbm.ppbm,jdm_zclbbm.zclbbm ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_zclbbmList.jsp","SelectJdm_zclbbm.jsp","","EditJdm_zclbbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zclbbm","jdm_zclbbm_zclbmc","jdm_ppbm_ppmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zclbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_zclbbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ppmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] zclbbm = request.getParameterValues("zclbbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zclbbm,"zclbbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_zclbbm where "+chooseitem;
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
	<td  width="15%">Ʒ������</td>
	<td  width="19%">���ϵ�б���</td>
	<td  width="49%">���ϵ������</td>
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