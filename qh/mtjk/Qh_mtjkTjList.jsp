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

<body bgcolor="#FFFFFF">
<center><B>ý����һ����</B></center><BR>


<%
	String wheresql="";
	String qh_mtjk_jkbbh=null;
	String qh_mtjk_bjkgsbh=null;
	String qh_mtjk_xxlybm=null;
	String qh_mtjk_bcsj=null;
	String qh_mtjk_gggs=null;
	String qh_mtjk_yjjg=null;
	String qh_mtjk_bz=null;
	String qh_mtjk_dwbh=null;
	qh_mtjk_jkbbh=request.getParameter("qh_mtjk_jkbbh");
	if (qh_mtjk_jkbbh!=null)
	{
		qh_mtjk_jkbbh=cf.GB2Uni(qh_mtjk_jkbbh);
		if (!(qh_mtjk_jkbbh.equals("")))	wheresql+="  and (qh_mtjk.jkbbh='"+qh_mtjk_jkbbh+"')";
	}
	qh_mtjk_bjkgsbh=request.getParameter("qh_mtjk_bjkgsbh");
	if (qh_mtjk_bjkgsbh!=null)
	{
		qh_mtjk_bjkgsbh=cf.GB2Uni(qh_mtjk_bjkgsbh);
		if (!(qh_mtjk_bjkgsbh.equals("")))	wheresql+="  and (qh_mtjk.bjkgsbh='"+qh_mtjk_bjkgsbh+"')";
	}
	qh_mtjk_xxlybm=request.getParameter("qh_mtjk_xxlybm");
	if (qh_mtjk_xxlybm!=null)
	{
		qh_mtjk_xxlybm=cf.GB2Uni(qh_mtjk_xxlybm);
		if (!(qh_mtjk_xxlybm.equals("")))	wheresql+="  and (qh_mtjk.xxlybm='"+qh_mtjk_xxlybm+"')";
	}
	qh_mtjk_bcsj=request.getParameter("qh_mtjk_bcsj");
	if (qh_mtjk_bcsj!=null)
	{
		qh_mtjk_bcsj=qh_mtjk_bcsj.trim();
		if (!(qh_mtjk_bcsj.equals("")))	wheresql+="  and (qh_mtjk.bcsj>=TO_DATE('"+qh_mtjk_bcsj+"','YYYY/MM/DD'))";
	}
	qh_mtjk_bcsj=request.getParameter("qh_mtjk_bcsj2");
	if (qh_mtjk_bcsj!=null)
	{
		qh_mtjk_bcsj=qh_mtjk_bcsj.trim();
		if (!(qh_mtjk_bcsj.equals("")))	wheresql+="  and (qh_mtjk.bcsj<=TO_DATE('"+qh_mtjk_bcsj+"','YYYY/MM/DD'))";
	}
	qh_mtjk_gggs=request.getParameter("qh_mtjk_gggs");
	if (qh_mtjk_gggs!=null)
	{
		qh_mtjk_gggs=cf.GB2Uni(qh_mtjk_gggs);
		if (!(qh_mtjk_gggs.equals("")))	wheresql+="  and (qh_mtjk.gggs='"+qh_mtjk_gggs+"')";
	}
	qh_mtjk_yjjg=request.getParameter("qh_mtjk_yjjg");
	if (qh_mtjk_yjjg!=null)
	{
		qh_mtjk_yjjg=qh_mtjk_yjjg.trim();
		if (!(qh_mtjk_yjjg.equals("")))	wheresql+=" and  (qh_mtjk.yjjg="+qh_mtjk_yjjg+") ";
	}
	qh_mtjk_bz=request.getParameter("qh_mtjk_bz");
	if (qh_mtjk_bz!=null)
	{
		qh_mtjk_bz=cf.GB2Uni(qh_mtjk_bz);
		if (!(qh_mtjk_bz.equals("")))	wheresql+="  and (qh_mtjk.bz='"+qh_mtjk_bz+"')";
	}
	qh_mtjk_dwbh=request.getParameter("qh_mtjk_dwbh");
	if (qh_mtjk_dwbh!=null)
	{
		qh_mtjk_dwbh=cf.GB2Uni(qh_mtjk_dwbh);
		if (!(qh_mtjk_dwbh.equals("")))	wheresql+="  and (qh_mtjk.dwbh='"+qh_mtjk_dwbh+"')";
	}
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{ 
		wheresql+="and (1=1) ";
	 }
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and (sq_dwxx.ssdw='"+ssfgs+"') ";
	 }
	 else
	 {
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"') ";
	 }
%>
<table style='FONT-SIZE:12px' width='100%' border='1' cellspacing='0' cellpadding='1'>
<tr bgcolor="#CCCCCC"  align="center">
    
	<td  width="2%">���</td>
	<td  width="8%">����ع�˾����</td>
	<td  width="5%">�����ʽ</td>
	<td  width="6%">����ʱ��</td>
	<td  width="5%">��湫˾</td>
	<td  width="6%">��ص�λ</td>
	<td  width="12%">��ע</td>
	<td  width="6%">Ԥ�Ƽ۸�(Ԫ)</td>
</tr>
<%
	String ls_sql=null;
	int[] mark={3,3,3,3,3,3,3,2};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

	ls_sql="SELECT ROWNUM, qh_bjkgsdm.bjkgsmc,dm_xxlybm.xxlymc,qh_mtjk.bcsj,qh_mtjk.gggs,sq_dwxx.dwmc,qh_mtjk.bz,sum(qh_mtjk.yjjg)  ";
	ls_sql+=" FROM qh_mtjk,sq_dwxx,qh_bjkgsdm,dm_xxlybm  ";
    ls_sql+=" where (qh_mtjk.dwbh=sq_dwxx.dwbh(+)) and (qh_bjkgsdm.bjkgsbh=qh_mtjk.bjkgsbh) and (qh_mtjk.xxlybm=dm_xxlybm.xxlybm)";
    ls_sql+=wheresql;
    ls_sql+=" group by ROWNUM, qh_bjkgsdm.bjkgsmc,dm_xxlybm.xxlymc,sq_dwxx.dwmc,qh_mtjk.bcsj,qh_mtjk.gggs,qh_mtjk.dwbh,qh_mtjk.bz";
	so.addData(ls_sql);

	//�������
	so.outData(out,mark);
%>
</table>
</body>
</html>
