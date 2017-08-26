<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String oa_lqsq_slr=null;
String oa_lqsq_sqrq=null;
String oa_lqsq_jhlqsl=null;
String oa_lqsq_jhlqrq=null;
String oa_lqsq_lqzt=null;
String oa_lqsq_slqsl=null;
String oa_lqsq_blr=null;
String oa_lqsq_lqsj=null;
String oa_lqsq_bz=null;
String oa_bgypbm_bgypmc=null;
String oa_lqsq_xh=null;
String whereoa_lqsq_xh=null;
whereoa_lqsq_xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select oa_lqsq.slr as oa_lqsq_slr,oa_lqsq.sqrq as oa_lqsq_sqrq,oa_lqsq.jhlqsl as oa_lqsq_jhlqsl,oa_lqsq.jhlqrq as oa_lqsq_jhlqrq,oa_lqsq.lqzt as oa_lqsq_lqzt,oa_lqsq.slqsl as oa_lqsq_slqsl,oa_lqsq.blr as oa_lqsq_blr,oa_lqsq.lqsj as oa_lqsq_lqsj,oa_lqsq.bz as oa_lqsq_bz,oa_bgypbm.bgypmc as oa_bgypbm_bgypmc,oa_lqsq.xh as oa_lqsq_xh ";
	ls_sql+=" from  oa_bgypbm,oa_lqsq";
	ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm and  (oa_lqsq.xh="+whereoa_lqsq_xh+")  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		oa_lqsq_slr=cf.fillNull(rs.getString("oa_lqsq_slr"));
		oa_lqsq_sqrq=cf.fillNull(rs.getDate("oa_lqsq_sqrq"));
		oa_lqsq_jhlqsl=cf.fillNull(rs.getString("oa_lqsq_jhlqsl"));
		oa_lqsq_jhlqrq=cf.fillNull(rs.getDate("oa_lqsq_jhlqrq"));
		oa_lqsq_lqzt=cf.fillNull(rs.getString("oa_lqsq_lqzt"));
		oa_lqsq_slqsl=cf.fillNull(rs.getString("oa_lqsq_slqsl"));
		oa_lqsq_blr=cf.fillNull(rs.getString("oa_lqsq_blr"));
		oa_lqsq_lqsj=cf.fillNull(rs.getDate("oa_lqsq_lqsj"));
		oa_lqsq_bz=cf.fillNull(rs.getString("oa_lqsq_bz"));
		oa_bgypbm_bgypmc=cf.fillNull(rs.getString("oa_bgypbm_bgypmc"));
		oa_lqsq_xh=cf.fillNull(rs.getString("oa_lqsq_xh"));
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
<div align="center">领取办公用品</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">申请序号</div>
    </td>
    <td width="32%"> <%=oa_lqsq_xh%> </td>
    <td width="18%"> 
      <div align="right">办公用品名称</div>
    </td>
    <td width="32%"><%=oa_bgypbm_bgypmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">申领人</div>
    </td>
    <td width="32%"> <%=oa_lqsq_slr%> </td>
    <td width="18%"> 
      <div align="right">申请日期</div>
    </td>
    <td width="32%"> <%=oa_lqsq_sqrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">计划领取数量</div>
    </td>
    <td width="32%"> <%=oa_lqsq_jhlqsl%> </td>
    <td width="18%"> 
      <div align="right">计划领取日期</div>
    </td>
    <td width="32%"> <%=oa_lqsq_jhlqrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">领取状态</div>
    </td>
    <td width="32%"> <%
	cf.selectToken(out,"N+未领取&Y+已领取",oa_lqsq_lqzt,true);
%> </td>
    <td width="18%"> 
      <div align="right">实领取数量</div>
    </td>
    <td width="32%"> <%=oa_lqsq_slqsl%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">办理人</div>
    </td>
    <td width="32%"> <%=oa_lqsq_blr%> </td>
    <td width="18%"> 
      <div align="right">领取时间</div>
    </td>
    <td width="32%"> <%=oa_lqsq_lqsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">备注</div>
    </td>
    <td colspan="3"> <%=oa_lqsq_bz%> 
    </td>
  </tr>
</table>
</body>
</html>
