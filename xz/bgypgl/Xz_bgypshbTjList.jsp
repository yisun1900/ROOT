<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
%>


<html>
<head>
<title>ͳ�Ʊ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ls_sql2=null;
String dwmc=null;
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{
		ls_sql2="select dwmc from sq_dwxx where dwlx='A0' ";

	}
	else if  (yhjs.equals("F0")||yhjs.equals("F1"))
	{
		ls_sql2="select dwmc from sq_dwxx where dwlx='F0' and ssdw='"+ssfgs+"'";
	}
	dwmc=cf.executeQuery(ls_sql2);
%>
<body bgcolor="#FFFFFF">
<center><B><%=dwmc%>�칫��Ʒ�������ͳ�Ʊ�</B></center><BR>


<%
	String wheresql="";
	String xz_bgypshb_sqxh=null;
	String xz_bgypshb_dwbh=null;
	String xz_bgypshb_sqrq=null;
	String xz_bgypshb_sqr=null;
	String xz_bgypshb_bgypbh=null;
	xz_bgypshb_sqxh=request.getParameter("xz_bgypshb_sqxh");
	if (xz_bgypshb_sqxh!=null)
	{
		xz_bgypshb_sqxh=cf.GB2Uni(xz_bgypshb_sqxh);
		if (!(xz_bgypshb_sqxh.equals("")))	wheresql+="  and (xz_bgypshb.sqxh='"+xz_bgypshb_sqxh+"')";
	}
	xz_bgypshb_dwbh=request.getParameter("xz_bgypshb_dwbh");
	if (xz_bgypshb_dwbh!=null)
	{
		xz_bgypshb_dwbh=cf.GB2Uni(xz_bgypshb_dwbh);
		if (!(xz_bgypshb_dwbh.equals("")))	wheresql+="  and (xz_bgypshb.dwbh='"+xz_bgypshb_dwbh+"')";
	}
	xz_bgypshb_sqrq=request.getParameter("xz_bgypshb_sqrq");
	if (xz_bgypshb_sqrq!=null)
	{
		xz_bgypshb_sqrq=xz_bgypshb_sqrq.trim();
		if (!(xz_bgypshb_sqrq.equals("")))	wheresql+="  and (xz_bgypshb.sqrq>=TO_DATE('"+xz_bgypshb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgypshb_sqrq=request.getParameter("xz_bgypshb_sqrq2");
	if (xz_bgypshb_sqrq!=null)
	{
		xz_bgypshb_sqrq=xz_bgypshb_sqrq.trim();
		if (!(xz_bgypshb_sqrq.equals("")))	wheresql+="  and (xz_bgypshb.sqrq<=TO_DATE('"+xz_bgypshb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgypshb_sqr=request.getParameter("xz_bgypshb_sqr");
	if (xz_bgypshb_sqr!=null)
	{
		xz_bgypshb_sqr=cf.GB2Uni(xz_bgypshb_sqr);
		if (!(xz_bgypshb_sqr.equals("")))	wheresql+="  and (xz_bgypshb.sqr='"+xz_bgypshb_sqr+"')";
	}
	xz_bgypshb_bgypbh=request.getParameter("xz_bgypshb_bgypbh");
	if (xz_bgypshb_bgypbh!=null)
	{
		xz_bgypshb_bgypbh=cf.GB2Uni(xz_bgypshb_bgypbh);
		if (!(xz_bgypshb_bgypbh.equals("")))	wheresql+="  and (xz_bgypshb.bgypbh='"+xz_bgypshb_bgypbh+"')";
	}
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}

%>
<table style='FONT-SIZE:12px' width='100%' border='1' cellspacing='0' cellpadding='1'>
<tr bgcolor="#CCCCCC"  align="center">
	
	<td  width="7%">���벿��</td>
	<td  width="7%">�������</td>
	<td  width="8%">��������</td>
	<td  width="6%">������</td>
	<td  width="8%">�칫��Ʒ</td>
	<td  width="10%">��ע</td>
	<td  width="6%">��������</td>
	<td  width="6%">��׼����</td>
	<td  width="6%">���½������</td>
</tr>
<%
	String ls_sql=null;
	int[] mark={3,3,3,3,3,3,2,2,2};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

	ls_sql="SELECT sq_dwxx.dwmc,xz_bgypshb.sqxh,xz_bgypshb.sqrq,xz_bgypshb.sqr,xz_bgypbm.bgypmc,xz_bgypshb.bz,sum(xz_bgypshb.sqsl),sum(xz_bgypshb.pzsl),sum(xz_bgypshb.syjcsl)  ";
	ls_sql+=" FROM xz_bgypbm,xz_bgypshb,sq_dwxx  ";
    ls_sql+=" where xz_bgypshb.bgypbh=xz_bgypbm.bgypbh and xz_bgypshb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" group by xz_bgypshb.sqxh,sq_dwxx.dwmc,xz_bgypshb.sqrq,xz_bgypshb.sqr,xz_bgypbm.bgypmc,xz_bgypshb.bz";
	so.addData(ls_sql);

	//�������
	so.outData(out,mark);
%>
</table>
</body>
</html>
