<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String dqbm=(String)session.getAttribute("dqbm");
%>
<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String qh_bjkgsdm_bjkgsbh=null;
	String qh_bjkgsdm_bjkgsmc=null;
	qh_bjkgsdm_bjkgsbh=request.getParameter("qh_bjkgsdm_bjkgsbh");
	if (qh_bjkgsdm_bjkgsbh!=null)
	{
		qh_bjkgsdm_bjkgsbh=cf.GB2Uni(qh_bjkgsdm_bjkgsbh);
		if (!(qh_bjkgsdm_bjkgsbh.equals("")))	wheresql+=" and  (qh_bjkgsdm.bjkgsbh='"+qh_bjkgsdm_bjkgsbh+"')";
	}
	qh_bjkgsdm_bjkgsmc=request.getParameter("qh_bjkgsdm_bjkgsmc");
	if (qh_bjkgsdm_bjkgsmc!=null)
	{
		qh_bjkgsdm_bjkgsmc=cf.GB2Uni(qh_bjkgsdm_bjkgsmc);
		if (!(qh_bjkgsdm_bjkgsmc.equals("")))	wheresql+=" and  (qh_bjkgsdm.bjkgsmc='"+qh_bjkgsdm_bjkgsmc+"')";
	}
	ls_sql="SELECT qh_bjkgsdm.bjkgsbh as bjkgsbh,qh_bjkgsdm.bjkgsmc as qh_bjkgsdm_bjkgsmc,dm_dqbm.dqmc ";
	ls_sql+=" FROM qh_bjkgsdm ,dm_dqbm ";
    ls_sql+=" where qh_bjkgsdm.dqbm=dm_dqbm.dqbm and (dm_dqbm.dqbm='"+dqbm+"')";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditQh_bjkgsdm.jsp");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"bjkgsbh","qh_bjkgsdm_bjkgsmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bjkgsbh"};
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
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="20%">����ع�˾���</td>
	<td  width="30%">����ع�˾����</td>
	<td  width="20%">����</td>
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