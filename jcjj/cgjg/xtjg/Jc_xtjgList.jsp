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
	String jc_xtjg_xtbm=null;
	String jc_xtjg_jg=null;
	jc_xtjg_xtbm=request.getParameter("jc_xtjg_xtbm");
	if (jc_xtjg_xtbm!=null)
	{
		jc_xtjg_xtbm=cf.GB2Uni(jc_xtjg_xtbm);
		if (!(jc_xtjg_xtbm.equals("")))	wheresql+=" and  (jc_xtjg.xtbm='"+jc_xtjg_xtbm+"')";
	}
	jc_xtjg_jg=request.getParameter("jc_xtjg_jg");
	if (jc_xtjg_jg!=null)
	{
		jc_xtjg_jg=jc_xtjg_jg.trim();
		if (!(jc_xtjg_jg.equals("")))	wheresql+=" and  (jc_xtjg.jg="+jc_xtjg_jg+") ";
	}
	ls_sql="SELECT jc_xtjg.xtbm,jdm_xtbm.xtmc,jc_xtjg.jg  ";
	ls_sql+=" FROM jdm_xtbm,jc_xtjg  ";
    ls_sql+=" where jc_xtjg.xtbm=jdm_xtbm.xtbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_xtjgList.jsp","SelectJc_xtjg.jsp","","EditJc_xtjg.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xtbm","jdm_xtbm_xtmc","jc_xtjg_jg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xtbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_xtjgList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xtbm = request.getParameterValues("xtbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xtbm,"xtbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_xtjg where "+chooseitem;
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