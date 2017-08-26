<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String pdph=null;
String dqbm=null;
String ckbh=null;
String pdzt=null;
String pdr=null;
String pdrssbm=null;
String pdrssfgs=null;
String pdsj=null;
String bz=null;
String wherepdph=cf.GB2Uni(request.getParameter("pdph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pdph,dqbm,ckbh,pdzt,pdr,pdrssbm,pdrssfgs,pdsj,bz ";
	ls_sql+=" from  jxc_kcpdjl";
	ls_sql+=" where  (pdph="+wherepdph+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pdph=cf.fillNull(rs.getString("pdph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		pdzt=cf.fillNull(rs.getString("pdzt"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdrssbm=cf.fillNull(rs.getString("pdrssbm"));
		pdrssfgs=cf.fillNull(rs.getString("pdrssfgs"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
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
<form method="post" action="SaveEditJxc_kcpdjl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">盘点批号</td> 
  <td width="35%"> 
    <input type="text" name="pdph" size="20" maxlength="16"  value="<%=pdph%>" >
  </td>
  <td align="right" width="15%">地区编码</td> 
  <td width="35%"> 
    <input type="text" name="dqbm" size="20" maxlength="2"  value="<%=dqbm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">仓库编号</td> 
  <td width="35%"> 
    <input type="text" name="ckbh" size="20" maxlength="4"  value="<%=ckbh%>" >
  </td>
  <td align="right" width="15%">盘点状态</td> 
  <td width="35%"> 
    <input type="text" name="pdzt" size="20" maxlength="1"  value="<%=pdzt%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">盘点人</td> 
  <td width="35%"> 
    <input type="text" name="pdr" size="20" maxlength="50"  value="<%=pdr%>" >
  </td>
  <td align="right" width="15%">盘点人所属部门</td> 
  <td width="35%"> 
    <input type="text" name="pdrssbm" size="20" maxlength="5"  value="<%=pdrssbm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">盘点人所属分公司</td> 
  <td width="35%"> 
    <input type="text" name="pdrssfgs" size="20" maxlength="5"  value="<%=pdrssfgs%>" >
  </td>
  <td align="right" width="15%">盘点时间</td> 
  <td width="35%"> 
    <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=pdsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%"> 
    <input type="text" name="bz" size="20" maxlength="200"  value="<%=bz%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherepdph"  value="<%=wherepdph%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.pdph)=="") {
		alert("请输入[盘点批号]！");
		FormName.pdph.focus();
		return false;
	}
	if(!(isNumber(FormName.pdph, "盘点批号"))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请输入[仓库编号]！");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.pdzt)=="") {
		alert("请输入[盘点状态]！");
		FormName.pdzt.focus();
		return false;
	}
	if(	javaTrim(FormName.pdr)=="") {
		alert("请输入[盘点人]！");
		FormName.pdr.focus();
		return false;
	}
	if(	javaTrim(FormName.pdrssbm)=="") {
		alert("请输入[盘点人所属部门]！");
		FormName.pdrssbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pdrssfgs)=="") {
		alert("请输入[盘点人所属分公司]！");
		FormName.pdrssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("请输入[盘点时间]！");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "盘点时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
