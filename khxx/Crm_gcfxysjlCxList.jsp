<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ռ�¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
%>

<body bgcolor="#FFFFFF">
<div align="center">���ռ�¼(�ͻ���ţ�<%=khbh%>��</div>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">���ռ�¼��</td>
	<td  width="5%">��Ƭ��</td>
	<td  width="24%">������Ŀ</td>
	<td  width="8%">����ʱ��</td>
	<td  width="6%">������</td>
	<td  width="6%">���ս��</td>
	<td  width="6%">��������</td>
	<td  width="26%">����˵��</td>
	<td  width="6%">�ͻ�ǩ��</td>
	<td  width="6%">ǩ����Ȩ</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT crm_gcfxysjl.ysjlh,zpsl,gcysxmmc,crm_gcfxysjl.yssj,crm_gcfxysjl.ysr,DECODE(crm_gcfxysjl.ysjg,'1','�ϸ�','2','���ϸ�'),DECODE(crm_gcfxysjl.sffszg,'1','��','2','��'),yssm,DECODE(crm_gcfxysjl.sfkhbrqz,'Y','��','N','��'), DECODE(crm_gcfxysjl.dqzysq,'Y','��','N','����Ȩ') ";
	ls_sql+=" FROM crm_gcfxysjl  ";
    ls_sql+=" where crm_gcfxysjl.khbh='"+khbh+"'  ";
	ls_sql+=" order by crm_gcfxysjl.ysjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ysjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/gcgl/gcjdgz/fxys/ViewCrm_gcfxysjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ysjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>
</html>

