<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String khbh=request.getParameter("khbh");

	ls_sql="select crm_gcdagl.damxbm,dm_damxbm.damxmc,crm_khxx.khxm,bgr,sq_dwxx.dwmc,bgsj,crm_gcdagl.lrr,crm_gcdagl.lrsj  ";
	ls_sql+=" from crm_gcdagl,crm_khxx,dm_damxbm,sq_dwxx ";
    ls_sql+=" where crm_gcdagl.damxbm=dm_damxbm.damxbm(+)";
    ls_sql+=" and crm_gcdagl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_gcdagl.bgrdw=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_gcdagl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_gcdagl.damxbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("","","","EditCrm_gcdadjmx.jsp?khbh="+khbh);
//	pageObj.setPageRow(1);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","damxbm","dm_damxbm_damxmc","crm_gcdamx_lqdar","crm_gcdamx_lqdasj","crm_gcdamx_lqdasl","crm_gcdamx_lqdablr","crm_gcdamx_bxjhbz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"damxbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_gcdamx.jsp?khbh="+khbh};//��ť�������õ���ҳ���������Ӳ���
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
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����Ǽ���ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">�������</td>
	<td  width="12%">��������</td>
	<td  width="10%">�ͻ�����</td>
	<td  width="10%">������</td>
	<td  width="12%">���ܵ�λ</td>
	<td  width="13%">����ʱ��</td>
	<td  width="10%">¼����</td>
	<td  width="13%">¼��ʱ��</td>
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