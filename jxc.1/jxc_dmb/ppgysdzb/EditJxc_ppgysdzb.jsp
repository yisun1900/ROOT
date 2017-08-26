<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String gysbm=null;
String gysmc=null;
String dqbm=null;
String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc,gysbm,gysmc,dqbm ";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<form method="post" action="SaveEditJxc_ppgysdzb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">子品牌</td> 
  <td > 
    <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
   <%
	out.print("<optgroup label=\"主材类\"> </optgroup>");
	cf.selectItem(out,"select ppbm,ppmc from jxc_ppxx,jxc_scsxx where jxc_ppxx.scsmc=jxc_scsxx.scsmc and scslb='1' order by ppmc",ppbm);
	out.print("<optgroup label=\"辅材类\"> </optgroup>");
	cf.selectItem(out,"select ppbm,ppmc from jxc_ppxx,jxc_scsxx where jxc_ppxx.scsmc=jxc_scsxx.scsmc and scslb='2' order by ppmc",ppbm);
	out.print("<optgroup label=\"通用类\"> </optgroup>");
	cf.selectItem(out,"select ppbm,ppmc from jxc_ppxx,jxc_scsxx where jxc_ppxx.scsmc=jxc_scsxx.scsmc and scslb='3' order by ppmc",ppbm);
%>

  </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商</td>
  <td><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:352PX">
    <option value=""></option>
	<%
	out.print("<optgroup label=\"合作\"> </optgroup>");
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx where sfhz='Y' order by gysmc",gysbm);
	out.print("<optgroup label=\"不合作\"> </optgroup>");
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx where sfhz='N' order by gysmc",gysbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">所属地区</td> 
  <td width="35%"> 
	<select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqmc",dqbm);
%>
  </select>  </td>
</tr>
<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
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
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[子品牌编码]！");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "子品牌编码"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
