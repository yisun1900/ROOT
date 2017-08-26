<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%

String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String fssj=null;
String khxm=null;
double jzjje=0;
double zhguanlif=0;
double zjxsuijin=0;
double kglf=0;
double zjxrzf=0;
double zjxdjjje=0;
double kqtk=0;


int row=0;

String xmmc=null;
String bgxm=null;
String jldw=null;
double dj=0;
double sl=0;
double je=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_zjxdj.zjxxh,crm_zjxdj.khbh,crm_zjxdj.fssj,crm_khxx.khxm,jzjje,crm_zjxdj.zhguanlif,crm_zjxdj.zjxsuijin,crm_zjxdj.kglf,zjxrzf,zjxdjjje,crm_zjxdj.kqtk ";
	ls_sql+=" from  crm_zjxdj,crm_khxx";
	ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fssj=cf.fillNull(rs.getDate("fssj"));
		khxm=cf.fillNull(rs.getString("khxm"));
		jzjje=rs.getDouble("jzjje");
		zhguanlif=rs.getDouble("zhguanlif");
		zjxsuijin=rs.getDouble("zjxsuijin");
		kglf=rs.getDouble("kglf");
		zjxrzf=rs.getDouble("zjxrzf");
		zjxdjjje=rs.getDouble("zjxdjjje");
		kqtk=rs.getDouble("kqtk");

	}
	else{
		rs.close();
		ps.close();

		return;
	}
%>
<html>
<head>
<title>施工洽商变更单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>

<body bgcolor="#FFFFFF">
<div align="center">
<p><b>
<font size="5">施&nbsp;工&nbsp;洽&nbsp;商&nbsp;变&nbsp;更&nbsp;单（市场认证增减项情况）</font>
</b></p>
</div>

<table width="100%" height="72" border="0">
  <tr>
    <td width="50%">客户（甲方）：<%=khxm%></td>
    <td width="50%">开工前&nbsp;□&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开工后&nbsp;□</td>
  </tr>
  <tr>
    <td>工程最终增减合计金额：<%=cf.formatDouble(jzjje+zhguanlif+zjxsuijin+kglf+zjxrzf+zjxdjjje-kqtk)%>元</td>
    <td>变更日期：<%=fssj%></td>
  </tr>
</table>
<p>工程增项：</p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="50%">项目名称</td>
    <td  width="10%">单位</td>
	<td  width="10%">数量</td>
    <td  width="10%">单价</td>
    <td  width="20%">合计</td>
   </tr>
<%

try {
	conn=cf.getConnection();

	String lx=null;
	String lxmc=null;

	double allje=0;
	double xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','增项','2','减项') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='1'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=je%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<tr bgcolor="#FFFFF"  align="left"> 
	  <td colspan="4">增项合计金额：<%=cf.formatDouble(xj)%>元</td>
	</tr>
  <p>工程减项：</p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="50%">项目名称</td>
    <td  width="10%">单位</td>
	<td  width="10%">数量</td>
    <td  width="10%">单价</td>
    <td  width="20%">合计</td>
  </tr>
<%
	xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','增项','2','减项') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=je%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<tr bgcolor="#FFFFF"  align="left"> 
	  <td colspan="4">减项合计金额：<%=cf.formatDouble(xj)%>元</td>
	</tr>
          
<table width="100%" height="72" border="0">
  <tr>
    <td width="25%">工长：</td>
    <td width="25%">家装设计师：</td>
    <td width="25%">项目管家：</td>
    <td width="25%">客户：</td>
  </tr>
  <tr>
    <td width="25%">日期：</td>
    <td width="25%">日期：</td>
    <td width="25%">日期：</td>
    <td width="25%">日期：</td>
  </tr>
</table>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>电路改造项目：（报价中预收电路金额：<%=%>元）</p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="50%">项目名称</td>
    <td  width="10%">单位</td>
	<td  width="10%">数量</td>
    <td  width="10%">单价</td>
    <td  width="20%">合计</td>
  </tr>
<%
	xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','增项','2','减项') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=je%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
          <p>电路改造合计减去预收电路金额：<%=%>元</p>
          <hr>
<p>水路改造项目：（报价中预收水路金额：<%=%>元）</p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="50%">项目名称</td>
    <td  width="10%">单位</td>
	<td  width="10%">数量</td>
    <td  width="10%">单价</td>
    <td  width="20%">合计</td>
  </tr>
<%
	xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','增项','2','减项') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=je%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
          <p>水路改造合计减去预收水路金额：<%=%>元</p>
          <hr>
          <p>其他变更费用：<%=%></p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="25%">项目</td>
    <td  width="10%">比率</td>
	<td  width="55%">计算方法</td>
    <td  width="10%">合计金额</td>
  </tr>
<%
	xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','增项','2','减项') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<table width="100%" height="72" border="0">
            <tr>
              <td width="25%">工长：</td>
              <td width="25%">家装设计师：</td>
              <td width="25%">项目管家：</td>
              <td width="25%">客户：</td>
            </tr>
            <tr>
              <td width="25%">日期：</td>
              <td width="25%">日期：</td>
              <td width="25%">日期：</td>
              <td width="25%">日期：</td>
            </tr>
</table>
<p>备注：</p>
<p>&nbsp;</p>
<p>开工前零售业务部减项确认：</p>
<p>&nbsp;</p>
<p>开工后分公司管理一部减项确认：</p>
<p>&nbsp;</p>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>