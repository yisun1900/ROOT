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
	  <td width="3%" align="center">序号</td>
	  <td width="9%" align="center">类别</td>
	  <td width="11%" align="center">项目</td>
	  <td width="12%" align="center">产品类别</td>
	  <td width="5%" align="center">选主材</td>
	  <td width="7%" align="center">实际数量</td>
	  <td width="5%" align="center">减免</td>
	  <td  width="7%" align="center">减免数量</td>
	  <td width="41%" align="center">说明</td>
    </tr>

					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="8" align="center">一</td>
					  <td rowspan="8" align="center">机加工类</td>
					  <td rowspan="4" align="center">门</td>
					  <td align="center">实木复合门</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=1&tccplbbm=6" target="_blank">选择</a></td>
					  <td align="center">0.0</td>
					  <td rowspan="4" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">减免</a></td>
					  <td align="center">0.0</td>
					  <td align="left"></td>
    </tr>
					<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>门吸</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=1&tccplbbm=6" target="_blank">选择</a></td>
					  <td>0.0</td>
					  <td>0.0</td>
					  <td align="left"></td>
				    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>门锁</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=1&tccplbbm=6" target="_blank">选择</a></td>
					  <td>0.0</td>
					  <td>0.0</td>
					  <td align="left"></td>
				    </tr>
					<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>合页</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=1&tccplbbm=6" target="_blank">选择</a></td>
					  <td>0.0</td>
					  <td>0.0</td>
					  <td align="left"></td>
				    </tr>
					
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="4">橱柜</td>
						  <td>台面</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=2&tccplbbm=9" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="4"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0008" target="_blank"></a><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0007" target="_blank">减免</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>吊柜</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=2&tccplbbm=8" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>地柜</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=2&tccplbbm=7" target="_blank">选择</a></td>
					  <td>0.0</td>
					  <td>0.0</td>
					  <td align="left">&nbsp;</td>
    </tr>

						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>橱柜五金</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=2&tccplbbm=9" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						

					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="12" align="center">二</td>
					  <td rowspan="12" align="center">洁具</td>
					  <td rowspan="4" align="center">主卫生间</td>
					  <td align="center">座便器</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=13" target="_blank">选择</a></td>
					  <td align="center">2.0</td>
					  <td rowspan="4" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">减免</a></td>
					  <td align="center">0.0</td>
					  <td align="left">&nbsp;</td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>龙头</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=14" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
					  </tr>
						
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>花洒</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=15" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
					  </tr>
						
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>驻盆/浴室柜</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=16" target="_blank">选择</a></td>
						  <td>2.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
					  </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="4">次卫生间</td>
						  <td>座便器</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=13" target="_blank">选择</a></td>
						  <td>2.0</td>
						  <td rowspan="4"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">减免</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>龙头</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=14" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>花洒</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=15" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>驻盆</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=16" target="_blank">选择</a></td>
						  <td>2.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td rowspan="4">次卫生间一</td>
						  <td>座便器</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=13" target="_blank">选择</a></td>
						  <td>2.0</td>
						  <td rowspan="4"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">减免</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>龙头</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=14" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>花洒</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=15" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>驻盆</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=4&tccplbbm=16" target="_blank">选择</a></td>
						  <td>2.0</td>
						  <td>0.0</td>
						  <td align="left"></td>
    </tr>
						
					    <tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					      <td rowspan="18" align="center">三</td>
					      <td rowspan="18" align="center">瓷砖</td>
					      <td rowspan="4" align="center">厨房</td>
					      <td align="center">墙砖</td>
					      <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">选择</a></td>
					      <td align="center">0.0</td>
					      <td  rowspan="1" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">减免</a></td>
					      <td align="center">0.0</td>
					      <td align="left">&nbsp;</td>
    </tr>
					    <tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					      <td>地砖</td>
					      <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">选择</a></td>
					      <td>0.0</td>
					      <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">减免</a></td>
					      <td>0.0</td>
					      <td align="left">&nbsp;</td>
    </tr>
					    <tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					      <td bgcolor="#FFFFFF">腰线（套餐外）</td>
					      <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">选择</a></td>
					      <td>&nbsp;</td>
					      <td>&nbsp;</td>
					      <td>&nbsp;</td>
					      <td align="left">需额外收费</td>
    </tr>
					    <tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					      <td bgcolor="#FFFFFF">花片（套餐外）</td>
					      <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">选择</a></td>
					      <td>0.0</td>
					      <td  rowspan="1">&nbsp;</td>
					      <td>&nbsp;</td>
					      <td align="left">需额外收费</td>
    </tr>
					    
				    <tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				      <td rowspan="4">主卫生间</td>
					  <td>墙砖</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">选择</a></td>
					  <td>0.0</td>
					  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">减免</a></td>
					  <td>0.0</td>
					  <td align="left">&nbsp;</td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>地砖</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=18" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">减免</a><a href="qxzcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0018" target="_blank"></a></td>
						  <td>4.0</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>腰线（套餐外）</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">选择</a></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">需额外收费</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>花片（套餐外）</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1">&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">需额外收费</td>
					  </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="4">次卫生间</td>
						  <td>墙砖</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">减免</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>地砖</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=18" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">减免</a><a href="qxzcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0018" target="_blank"></a></td>
						  <td>4.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>腰线（套餐外）</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">选择</a></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">需额外收费</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>花片（套餐外）</td>
                          <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1">&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">需额外收费</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td rowspan="4">次卫生间一</td>
						  <td>墙砖</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=17" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0017" target="_blank">减免</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>地砖</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=18" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=2&tcsjflbm=0009" target="_blank">减免</a><a href="qxzcjm.jsp?khbh=0000526&tccpdlbm=5&tcsjflbm=0018" target="_blank"></a></td>
						  <td>4.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>腰线（套餐外）</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">选择</a></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">需额外收费</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td>花片（套餐外）</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=5&tccplbbm=20" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1">&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">需额外收费</td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="2">大地砖</td>
					  <td>踢脚线</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left">&nbsp;</td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>大地砖</td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=14&tccplbbm=37" target="_blank">选择</a></td>
					  <td>0.0</td>
					  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=14&tcsjflbm=0037" target="_blank">减免</a></td>
					  <td>0.0</td>
					  <td align="left">&nbsp;</td>
				    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="4" align="center">四</td>
						  <td rowspan="4" align="center">铝扣板</td>
						  <td align="center">厨房</td>
						  <td align="center">吊顶</td>
						  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=7&tccplbbm=24" target="_blank">选择</a></td>
						  <td align="center">0.0</td>
						  <td  rowspan="1" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=7&tcsjflbm=0024" target="_blank">减免</a></td>
						  <td align="center">0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="1">主卫生间</td>
						  <td>吊顶</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=7&tccplbbm=24" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=7&tcsjflbm=0024" target="_blank">减免</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="1">次卫生间</td>
						  <td>吊顶</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=7&tccplbbm=24" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=7&tcsjflbm=0024" target="_blank">减免</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
                          <td rowspan="1">次卫生间一</td>
						  <td>吊顶</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=7&tccplbbm=24" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td  rowspan="1"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=7&tcsjflbm=0024" target="_blank">减免</a></td>
						  <td>0.0</td>
						  <td align="left">&nbsp;</td>
    </tr>
						
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="2" align="center">五</td>
					  <td colspan="2" rowspan="2" align="center">地板</td>
					  <td align="center">地板</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=6&tccplbbm=22" target="_blank">选择</a></td>
					  <td align="center">0.0</td>
					  <td  rowspan="1" align="center"><a href="zcjm.jsp?khbh=0000526&tccpdlbm=6&tcsjflbm=0022" target="_blank">减免</a></td>
					  <td align="center">0.0</td>
					  <td align="left">&nbsp;</td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>踢脚线</td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=6&tccplbbm=23" target="_blank">选择</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>0.0</td>
						  <td align="left"></td>
					  </tr>
					
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1" align="center">六</td>
					  <td colspan="3" rowspan="1" align="center">壁纸（套餐外）</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=14&tccplbbm=37" target="_blank">选择</a></td>
					  <td align="center">&nbsp;</td>
					  <td  rowspan="1" align="center">&nbsp;</td>
					  <td align="center">&nbsp;</td>
					  <td align="left">需额外收费</td>
				    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1" align="center">七</td>
					  <td colspan="3" rowspan="1" align="center">套餐外主材</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=14&tccplbbm=37" target="_blank">选择</a></td>
					  <td align="center">&nbsp;</td>
					  <td  rowspan="1" align="center">&nbsp;</td>
					  <td align="center">&nbsp;</td>
					  <td align="left">需额外收费</td>
				    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1" align="center">八</td>
					  <td colspan="2" rowspan="1" align="center">油漆</td>
					  <td align="center">品牌、色号</td>
					  <td align="center"><a href="InsertBj_khzcxm.jsp?khbh=0000526&tccpdlbm=14&tccplbbm=37" target="_blank">选择</a></td>
					  <td align="center">&nbsp;</td>
					  <td  rowspan="1" align="center">&nbsp;</td>
					  <td align="center">&nbsp;</td>
					  <td align="left">标准3个颜色，每增加1个加200</td>
				    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="11" align="center">九</td>
					  <td rowspan="11" align="center">礼包项</td>
					  <td rowspan="2" align="center">石材</td>
					  <td align="center">过门石</td>
					  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=11&tcsjflbm=0032">升级</a></td>
					  <td align="center">0.0</td>
					  <td align="center">&nbsp;</td>
					  <td align="center">&nbsp;</td>
					  <td align="left"></td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>窗台石</td>
						  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=11&tcsjflbm=0033">升级</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left"></td>
					  </tr>
						
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="4">厨房电器</td>
					  <td>烟机</td>
					  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=3&tcsjflbm=0011">升级</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left">&nbsp;</td>
				    </tr>
					
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>灶台</td>
						  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=3&tcsjflbm=0012">升级</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>水槽</td>
						  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=3&tcsjflbm=0012">升级</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						<tr bgcolor="#E8E8FF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td>消毒柜</td>
						  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=3&tcsjflbm=0012">升级</a></td>
						  <td>0.0</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td align="left">&nbsp;</td>
					  </tr>
						

						
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1">开关面板</td>
					  <td>插座</td>
					  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=12&tcsjflbm=0035">升级</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
				    </tr>
					
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>水槽</td>
					  <td>水槽</td>
					  <td><a href="zcsj.jsp?khbh=0000526&tccpdlbm=12&tcsjflbm=0035">升级</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>卫浴小五金</td>
					  <td>卫浴小五金</td>
					  <td><a href="zcsj.jsp?khbh=0000526&tccpdlbm=12&tcsjflbm=0035">升级</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td>卫生间挂件</td>
					  <td>卫生间挂件</td>
					  <td><a href="zcsj.jsp?khbh=0000526&tccpdlbm=12&tcsjflbm=0035">升级</a></td>
					  <td>0.0</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="left"></td>
    </tr>
					<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="1">吸顶灯</td>
					  <td>吸顶灯</td>
					  <td  rowspan="1"><a href="zcsj.jsp?khbh=0000526&tccpdlbm=13&tcsjflbm=0036">升级</a></td>
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
	out.print("发生意外: " + e);
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
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
//-->
</script>

