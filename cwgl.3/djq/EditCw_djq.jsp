<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String djqmc=null;
String djqcdbl=null;
String bz=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wheredjqmc=cf.getParameter(request,"djqmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,djqmc,djqcdbl,bz ";
	ls_sql+=" from  cw_djq";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (djqmc='"+wheredjqmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		djqmc=cf.fillNull(rs.getString("djqmc"));
		djqcdbl=cf.fillNull(rs.getString("djqcdbl"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditCw_djq.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%>
    </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">代金券名称</td>
  <td colspan="3"><input type="text" name="djqmc" size="73" maxlength="50"  value="<%=djqmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">代金券厂家承担比例</td>
  <td><input type="text" name="djqcdbl" size="20" maxlength="9"  value="<%=djqcdbl%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
<input type="hidden" name="wheredjqmc"  value="<%=wheredjqmc%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.djqmc)=="") {
		alert("请输入[代金券名称]！");
		FormName.djqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.djqcdbl)=="") {
		alert("请输入[代金券厂家承担比例]！");
		FormName.djqcdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djqcdbl, "代金券厂家承担比例"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
