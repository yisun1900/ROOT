<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT jc_cgdqfcdmx.ddbh,jc_cgdqfcdmx.dqbm,jc_cgdqbj.dqmc as jc_cgdqbj_dqmc,xh,cptz,TO_CHAR(jc_cgdqfcdmx.dj) as jc_cgdqfcdmx_dj,jc_cgdqfcdmx.sl as jc_cgdqfcdmx_sl,jc_cgdqfcdmx.je as jc_cgdqfcdmx_je,jc_cgdqfcdmx.bz as jc_cgdqfcdmx_bz ";
	ls_sql+=" FROM jc_cgdqbj,jc_cgdqfcdmx  ";
    ls_sql+=" where jc_cgdqfcdmx.dqbm=jc_cgdqbj.dqbm";
    ls_sql+=" and jc_cgdqfcdmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cgdqfcdmxList.jsp?ddbh="+ddbh,"","","EditJc_cgdqfcdmx.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jc_cgdqbj_dqmc","xh","cptz","jc_cgdqfcdmx_dj","jc_cgdqfcdmx_sl","jc_cgdqfcdmx_je","jc_cgdqfcdmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"ddbh","dqbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_cgdqfcdmxList.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_cgdqfcdmx where "+chooseitem;

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
  <B><font size="3">�������ⵥ��ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">��������</td>
	<td  width="10%">�ͺ�</td>
	<td  width="32%">��Ʒ����</td>
	<td  width="6%">����</td>
	<td  width="6%">����</td>
	<td  width="10%">���</td>
	<td  width="16%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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