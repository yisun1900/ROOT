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
	String gtxh=request.getParameter("gtxh");

	ls_sql="SELECT TO_CHAR(jc_ddpjmx.pjxh) pjxh,TO_CHAR(jc_ddpjmx.gtxh),jc_ddpjmx.ddbh,jdm_jjpjmcbm.jjpjmc,jc_ddpjmx.xinghao,TO_CHAR(jc_ddpjmx.pjcd),TO_CHAR(jc_ddpjmx.pjkd),TO_CHAR(jc_ddpjmx.pjgd),jc_ddpjmx.sl,TO_CHAR(jc_ddpjmx.dj),jc_ddpjmx.je,jc_ddpjmx.bz";
	ls_sql+=" FROM jc_ddpjmx,jdm_jjpjmcbm  ";
    ls_sql+=" where jc_ddpjmx.jjpjmcbm=jdm_jjpjmcbm.jjpjmcbm";
    ls_sql+=" and jc_ddpjmx.gtxh="+gtxh+"";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_ddpjmxList.jsp","","","EditJc_ddpjmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jc_ddpjmx_gtxh","jc_ddpjmx_ddbh","jdm_jjpjmcbm_jjpjmc","pjxh","jc_ddpjmx_pjcd","jc_ddpjmx_pjkd","jc_ddpjmx_pjgd","jc_ddpjmx_sl","jc_ddpjmx_dj","jc_ddpjmx_je","jc_ddpjmx_bz","jc_ddpjmx_xinghao"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pjxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_ddpjmxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] pjxh = request.getParameterValues("pjxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pjxh,"pjxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_ddpjmx where "+chooseitem;
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
  <B><font size="3">���������ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="5%">������</td>
	<td  width="5%">�������</td>
	<td  width="7%">�������</td>
	<td  width="11%">�������</td>
	<td  width="9%">����ͺ�</td>
	<td  width="8%">������ȣ�mm��</td>
	<td  width="8%">�����ȣ�mm��</td>
	<td  width="8%">����߶ȣ�mm��</td>
	<td  width="6%">����</td>
	<td  width="7%">����</td>
	<td  width="8%">���</td>
	<td  width="11%">��ע</td>
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