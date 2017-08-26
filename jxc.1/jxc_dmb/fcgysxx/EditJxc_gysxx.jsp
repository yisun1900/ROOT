<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String gysbm=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String cwdm=null;
String bz=null;
String gyslx=null;
String sfhz=null;
String cllx=null;


String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cllx,gysbm,dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,email,cwdm,bz,gyslx,sfhz ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cllx=cf.fillNull(rs.getString("cllx"));
		sfhz=cf.fillNull(rs.getString("sfhz"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		gysdz=cf.fillNull(rs.getString("gysdz"));
		gysfzr=cf.fillNull(rs.getString("gysfzr"));
		gysdh=cf.fillNull(rs.getString("gysdh"));
		gyscz=cf.fillNull(rs.getString("gyscz"));
		email=cf.fillNull(rs.getString("email"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		bz=cf.fillNull(rs.getString("bz"));
		gyslx=cf.fillNull(rs.getString("gyslx"));
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
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">供应商编码</span></td>
    <td><input type="text" name="gysbm" size="10" maxlength="8"  value="<%=gysbm%>" readonly>
      （不可修改）</td>
    <td align="right">财务代码</td>
    <td><input type="text" name="cwdm" size="20" maxlength="20"  value="<%=cwdm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>供应商名称</td>
  <td colspan="3"><input type="text" name="gysmc" size="73" maxlength="50"  value="<%=gysmc%>" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否合作</td>
  <td>
<%
	cf.radioToken(out,"sfhz","Y+合作&N+不合作",sfhz);
%>  </td>
  <td align="right"><span class="STYLE1">*</span>供应材料类型</td>
  <td><%
	cf.radioToken(out,"cllx","2+辅材",cllx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>所属地区</td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" width="19%"><span class="STYLE1">*</span>供应商类型</td> 
  <td width="31%"><select name="gyslx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+代销品供货商&1+库存供货商&2+共用供货商",gyslx);
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商地址</td> 
  <td colspan="3"><input type="text" name="gysdz" size="73" maxlength="100"  value="<%=gysdz%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商负责人</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" size="20" maxlength="20"  value="<%=gysfzr%>" >  </td>
  <td align="right" width="19%">供应商电话</td> 
  <td width="31%"> 
    <input type="text" name="gysdh" size="20" maxlength="50"  value="<%=gysdh%>" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商传真</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" size="20" maxlength="50"  value="<%=gyscz%>" >  </td>
  <td align="right" width="19%">EMail</td> 
  <td width="31%"> 
    <input type="text" name="email" size="20" maxlength="50"  value="<%=email%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="72" rows="2"><%=bz%></textarea>  </td>
</tr>
<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <p>
	    <input type="button"  value="保存" onClick="f_do(editform)">
	    <input type="reset"  value="重输">
	  </p>
	  <p>
	    <input type="button"  value="子品牌供应商对照表" onClick="f_dzb(editform)" >
	    <input type="button"  value="录入联系人" onClick="f_lr(editform)" name="lr" >
	    <input type="button"  value="查看联系人" onClick="f_ck(editform)" name="ck" >
	  </p>
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
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhz)) {
		alert("请选择[是否合作]！");
		FormName.sfhz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.cllx)=="") {
		alert("请输入[供应材料类型]！");
		FormName.cllx.focus();
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
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[供应商名称]！");
		FormName.gysmc.focus();
		return false;
	}



	FormName.target="";
	FormName.action="SaveEditJxc_gysxx.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJxc_gyslxr.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jxc_gyslxrList.jsp";
	FormName.submit();
	return true;
}

function f_dzb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJxc_ppgysdzb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
