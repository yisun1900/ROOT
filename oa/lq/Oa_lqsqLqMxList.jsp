<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�칫��Ʒ��ȡ��ϸ(<%=sjfw%>---<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">��λ</td>
	<td  width="6%">������</td>
	<td  width="12%">�칫��Ʒ</td>
	<td  width="5%">����</td>
	<td  width="5%">�ƻ�����</td>
	<td  width="7%">���</td>
	<td  width="9%">��������</td>
	<td  width="10%">�ƻ���ȡ����</td>
	<td  width="7%">��ȡ״̬</td>
	<td  width="5%">ʵ������</td>
	<td  width="7%">���</td>
	<td  width="5%">������</td>
	<td  width="10%">��ȡʱ��</td>
</tr>
<%
	int[] mark={3,1,1,1,2,2,4,4,4,2,2,4,4};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ
	
	ls_sql="SELECT sq_dwxx.dwmc,oa_lqsq.slr as slr,oa_bgypbm.bgypmc,TO_CHAR(dj) dj,oa_lqsq.jhlqsl as oa_lqsq_jhlqsl,oa_lqsq.jhlqsl*dj jhje,oa_lqsq.lrrq as lrrq,oa_lqsq.jhlqrq as oa_lqsq_jhlqrq, DECODE(oa_lqsq.lqzt,'N','δ��ȡ','Y','����ȡ') as oa_lqsq_lqzt,oa_lqsq.slqsl as oa_lqsq_slqsl,oa_lqsq.slqsl*dj sjje,oa_lqsq.blr as oa_lqsq_blr,oa_lqsq.lqsj as oa_lqsq_lqsj";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" order by sq_dwxx.dwmc,oa_lqsq.slr,oa_lqsq.bgypbm";
	so.addData(ls_sql);

	//�������
	so.outData(out,mark);
%> 

</body>
</html>