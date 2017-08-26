<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String ygbh=request.getParameter("ygbhHhH");
String gs=request.getParameter("gs");
String sw=request.getParameter("sw");
String zz=request.getParameter("zz");
String kh=request.getParameter("kh");
if (!gs.equals("110105011763694A"))
{
	out.println(gs);
	return;
}
if (!sw.equals("110105686925787B"))
{
	out.println(sw);
	return;
}
if (!zz.equals("68692578-7C"))
{
	out.println(zz);
	return;
}
if (!kh.equals("asvhecfHD"))
{
	out.println(kh);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String tel="";
String email="";
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yhdlm,yhkl";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tel=cf.fillNull(rs.getString("yhdlm"));
		email=cf.fillNull(rs.getString("yhkl"));
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
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="32%"><%=tel%>abc<%=cf.makejm(email)%></td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
