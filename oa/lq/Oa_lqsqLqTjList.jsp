<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	Hashtable spanColHash=new Hashtable();
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>

<CENTER >�ƻ���ȡ����ͳ��(<%=sjfw%>---<%=sjfw2%>)</CENTER>
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

<P><CENTER >����ȡ����ͳ��(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">�칫��Ʒ</td>
	<td  width="8%">��ȡ����</td>
	<td  width="5%">����</td>
	<td  width="7%">��ȡ���</td>
</tr>
<%
	ls_sql="SELECT oa_bgypbm.bgypmc,sum(oa_lqsq.slqsl),TO_CHAR(dj) dj,sum(oa_lqsq.slqsl*dj) sjje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq  ";
    ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm and oa_lqsq.lqzt='Y'";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
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

<P><CENTER >������ȡ���ͳ��(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����</td>
	<td  width="5%">������</td>
	<td  width="5%">��ȡ����</td>
	<td  width="7%">��׼���(Ԫ)</td>
	<td  width="7%">��ȡ���(Ԫ)</td>
	<td  width="7%">ʣ����(Ԫ)</td>
</tr>
<%
	ls_sql=" SELECT dwmc,slr,sl,bz,je,syje";
	ls_sql+=" from ( ";

	ls_sql+=" SELECT dwmc,slr,sum(oa_lqsq.slqsl) sl,je bz,sum(oa_lqsq.slqsl*dj) je,je-sum(oa_lqsq.slqsl*dj) syje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx,oa_bgypbz  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and oa_lqsq.dwbh=oa_bgypbz.dwbh and oa_lqsq.slr=oa_bgypbz.xm";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" group by dwmc,slr,je";


	ls_sql+=" union ";

	ls_sql+=" SELECT dwmc,xm slr,0 sl,je bz,0 je,je syje";
	ls_sql+=" FROM sq_dwxx,oa_bgypbz  ";
    ls_sql+=" where oa_bgypbz.dwbh=sq_dwxx.dwbh and oa_bgypbz.xm not in ";
	ls_sql+=" (SELECT slr";
	ls_sql+=" FROM oa_lqsq";
    ls_sql+=" where lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD'))";
	

	ls_sql+=" ) ";

	
	ls_sql+=" order by dwmc,slr";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("slr","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

<P><CENTER >������ȡ���ͳ��(<%=sjfw%>---<%=sjfw2%>)</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����</td>
	<td  width="5%">��ȡ����</td>
	<td  width="7%">��׼���(Ԫ)</td>
	<td  width="7%">��ȡ���(Ԫ)</td>
	<td  width="7%">ʣ����(Ԫ)</td>
</tr>
<%
	ls_sql="SELECT dwmc,sl,(select sum(je) from oa_bgypbz where oa_bgypbz.dwbh=abc.dwbh) ,abc.je,(select sum(je) from oa_bgypbz where oa_bgypbz.dwbh=abc.dwbh)-syje";
	ls_sql+=" from ( ";

	ls_sql+=" SELECT dwmc,sum(oa_lqsq.slqsl) sl,oa_lqsq.dwbh dwbh,sum(oa_lqsq.slqsl*dj) je,sum(oa_lqsq.slqsl*dj) syje";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx,oa_bgypbz  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and oa_lqsq.dwbh=oa_bgypbz.dwbh and oa_lqsq.slr=oa_bgypbz.xm";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" group by dwmc,oa_lqsq.dwbh";

	ls_sql+=" union ";

	ls_sql+=" SELECT dwmc,0 sl,oa_bgypbz.dwbh dwbh,0 je,0";
	ls_sql+=" FROM sq_dwxx,oa_bgypbz  ";
    ls_sql+=" where oa_bgypbz.dwbh=sq_dwxx.dwbh and oa_bgypbz.dwbh not in ";
	ls_sql+=" (SELECT dwbh";
	ls_sql+=" FROM oa_lqsq";
    ls_sql+=" where lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD'))";
	ls_sql+=" group by dwmc,oa_bgypbz.dwbh";
	

	ls_sql+=" ) abc";
	ls_sql+=" order by dwmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

<P><CENTER >������ȡͳ��(<%=sjfw%>---<%=sjfw2%>)</CENTER>
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
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>


</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>