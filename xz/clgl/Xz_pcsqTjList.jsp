<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
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


<html>
<head>
<title>ͳ�Ʊ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center><B><%=dwmc%>˾���������ͳ�Ʊ�</B></center><BR>

<CENTER><%=request.getParameter("xz_pcsq_sqrq")%>��<%=request.getParameter("xz_pcsq_sqrq2")%></CENTER>
<%
	String wheresql="";
	String xz_pcsq_sqrq=null;
	String xz_pcsq_dwbh=null;
	String xz_pcsq_mdd=null;
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq>=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq2");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq<=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
//**********************************
//�����û����ԣ����Ӳ�ѯ����
//********************************
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+="and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and  sq_dwxx.ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"') ";
	}	

%>
<table style='FONT-SIZE:12px' width='100%' border='1' cellspacing='0' cellpadding='1'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">����</td>
	<td  width="11%">�������</td>
	<td  width="11%">��������</td>
	<td  width="11%">���벿��</td>
	<td  width="11%">�ó�����</td>
	<td  width="11%">Ŀ�ĵ�</td>
	<td  width="11%">�ó�ʱ��</td>
	<td  width="11%">����ʱ��</td>
	<td  width="11%">������</td>
</tr>
<%
	String ls_sql=null;
	int[] mark={3,1,1,1,1,1,1,1,2};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

	ls_sql="SELECT xz_qcdm.qcph,xz_pcsq.sqxh,xz_pcsq.sqrq,sq_dwxx.dwmc,xz_pcsq.ycsy,xz_pcsq.mdd,xz_pcsq.ycsj,xz_pcsq.fhsj,sum(xz_pcsq.gls)  ";
	ls_sql+=" FROM xz_pcsq,sq_dwxx,xz_qcdm  ";
    ls_sql+=" where xz_pcsq.qcdm=xz_qcdm.qcdm(+) and xz_pcsq.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=wheresql;
	ls_sql+=" and xz_qcdm.qcph is not null";
    ls_sql+=" group by xz_qcdm.qcph,xz_pcsq.sqxh,xz_pcsq.sqrq,sq_dwxx.dwmc,xz_pcsq.ycsy,xz_pcsq.mdd,xz_pcsq.ycsj,xz_pcsq.fhsj order by xz_qcdm.qcph";
	//out.print(ls_sql);
	so.addData(ls_sql);

	//�������
	so.outData(out,mark);
%>
</table>
</body>
</html>
