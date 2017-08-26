<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_bdgl_bdbh=null;
String xz_bdgl_bdmc=null;
String xz_bdgl_bdfj=null;
String xz_bdgl_fbsj=null;
String xz_bdgl_fbr=null;
String xz_bdgl_fbbm=null;
String xz_bdgl_lrr=null;
String xz_bdgl_bz=null;
String xz_bdgl_lrsj=null;
String wherexz_bdgl_bdbh=null;
wherexz_bdgl_bdbh=cf.GB2Uni(request.getParameter("bdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_bdgl.bdbh as xz_bdgl_bdbh,xz_bdgl.bdmc as xz_bdgl_bdmc,xz_bdgl.bdfj as xz_bdgl_bdfj,xz_bdgl.fbsj as xz_bdgl_fbsj,xz_bdgl.fbr as xz_bdgl_fbr,xz_bdgl.fbbm as xz_bdgl_fbbm,xz_bdgl.lrr as xz_bdgl_lrr,xz_bdgl.bz as xz_bdgl_bz,xz_bdgl.lrsj as xz_bdgl_lrsj ";
	ls_sql+=" from  sq_dwxx,xz_bdgl";
	ls_sql+=" where xz_bdgl.fbbm=sq_dwxx.dwbh and  (xz_bdgl.bdbh='"+wherexz_bdgl_bdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_bdgl_bdbh=cf.fillNull(rs.getString("xz_bdgl_bdbh"));
		xz_bdgl_bdmc=cf.fillNull(rs.getString("xz_bdgl_bdmc"));
		xz_bdgl_bdfj=cf.fillNull(rs.getString("xz_bdgl_bdfj"));
		xz_bdgl_fbsj=cf.fillNull(rs.getDate("xz_bdgl_fbsj"));
		xz_bdgl_fbr=cf.fillNull(rs.getString("xz_bdgl_fbr"));
		xz_bdgl_fbbm=cf.fillNull(rs.getString("xz_bdgl_fbbm"));
		xz_bdgl_lrr=cf.fillNull(rs.getString("xz_bdgl_lrr"));
		xz_bdgl_bz=cf.fillNull(rs.getString("xz_bdgl_bz"));
		xz_bdgl_lrsj=cf.fillNull(rs.getDate("xz_bdgl_lrsj"));
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
    <div align="right">表单编号</div>
  </td>
  <td width="35%"> 
    <%=xz_bdgl_bdbh%>
  </td>
  <td width="15%"> 
    <div align="right">表单名称</div>
  </td>
  <td width="35%"> 
    <%=xz_bdgl_bdmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">表单附件</div>
  </td>
  <td width="35%"> 
    <%=xz_bdgl_bdfj%>
  </td>
  <td width="15%"> 
    <div align="right">发布时间</div>
  </td>
  <td width="35%"> 
    <%=xz_bdgl_fbsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">发布人</div>
  </td>
  <td width="35%"> 
    <%=xz_bdgl_fbr%>
  </td>
  <td width="15%"> 
    <div align="right">发布部门</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"",xz_bdgl_fbbm,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">录入人</div>
  </td>
  <td width="35%"> 
    <%=xz_bdgl_lrr%>
  </td>
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=xz_bdgl_bz%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">录入时间</div>
  </td>
  <td width="35%"> 
    <%=xz_bdgl_lrsj%>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
