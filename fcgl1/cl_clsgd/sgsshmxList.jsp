<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String wheresgph=cf.GB2Uni(request.getParameter("sgph"));
%>
<style type="text/css">
　　.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料申购单(批号：<%=wheresgph%>)</font></B>
</CENTER>
<form method="post" action="savedgdshmx.jsp" name="selectform" target="_back">
<table width="100%" bgcolor="#000000"  style='FONT-SIZE: 12px' border="1" cellspacing="1">
  <tr align="center" bgcolor="#cccccc"> 
	<td width="5%">申购批号</td>
	<td width="5%">材料编码</td>
	<td width="5%">申购数量</td>
	<td width="5%">审核数量</td>
	<td width="20%">材料名称</td>
	<td width="20%">材料规格</td>
  </tr>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String sgph=null;
String clbm=null;
String clmc=null;
String clgg=null;
String sgsl=null;
int i=0;
String bg1="E8E8FF";
String bg2="FFFFFF";
try {
	conn=cf.getConnection();
	ls_sql="SELECT sgph,clbm,clmc,clgg,sgsl ";
	ls_sql+=" FROM cl_clsgmx ";
    ls_sql+=" where sgph='"+wheresgph+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		i+=1;
		sgph=rs.getString("sgph");
		clbm=rs.getString("clbm");
		clmc=rs.getString("clmc");
		clgg=rs.getString("clgg");
		sgsl=rs.getString("sgsl");
%> 
<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
	<td>
	<div align="center"><input type="text" name="sgph" size="10" maxlength="13" value="<%=sgph%>" class=xian readonly></div>
	</td>
    <td>
	<div align="center"><input type="text" name="clbm" size="10" maxlength="13" value="<%=clbm%>" class=xian readonly></div>
	</td>
    <td>
	<div align="center"><%=sgsl%></div>
	</td>  
	<td>
	<div align="center"><input type="text" name="shsl" size="10" maxlength="13" value="<%=sgsl%>" onkeyup="keyGo(shsl[<%=i%>])"></div>
	</td>
	<td><div align="center"><%=clmc%></div></td>
    <td><div align="center"><%=clgg%></div></td>

  </tr>
  <%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
<tr align="center" bgcolor="#cccccc"> 
	<td width="5%">&nbsp;</td>
	<td width="5%">&nbsp;</td>
	<td width="5%">&nbsp;</td>
	<td width="5%">&nbsp;</td>
	<td width="20%">&nbsp;</td>
	<td width="20%"> <input type="button"  value="审核完成" onClick="f_do(selectform)"></td>
  </tr>
</table>
</form>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>