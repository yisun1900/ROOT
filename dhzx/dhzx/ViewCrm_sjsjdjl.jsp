<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT crm_sjsjdjl.sjsjdjlh,DECODE(crm_sjsjdjl.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��'),crm_sjsjdjl.khbh,a.dwmc ssfgs,b.dwmc zxdm,crm_sjsjdjl.sjs,kssj,kslrr,jssj,jslrr,dm_sbyybm.sbyymc,crm_sjsjdjl.sbyyxs";
	ls_sql+=" FROM crm_sjsjdjl,dm_sbyybm,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where crm_sjsjdjl.ssfgs=a.dwbh(+) and crm_sjsjdjl.zxdm=b.dwbh(+)";
    ls_sql+=" and crm_sjsjdjl.sbyybm=dm_sbyybm.sbyybm(+) and  crm_sjsjdjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_sjsjdjl.sjsjdjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ʦ�ӵ���¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ͻ������¼��</td>
	<td  width="7%">��ѯ״̬</td>
	<td  width="5%">�ͻ����</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="10%">��ѯ����</td>
	<td  width="5%">���ʦ</td>
	<td  width="8%">��ʼʱ��</td>
	<td  width="6%">��ʼ¼����</td>
	<td  width="8%">����ʱ��</td>
	<td  width="6%">����¼����</td>
	<td  width="10%">ʧ��ԭ��</td>
	<td  width="19%">ʧ��ԭ������</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>