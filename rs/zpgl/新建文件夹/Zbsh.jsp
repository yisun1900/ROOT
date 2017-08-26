<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String yhzbh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select yhzbh ";
	ls_sql+=" from  sq_yhssz";
	ls_sql+=" where yhdlm='"+yhdlm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		yhzbh=rs.getString(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
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

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_zpjhShList.jsp" name="selectform">
<div align="center">招聘审核</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="35%">可审核状态</td> 
  <td width="65%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:240" multiple size="12">
<%
		cf.selectItem(out,"select rs_ryzbsqsq.ztbm ztbm,rs_ztbm.ztmc ztmc from rs_ryzbsqsq,rs_ztbm where rs_ryzbsqsq.ztbm=rs_ztbm.ztbm and rs_ryzbsqsq.yhzbh='"+yhzbh+"'","");
%>
    </select>
  </td>
</tr>
<tr align="center"> 
  <td colspan="2"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
  </td>
</tr>
</table>
</form>
</body>
</html>
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
