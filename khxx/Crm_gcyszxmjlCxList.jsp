<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String khbh=request.getParameter("khbh");
	String gcjdbm=request.getParameter("gcjdbm");


	ls_sql="SELECT crm_khxx.khxm,crm_gcyszxmjl.ysjlh,dm_gcyszxmbm.gcyszxmmc, DECODE(crm_gcyszxmjl.gcjdbm,'3','���ι�������','4','��������'),crm_gcyszxmjl.yssj,crm_gcyszxmjl.ysr,crm_gcyszxmjl.lrr,crm_gcyszxmjl.lrsj,dwmc,crm_gcyszxmjl.bz ";
	ls_sql+=" FROM crm_gcyszxmjl,crm_khxx,dm_gcyszxmbm,sq_dwxx  ";
    ls_sql+=" where crm_gcyszxmjl.gcyszxmbm=dm_gcyszxmbm.gcyszxmbm and crm_gcyszxmjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_gcyszxmjl.lrdw=sq_dwxx.dwbh";
    ls_sql+=" and crm_gcyszxmjl.khbh='"+khbh+"' and crm_gcyszxmjl.gcjdbm='"+gcjdbm+"'";
    ls_sql+=" order by crm_gcyszxmjl.ysjlh";
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
	coluParm.link="/gcgl/gcjdgz/ViewCrm_gcyszxmjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ysjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�������ռ�¼</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ�����</td>
	<td  width="6%">���ռ�¼��</td>
	<td  width="9%">��������Ŀ</td>
	<td  width="8%">���շ���</td>
	<td  width="7%">����ʱ��</td>
	<td  width="5%">������</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="8%">¼�뵥λ</td>
	<td  width="20%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>