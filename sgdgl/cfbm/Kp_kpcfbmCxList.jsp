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
	String kpcfbm=null;
	String kpcfmc=null;
	kpcfbm=request.getParameter("kpcfbm");
	if (kpcfbm!=null)
	{
		kpcfbm=cf.GB2Uni(kpcfbm);
		if (!(kpcfbm.equals("")))	wheresql+=" and  (kpcfbm='"+kpcfbm+"')";
	}
	kpcfmc=request.getParameter("kpcfmc");
	if (kpcfmc!=null)
	{
		kpcfmc=cf.GB2Uni(kpcfmc);
		if (!(kpcfmc.equals("")))	wheresql+=" and  (kpcfmc='"+kpcfmc+"')";
	}
	ls_sql="SELECT kpcfbm,kpcfmc  ";
	ls_sql+=" FROM kp_kpcfbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by kpcfbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_kpcfbmCxList.jsp","SelectCxKp_kpcfbm.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kpcfbm","kpcfmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kpcfbm"};
	pageObj.setKey(keyName);
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
	<td  width="20%">Υ�洦������</td>
	<td  width="50%">Υ�洦������</td>
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