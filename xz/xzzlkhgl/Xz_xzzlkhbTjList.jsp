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
String dqbm=(String)session.getAttribute("dqbm");
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
<center><B><%=dwmc%>�������������ͳ�Ʊ�</B></center><BR>
<CENTER><%=request.getParameter("xz_xzzlkhb_khsj")%>��<%=request.getParameter("xz_xzzlkhb_khsj2")%></CENTER>


<%
	String wheresql="";
	String xz_xzzlkhb_dwbh=null;
	String xz_xzzlkhb_khsj=null;
	xz_xzzlkhb_dwbh=request.getParameter("xz_xzzlkhb_dwbh");
	if (xz_xzzlkhb_dwbh!=null)
	{
		xz_xzzlkhb_dwbh=cf.GB2Uni(xz_xzzlkhb_dwbh);
		if (!(xz_xzzlkhb_dwbh.equals("")))	wheresql+="  and (xz_xzzlkhb.dwbh='"+xz_xzzlkhb_dwbh+"')";
	}
	xz_xzzlkhb_khsj=request.getParameter("xz_xzzlkhb_khsj");
	if (xz_xzzlkhb_khsj!=null)
	{
		xz_xzzlkhb_khsj=xz_xzzlkhb_khsj.trim();
		if (!(xz_xzzlkhb_khsj.equals("")))	wheresql+="  and (xz_xzzlkhb.khsj>=TO_DATE('"+xz_xzzlkhb_khsj+"','YYYY/MM/DD'))";
	}
	xz_xzzlkhb_khsj=request.getParameter("xz_xzzlkhb_khsj2");
	if (xz_xzzlkhb_khsj!=null)
	{
		xz_xzzlkhb_khsj=xz_xzzlkhb_khsj.trim();
		if (!(xz_xzzlkhb_khsj.equals("")))	wheresql+="  and (xz_xzzlkhb.khsj<=TO_DATE('"+xz_xzzlkhb_khsj+"','YYYY/MM/DD'))";
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
	<td  width="6%">���</td>
	<td  width="9%">�����˲���</td>
	<td  width="8%">����ʱ��</td>
	<td  width="4%">������</td>
	<td  width="6%">����15��</td>
	<td  width="6%">��ͬ10��</td>
	<td  width="6%">�������10��</td>
	<td  width="6%">�ļ�5��</td>
	<td  width="6%">��Ʒ�豸10</td>
	<td  width="6%">�칫��Ʒ5��</td>
	<td  width="6%">������Ʒ5��</td>
	<td  width="6%">�����15��</td>
	<td  width="6%">���5��</td>
	<td  width="6%">����7��</td>
	<td  width="6%">��������8��</td>
	<td  width="6%">�������ż���ԱͶ��5��</td>
<td  width="6%">�ϼ�</td>
</tr>
<%
	String ls_sql=null;
	int[] mark={4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,2};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

	ls_sql="SELECT xz_xzzlkhb.xh,sq_dwxx.dwmc,xz_xzzlkhb.khsj,xz_xzzlkhb.khr,(xz_xzzlkhb.cw),(xz_xzzlkhb.ht),(xz_xzzlkhb.dmgl),(xz_xzzlkhb.wj),(xz_xzzlkhb.wpsb),(xz_xzzlkhb.bgyp),(xz_xzzlkhb.xcyp),(xz_xzzlkhb.gxbb),(xz_xzzlkhb.jk),(xz_xzzlkhb.kq),(xz_xzzlkhb.gzap),(xz_xzzlkhb.ts),((xz_xzzlkhb.cw)+(xz_xzzlkhb.ht)+(xz_xzzlkhb.dmgl)+(xz_xzzlkhb.wj)+(xz_xzzlkhb.wpsb)+(xz_xzzlkhb.bgyp)+(xz_xzzlkhb.xcyp)+(xz_xzzlkhb.gxbb)+(xz_xzzlkhb.jk)+(xz_xzzlkhb.kq)+(xz_xzzlkhb.gzap)+(xz_xzzlkhb.ts)) as hj";
	ls_sql+=" FROM xz_xzzlkhb,sq_dwxx  ";
    ls_sql+=" where xz_xzzlkhb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by hj desc";
	so.addData(ls_sql);

	//�������
	so.outData(out,mark);
%>
</table>
</body>
</html>
