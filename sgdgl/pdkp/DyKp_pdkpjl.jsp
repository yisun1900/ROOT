<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String kpjlh=request.getParameter("kpjlh");
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ�����ɵ�������ӡ��������¼�ţ�<%=kpjlh%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="3.5%"><b>��������</b></td>
    <td rowspan="2" width="3.5%"><b>���ڵ÷�</b></td>
    <td rowspan="2" width="4.5%"><b>ʩ����</b></td>
    <td rowspan="2" width="3.5%"><b>�ʱ���</b></td>
    <td rowspan="2" width="3.5%"><b>������</b></td>
    <td rowspan="2" width="3.5%"><b>����</b></td>
    <td rowspan="2" width="3.5%">�ӵ�Ȩ��</td>
    <td colspan="3" ><b>�ӵ�����</b></td>
    <td rowspan="2" width="3.5%">�۵�����</td>
    <td colspan="3" ><b>�����ɵ�</b></td>
    <td colspan="3" ><b>����ʣ��</b></td>
    <td colspan="3" ><b>�����ɵ�����</b></td>
    <td colspan="4" ><b>���ڽӵ��ܼ�</b></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="3.5%">��</td>
    <td  width="3.5%">�е�</td>
    <td  width="3.5%">С��</td>
    <td  width="4.5%"><b>��</b></td>
    <td  width="4.5%"><b>�е�</b></td>
    <td  width="4.5%"><b>С��</b></td>
    <td  width="4.5%"><b>��</b></td>
    <td  width="4.5%"><b>�е�</b></td>
    <td  width="4.5%"><b>С��</b></td>
    <td  width="4.5%"><b>��</b></td>
    <td  width="4.5%"><b>�е�</b></td>
    <td  width="4.5%"><b>С��</b></td>
    <td  width="4.5%"><b>�ܶ�</b></td>
    <td  width="4.5%"><b>��</b></td>
    <td  width="4.5%"><b>�е�</b></td>
    <td  width="4.5%"><b>С��</b></td>
  </tr>
  <%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT kp_pdkpmx.bqpm,TO_CHAR(kp_pdkpmx.bqdf),sq_sgd.sgdmc,kp_pdkpmx.zbj,kp_pdkpmx.bzs,sgdjbmc,TO_CHAR(kp_pdkpmx.jdqz),kp_pdkpmx.ddbl||'%',kp_pdkpmx.zdbl||'%',kp_pdkpmx.xdbl||'%',kp_pdkpmx.kcjdebfb||'%',kp_pdkpmx.ddje,kp_pdkpmx.zdje,kp_pdkpmx.xdje,kp_pdkpmx.sqsydde,kp_pdkpmx.sqsyzde,kp_pdkpmx.sqsyxde,kp_pdkpmx.sqpdbcdde,kp_pdkpmx.sqpdbczde,kp_pdkpmx.sqpdbcxde,kp_pdkpmx.bqjdze,kp_pdkpmx.bqdde,kp_pdkpmx.bqzde,kp_pdkpmx.bqxde";
	ls_sql+=" FROM sq_sgd,kp_pdkpmx,sq_sgdjbbm  ";
    ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=" and kp_pdkpmx.kpjlh='"+kpjlh+"' and kp_pdkpmx.sgdlx='S0'";
    ls_sql+=" order by kp_pdkpmx.kpjlh,kp_pdkpmx.sgdlx,kp_pdkpmx.bqpm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="3.5%"><b>��������</b></td>
    <td rowspan="2" width="3.5%"><b>���ڵ÷�</b></td>
    <td rowspan="2" width="4.5%"><b>ʩ����</b></td>
    <td rowspan="2" width="3.5%"><b>�ʱ���</b></td>
    <td rowspan="2" width="3.5%"><b>������</b></td>
    <td rowspan="2" width="3.5%"><b>����</b></td>
    <td rowspan="2" width="3.5%">�ӵ�Ȩ��</td>
    <td colspan="3" ><b>�ӵ�����</b></td>
    <td rowspan="2" width="3.5%">�۵�����</td>
    <td colspan="3" ><b>�����ɵ�</b></td>
    <td colspan="3" ><b>����ʣ��</b></td>
    <td colspan="3" ><b>�����ɵ�����</b></td>
    <td colspan="4" ><b>���ڽӵ��ܼ�</b></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="3.5%">��</td>
    <td  width="3.5%">�е�</td>
    <td  width="3.5%">С��</td>
    <td  width="4.5%"><b>��</b></td>
    <td  width="4.5%"><b>�е�</b></td>
    <td  width="4.5%"><b>С��</b></td>
    <td  width="4.5%"><b>��</b></td>
    <td  width="4.5%"><b>�е�</b></td>
    <td  width="4.5%"><b>С��</b></td>
    <td  width="4.5%"><b>��</b></td>
    <td  width="4.5%"><b>�е�</b></td>
    <td  width="4.5%"><b>С��</b></td>
    <td  width="4.5%"><b>�ܶ�</b></td>
    <td  width="4.5%"><b>��</b></td>
    <td  width="4.5%"><b>�е�</b></td>
    <td  width="4.5%"><b>С��</b></td>
  </tr>
  <%
	ls_sql="SELECT kp_pdkpmx.bqpm,TO_CHAR(kp_pdkpmx.bqdf),sq_sgd.sgdmc,kp_pdkpmx.zbj,kp_pdkpmx.bzs,sgdjbmc,TO_CHAR(kp_pdkpmx.jdqz),kp_pdkpmx.ddbl||'%',kp_pdkpmx.zdbl||'%',kp_pdkpmx.xdbl||'%',kp_pdkpmx.kcjdebfb||'%',kp_pdkpmx.ddje,kp_pdkpmx.zdje,kp_pdkpmx.xdje,kp_pdkpmx.sqsydde,kp_pdkpmx.sqsyzde,kp_pdkpmx.sqsyxde,kp_pdkpmx.sqpdbcdde,kp_pdkpmx.sqpdbczde,kp_pdkpmx.sqpdbcxde,kp_pdkpmx.bqjdze,kp_pdkpmx.bqdde,kp_pdkpmx.bqzde,kp_pdkpmx.bqxde";
	ls_sql+=" FROM sq_sgd,kp_pdkpmx,sq_sgdjbbm  ";
    ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=" and kp_pdkpmx.kpjlh='"+kpjlh+"' and kp_pdkpmx.sgdlx='S1'";
    ls_sql+=" order by kp_pdkpmx.kpjlh,kp_pdkpmx.sgdlx,kp_pdkpmx.bqpm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

</body>
</html>