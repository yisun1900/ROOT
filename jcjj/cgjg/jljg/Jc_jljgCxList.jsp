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
	String jc_jljg_jlbm=null;
	String jc_jljg_jg=null;
	jc_jljg_jlbm=request.getParameter("jc_jljg_jlbm");
	if (jc_jljg_jlbm!=null)
	{
		jc_jljg_jlbm=cf.GB2Uni(jc_jljg_jlbm);
		if (!(jc_jljg_jlbm.equals("")))	wheresql+=" and  (jc_jljg.jlbm='"+jc_jljg_jlbm+"')";
	}
	jc_jljg_jg=request.getParameter("jc_jljg_jg");
	if (jc_jljg_jg!=null)
	{
		jc_jljg_jg=jc_jljg_jg.trim();
		if (!(jc_jljg_jg.equals("")))	wheresql+=" and  (jc_jljg.jg="+jc_jljg_jg+") ";
	}
	ls_sql="SELECT jc_jljg.jlbm,jdm_jlbm.jlmc,jc_jljg.jg  ";
	ls_sql+=" FROM jdm_jlbm,jc_jljg  ";
    ls_sql+=" where jc_jljg.jlbm=jdm_jlbm.jlbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_jljgCxList.jsp","SelectCxJc_jljg.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jlbm","jdm_jlbm_jlmc","jc_jljg_jg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jlbm"};
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