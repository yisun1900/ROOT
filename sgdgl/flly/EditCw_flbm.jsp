<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String flbm=null;
String flmc=null;
double dj=0;
String jldw=null;
String lx=null;
String ssfgs=null;
String whereflbm=cf.GB2Uni(request.getParameter("flbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select flbm,flmc,dj,jldw,lx,ssfgs ";
	ls_sql+=" from  cw_flbm";
	ls_sql+=" where  (flbm='"+whereflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		flbm=cf.fillNull(rs.getString("flbm"));
		flmc=cf.fillNull(rs.getString("flmc"));
		dj=rs.getDouble("dj");
		jldw=cf.fillNull(rs.getString("jldw"));
		lx=cf.fillNull(rs.getString("lx"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
<form method="post" action="SaveEditCw_flbm.jsp" name="editform">
<div align="center">辅料编码－修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>分公司 </td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	%>
    </select></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>辅料编码</td> 
  <td width="32%"> 
    <input type="text" name="flbm" size="20" maxlength="4"  value="<%=flbm%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>类型</td> 
  <td width="32%"><%
	cf.radioToken(out, "lx","1+公司辅料&2+配送辅料",lx);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>计量单位</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>单价</td>
  <td><input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>辅料名称</td> 
  <td colspan="3"><input type="text" name="flmc" size="73" maxlength="50"  value="<%=flmc%>" >    </td>
  </tr>
<input type="hidden" name="whereflbm"  value="<%=whereflbm%>" >
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
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.flbm)=="") {
		alert("请输入[辅料编码]！");
		FormName.flbm.focus();
		return false;
	}
	if(	javaTrim(FormName.flmc)=="") {
		alert("请输入[辅料名称]！");
		FormName.flmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
