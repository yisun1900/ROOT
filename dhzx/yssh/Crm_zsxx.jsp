<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String ywy=null;
String sjs=null;

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String ssfgs=null;

double gcfqdzk=10;
double gcfzjxzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,xb,fwdz,lxfs,qtdh,email,ywy,sjs,cxhdbmxq,cxhdbmzh,cxhdbm,ssfgs ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		ywy=cf.fillNull(rs.getString("ywy"));
		sjs=cf.fillNull(rs.getString("sjs"));

		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		ssfgs=cf.fillNull(rs.getString("ssfgs"));

	}
	rs.close();
	ps.close();

	ls_sql="select gcfqdzk,gcfzjxzk,glfzk,sjzk,sjfzk";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfqdzk=rs.getDouble("gcfqdzk");
		gcfzjxzk=rs.getDouble("gcfzjxzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">促销活动（客户编号：<%=khbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">客户姓名</font></td>
              <td width="30%"><%=khxm%></td>
              <td width="19%" align="right"><font color="#0000FF">性别</font></td>
              <td width="31%"><%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">房屋地址</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">设计师</font></td>
              <td><%=sjs%></td>
              <td align="right"><font color="#0000FF">业务员</font></td>
              <td><%=ywy%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center">客户折扣</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">工程费签单折扣</font></td>
              <td><%=gcfqdzk%></td>
              <td align="right"><font color="#0000FF">工程费增减项折扣</font></td>
              <td><%=gcfzjxzk%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">管理费折扣</font></td>
              <td><%=glfzk%></td>
              <td align="right"><font color="#0000FF">税金折扣</font></td>
              <td><%=sjzk%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">设计费折扣</font></td>
              <td><%=sjfzk%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

<%
	String 	xmflmc=null;
	double zk=0;
	ls_sql="SELECT xmflmc,zk ";
	ls_sql+=" FROM crm_khbfxmzk,bdm_xmflbm  ";
	ls_sql+=" where crm_khbfxmzk.xmflbm=bdm_xmflbm.xmflbm(+) and khbh='"+khbh+"'";
	ls_sql+=" order by  crm_khbfxmzk.xmflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmflmc=cf.fillNull(rs.getString("xmflmc"));
		zk=rs.getDouble("zk");

		%>
		<tr bgcolor="#FFFFFF">
		  <td width="20%" align="right"><font color="#0000FF"><%=xmflmc%></font></td>
		  <td width="30%"><%=zk%></td>
		  <td colspan="2">部分工程项目打折，取代工程费折扣</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

%>
          </table>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="21%">赠送项目</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">成本单价</td>
	<td  width="8%">市场单价</td>
	<td  width="6%">下限</td>
	<td  width="6%">上限</td>
	<td  width="6%">数量</td>
	<td  width="9%">净值</td>
	<td  width="43%">备注</td>
</tr>
<%
	String zsxm=null;
	String jldw=null;
	double cbdj=0;
	double scdj=0;
	String zsslsx=null;
	String zsslxx=null;
	String bz=null;
	String sjsl=null;
	double zsjz=0;
	double xjzsjz=0;
	int row=0;


	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,sjsl,zsjz ";
	ls_sql+=" FROM crm_khzsxx  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by  zsxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		bz=cf.fillHtml(rs.getString("bz"));
		sjsl=cf.fillNull(rs.getString("sjsl"));
		zsjz=rs.getDouble("zsjz");

		xjzsjz+=zsjz;

		%>
		<tr align="center">
			<td><%=zsxm%></td>
			<td><%=jldw%></td>
			<td><%=cbdj%></td>
			<td><%=scdj%></td>
			<td><%=zsslxx%></td>
			<td><%=zsslsx%></td>
			<td><%=sjsl%></td>
			<td><%=zsjz%></td>
			<td><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
		<tr align="center">
			<td>小 计</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=xjzsjz%></td>
			<td>&nbsp;</td>
		</tr>
          </table>
		  
		  
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>