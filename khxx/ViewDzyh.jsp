<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khxm=null;
String fwdz=null;


double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

String zjxzklx="";
String zjxzklxmc="";
double gczxzk=10;
double gcjxzk=10;
double zxglfzk=10;
double jxglfzk=10;
double zxsjzk=10;
double jxsjzk=10;

double clfzk=0;
double zcfzk=0;
double rgfzk=0;
double ysfzk=0;
double jxfzk=0;
double shfzk=0;
double qtfzk=0;

double hdzsjz=0;
double zjxhdzsjz=0;
double djjbfb=0;
double djjje=0;
double zjxdjjje=0;
double rzfbfb=0;
double htrzf=0;
double zjxrzf=0;

String djjzsfs="";
double zsgdje=0;
double zsbfb=0;
double zsje=0;


String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();


	ls_sql="select gcfqdzk,glfzk,sjzk,sjfzk ,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" ,zjxzklx,DECODE(zjxzklx,'1','ͬ��ͬ','2','�����ۿ�') zjxzklxmc,gczxzk,gcjxzk,zxglfzk,jxglfzk,zxsjzk,jxsjzk ";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
		zjxzklxmc=cf.fillNull(rs.getString("zjxzklxmc"));
		gczxzk=rs.getDouble("gczxzk");
		gcjxzk=rs.getDouble("gcjxzk");
		zxglfzk=rs.getDouble("zxglfzk");
		jxglfzk=rs.getDouble("jxglfzk");
		zxsjzk=rs.getDouble("zxsjzk");
		jxsjzk=rs.getDouble("jxsjzk");

		gcfqdzk=rs.getDouble("gcfqdzk");
		gczxzk=rs.getDouble("gczxzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");

		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();


	ls_sql="select DECODE(djjzsfs,'1','�̶����','2','���̷Ѱٷֱ�','3','�����ٷֱ�') djjzsfs,zsgdje,zsbfb,zsje ";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsgdje=rs.getDouble("zsgdje");
		zsbfb=rs.getDouble("zsbfb");
		zsje=rs.getDouble("zsje");
	}
	rs.close();
	ps.close();

	ls_sql="select hdzsjz,zjxhdzsjz,djjbfb,djjje,zjxdjjje,rzfbfb,htrzf,zjxrzf ";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hdzsjz=rs.getDouble("hdzsjz");
		zjxhdzsjz=rs.getDouble("zjxhdzsjz");
		djjbfb=rs.getDouble("djjbfb");
		djjje=rs.getDouble("djjje");
		zjxdjjje=rs.getDouble("zjxdjjje");

		rzfbfb=rs.getDouble("rzfbfb");
		htrzf=rs.getDouble("htrzf");
		zjxrzf=rs.getDouble("zjxrzf");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�ۿ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�ۿ�������Ϣ</div> 
<div align="center"></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF">
    <td width="21%" align="right"><strong>�ͻ���� </strong></td>
    <td width="29%"><%=khbh%></td>
    <td width="21%" align="right"><b>�ͻ�����</b></td>
    <td width="29%"><%=khxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><b>���ݵ�ַ</b></td>
    <td colspan="3" bgcolor="#CCCCFF"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>��˾�����</strong></td>
    <td colspan="3"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>С�������</strong></td>
    <td colspan="3"><%=cxhdbmxq%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>չ������</strong></td>
    <td colspan="3"><%=cxhdbmzh%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>��ע</strong></td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td colspan="4" align="center"><strong>�ۿ�</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̷�ǩ���ۿ�</td>
    <td><%=gcfqdzk%></td><td align="right">&nbsp;</td>
      <td>&nbsp;</td></tr>
  <tr bgcolor="#FFFFFF">
    <td height="21" align="right">������ۿ�</td>
    <td><%=glfzk%></td><td align="right">˰���ۿ�</td>
      <td><%=sjzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Ʒ��ۿ�</td>
    <td><%=sjfzk%></td><td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�����ְٷֱ�</td>
    <td><%=djjbfb%>%</td>
    <td align="right">��ͬ������</td>
    <td><%=djjje%></td>
  </tr>
</table>

</body>
</html>
