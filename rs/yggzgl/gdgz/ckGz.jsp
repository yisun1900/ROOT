<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xh=null;
	xh=request.getParameter("xh");
	wheresql+=" and  (xh='"+xh+"')";

	ls_sql="SELECT dwmc,yhmc,xzzwbm,qqts,cqts,sjts,bjts,kgts,jbgz,gwgz,khgz,jxfz,byjxgz,buzhu,glgz,jbf,jtbt,dhbt,mrcb,cb,yjsxe,tc,jf,sjkk,bjkk,cjkk,kgkk,qtkk,ksk,sqgz,shgz,rs_yggzb.bz  ";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yggzb.dwbh,rs_yggzb.yhmc";
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
  <B><font size="3">�鿴���ʣ����:<%=xh%>��</font></B>
</CENTER>
<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="5%" rowspan="3">��������</td>
  <td  width="3%" rowspan="3">Ա������</td>
  <td  width="3%" rowspan="3">ְ��</td>
  <td  width="2%" rowspan="3">ȫ������</td>
  <td colspan="4">��������</td>
  <td colspan="5">����</td>
  <td colspan="8">����</td>
  <td colspan="8">����</td>
  <td  width="3%" rowspan="3">Ӧ������</td>
  <td  width="3%" rowspan="3">ʵ������</td>
  <td  width="11%" rowspan="3">��ע</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%" rowspan="2">��������</td>
  <td  width="2%" rowspan="2">�¼�����</td>
  <td  width="2%" rowspan="2">��������</td>
  <td  width="2%" rowspan="2">��������</td>
  <td  width="3%" rowspan="2">��������</td>
  <td  width="3%" rowspan="2">��λ����</td>
  <td colspan="3">��Ч����</td>
  <td  width="3%" rowspan="2">����</td>
  <td  width="3%" rowspan="2">���乤��</td>
  <td  width="3%" rowspan="2">�Ӱ��</td>
  <td  width="3%" rowspan="2">��ͨ����</td>
  <td  width="3%" rowspan="2">ͨѶ����</td>
  <td  width="3%" rowspan="2">ÿ�ղͲ�</td>
  <td  width="3%" rowspan="2">�Ͳ�</td>
  <td  width="3%" rowspan="2">�۱���</td>
  <td  width="3%" rowspan="2">���</td>
  <td  width="3%" rowspan="2">����</td>
  <td colspan="4">ȱ�ڿۿ�</td>
  <td  width="3%" rowspan="2">��������</td>
  <td  width="3%" rowspan="2">�۸�˰</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��Ч���ʻ���</td>
	<td  width="3%">��Ч��ֵ</td>
	<td  width="3%">���¼�Ч����</td>
	<td  width="3%">�¼ٿۿ�</td>
	<td  width="3%">���ٿۿ�</td>
	<td  width="3%">���ٿۿ�</td>
	<td  width="3%">�����ۿ�</td>
  </tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
	</table>

</body>

</html>