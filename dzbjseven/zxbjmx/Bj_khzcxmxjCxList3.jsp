<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int xmpx=0;
double dj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();

	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;'  >
<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="0000526" >

  <table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td width="3%" align="center">���</td>
	  <td width="9%" align="center">���</td>
	  <td width="11%" align="center">��Ŀ</td>
	  <td width="12%" align="center">��Ʒ���</td>
	  <td width="5%" align="center">ѡ����</td>
	  <td width="7%" align="center">ʵ������</td>
	  <td width="5%" align="center">����</td>
	  <td  width="7%" align="center">��������</td>
	  <td width="41%" align="center">˵��</td>
    </tr>

					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="8" align="center">һ</td>
					  <td rowspan="8" align="center">���ӹ���</td>
					  <td rowspan="4" align="center">��</td>
					  <td align="center">ʵľ������</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=1&tccplbbm=6" target="_blank">ѡ��</a></td>
					  <td align="center">0.0</td>
					  <td rowspan="4" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">����</a></td>
					  <td align="center">0.0</td>
					  <td align="left"></td>
    </tr>
					<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>����</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=1&tccplbbm=6" target="_blank">ѡ��</a></td>
					  <td>0.0</td>
					  <td>0.0</td>
					  <td align="left"></td>
				    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>����</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=1&tccplbbm=6" target="_blank">ѡ��</a></td>
					  <td>0.0</td>
					  <td>0.0</td>
					  <td align="left"></td>
				    </tr>
					<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>��ҳ</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=1&tccplbbm=6" target="_blank">ѡ��</a></td>
					  <td>0.0</td>
					  <td>0.0</td>
					  <td align="left"></td>
				    </tr>
					
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="4">����</td>
						  <td>̨��</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=2&tccplbbm=9" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="4"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0008" target="_blank"></a><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0007" target="_blank">����</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>����</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=2&tccplbbm=8" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>�ع�</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=2&tccplbbm=7" target="_blank">ѡ��</a></td>
					  <td>0.0</td>
					  <td>0.0</td>
					  <td align="left">&nbsp;</td>
    </tr>

						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>�������</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=2&tccplbbm=9" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						

					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="12" align="center">��</td>
					  <td rowspan="12" align="center">���</td>
					  <td rowspan="4" align="center">��������</td>
					  <td align="center">������</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=13" target="_blank">ѡ��</a></td>
					  <td align="center">2.0</td>
					  <td rowspan="4" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">����</a></td>
					  <td align="center">0.0</td>
					  <td align="left">&nbsp;</td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>��ͷ</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=14" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
					  </tr>
						
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>����</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=15" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
					  </tr>
						
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>פ��/ԡ�ҹ�</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=16" target="_blank">ѡ��</a></td>
						  <td>2.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
					  </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="4">��������</td>
						  <td>������</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=13" target="_blank">ѡ��</a></td>
						  <td>2.0</td>
						  <td rowspan="4"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">����</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>��ͷ</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=14" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>����</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=15" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>פ��</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=16" target="_blank">ѡ��</a></td>
						  <td>2.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td rowspan="4">��������һ</td>
						  <td>������</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=13" target="_blank">ѡ��</a></td>
						  <td>2.0</td>
						  <td rowspan="4"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">����</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>��ͷ</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=14" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>����</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=15" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>פ��</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=16" target="_blank">ѡ��</a></td>
						  <td>2.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						
					    <tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					      <td rowspan="18" align="center">��</td>
					      <td rowspan="18" align="center">��ש</td>
					      <td rowspan="4" align="center">����</td>
					      <td align="center">ǽש</td>
					      <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">ѡ��</a></td>
					      <td align="center">0.0</td>
					      <td  rowspan="1" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">����</a></td>
					      <td align="center">0.0</td>
					      <td align="left">&nbsp;</td>
    </tr>
					    <tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					      <td>��ש</td>
					      <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">ѡ��</a></td>
					      <td>0.0</td>
					      <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">����</a></td>
					      <td>0.0</td>
					      <td align="left">&nbsp;</td>
    </tr>
					    <tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					      <td bgcolor="#FFFFFF">���ߣ��ײ��⣩</td>
					      <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">ѡ��</a></td>
					      <td>&nbsp;</td>
					      <td>&nbsp;</td>
					      <td>&nbsp;</td>
					      <td align="left">������շ�</td>
    </tr>
					    <tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					      <td bgcolor="#FFFFFF">��Ƭ���ײ��⣩</td>
					      <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">ѡ��</a></td>
					      <td>0.0</td>
					      <td  rowspan="1">&nbsp;</td>
					      <td>&nbsp;</td>
					      <td align="left">������շ�</td>
    </tr>
					    
				    <tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				      <td rowspan="4">��������</td>
					  <td>ǽש</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">ѡ��</a></td>
					  <td>0.0</td>
					  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">����</a></td>
					  <td>0.0</td>
					  <td align="left">&nbsp;</td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>��ש</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=18" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">����</a><a href="qxzcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0018" target="_blank"></a></td>
						  <td>4.0</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>���ߣ��ײ��⣩</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">ѡ��</a></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">������շ�</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>��Ƭ���ײ��⣩</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1">&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">������շ�</td>
					  </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="4">��������</td>
						  <td>ǽש</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">����</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>��ש</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=18" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">����</a><a href="qxzcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0018" target="_blank"></a></td>
						  <td>4.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>���ߣ��ײ��⣩</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">ѡ��</a></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">������շ�</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>��Ƭ���ײ��⣩</td>
                          <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1">&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">������շ�</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td rowspan="4">��������һ</td>
						  <td>ǽש</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">����</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>��ש</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=18" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">����</a><a href="qxzcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0018" target="_blank"></a></td>
						  <td>4.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>���ߣ��ײ��⣩</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">ѡ��</a></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">������շ�</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>��Ƭ���ײ��⣩</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1">&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">������շ�</td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="2">���ש</td>
					  <td>�߽���</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left">&nbsp;</td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>���ש</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=14&tccplbbm=37" target="_blank">ѡ��</a></td>
					  <td>0.0</td>
					  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=14&tcsjflbm=0037" target="_blank">����</a></td>
					  <td>0.0</td>
					  <td align="left">&nbsp;</td>
				    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="4" align="center">��</td>
						  <td rowspan="4" align="center">���۰�</td>
						  <td align="center">����</td>
						  <td align="center">����</td>
						  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=7&tccplbbm=24" target="_blank">ѡ��</a></td>
						  <td align="center">0.0</td>
						  <td  rowspan="1" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=7&tcsjflbm=0024" target="_blank">����</a></td>
						  <td align="center">0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="1">��������</td>
						  <td>����</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=7&tccplbbm=24" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=7&tcsjflbm=0024" target="_blank">����</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="1">��������</td>
						  <td>����</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=7&tccplbbm=24" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=7&tcsjflbm=0024" target="_blank">����</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td rowspan="1">��������һ</td>
						  <td>����</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=7&tccplbbm=24" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=7&tcsjflbm=0024" target="_blank">����</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="2" align="center">��</td>
					  <td colspan="2" rowspan="2" align="center">�ذ�</td>
					  <td align="center">�ذ�</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=6&tccplbbm=22" target="_blank">ѡ��</a></td>
					  <td align="center">0.0</td>
					  <td  rowspan="1" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=6&tcsjflbm=0022" target="_blank">����</a></td>
					  <td align="center">0.0</td>
					  <td align="left">&nbsp;</td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>�߽���</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=6&tccplbbm=23" target="_blank">ѡ��</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>0.0</td>
						  <td align="left"></td>
					  </tr>
					
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1" align="center">��</td>
					  <td colspan="3" rowspan="1" align="center">��ֽ���ײ��⣩</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=14&tccplbbm=37" target="_blank">ѡ��</a></td>
					  <td align="center">&nbsp;</td>
					  <td  rowspan="1" align="center">&nbsp;</td>
					  <td align="center">&nbsp;</td>
					  <td align="left">������շ�</td>
				    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1" align="center">��</td>
					  <td colspan="3" rowspan="1" align="center">�ײ�������</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=14&tccplbbm=37" target="_blank">ѡ��</a></td>
					  <td align="center">&nbsp;</td>
					  <td  rowspan="1" align="center">&nbsp;</td>
					  <td align="center">&nbsp;</td>
					  <td align="left">������շ�</td>
				    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1" align="center">��</td>
					  <td colspan="2" rowspan="1" align="center">����</td>
					  <td align="center">Ʒ�ơ�ɫ��</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=14&tccplbbm=37" target="_blank">ѡ��</a></td>
					  <td align="center">&nbsp;</td>
					  <td  rowspan="1" align="center">&nbsp;</td>
					  <td align="center">&nbsp;</td>
					  <td align="left">��׼3����ɫ��ÿ����1����200</td>
				    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="11" align="center">��</td>
					  <td rowspan="11" align="center">�����</td>
					  <td rowspan="2" align="center">ʯ��</td>
					  <td align="center">����ʯ</td>
					  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=11&tcsjflbm=0032">����</a></td>
					  <td align="center">0.0</td>
					  <td align="center">&nbsp;</td>
					  <td align="center">&nbsp;</td>
					  <td align="left"></td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>��̨ʯ</td>
						  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=11&tcsjflbm=0033">����</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left"></td>
					  </tr>
						
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="4">��������</td>
					  <td>�̻�</td>
					  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=3&tcsjflbm=0011">����</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left">&nbsp;</td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>��̨</td>
						  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=3&tcsjflbm=0012">����</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>ˮ��</td>
						  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=3&tcsjflbm=0012">����</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>������</td>
						  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=3&tcsjflbm=0012">����</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						

						
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1">�������</td>
					  <td>����</td>
					  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=12&tcsjflbm=0035">����</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
				    </tr>
					
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>ˮ��</td>
					  <td>ˮ��</td>
					  <td><a href="zcsj.jsp?khbh=0000526&tccpdlbm=12&tcsjflbm=0035">����</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>��ԡС���</td>
					  <td>��ԡС���</td>
					  <td><a href="zcsj.jsp?khbh=0000526&tccpdlbm=12&tcsjflbm=0035">����</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>������Ҽ�</td>
					  <td>������Ҽ�</td>
					  <td><a href="zcsj.jsp?khbh=0000526&tccpdlbm=12&tcsjflbm=0035">����</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1">������</td>
					  <td>������</td>
					  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=13&tcsjflbm=0036">����</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
				    </tr>
  </table>

</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}
//-->
</script>

