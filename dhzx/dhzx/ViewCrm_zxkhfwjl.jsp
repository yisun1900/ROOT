<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT crm_zxkhfwjl.lrsj,crm_zxkhfwjl.lrr,DECODE(crm_zxkhfwjl.czlx,'1','�ܲ��ͻ�¼��','2','�ֹ�˾�ͻ�¼��','3','����ͻ�¼��','4','����ֹ�˾','5','�������','6','������','7','�������ʦ','8','�����ʦ','9','���ʦ��ѯ','A','��ط�ʱ��','B','�ͻ��ط�','C','ǩ���Ǽ�','D','ʧ�ܵǼ�'), DECODE(crm_zxkhfwjl.xzxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��'),crm_zxkhfwjl.khbh,a.dwmc ssfgs,b.dwmc zxdm,crm_zxkhfwjl.sjs,d.dwmc yzxdm,crm_zxkhfwjl.ysjs,dm_sbyybm.sbyymc,crm_zxkhfwjl.sbyyxs,c.dwmc lrbm,crm_zxkhfwjl.khfwjlh  ";
	ls_sql+=" FROM crm_zxkhfwjl,dm_sbyybm,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d ";
    ls_sql+=" where crm_zxkhfwjl.ssfgs=a.dwbh(+) and crm_zxkhfwjl.zxdm=b.dwbh(+) and crm_zxkhfwjl.lrbm=c.dwbh(+) and crm_zxkhfwjl.yzxdm=d.dwbh(+)";
    ls_sql+=" and crm_zxkhfwjl.sbyybm=dm_sbyybm.sbyybm(+) and  crm_zxkhfwjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_zxkhfwjl.khfwjlh";
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
  <B><font size="3">��ѯ�ͻ������¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">¼��ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="7%">��������</td>
	<td  width="7%">����ѯ״̬</td>
	<td  width="5%">�ͻ����</td>
	<td  width="8%">�����ֹ�˾</td>
	<td  width="8%">����ѯ����</td>
	<td  width="4%">�����ʦ</td>
	<td  width="8%">ԭ��ѯ����</td>
	<td  width="4%">ԭ���ʦ</td>
	<td  width="9%">ʧ��ԭ��</td>
	<td  width="16%">���˵��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="6%">�ͻ������¼��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>