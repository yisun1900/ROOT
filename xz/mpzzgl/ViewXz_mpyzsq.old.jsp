<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();



	String ls_sql=null;
	String wheresql="";


	byte[] b=new byte[1024];

	out.println(request.getInputStream().readLine(b,0,11));
	
	String tj1=request.getParameter("tj1");
//	out.println(request.getReader());

	byte[] aa=tj1.getBytes();
	for (int i=0;i<aa.length ;i++ )
	{
		out.println(aa[i]);
	}

	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));

	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));

	if (tj1name!=null)
	{
		if (!(tj1name.equals("")))
		{
			wheresql+=" and  ("+tj1name+"='"+tj1+"')";
		}
	}
	if (tj2name!=null)
	{
		if (!(tj2name.equals("")))
		{
			wheresql+=" and  ("+tj2name+"='"+tj2+"')";
		}
	}
	if (tj3name!=null)
	{
		if (!(tj3name.equals("")))
		{
			wheresql+=" and  ("+tj3name+"='"+tj3+"')";
		}
	}


	ls_sql="SELECT xz_mpyzsq.sqxh,DECODE(xz_mpyzsq.sfywc,'Y','��','N','��') as sfywc,xz_mpyzsq.sqrq,xz_mpyzsq.yqjfrq,xz_mpyzsq.yqsl,mpbb,wcsj,wcsl,dj,xz_mpyzsq.xm as xz_mpyzsq_xm,xz_mpyzsq.zw as xz_mpyzsq_zw,xz_mpyzsq.dh as xz_mpyzsq_dh,xz_mpyzsq.cz as xz_mpyzsq_cz,xz_mpyzsq.yx as xz_mpyzsq_yx,sq_dwxx.dwmc as xz_mpyzsq_dwbh,xz_mpyzsq.sqlrr,xz_mpyzsq.bz as xz_mpyzsq_bz    ";
	ls_sql+=" FROM xz_mpyzsq,sq_dwxx  ";
    ls_sql+=" where xz_mpyzsq.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by xz_mpyzsq.sqxh";
	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_mpyzsqCxList.jsp","SelectCxXz_mpyzsq.jsp","","");
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
  <B><font size="3">��Ƭ���������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�������</td>
	<td  width="3%">�Ƿ����</td>
	<td  width="5%">��������</td>
	<td  width="5%">Ҫ�󽻸�����</td>
	<td  width="3%">Ҫ������</td>
	<td  width="5%">��Ƭ�汾</td>
	<td  width="5%">���ʱ��</td>
	<td  width="3%">�������</td>
	<td  width="3%">����</td>
	<td  width="4%">����</td>
	<td  width="5%">ְ��</td>
	<td  width="12%">�绰</td>
	<td  width="8%">����</td>
	<td  width="12%">����</td>
	<td  width="8%">���벿��</td>
	<td  width="4%">����¼����</td>
	<td  width="11%">��ע</td>
</tr>
<%
	pageObj.displayDate();
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
