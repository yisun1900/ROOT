<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tccplbbm=null;
String jldw=null;
String sjcj=null;

String sjsfycx=null;
String cxsjcj=null;
String cxkssj=null;
String cxjssj=null;

String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherebjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,bjjbbm1,tccplbbm,jldw,sjcj,sjsfycx,cxkssj,cxjssj,cxsjcj ";
	ls_sql+=" from  tckd_tcsjcjb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (bjjbbm1='"+wherebjjbbm1+"') and  (tccplbbm='"+wheretccplbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbbm1=cf.fillNull(rs.getString("bjjbbm1"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sjcj=cf.fillNull(rs.getString("sjcj"));

		sjsfycx=cf.fillNull(rs.getString("sjsfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		cxsjcj=cf.fillNull(rs.getString("cxsjcj"));
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
<form method="post" action="SaveEditTckd_tcsjcjb.jsp" name="editform" target="_blank">
<div align="center">套餐升级差价表－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">


<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>地区</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select></td>
  <td align="right"><font color="#FF0000">*</font>产品类别</td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc",tccplbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>原报价级别</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm  order by bjjbbm",bjjbbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>升级报价级别</td>
  <td><select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm  order by bjjbbm",bjjbbm1);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>计量单位</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>升级差价</td> 
  <td width="32%"><input type="text" name="sjcj" size="20" maxlength="17"  value="<%=sjcj%>" ></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right"><font color="#FF0000">*</font>升级是否有促销</td>
  <td colspan="3"><%
	cf.radioToken(out, "sjsfycx","1+无促销&2+无数量限制促销&3+有数量限制促销",sjsfycx);
%></td>
  </tr>
<tr bgcolor="#E8E8FF">
  <td align="right">促销开始时间</td>
  <td><input type="text" name="cxkssj" value="<%=cxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">促销结束时间</td>
  <td><input type="text" name="cxjssj" value="<%=cxjssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">促销升级差价</td>
  <td><input type="text" name="cxsjcj" value="<%=cxsjcj%>" size="20" maxlength="9" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
	<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
	<input type="hidden" name="wherebjjbbm1"  value="<%=wherebjjbbm1%>" >
	<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="button" onClick="f_lr(editform)"  value="维护品牌升级差价">
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
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品类别]！");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[原报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("请选择[升级报价级别]！");
		FormName.bjjbbm1.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("请输入[升级差价]！");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "升级差价"))) {
		return false;
	}

	if(	!radioChecked(FormName.sjsfycx)) {
		alert("请选择[升级是否有促销]！");
		FormName.sjsfycx[0].focus();
		return false;
	}

	if (FormName.sjsfycx[1].checked || FormName.sjsfycx[2].checked)
	{
		if(	javaTrim(FormName.cxsjcj)=="") {
			alert("请输入[促销升级差价]！");
			FormName.cxsjcj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxsjcj, "促销升级差价"))) {
			return false;
		}

		if(	javaTrim(FormName.cxkssj)=="") {
			alert("请输入[促销开始时间]！");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjssj)=="") {
			alert("请输入[促销结束时间]！");
			FormName.cxjssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjssj, "促销结束时间"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjssj.value)
		{
			alert("[促销开始时间]不能大于[促销结束时间]！");
			FormName.cxjssj.select();
			return false;
		}
	}
	else{
		FormName.cxsjcj.value="";
		FormName.cxkssj.value="";
		FormName.cxjssj.value="";
	}

	FormName.action="SaveEditTckd_tcsjcjb.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品类别]！");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[原报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("请选择[升级报价级别]！");
		FormName.bjjbbm1.focus();
		return false;
	}

	FormName.action="InsertTckd_tcppsjcjb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
