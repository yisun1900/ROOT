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
	String zbjjsyybm=null;
	String zbjjsyymc=null;
	zbjjsyybm=request.getParameter("zbjjsyybm");
	if (zbjjsyybm!=null)
	{
		zbjjsyybm=cf.GB2Uni(zbjjsyybm);
		if (!(zbjjsyybm.equals("")))	wheresql+=" and  (zbjjsyybm='"+zbjjsyybm+"')";
	}
	zbjjsyymc=request.getParameter("zbjjsyymc");
	if (zbjjsyymc!=null)
	{
		zbjjsyymc=cf.GB2Uni(zbjjsyymc);
		if (!(zbjjsyymc.equals("")))	wheresql+=" and  (zbjjsyymc='"+zbjjsyymc+"')";
	}
	ls_sql="SELECT zbjjsyybm,zbjjsyymc  ";
	ls_sql+=" FROM dm_zbjjsyybm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by zbjjsyybm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_zbjjsyybmList.jsp","SelectDm_zbjjsyybm.jsp","","EditDm_zbjjsyybm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zbjjsyybm","zbjjsyymc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zbjjsyybm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_zbjjsyybmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] zbjjsyybm = request.getParameterValues("zbjjsyybm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zbjjsyybm,"zbjjsyybm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_zbjjsyybm where "+chooseitem;
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
	<td  width="24%">�ʱ������ԭ�����</td>
	<td  width="64%">�ʱ������ԭ������</td>
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