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
	String cldlbm=null;
	String cldlmc=null;
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (cldlbm='"+cldlbm+"')";
	}
	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cldlmc='"+cldlmc+"')";
	}
	ls_sql="SELECT cldlbm,cldlmc,qybfb||'%'  ";
	ls_sql+=" FROM cl_cldlbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by cldlbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cl_cldlbmList.jsp","","","EditCl_cldlbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"clbm","clmc","clgg","lrjsfs","lrbfb","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cldlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cl_cldlbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

////�����г�������
//	Hashtable coluParmHash=new Hashtable();
//	ColuParm coluParm=null;
//
//	coluParm=new ColuParm();//����һ���в�������
//	String[] coluKey={"clbm"};//�����в�����coluParm.key������
//	coluParm.key=coluKey;//�����в�����coluParm.key������
//	coluParm.link="ViewCl_clbm.jsp?";//Ϊ�в�����coluParm.link���ó�������
//	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
//	coluParmHash.put("clbm",coluParm);//�в����������Hash��
//	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] cldlbm = request.getParameterValues("cldlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cldlbm,"cldlbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cl_cldlbm where "+chooseitem;
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
	<td  width="13%">&nbsp;</td>
	<td  width="20%">���ϴ������</td>
	<td  width="40%">���ϴ�������</td>
	<td  width="20%">ǩԼ��ٷֱ�</td>
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