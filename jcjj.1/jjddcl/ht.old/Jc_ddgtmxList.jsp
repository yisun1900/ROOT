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
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT TO_CHAR(jc_ddgtmx.gtxh) gtxh,jc_ddgtmx.ddbh,jdm_jjlbbm.jjlbmc,jdm_jjgtmcbm.jjgtmc,TO_CHAR(jc_ddgtmx.gtcd),TO_CHAR(jc_ddgtmx.gtkd),TO_CHAR(jc_ddgtmx.gtgd),jdm_gtbcysbm.gtbcysmc,jc_ddgtmx.zj,jc_ddgtmx.bz  ";
	ls_sql+=" FROM jc_ddgtmx,jdm_gtbcysbm,jdm_jjgtmcbm,jdm_jjlbbm  ";
    ls_sql+=" where jc_ddgtmx.jjgtmcbm=jdm_jjgtmcbm.jjgtmcbm and jc_ddgtmx.jjlbbm=jdm_jjlbbm.jjlbbm and jc_ddgtmx.gtbcysbm=jdm_gtbcysbm.gtbcysbm(+)";
    ls_sql+=" and jc_ddgtmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_ddgtmxList.jsp","","","EditJc_ddgtmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gtxh","ddbh","jdm_jjlbbm_jjlbmc","jdm_jjgtmcbm_jjgtmc","jc_ddgtmx_gtcd","jc_ddgtmx_gtkd","jc_ddgtmx_gtgd","jdm_gtbcysbm_gtbcysmc","jc_ddgtmx_zj","jc_ddgtmx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gtxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_ddgtmxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] gtxh = request.getParameterValues("gtxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gtxh,"gtxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_ddgtmx where "+chooseitem;
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
  <B><font size="3">������ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">�������</td>
	<td  width="8%">�������</td>
	<td  width="12%">�Ҿ����</td>
	<td  width="11%">�Ҿ߹���</td>
	<td  width="7%">���峤��</td>
	<td  width="7%">������</td>
	<td  width="7%">����߶�</td>
	<td  width="10%">�����ɫ</td>
	<td  width="8%">�ܼ�</td>
	<td  width="16%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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