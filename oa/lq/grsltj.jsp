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

<P><CENTER >��������ͳ�ƣ���������ȡ�ͼƻ���ȡ��(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����</td>
	<td  width="5%">������</td>
	<td  width="7%">��ȡ״̬</td>
	<td  width="12%">�칫��Ʒ</td>
	<td  width="5%">����</td>
	<td  width="5%">����</td>
	<td  width="7%">���</td>
</tr>
<%
	ls_sql="SELECT dwmc,slr,lx,bgypmc,TO_CHAR(dj),sl,sjje";
	ls_sql+=" from ( ";

	ls_sql+=" SELECT dwmc,slr,bgypmc,'��ȡ' lx,dj,sum(slqsl) sl,sum(slqsl*dj) sjje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" and oa_lqsq.lqzt='Y'";
	ls_sql+=" group by dwmc,slr,bgypmc,dj";

	ls_sql+=" union ";

	ls_sql+=" SELECT dwmc,slr,bgypmc,'�ƻ���ȡ' lx,dj dj,sum(jhlqsl) sl,sum(jhlqsl*dj) sjje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=" and jhlqrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and jhlqrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" and oa_lqsq.lqzt='N'";
	ls_sql+=" group by dwmc,slr,bgypmc,dj";
/*
*/

	ls_sql+=" ) ";

	ls_sql+=" order by dwmc,slr,lx,bgypmc";
	
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("slr","1");//�в����������Hash��
	spanColHash.put("lx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>


</body>
</html>