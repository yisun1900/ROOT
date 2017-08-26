<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zsxm=null;
String jldw=null;
String cbdj=null;
String scdj=null;
String zsslsx=null;
String zsslxx=null;
String sftz=null;
String bz=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherezsxm=request.getParameter("zsxm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,sftz,bz ";
	ls_sql+=" from  jc_tqzsxx";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (zsxm='"+wherezsxm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=cf.fillNull(rs.getString("cbdj"));
		scdj=cf.fillNull(rs.getString("scdj"));
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		sftz=cf.fillNull(rs.getString("sftz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_tqzsxx.jsp" name="editform">
<div align="center">特权赠送信息－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>赠送项目</td>
  <td colspan="3"><input type="text" name="zsxm" size="73" maxlength="100"  value="<%=zsxm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计量单位</td> 
  <td width="32%"><input type="text" name="jldw" size="20" maxlength="20"  value="<%=jldw%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否停止</td> 
  <td width="32%"><%
	cf.radioToken(out, "sftz","Y+是&N+否",sftz);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>成本单价</td> 
  <td width="32%"> 
    <input type="text" name="cbdj" size="20" maxlength="17"  value="<%=cbdj%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>市场单价</td> 
  <td width="32%"> 
    <input type="text" name="scdj" size="20" maxlength="17"  value="<%=scdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>赠送数量下限 </td> 
  <td width="32%"><input type="text" name="zsslxx" size="20" maxlength="17"  value="<%=zsslxx%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>赠送数量上限</td> 
  <td width="32%"><input type="text" name="zsslsx" size="20" maxlength="17"  value="<%=zsslsx%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
		<input type="hidden" name="wherezsxm"  value="<%=wherezsxm%>" >
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
	if(	javaTrim(FormName.zsxm)=="") {
		alert("请输入[赠送项目]！");
		FormName.zsxm.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.cbdj)=="") {
		alert("请输入[成本单价]！");
		FormName.cbdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbdj, "成本单价"))) {
		return false;
	}
	if(	javaTrim(FormName.scdj)=="") {
		alert("请输入[市场单价]！");
		FormName.scdj.focus();
		return false;
	}
	if(!(isFloat(FormName.scdj, "市场单价"))) {
		return false;
	}
	if(	javaTrim(FormName.zsslsx)=="") {
		alert("请输入[赠送数量上限]！");
		FormName.zsslsx.focus();
		return false;
	}
	if(!(isFloat(FormName.zsslsx, "赠送数量上限"))) {
		return false;
	}
	if(	javaTrim(FormName.zsslxx)=="") {
		alert("请输入[赠送数量下限]！");
		FormName.zsslxx.focus();
		return false;
	}
	if(!(isFloat(FormName.zsslxx, "赠送数量下限"))) {
		return false;
	}
	if(	!radioChecked(FormName.sftz)) {
		alert("请选择[是否停止]！");
		FormName.sftz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
