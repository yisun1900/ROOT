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
	String jc_lsjg_lsbm=null;
	String jc_lsjg_jg=null;
	jc_lsjg_lsbm=request.getParameter("jc_lsjg_lsbm");
	if (jc_lsjg_lsbm!=null)
	{
		jc_lsjg_lsbm=cf.GB2Uni(jc_lsjg_lsbm);
		if (!(jc_lsjg_lsbm.equals("")))	wheresql+=" and  (jc_lsjg.lsbm='"+jc_lsjg_lsbm+"')";
	}
	jc_lsjg_jg=request.getParameter("jc_lsjg_jg");
	if (jc_lsjg_jg!=null)
	{
		jc_lsjg_jg=jc_lsjg_jg.trim();
		if (!(jc_lsjg_jg.equals("")))	wheresql+=" and  (jc_lsjg.jg="+jc_lsjg_jg+") ";
	}
	ls_sql="SELECT jc_lsjg.lsbm,jdm_lsbm.lsmc,jc_lsjg.jg  ";
	ls_sql+=" FROM jdm_lsbm,jc_lsjg  ";
    ls_sql+=" where jc_lsjg.lsbm=jdm_lsbm.lsbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_lsjgCxList.jsp","SelectCxJc_lsjg.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lsbm","jdm_lsbm_lsmc","jc_lsjg_jg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"lsbm"};
	pageObj.setKey(keyName);
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
	<td  width="33%">����</td>
	<td  width="33%">����</td>
	<td  width="33%">�۸�</td>
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