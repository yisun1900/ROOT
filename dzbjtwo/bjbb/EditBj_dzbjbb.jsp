<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String bjbbh=null;
String qysj=null;
String yxq=null;
String sfzybb=null;
String bz=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjbbh=request.getParameter("bjbbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjbbh,qysj,yxq,sfzybb,bz ";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjbbh='"+wherebjbbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		qysj=cf.fillNull(rs.getDate("qysj"));
		yxq=cf.fillNull(rs.getDate("yxq"));
		sfzybb=cf.fillNull(rs.getString("sfzybb"));
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
<form method="post" action="SaveEditBj_dzbjbb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>地区编码</td> 
  <td width="33%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="17%">&nbsp;</td> 
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>报价版本号</td>
  <td colspan="3"><input type="text" name="bjbbh" size="73" maxlength="50"  value="<%=bjbbh%>" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否在用版本</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfzybb","1+未启用&2+当前版&3+可用版&4+已停用",sfzybb);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>启用时间</td>
  <td><input type="text" name="qysj" size="20" maxlength="10"  value="<%=qysj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>有效期</td>
  <td><input type="text" name="yxq" value="<%=yxq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjbbh"  value="<%=wherebjbbh%>" >
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请输入[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.qysj)=="") {
		alert("请输入[启用时间]！");
		FormName.qysj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qysj, "启用时间"))) {
		return false;
	}
	if(	javaTrim(FormName.yxq)=="") {
		alert("请输入[有效期]！");
		FormName.yxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxq, "有效期"))) {
		return false;
	}

	if (FormName.yxq.value<FormName.qysj.value)
	{
		alert("[有效期]不能小于[启用时间]！");
		FormName.yxq.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfzybb)) {
		alert("请选择[是否在用版本]！");
		FormName.sfzybb[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
