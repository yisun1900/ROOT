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

	ls_sql="SELECT TO_CHAR(jc_ddbjmx.bjxh) bjxh,TO_CHAR(jc_ddbjmx.gtxh),jc_ddbjmx.ddbh,jdm_jjbjmcbm.jjbjmc,TO_CHAR(jc_ddbjmx.bjcd),TO_CHAR(jc_ddbjmx.bjkd),jc_ddbjmx.sl,TO_CHAR(jc_ddbjmx.dj),jc_ddbjmx.je,jc_ddbjmx.bz  ";
	ls_sql+=" FROM jc_ddbjmx,jdm_jjbjmcbm  ";
    ls_sql+=" where jc_ddbjmx.jjbjmcbm=jdm_jjbjmcbm.jjbjmcbm";
    ls_sql+=" and jc_ddbjmx.gtxh="+gtxh+"";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_ddbjmxList.jsp","","","EditJc_ddbjmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"bjxh","gtxh","jc_ddbjmx_ddbh","jdm_jjbjmcbm_jjbjmc","jc_ddbjmx_bjcd","jc_ddbjmx_bjkd","jc_ddbjmx_sl","jc_ddbjmx_dj","jc_ddbjmx_je","jc_ddbjmx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bjxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_ddbjmxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] bjxh = request.getParameterValues("bjxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(bjxh,"bjxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_ddbjmx where "+chooseitem;
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
  <B><font size="3">��������ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">������</td>
	<td  width="6%">�������</td>
	<td  width="8%">�������</td>
	<td  width="12%">�������</td>
	<td  width="10%">������ȣ�mm��</td>
	<td  width="10%">�����ȣ�mm��</td>
	<td  width="6%">����</td>
	<td  width="8%">����</td>
	<td  width="10%">���</td>
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