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
	String kpdlbm=null;
	String kpdlmc=null;
	kpdlbm=request.getParameter("kpdlbm");
	if (kpdlbm!=null)
	{
		kpdlbm=cf.GB2Uni(kpdlbm);
		if (!(kpdlbm.equals("")))	wheresql+=" and  (kpdlbm='"+kpdlbm+"')";
	}
	kpdlmc=request.getParameter("kpdlmc");
	if (kpdlmc!=null)
	{
		kpdlmc=cf.GB2Uni(kpdlmc);
		if (!(kpdlmc.equals("")))	wheresql+=" and  (kpdlmc='"+kpdlmc+"')";
	}
	ls_sql="SELECT kpdlbm,kpdlmc  ";
	ls_sql+=" FROM kp_kpdlbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_kpdlbmCxList.jsp","SelectCxKp_kpdlbm.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kpdlbm","kpdlmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kpdlbm"};
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
	<td  width="20%">�����������</td>
	<td  width="50%">������������</td>
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