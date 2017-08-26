<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String whererkph=cf.GB2Uni(request.getParameter("rkph"));
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String gysmc = null;
try {
	conn=cf.getConnection();
	ls_sql="SELECT gysmc ";
	ls_sql+=" FROM cl_rkd ";
    ls_sql+=" where rkph='"+whererkph+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));
//		out.print(gysmc);
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
<style type="text/css">
　　.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px' onunload="window.opener.location.reload()">
<form method="post" action="saveEditdgd.jsp" name="selectform" target="_back">
<CENTER >
  <B><font size="3">材料入库单(批号：<%=whererkph%>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  供应商:<select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select gysmc,gysmc from cl_gysbm order by gysbm",gysmc);
		%> 
		</select></font></B>
		<br>&nbsp;
</CENTER>
<table width="100%" bgcolor="#000000"  style='FONT-SIZE: 12px' border="1" cellspacing="1">
  <tr align="center" bgcolor="#cccccc"> 
  <td width="6%">&nbsp;</td>
	<td width="8%">入库批号</td>
	<td width="8%">材料编码</td>
	<td width="6%">入库单价</td>
	<td width="6%">入库数量</td>
	<td width="6%">入库金额</td>
	<td width="25%">材料名称</td>
	<td width="25%">材料规格</td>
  </tr>
<%
String rkph=null;
String clbm=null;
String clmc=null;
String clgg=null;
String rkdj=null;
String rksl=null;
String rkje=null;
int i=0;
String bg1="E8E8FF";
String bg2="FFFFFF";
try {
	conn=cf.getConnection();
	ls_sql="SELECT rkph,clbm,clmc,clgg,rkdj,rksl,rkje ";
	ls_sql+=" FROM cl_rkmx ";
    ls_sql+=" where rkph='"+whererkph+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		i+=1;
		rkph=cf.fillNull(rs.getString("rkph"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		rkdj=cf.fillNull(rs.getString("rkdj"));
		rksl=cf.fillNull(rs.getString("rksl"));
		rkje=cf.fillNull(rs.getString("rkje"));
%> 
<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
	<td><div align="center"><A HREF="#" onClick="window.open('Delrkmx.jsp?rkph=<%=rkph%>&clbm=<%=clbm%>')">删除</A></div></td>
	<td>
	<div align="center"><input type="text" name="rkph" size="10" maxlength="13" value="<%=rkph%>" class=xian readonly></div>
	</td>
    <td>
	<div align="center"><input type="text" name="clbm" size="8" maxlength="13" value="<%=clbm%>" class=xian readonly></div>
	</td>
    <td>
	<div align="center"><input type="text" name="rkdj" size="6" maxlength="8" value="<%=rkdj%>" onkeyup="keyGo(rkdj[<%=i%>])"></div>
	</td>   
	<td>
	<div align="center"><input type="text" name="rksl" size="6" maxlength="8" value="<%=rksl%>" onkeyup="keyGo(rksl[<%=i%>])"></div>
	</td> 
	<td>
	<div align="center"><input type="text" name="rkje" size="6" maxlength="8" value="<%=rkje%>" onkeyup="keyGo(rkje[<%=i%>])"></div>
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
	<td width="5%">&nbsp;</td>
	<td width="5%">&nbsp;</td>
	<td width="20%">&nbsp;</td>
	<td width="20%"> <input type="button"  value=" 保 存 " onClick="f_do(selectform)"></td>
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