<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String khbh=request.getParameter("khbh");



	ls_sql="SELECT crm_khxx.khxm,crm_cljcjl.ysjlh,crm_cljcjl.yssj,crm_cljcjl.ysr,crm_cljcjl.lrr,crm_cljcjl.lrsj,sq_dwxx.dwmc,crm_cljcjl.bz";
	ls_sql+=" FROM crm_cljcjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_cljcjl.lrdw=sq_dwxx.dwbh and crm_cljcjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cljcjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_cljcjl.ysjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"ysjlh"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ysjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/gcgl/gcjdgz/cljc/ViewCrm_cljcjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ysjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���Ͻ�����¼</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ�����</td>
	<td  width="5%">���ռ�¼��</td>
	<td  width="7%">����ʱ��</td>
	<td  width="5%">������</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="11%">¼�뵥λ</td>
	<td  width="21%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>