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
	String dm_bbjb_gcysbbh=null;
	String dm_bbjb_bjjbbm=null;
	String dm_bjjbbm_bjjbmc=null;
	dm_bbjb_gcysbbh=request.getParameter("dm_bbjb_gcysbbh");
	if (dm_bbjb_gcysbbh!=null)
	{
		dm_bbjb_gcysbbh=cf.GB2Uni(dm_bbjb_gcysbbh);
		if (!(dm_bbjb_gcysbbh.equals("")))	wheresql+=" and  (dm_bbjb.gcysbbh='"+dm_bbjb_gcysbbh+"')";
	}
	dm_bbjb_bjjbbm=request.getParameter("dm_bbjb_bjjbbm");
	if (dm_bbjb_bjjbbm!=null)
	{
		dm_bbjb_bjjbbm=cf.GB2Uni(dm_bbjb_bjjbbm);
		if (!(dm_bbjb_bjjbbm.equals("")))	wheresql+=" and  (dm_bbjb.bjjbbm='"+dm_bbjb_bjjbbm+"')";
	}
	dm_bjjbbm_bjjbmc=request.getParameter("dm_bjjbbm_bjjbmc");
	if (dm_bjjbbm_bjjbmc!=null)
	{
		dm_bjjbbm_bjjbmc=cf.GB2Uni(dm_bjjbbm_bjjbmc);
		if (!(dm_bjjbbm_bjjbmc.equals("")))	wheresql+=" and  (dm_bjjbbm.bjjbmc='"+dm_bjjbbm_bjjbmc+"')";
	}

	ls_sql="SELECT dm_bbjb.gcysbbh,gcysbbmc,dm_bbjb.bjjbbm,bdm_bjjbbm.bjjbmc  ";
	ls_sql+=" FROM dm_bbjb,bdm_bjjbbm,dm_hegcysbb  ";
    ls_sql+=" where dm_bbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and dm_bbjb.gcysbbh=dm_hegcysbb.gcysbbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_bbjb.gcysbbh,dm_bbjb.bjjbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_bbjbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gcysbbh","bjjbbm","dm_bjjbbm_bjjbmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gcysbbh","bjjbbm"};
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
	<td  width="12%">���հ汾��</td>
	<td  width="29%">���հ汾����</td>
	<td  width="12%">���ۼ������</td>
	<td  width="29%">������������</td>
</tr>
<%
	pageObj.printDate();
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