<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String khbh=request.getParameter("khbh");


	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs";
	ls_sql+=" ,crm_khxx.sjs,sgdmc sgd,crm_khxx.kgrq,crm_khxx.zjxm,crm_khxx.qye,crm_khxx.qyrq";
	ls_sql+=" ,crm_khxx.sjkgrq,a.dwmc sbdm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a ,sq_sgd";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)) and zt='2'";
	ls_sql+=" and zjxm=(select zjxm from crm_khxx where khbh='"+khbh+"')";
	ls_sql+=" and kgrq=(select kgrq from crm_khxx where khbh='"+khbh+"')";
	ls_sql+=" order by crm_khxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000000);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >���쿪���Ŀͻ��б�</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ����</td>
	<td  width="6%">����</td>
	<td  width="20%">���ݵ�ַ</td>
	<td  width="10%">��ϵ��ʽ</td>
	<td  width="6%">���ʦ</td>
	<td  width="6%">ʩ����</td>
	<td  width="9%">Ӧ��������</td>
	<td  width="6%">���̵���</td>
	<td  width="7%">ǩԼ��</td>
	<td  width="9%">ǩԼ����</td>
	<td  width="9%">ʵ��������</td>
	<td  width="7%">ǩԼ����</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>