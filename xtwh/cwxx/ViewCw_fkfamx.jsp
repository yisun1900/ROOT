<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String fkfabm=request.getParameter("fkfabm");

	ls_sql="SELECT cw_fkcs.fkcsmc, DECODE(cw_fkfamx.lx,'1','����ǰ�տ�(����������)','2','����ǰ�տ��������һ����ȡ��','3','����ǰ�տ��������ִ���ȡ��','6','���ۺ��տ�(����������)','7','���ۺ��տ��������һ����ȡ��','8','���ۺ��տ��������ִ���ȡ��','A','��ǰ������','B','�ۺ�������') lx,DECODE(cw_fkfamx.sfbhglf,'N','������','Y','����') sfbhglf,DECODE(cw_fkfamx.sfbhsj,'N','������','Y','����') sfbhsj,cw_fkfamx.bqfkbl,cw_fkfamx.yfkbl  ";
	ls_sql+=" FROM cw_fkcs,cw_fkfamx  ";
    ls_sql+=" where cw_fkfamx.fkcs=cw_fkcs.fkcs(+) ";
	ls_sql+=" and  (cw_fkfamx.fkfabm='"+fkfabm+"')";
    ls_sql+=" order by cw_fkfamx.fkcs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�������ϸ</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">�տ�����</td>
	<td  width="37%">�տʽ</td>
	<td  width="12%">�տ��Ƿ���������</td>
	<td  width="12%">�տ��Ƿ����˰��</td>
	<td  width="12%">�����տ���ʣ�%��</td>
	<td  width="12%">�ۼ��տ���ʣ�%��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>

</body>
</html>