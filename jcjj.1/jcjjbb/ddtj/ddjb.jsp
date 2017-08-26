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

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String lrdwbh=request.getParameter("dwbh");
String lrxmzy=request.getParameter("xmzy");
String wheresql="";
if (lrxmzy!=null)
{
	lrxmzy=cf.GB2Uni(lrxmzy);
	if (!(lrxmzy.equals("")))	wheresql+=" and  (xmzy='"+lrxmzy+"')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String dwbh=null;
String dwmc=null;
String xmzy=null;
String clzt=null;

int sl=0;

int ddzl=0;
double htze=0;
int wwc=0;
int ywc=0;
int ypd=0;
int ycc=0;
int yfc=0;
int yht=0;
int yqr=0;
int yrk=0;
int yaz=0;

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>���ɼҾӶ���ͳ��</B><b>(¼��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<div align="center"><B>ľ��Ԥ����ͳ��</B><BR></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="15%">����</td>
  <td width="9%">��ĿרԱ</td>
  <td width="9%">��������</td>
  <td width="11%">��ͬ�ܶ�</td>
  <td width="8%">δ���</td>
  <td width="8%">�����</td>
  <td width="8%">���ɵ�</td>
  <td width="8%">�ѳ���</td>
  <td width="8%">ǩ����ͬ</td>
  <td width="8%">�����</td>
  <td width="8%">��װ���</td>
</tr>
<%

	//ľ��Ԥ����ͳ��:��ϸ
	ls_sql="SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_xmzy.xmzy";
	ls_sql+=" FROM sq_dwxx,sq_xmzy";
    ls_sql+=" where sq_dwxx.dwbh=sq_xmzy.dwbh(+) and (dwlx='F2' and cxbz='N')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by sq_dwxx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));

		ddzl=0;
		htze=0;
		wwc=0;
		ywc=0;
		ypd=0;
		ycc=0;
		yht=0;
		yrk=0;
		yaz=0;

		ls_sql="SELECT clzt,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_mmydd,crm_khxx";
		ls_sql+=" where jc_mmydd.clzt!='99' and jc_mmydd.khlx='1'";
		ls_sql+=" and jc_mmydd.khbh=crm_khxx.khbh(+) ";
		ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and jc_mmydd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by clzt";
		ls_sql+=" order by clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);

			if (clzt.equals("00"))
			{
				wwc=sl;
			}
			else if (clzt.equals("01"))
			{
				ywc=sl;
			}
			else if (clzt.equals("02"))
			{
				ypd=sl;
			}
			else if (clzt.equals("03"))
			{
				ycc=sl;
			}
			else if (clzt.equals("04"))
			{
				yht=sl;
			}
			else if (clzt.equals("05"))
			{
				yrk=sl;
			}
			else if (clzt.equals("06"))
			{
				yaz=sl;
			}
		}
		rs.close();
		ps.close();

		ddzl=wwc+ywc+ypd+ycc+yht+yrk+yaz;

		%>
		<tr align="center">
		<td><%=dwmc%></td>
		<td><%=xmzy%></td>
		<td><%=ddzl%></td>
		<td><%=htze%></td>
		<td><%=wwc%></td>
		<td><%=ywc%></td>
		<td><%=ypd%></td>
		<td><%=ycc%></td>
		<td><%=yht%></td>
		<td><%=yrk%></td>
		<td><%=yaz%></td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	ddzl=0;
	wwc=0;
	ywc=0;
	ypd=0;
	ycc=0;
	yht=0;
	yrk=0;
	yaz=0;

	//ľ��Ԥ����ͳ��:�� ��

	ls_sql="SELECT clzt,count(*),sum(zjhze)";
	ls_sql+=" FROM jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+) and jc_mmydd.clzt!='99' and jc_mmydd.khlx='1'";
	ls_sql+=" and jc_mmydd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" group by clzt";
	ls_sql+=" order by clzt";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clzt=rs.getString("clzt");
		sl=rs.getInt(2);
		htze+=rs.getDouble(3);

		if (clzt.equals("00"))
		{
			wwc=sl;
		}
		else if (clzt.equals("01"))
		{
			ywc=sl;
		}
		else if (clzt.equals("02"))
		{
			ypd=sl;
		}
		else if (clzt.equals("03"))
		{
			ycc=sl;
		}
		else if (clzt.equals("04"))
		{
			yht=sl;
		}
		else if (clzt.equals("05"))
		{
			yrk=sl;
		}
		else if (clzt.equals("06"))
		{
			yaz=sl;
		}
	}
	rs.close();
	ps.close();

	ddzl=wwc+ywc+ypd+ycc+yht+yrk+yaz;

	%>
	<tr align="center">
	<td>��  ��</td>
	<td>&nbsp;</td>
	<td><%=ddzl%></td>
	<td><%=htze%></td>
	<td><%=wwc%></td>
	<td><%=ywc%></td>
	<td><%=ypd%></td>
	<td><%=ycc%></td>
	<td><%=yht%></td>
	<td><%=yrk%></td>
	<td><%=yaz%></td>
	</tr>
</table>


<div align="center"><B>����Ԥ����ͳ��</B><BR></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="14%">����</td>
  <td width="7%">��ĿרԱ</td>
  <td width="7%">��������</td>
  <td width="9%">��ͬ�ܶ�</td>
  <td width="7%">δ���</td>
  <td width="7%">�����</td>
  <td width="7%">���ɵ�</td>
  <td width="7%">�ѳ���</td>
  <td width="7%">�Ѹ���</td>
  <td width="7%">ǩ����ͬ</td>
  <td width="7%">��ͬ��ȷ��</td>
  <td width="7%">�����</td>
  <td width="7%">��װ���</td>
</tr>
<%
	//����Ԥ����ͳ��:��ϸ
	ls_sql="SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_xmzy.xmzy";
	ls_sql+=" FROM sq_dwxx,sq_xmzy";
    ls_sql+=" where sq_dwxx.dwbh=sq_xmzy.dwbh(+) and (dwlx='F2' and cxbz='N')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));

		ddzl=0;
		htze=0;
		wwc=0;
		ywc=0;
		ypd=0;
		ycc=0;
		yfc=0;
		yht=0;
		yqr=0;
		yrk=0;
		yaz=0;

		ls_sql="SELECT clzt,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_cgdd,crm_khxx";
		ls_sql+=" where jc_cgdd.clzt!='99' and jc_cgdd.khlx='1'";
		ls_sql+=" and jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and jc_cgdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by clzt";
		ls_sql+=" order by clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);

			//00��Ԥ����δ��ɣ�01��Ԥ��������ɣ�02�����ɵ���03���ѳ��⣻04���Ѹ��⣻05��ǩ����ͬ��06����ͬ��ȷ�ϣ�07������⣻08���Ѱ�װ
			if (clzt.equals("00"))
			{
				wwc=sl;
			}
			else if (clzt.equals("01"))
			{
				ywc=sl;
			}
			else if (clzt.equals("02"))
			{
				ypd=sl;
			}
			else if (clzt.equals("03"))
			{
				ycc=sl;
			}
			else if (clzt.equals("04"))
			{
				yfc=sl;
			}
			else if (clzt.equals("05"))
			{
				yht=sl;
			}
			else if (clzt.equals("06"))
			{
				yqr=sl;
			}
			else if (clzt.equals("07"))
			{
				yrk=sl;
			}
			else if (clzt.equals("08"))
			{
				yaz=sl;
			}
		}
		rs.close();
		ps.close();

		ddzl=wwc+ywc+ypd+ycc+yfc+yht+yqr+yrk+yaz;

		%>
		<tr align="center">
		<td><%=dwmc%></td>
		<td><%=xmzy%></td>
		<td><%=ddzl%></td>
		<td><%=htze%></td>
		<td><%=wwc%></td>
		<td><%=ywc%></td>
		<td><%=ypd%></td>
		<td><%=ycc%></td>
		<td><%=yfc%></td>
		<td><%=yht%></td>
		<td><%=yqr%></td>
		<td><%=yrk%></td>
		<td><%=yaz%></td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	ddzl=0;
	wwc=0;
	ywc=0;
	ypd=0;
	ycc=0;
	yfc=0;
	yht=0;
	yqr=0;
	yrk=0;
	yaz=0;

	//����Ԥ����ͳ��:�ϼ�
	ls_sql="SELECT clzt,count(*),sum(zjhze)";
	ls_sql+=" FROM jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt!='99' and jc_cgdd.khlx='1'";
	ls_sql+=" and jc_cgdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" group by clzt";
	ls_sql+=" order by clzt";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clzt=rs.getString("clzt");
		sl=rs.getInt(2);
		htze+=rs.getDouble(3);

		//00��Ԥ����δ��ɣ�01��Ԥ��������ɣ�02�����ɵ���03���ѳ��⣻04���Ѹ��⣻05��ǩ����ͬ��06����ͬ��ȷ�ϣ�07������⣻08���Ѱ�װ
		if (clzt.equals("00"))
		{
			wwc=sl;
		}
		else if (clzt.equals("01"))
		{
			ywc=sl;
		}
		else if (clzt.equals("02"))
		{
			ypd=sl;
		}
		else if (clzt.equals("03"))
		{
			ycc=sl;
		}
		else if (clzt.equals("04"))
		{
			yfc=sl;
		}
		else if (clzt.equals("05"))
		{
			yht=sl;
		}
		else if (clzt.equals("06"))
		{
			yqr=sl;
		}
		else if (clzt.equals("07"))
		{
			yrk=sl;
		}
		else if (clzt.equals("08"))
		{
			yaz=sl;
		}
	}
	rs.close();
	ps.close();

	ddzl=wwc+ywc+ypd+ycc+yfc+yht+yqr+yrk+yaz;

	%>
	<tr align="center">
	<td>��  ��</td>
	<td>&nbsp;</td>
	<td><%=ddzl%></td>
	<td><%=htze%></td>
	<td><%=wwc%></td>
	<td><%=ywc%></td>
	<td><%=ypd%></td>
	<td><%=ycc%></td>
	<td><%=yfc%></td>
	<td><%=yht%></td>
	<td><%=yqr%></td>
	<td><%=yrk%></td>
	<td><%=yaz%></td>
	</tr>
</table>


<div align="center"><B>�Ҿ�Ԥ����ͳ��</B><BR></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="14%">����</td>
  <td width="7%">��ĿרԱ</td>
  <td width="7%">��������</td>
  <td width="9%">��ͬ�ܶ�</td>
  <td width="7%">δ���</td>
  <td width="7%">�����</td>
  <td width="7%">���ɵ�</td>
  <td width="7%">�ѳ���</td>
  <td width="7%">�Ѹ���</td>
  <td width="7%">ǩ����ͬ</td>
  <td width="7%">��ͬ��ȷ��</td>
  <td width="7%">�����</td>
  <td width="7%">��װ���</td>
</tr>
<%
	//�Ҿ�Ԥ����ͳ��:��ϸ
	ls_sql="SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_xmzy.xmzy";
	ls_sql+=" FROM sq_dwxx,sq_xmzy";
    ls_sql+=" where sq_dwxx.dwbh=sq_xmzy.dwbh(+) and (dwlx='F2' and cxbz='N')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));

		ddzl=0;
		htze=0;
		wwc=0;
		ywc=0;
		ypd=0;
		ycc=0;
		yfc=0;
		yht=0;
		yqr=0;
		yrk=0;
		yaz=0;

		ls_sql="SELECT clzt,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_jjdd,crm_khxx";
		ls_sql+=" where jc_jjdd.clzt!='99' and jc_jjdd.khlx='1'";
		ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and jc_jjdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by clzt";
		ls_sql+=" order by clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);

			//00��Ԥ����δ��ɣ�01��Ԥ��������ɣ�02�����ɵ���03���ѳ��⣻04���Ѹ��⣻05��ǩ����ͬ��06����ͬ��ȷ�ϣ�07������⣻08���Ѱ�װ
			if (clzt.equals("00"))
			{
				wwc=sl;
			}
			else if (clzt.equals("01"))
			{
				ywc=sl;
			}
			else if (clzt.equals("02"))
			{
				ypd=sl;
			}
			else if (clzt.equals("03"))
			{
				ycc=sl;
			}
			else if (clzt.equals("04"))
			{
				yfc=sl;
			}
			else if (clzt.equals("05"))
			{
				yht=sl;
			}
			else if (clzt.equals("06"))
			{
				yqr=sl;
			}
			else if (clzt.equals("07"))
			{
				yrk=sl;
			}
			else if (clzt.equals("08"))
			{
				yaz=sl;
			}
		}
		rs.close();
		ps.close();

		ddzl=wwc+ywc+ypd+ycc+yfc+yht+yqr+yrk+yaz;

		%>
		<tr align="center">
		<td><%=dwmc%></td>
		<td><%=xmzy%></td>
		<td><%=ddzl%></td>
		<td><%=htze%></td>
		<td><%=wwc%></td>
		<td><%=ywc%></td>
		<td><%=ypd%></td>
		<td><%=ycc%></td>
		<td><%=yfc%></td>
		<td><%=yht%></td>
		<td><%=yqr%></td>
		<td><%=yrk%></td>
		<td><%=yaz%></td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	ddzl=0;
	wwc=0;
	ywc=0;
	ypd=0;
	ycc=0;
	yfc=0;
	yht=0;
	yqr=0;
	yrk=0;
	yaz=0;

	//�Ҿ�Ԥ����ͳ��:�ϼ�
	ls_sql="SELECT clzt,count(*),sum(htze-jxje+zxje)";
	ls_sql+=" FROM jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+) and jc_jjdd.clzt!='99' and jc_jjdd.khlx='1'";
	ls_sql+=" and jc_jjdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" group by clzt";
	ls_sql+=" order by clzt";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clzt=rs.getString("clzt");
		sl=rs.getInt(2);
		htze+=rs.getDouble(3);

		//00��Ԥ����δ��ɣ�01��Ԥ��������ɣ�02�����ɵ���03���ѳ��⣻04���Ѹ��⣻05��ǩ����ͬ��06����ͬ��ȷ�ϣ�07������⣻08���Ѱ�װ
		if (clzt.equals("00"))
		{
			wwc=sl;
		}
		else if (clzt.equals("01"))
		{
			ywc=sl;
		}
		else if (clzt.equals("02"))
		{
			ypd=sl;
		}
		else if (clzt.equals("03"))
		{
			ycc=sl;
		}
		else if (clzt.equals("04"))
		{
			yfc=sl;
		}
		else if (clzt.equals("05"))
		{
			yht=sl;
		}
		else if (clzt.equals("06"))
		{
			yqr=sl;
		}
		else if (clzt.equals("07"))
		{
			yrk=sl;
		}
		else if (clzt.equals("08"))
		{
			yaz=sl;
		}
	}
	rs.close();
	ps.close();

	ddzl=wwc+ywc+ypd+ycc+yfc+yht+yqr+yrk+yaz;

	%>
	<tr align="center">
	<td>��  ��</td>
	<td>&nbsp;</td>
	<td><%=ddzl%></td>
	<td><%=htze%></td>
	<td><%=wwc%></td>
	<td><%=ywc%></td>
	<td><%=ypd%></td>
	<td><%=ycc%></td>
	<td><%=yfc%></td>
	<td><%=yht%></td>
	<td><%=yqr%></td>
	<td><%=yrk%></td>
	<td><%=yaz%></td>
	</tr>
</table>


<div align="center"><B>���ĺ�ͬͳ��</B><BR></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="14%">����</td>
  <td width="7%">��ĿרԱ</td>
  <td width="7%">��ͬ����</td>
  <td width="9%">��ͬ�ܶ�</td>
  <td width="7%">δ���</td>
  <td width="7%">�����</td>
  <td width="7%">��ͬ��ȷ��</td>
  <td width="7%">���ͻ�</td>
</tr>
<%
	//����Ԥ����ͳ��:��ϸ
	ls_sql="SELECT sq_dwxx.dwbh,sq_dwxx.dwmc,sq_xmzy.xmzy";
	ls_sql+=" FROM sq_dwxx,sq_xmzy";
    ls_sql+=" where sq_dwxx.dwbh=sq_xmzy.dwbh(+) and (dwlx='F2' and cxbz='N')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dwbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));

		ddzl=0;
		htze=0;
		wwc=0;
		ywc=0;
		ypd=0;
		ycc=0;
		yfc=0;
		yht=0;
		yqr=0;
		yrk=0;
		yaz=0;

		ls_sql="SELECT clzt,count(*),sum(hkze+zjhze)";
		ls_sql+=" FROM jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcdd.clzt!='99' ";
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and jc_zcdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by clzt";
		ls_sql+=" order by clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);

			//00������δ��ɣ�01����������ɣ�02��������ȷ�ϣ�03�����ͻ�
			if (clzt.equals("00"))
			{
				wwc=sl;
			}
			else if (clzt.equals("01"))
			{
				ywc=sl;
			}
			else if (clzt.equals("02"))
			{
				yqr=sl;
			}
			else if (clzt.equals("03"))
			{
				yaz=sl;
			}
		}
		rs.close();
		ps.close();

		ddzl=wwc+ywc+yqr+yaz;

		%>
		<tr align="center">
		<td><%=dwmc%></td>
		<td><%=xmzy%></td>
		<td><%=ddzl%></td>
		<td><%=htze%></td>
		<td><%=wwc%></td>
		<td><%=ywc%></td>
		<td><%=yqr%></td>
		<td><%=yaz%></td>
		</tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	ddzl=0;
	wwc=0;
	ywc=0;
	ypd=0;
	ycc=0;
	yfc=0;
	yht=0;
	yqr=0;
	yrk=0;
	yaz=0;

	//����Ԥ����ͳ��:�ϼ�
	ls_sql="SELECT clzt,count(*),sum(hkze+zjhze)";
	ls_sql+=" FROM jc_zcdd,crm_khxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.clzt!='99' ";
	ls_sql+=" and jc_zcdd.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" group by clzt";
	ls_sql+=" order by clzt";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clzt=rs.getString("clzt");
		sl=rs.getInt(2);
		htze+=rs.getDouble(3);

		//00������δ��ɣ�01����������ɣ�02��������ȷ�ϣ�03�����ͻ�
		if (clzt.equals("00"))
		{
			wwc=sl;
		}
		else if (clzt.equals("01"))
		{
			ywc=sl;
		}
		else if (clzt.equals("02"))
		{
			yqr=sl;
		}
		else if (clzt.equals("03"))
		{
			yaz=sl;
		}
	}
	rs.close();
	ps.close();

	ddzl=wwc+ywc+yqr+yaz;

	%>
	<tr align="center">
	<td>��  ��</td>
	<td>&nbsp;</td>
	<td><%=ddzl%></td>
	<td><%=htze%></td>
	<td><%=wwc%></td>
	<td><%=ywc%></td>
	<td><%=yqr%></td>
	<td><%=yaz%></td>
	</tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>