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
	String jc_ctjg_ctbm=null;
	String jc_ctjg_jg=null;
	jc_ctjg_ctbm=request.getParameter("jc_ctjg_ctbm");
	if (jc_ctjg_ctbm!=null)
	{
		jc_ctjg_ctbm=cf.GB2Uni(jc_ctjg_ctbm);
		if (!(jc_ctjg_ctbm.equals("")))	wheresql+=" and  (jc_ctjg.ctbm='"+jc_ctjg_ctbm+"')";
	}
	jc_ctjg_jg=request.getParameter("jc_ctjg_jg");
	if (jc_ctjg_jg!=null)
	{
		jc_ctjg_jg=jc_ctjg_jg.trim();
		if (!(jc_ctjg_jg.equals("")))	wheresql+=" and  (jc_ctjg.jg="+jc_ctjg_jg+") ";
	}
	ls_sql="SELECT jc_ctjg.ctbm,jdm_ctbm.ctmc,jc_ctjg.jg  ";
	ls_sql+=" FROM jdm_ctbm,jc_ctjg  ";
    ls_sql+=" where jc_ctjg.ctbm=jdm_ctbm.ctbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_ctjgList.jsp","SelectJc_ctjg.jsp","","EditJc_ctjg.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ctbm","jdm_ctbm_ctmc","jc_ctjg_jg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ctbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_ctjgList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] ctbm = request.getParameterValues("ctbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ctbm,"ctbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_ctjg where "+chooseitem;
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
	<td  width="29%">����</td>
	<td  width="29%">����</td>
	<td  width="29%">�۸�</td>
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