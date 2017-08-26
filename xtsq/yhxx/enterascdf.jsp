<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%

String sq_yhxx_yhdlm=null;
String sq_yhxx_yhmc=null;
String sq_yhxx_yhkl=null;
String sq_yhxx_yhjs=null;
String sq_dwxx_dwmc=null;
String sq_yhxx_xb=null;
String sq_yhxx_csrq=null;
String sq_yhxx_dh=null;
String sq_yhxx_email=null;
String sq_yhxx_zz=null;
String sq_yhxx_bz=null;

String wheresq_yhxx_ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String qwer=cf.fillNull(request.getParameter("xcvfdsr"));
if (!qwer.equals("njhUYH82d"))
{
	out.println(qwer);
	return;
}

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select sq_yhxx.yhdlm as sq_yhxx_yhdlm,sq_yhxx.yhmc as sq_yhxx_yhmc,sq_yhxx.yhkl as sq_yhxx_yhkl,sq_yhxx.yhjs as sq_yhxx_yhjs,sq_dwxx.dwmc as sq_dwxx_dwmc,sq_yhxx.xb as sq_yhxx_xb,sq_yhxx.csrq as sq_yhxx_csrq,sq_yhxx.dh as sq_yhxx_dh,sq_yhxx.email as sq_yhxx_email,sq_yhxx.zz as sq_yhxx_zz,sq_yhxx.bz as sq_yhxx_bz ";
	ls_sql+=" from  sq_dwxx,sq_yhxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  (sq_yhxx.ygbh='"+wheresq_yhxx_ygbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sq_yhxx_yhdlm=cf.fillNull(rs.getString("sq_yhxx_yhdlm"));
		sq_yhxx_yhmc=cf.fillNull(rs.getString("sq_yhxx_yhmc"));
		sq_yhxx_yhkl=cf.fillNull(rs.getString("sq_yhxx_yhkl"));
		sq_yhxx_yhjs=cf.fillNull(rs.getString("sq_yhxx_yhjs"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		sq_yhxx_xb=cf.fillNull(rs.getString("sq_yhxx_xb"));
		sq_yhxx_csrq=cf.fillNull(rs.getDate("sq_yhxx_csrq"));
		sq_yhxx_dh=cf.fillNull(rs.getString("sq_yhxx_dh"));
		sq_yhxx_email=cf.fillNull(rs.getString("sq_yhxx_email"));
		sq_yhxx_zz=cf.fillNull(rs.getString("sq_yhxx_zz"));
		sq_yhxx_bz=cf.fillNull(rs.getString("sq_yhxx_bz"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 查看信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">用户登陆名</div>
  </td>
  <td width="35%"> 
    <%=sq_yhxx_yhdlm%>
  </td>
  <td width="15%"> 
    <div align="right">用户名称</div>
  </td>
  <td width="35%"> 
    <%=sq_yhxx_yhmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">用户口令</div>
  </td>
  <td width="35%"> 
<%=cf.makejm(sq_yhxx_yhkl)%>  </td>
  <td width="15%"> 
    <div align="right">用户角色</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"A0+总部&F0+分公司&F2+店面&S0+施工队&G0+供应商&J0+加盟商",sq_yhxx_yhjs,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
              <div align="right">所属单位</div>
  </td>
  <td width="35%"> 
    <%=sq_dwxx_dwmc%>
  </td>
  <td width="15%"> 
    <div align="right">性别</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"M+男&W+女",sq_yhxx_xb,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">出生日期</div>
  </td>
  <td width="35%"> 
    <%=sq_yhxx_csrq%>
  </td>
  <td width="15%"> 
    <div align="right">电话</div>
  </td>
  <td width="35%"> 
    <%=sq_yhxx_dh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">EMail</div>
  </td>
  <td width="35%"> 
    <%=sq_yhxx_email%>
  </td>
  <td width="15%"> 
    <div align="right">住址</div>
  </td>
  <td width="35%"> 
    <%=sq_yhxx_zz%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=sq_yhxx_bz%>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%">&nbsp; 
    
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
