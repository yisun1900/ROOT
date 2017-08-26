<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;

String whereppbm=request.getParameter("ppbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc ";
	ls_sql+=" from  sq_ppxx";
	ls_sql+=" where  (ppbm='"+whereppbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSq_ppxx.jsp" name="editform">
  <div align="center">修改品牌名称</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">品牌编码</font></td>
      <td colspan="3"> 
        <input type="text" name="ppbm" size="20" maxlength="5"  value="<%=ppbm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">品牌名称</td>
      <td colspan="3"> 
        <input type="text" name="ppmc" size="50" maxlength="50"  value="<%=ppmc%>" >
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
          <input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
        </div>
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
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[品牌编码]！");
		FormName.ppbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请输入[品牌名称]！");
		FormName.ppmc.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
