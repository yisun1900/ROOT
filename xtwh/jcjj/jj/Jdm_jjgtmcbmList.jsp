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
	String jdm_jjgtmcbm_jjgtmcbm=null;
	String jdm_jjgtmcbm_jjgtmc=null;
	String jdm_jjgtmcbm_jjlbbm=null;
	jdm_jjgtmcbm_jjgtmcbm=request.getParameter("jdm_jjgtmcbm_jjgtmcbm");
	if (jdm_jjgtmcbm_jjgtmcbm!=null)
	{
		jdm_jjgtmcbm_jjgtmcbm=cf.GB2Uni(jdm_jjgtmcbm_jjgtmcbm);
		if (!(jdm_jjgtmcbm_jjgtmcbm.equals("")))	wheresql+=" and  (jdm_jjgtmcbm.jjgtmcbm='"+jdm_jjgtmcbm_jjgtmcbm+"')";
	}
	jdm_jjgtmcbm_jjgtmc=request.getParameter("jdm_jjgtmcbm_jjgtmc");
	if (jdm_jjgtmcbm_jjgtmc!=null)
	{
		jdm_jjgtmcbm_jjgtmc=cf.GB2Uni(jdm_jjgtmcbm_jjgtmc);
		if (!(jdm_jjgtmcbm_jjgtmc.equals("")))	wheresql+=" and  (jdm_jjgtmcbm.jjgtmc='"+jdm_jjgtmcbm_jjgtmc+"')";
	}
	jdm_jjgtmcbm_jjlbbm=request.getParameter("jdm_jjgtmcbm_jjlbbm");
	if (jdm_jjgtmcbm_jjlbbm!=null)
	{
		jdm_jjgtmcbm_jjlbbm=cf.GB2Uni(jdm_jjgtmcbm_jjlbbm);
		if (!(jdm_jjgtmcbm_jjlbbm.equals("")))	wheresql+=" and  (jdm_jjgtmcbm.jjlbbm='"+jdm_jjgtmcbm_jjlbbm+"')";
	}
	ls_sql="SELECT jdm_jjgtmcbm.jjgtmcbm,jdm_jjgtmcbm.jjgtmc,jdm_jjlbbm.jjlbmc  ";
	ls_sql+=" FROM jdm_jjlbbm,jdm_jjgtmcbm  ";
    ls_sql+=" where jdm_jjgtmcbm.jjlbbm=jdm_jjlbbm.jjlbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_jjgtmcbm.jjlbbm,jjgtmcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_jjgtmcbmList.jsp","SelectJdm_jjgtmcbm.jsp","","EditJdm_jjgtmcbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jjgtmcbm","jdm_jjgtmcbm_jjgtmc","jdm_jjlbbm_jjlbmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jjgtmcbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_jjgtmcbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] jjgtmcbm = request.getParameterValues("jjgtmcbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jjgtmcbm,"jjgtmcbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_jjgtmcbm where "+chooseitem;
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
	<td  width="19%">�Ҿ߹������Ʊ���</td>
	<td  width="29%">�Ҿ߹�������</td>
	<td  width="29%">�Ҿ����</td>
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