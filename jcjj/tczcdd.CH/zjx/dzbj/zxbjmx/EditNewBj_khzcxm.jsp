<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改客户主材项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String sxh=cf.GB2Uni(request.getParameter("sxh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String cpbm=null;
String bjjbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
String ppmc=null;
String ptcpsm=null;
double sl=0;
double dj=0;
String sfkgdj=null;
String lx=null;
String jldw=null;
String readStr="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cpbm,tccpdlbm,tccplbbm,bjjbbm,ppmc,ptcpsm,sl,dj,sfkgdj,lx,jldw";
	ls_sql+=" from  bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpbm=cf.fillNull(rs.getString("cpbm"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		ptcpsm=cf.fillNull(rs.getString("ptcpsm"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		lx=cf.fillNull(rs.getString("lx"));//1：原项目；2：增项；3：减项；4：新增项
		jldw=cf.fillNull(rs.getString("jldw"));
	}
	else{
		out.println("错误！不存在，请关掉窗口重新尝试");
		return;
	}
	rs.close();
	ps.close();

	if (sfkgdj.equals("Y") && lx.equals("4"))//是否可改单价  Y：是；N：否
	{
		readStr="";
	}
	else {
		readStr="readOnly";
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditNewBj_khzcxm.jsp" name="insertform">
<div align="center">修改客户主材项目</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">增减项序号</span></td> 
  <td width="32%"> 
    <input type="text" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">产品大类</span></td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by cldlmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">产品类别</span></td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">结构位置</span></td>
  <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<OPTION SELECTED value="<%=jgwzbm%>"><%=jgwzbm%></OPTION>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">报价级别</span></td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">品牌</span></td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value="<%=ppmc%>"><%=ppmc%></option>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">产品</span></td> 
  <td colspan="3"> 
  <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX">
    <%
	String sql="select cpbm,cpmc||'（'||xh||'）（'||gg||'）'||'（'||jldw||'）' from bj_tczcbj where cpbm='"+cpbm+"'";
	cf.selectItem(out,sql,cpbm);
%>
  </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>计量单位</strong></td>
  <td><%=jldw%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>数量</td>
  <td><input type="text" name="sl" value="<%=sl%>" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>实际单价</td>
  <td><input type="text" name="dj" value="<%=dj%>" size="20" maxlength="17" <%=readStr%>></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><%if (tccplbbm.equals("36")) out.println("玻璃型号");if (tccplbbm.equals("50")) out.println("坑距");%></td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="<%=ptcpsm%>" size="73" maxlength="200" <%if (!tccplbbm.equals("36") && !tccplbbm.equals("50") ) out.println("disabled");%>>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="hidden" name="oldcpbm" value="<%=cpbm%>"> 
	<input type="hidden" name="sxh" value="<%=sxh%>">	</td>
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
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请选择[结构位置]！");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("请输入[产品编码]！");
		FormName.cpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("请选择[产品大类]！");
		FormName.tccpdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[实际单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "实际单价"))) {
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
