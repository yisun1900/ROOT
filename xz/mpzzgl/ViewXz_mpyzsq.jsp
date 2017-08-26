<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();



	String ls_sql=null;
	
	String tj1=request.getParameter("tj1");
	String tj2=request.getParameter("tj2");
	String tj3=request.getParameter("tj3");
	String tj1name=cf.GB2Uni(cf.getParameter(request,"tj1name"));
	String tj2name=cf.GB2Uni(cf.getParameter(request,"tj2name"));
	String tj3name=cf.GB2Uni(cf.getParameter(request,"tj3name"));
	String wheresql=cf.GB2Uni(cf.getParameter(request,"wheresql"));

	if (tj1name!=null && !tj1name.equals(""))
	{
		wheresql+=" and  ("+tj1name+"='"+tj1+"')";
	}
	if (tj2name!=null && !tj2name.equals(""))
	{
		wheresql+=" and  ("+tj2name+"='"+tj2+"')";
	}
	if (tj3name!=null && !tj3name.equals(""))
	{
		wheresql+=" and  ("+tj3name+"='"+tj3+"')";
	}


	ls_sql="SELECT xz_mpyzsq.sqxh,DECODE(xz_mpyzsq.sfywc,'Y','��','N','��') as sfywc,xz_mpyzsq.sqrq,xz_mpyzsq.yqjfrq,xz_mpyzsq.yqsl,mpbb,wcsj,wcsl,TO_CHAR(dj),xz_mpyzsq.xm as xz_mpyzsq_xm,xz_mpyzsq.zw as xz_mpyzsq_zw,sq_dwxx.dwmc as xz_mpyzsq_dwbh,xz_mpyzsq.bz as xz_mpyzsq_bz    ";
	ls_sql+=" FROM xz_mpyzsq,sq_dwxx  ";
    ls_sql+=" where xz_mpyzsq.dwbh=sq_dwxx.dwbh ";
    ls_sql+=wheresql;
    ls_sql+=" order by xz_mpyzsq.sqxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);
/*
//������ʾ��
	String[] disColName={"sqxh","xz_mpyzsq_xm","xz_mpyzsq_zw","xz_mpyzsq_sj","xz_mpyzsq_dh","xz_mpyzsq_yx","xz_mpyzsq_bz","xz_mpyzsq_dwbh","xz_mpyzsq_sqrq"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ƭ��������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�������</td>
	<td  width="4%">�Ƿ����</td>
	<td  width="9%">��������</td>
	<td  width="9%">Ҫ�󽻸�����</td>
	<td  width="4%">Ҫ������</td>
	<td  width="6%">��Ƭ�汾</td>
	<td  width="9%">���ʱ��</td>
	<td  width="4%">�������</td>
	<td  width="4%">����</td>
	<td  width="6%">����</td>
	<td  width="9%">ְ��</td>
	<td  width="12%">���벿��</td>
	<td  width="18%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>
