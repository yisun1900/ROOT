<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String tcmc=null;
int fwmj=0;
double tcjg=0;
double pmzjdj=0;
double cpjg=0;
double sgjg=0;
double jjjg=0;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
String bjbbh=request.getParameter("bjbbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,cpjg,sgjg,jjjg ";
	ls_sql+=" from  tckb_tcjgb";
	ls_sql+=" where  (bjbbh='"+bjbbh+"') and (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		fwmj=rs.getInt("fwmj");
		tcjg=rs.getDouble("tcjg");
		pmzjdj=rs.getDouble("pmzjdj");
		cpjg=rs.getDouble("cpjg");
		sgjg=rs.getDouble("sgjg");
		jjjg=rs.getDouble("jjjg");
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
<form method="post" action="SaveEditTckb_tcjgb.jsp" name="editform">
<div align="center">套餐总价表－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">报价版本号</font></td>
    <td bgcolor="#E8E8FF"><input type="text" name="bjbbh" value="<%=bjbbh%>" size="20" maxlength="20" readonly></td>
    <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
    <td bgcolor="#E8E8FF">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">地区</font></td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">报价级别</font></td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">户型</font></td> 
  <td width="32%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>起价面积</td> 
  <td width="32%"><input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐名称</td> 
  <td colspan="3"> 
    <input type="text" name="tcmc" size="73" maxlength="50"  value="<%=tcmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">套餐总价</font></td> 
  <td width="32%"> 
    <input type="text" name="tcjg" size="20" maxlength="17"  value="<%=tcjg%>" readonly>  </td>
  <td colspan="2">套餐总价＝产品价格＋施工价格＋家具起包价</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>产品起包价</td>
  <td><input type="text" name="cpjg" value="<%=cpjg%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
  <td align="right"><font color="#FF0000">*</font>施工起包价</td>
  <td><input name="sgjg" type="text" value="<%=sgjg%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>家具起包价</td>
  <td><input name="jjjg" type="text" value="<%=jjjg%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
  <td align="right"><font color="#FF0000">*</font>平米增加单价</td>
  <td><input type="text" name="pmzjdj" size="20" maxlength="17"  value="<%=pmzjdj%>" ></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
		<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
		<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
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
function calValue(FormName)
{  
	var tcjg=FormName.cpjg.value*1.0+FormName.sgjg.value*1.0+FormName.jjjg.value*1.0;
	tcjg=round(tcjg,2);
	FormName.tcjg.value=tcjg;
}


function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[起价面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "起价面积"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("请输入[套餐总价]！");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "套餐总价"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjdj)=="") {
		alert("请输入[平米增加单价]！");
		FormName.pmzjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjdj, "平米增加单价"))) {
		return false;
	}
	if(	javaTrim(FormName.cpjg)=="") {
		alert("请输入[产品起包价]！");
		FormName.cpjg.focus();
		return false;
	}
	if(!(isFloat(FormName.cpjg, "产品起包价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgjg)=="") {
		alert("请输入[施工起包价]！");
		FormName.sgjg.focus();
		return false;
	}
	if(!(isFloat(FormName.sgjg, "施工起包价"))) {
		return false;
	}
	if(	javaTrim(FormName.jjjg)=="") {
		alert("请输入[家具起包价]！");
		FormName.jjjg.focus();
		return false;
	}
	if(!(isFloat(FormName.jjjg, "家具起包价"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
