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
<center><B><%=dwmc%>��ֵ�׺�Ʒ�̵���ϸ��</B></center><BR>
<CENTER><%=request.getParameter("xz_dzyhppdmx_pdsj")%>��<%=request.getParameter("xz_dzyhppdmx_pdsj2")%></CENTER>


<%
	String wheresql="";
	String xz_dzyhppdmx_mc=null;
	String xz_dzyhppdmx_dwbh=null;
	String xz_dzyhppdmx_pdsj=null;
	xz_dzyhppdmx_mc=request.getParameter("xz_dzyhppdmx_mc");
	if (xz_dzyhppdmx_mc!=null)
	{
		xz_dzyhppdmx_mc=cf.GB2Uni(xz_dzyhppdmx_mc);
		if (!(xz_dzyhppdmx_mc.equals("")))	wheresql+="  and (xz_dzyhppdmx.mc='"+xz_dzyhppdmx_mc+"')";
	}
	xz_dzyhppdmx_dwbh=request.getParameter("xz_dzyhppdmx_dwbh");
	if (xz_dzyhppdmx_dwbh!=null)
	{
		xz_dzyhppdmx_dwbh=cf.GB2Uni(xz_dzyhppdmx_dwbh);
		if (!(xz_dzyhppdmx_dwbh.equals("")))	wheresql+="  and (xz_dzyhppdmx.dwbh='"+xz_dzyhppdmx_dwbh+"')";
	}
	xz_dzyhppdmx_pdsj=request.getParameter("xz_dzyhppdmx_pdsj");
	if (xz_dzyhppdmx_pdsj!=null)
	{
		xz_dzyhppdmx_pdsj=xz_dzyhppdmx_pdsj.trim();
		if (!(xz_dzyhppdmx_pdsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.pdsj>=TO_DATE('"+xz_dzyhppdmx_pdsj+"','YYYY/MM/DD'))";
	}
	xz_dzyhppdmx_pdsj=request.getParameter("xz_dzyhppdmx_pdsj2");
	if (xz_dzyhppdmx_pdsj!=null)
	{
		xz_dzyhppdmx_pdsj=xz_dzyhppdmx_pdsj.trim();
		if (!(xz_dzyhppdmx_pdsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.pdsj<=TO_DATE('"+xz_dzyhppdmx_pdsj+"','YYYY/MM/DD'))";
	}
		//**********************************
	//�����û����ԣ����Ӳ�ѯ����
	//********************************
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+="and dwlx<>'G0' and dwlx<>'J0' ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and (dwlx<>'G0' and dwlx<>'J0' and ssdw='"+ssfgs+"') ";
	}
	else
	{
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"') ";
	}


%>
<table style='FONT-SIZE:12px' width='100%' border='1' cellspacing='0' cellpadding='1'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�̵����</td>
	<td  width="4%">���</td>
	<td  width="7%">����</td>
	<td  width="2%">��λ</td>
	<td  width="7%">�ͺż����</td>
	<td  width="7%">����ʱ��</td>
	
	<td  width="3%">������</td>
	<td  width="3%">�̵���</td>
	<td  width="7%">�̵�ʱ��</td>
	<td  width="7%">��ע</td>
	<td  width="7%">ʹ�ò���</td>
	<td  width="3%">����</td>
	<td  width="5%">�����</td>
	<td  width="5%">��ֵ</td>
</tr>
<%
	String ls_sql=null;
	int[] mark={1,1,1,1,1,1,3,1,1,1,1,1,1,2};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

	ls_sql="SELECT xz_dzyhppdmx.pdxh,xz_dzyhppdmx.bh,xz_dzyhppdmx.mc,xz_dzyhppdmx.dw,xz_dzyhppdmx.xhjgg,xz_dzyhppdmx.grsj,xz_dzyhppdmx.zrr,xz_dzyhppdmx.pdr,xz_dzyhppdmx.pdsj,xz_dzyhppdmx.bz,sq_dwxx.dwmc,sum(xz_dzyhppdmx.sl),sum(xz_dzyhppdmx.gryz),sum(xz_dzyhppdmx.sl)*sum(xz_dzyhppdmx.gryz)  ";
	ls_sql+=" FROM sq_dwxx,xz_dzyhppdmx  ";
    ls_sql+=" where xz_dzyhppdmx.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" group by xz_dzyhppdmx.pdxh,xz_dzyhppdmx.bh,xz_dzyhppdmx.mc,xz_dzyhppdmx.dw,xz_dzyhppdmx.xhjgg,xz_dzyhppdmx.grsj,xz_dzyhppdmx.dwbh,xz_dzyhppdmx.zrr,xz_dzyhppdmx.pdr,xz_dzyhppdmx.pdsj,xz_dzyhppdmx.bz,sq_dwxx.dwmc";
	so.addData(ls_sql);

	//�������
	so.outData(out,mark);
%>
</table>
</body>
</html>
