<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	Hashtable spanColHash=new Hashtable();
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>

<CENTER >�ƻ���ȡ�칫��Ʒͳ��(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">�칫��Ʒ</td>
	<td  width="8%">�ƻ���ȡ����</td>
	<td  width="5%">����</td>
	<td  width="7%">�ɹ����</td>
</tr>
<%
	ls_sql="SELECT oa_bgypbm.bgypmc,sum(oa_lqsq.jhlqsl),TO_CHAR(dj) dj,sum(oa_lqsq.jhlqsl*dj) sjje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq  ";
    ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm and oa_lqsq.lqzt='N'";
    ls_sql+=" and jhlqrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and jhlqrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" group by oa_bgypbm.bgypmc,dj";
	ls_sql+=" order by oa_bgypbm.bgypmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>



</body>
</html>