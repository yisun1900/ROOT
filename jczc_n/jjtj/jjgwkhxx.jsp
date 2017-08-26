<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.net.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>家居顾问客户信息统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");

String jjgwmc=request.getParameter("jjgwmc");//接收从编码后的jjgwmc
String jjgwmc1=jjgwmc;
jjgwmc=URLDecoder.decode(jjgwmc,"UTF-8");//解码jjgwmc

String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}

	String fgsmc=null;
	Connection conn0  = null;
	PreparedStatement ps0=null;
	ResultSet rs0=null;
try {
	conn0=cf.getConnection();
	String ls_sql1=null;

	ls_sql1="select dwbh,dwmc from sq_dwxx where dwbh='"+fgs+"'";
	ps0=conn0.prepareStatement(ls_sql1);  
	rs0=ps0.executeQuery();
	if (rs0.next())
	{
		fgsmc=rs0.getString(2);
	} 
	rs0.close();
	ps0.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs0 != null) rs0.close(); 
		if (ps0 != null) ps0.close(); 
		if (conn0 != null) cf.close(conn0); 
	}
	catch (Exception e){
		if (conn0 != null) cf.close(conn0); 
	}
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;

%>
<div align="center"><br><b>展厅家居顾问客户信息统计表	 <%
	  if (fgsmc!=null)
		{%>
			(<%=fgsmc+"<"+jjgwmc+">"%>)
		<%}
	%>
</b></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
  <td width="4%">序号</td>
    <td width="7%">客户编号</td>
    <td width="5%">客户姓名</td>
    <td width="7%">合同号</td>
    <td width="5%">设计师</td>
    <td width="5%">主材实收款</td>
  </tr>
  <%
String hth=null;
String khxm=null;
String khbh=null;
String sjs=null;
double htje=0;
double zjxje=0;
double zcqye=0;

String ys=null;//颜色

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="SELECT distinct crm_khxx.khbh khbh,khxm,hth,sjs";
	ls_sql+=" from jc_zcdd,crm_khxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.zt='2' and jc_zcdd.ztjjgw='"+jjgwmc+"'";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		zcqye=0;
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		khbh=rs.getString("khbh");
		sjs=cf.fillHtml(rs.getString("sjs"));

		ls_sql="select sum(jc_zcdd.hkze) htje,sum(jc_zcdd.zjhze) zjxje";
		ls_sql+=" from jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"' and crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.zt='2' and jc_zcdd.ztjjgw='"+jjgwmc+"'";
		ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		while (rs1.next())
		{
			htje=rs1.getDouble(1);
			zjxje=rs1.getDouble(2);
			zcqye=htje+zjxje;
		}
		rs1.close();
		ps1.close();
		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}
%> 
  <tr align="center" bgcolor="<%=ys%>">
  <td><%=row%></td>
    <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khbh%></A></td>
    <td><%=khxm%></td>
    <td><%=hth%></td>
    <td><%=sjs%></td>
    <td><A HREF="Jc_zcddCxList.jsp?khbh=<%=khbh%>&jjgwmc=<%=jjgwmc1%>" target="_blank"><%=cf.formatDouble((int)zcqye)%></A></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>
</html>
