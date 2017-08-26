<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String bianhao=null;
String yhmc=null;

String gzlb="";
String khgz="";
String jbgz="";
String gwgz="";
String glgz="";
String jtbt="";
String dhbt="";
String cb="";
String buzhu="";
String bz="";
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ygbh,bianhao,yhmc ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select  gzlb,khgz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,bz ";
	ls_sql+=" from  rs_ygjbgzb";
	ls_sql+=" where ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gzlb=cf.fillNull(rs.getString("gzlb"));
		khgz=cf.fillNull(rs.getString("khgz"));
		jbgz=cf.fillNull(rs.getString("jbgz"));
		gwgz=cf.fillNull(rs.getString("gwgz"));
		glgz=cf.fillNull(rs.getString("glgz"));
		jtbt=cf.fillNull(rs.getString("jtbt"));
		dhbt=cf.fillNull(rs.getString("dhbt"));
		cb=cf.fillNull(rs.getString("cb"));
		buzhu=cf.fillNull(rs.getString("buzhu"));
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
<form method="post" action="SaveEditRs_ygjbgzb.jsp" name="editform">
<div align="center">维护基本工资</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>员工序号</td> 
  <td width="32%"> 
    <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>工号</td> 
  <td width="32%"> 
    <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>员工名称</td> 
  <td width="32%"> 
    <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>工资类别</td>
  <td><%
	cf.radioToken(out, "gzlb","1+固定工资&2+浮动工资",gzlb);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>绩效工资基数</td> 
  <td width="32%"> 
    <input type="text" name="khgz" size="20" maxlength="17"  value="<%=khgz%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>基本工资</td> 
  <td width="32%"> 
    <input type="text" name="jbgz" size="20" maxlength="17"  value="<%=jbgz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>岗位工资</td> 
  <td width="32%"> 
    <input type="text" name="gwgz" size="20" maxlength="17"  value="<%=gwgz%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>工龄工资</td> 
  <td width="32%"> 
    <input type="text" name="glgz" size="20" maxlength="17"  value="<%=glgz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>交通补贴</td> 
  <td width="32%"> 
    <input type="text" name="jtbt" size="20" maxlength="17"  value="<%=jtbt%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>通讯补贴</td> 
  <td width="32%"> 
    <input type="text" name="dhbt" size="20" maxlength="17"  value="<%=dhbt%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>餐饮补贴</td> 
  <td width="32%"> 
    <input type="text" name="cb" size="20" maxlength="17"  value="<%=cb%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>其它补贴</td> 
  <td width="32%"> 
    <input type="text" name="buzhu" size="20" maxlength="17"  value="<%=buzhu%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>    </td>
  </tr>
<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
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
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[员工名称]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.gzlb)) {
		alert("请选择[工资类别]！");
		FormName.gzlb[0].focus();
		return false;
	}

	if(	javaTrim(FormName.khgz)=="") {
		alert("请输入[绩效工资基数]！");
		FormName.khgz.focus();
		return false;
	}
	if(!(isFloat(FormName.khgz, "绩效工资基数"))) {
		return false;
	}
	if(	javaTrim(FormName.jbgz)=="") {
		alert("请输入[基本工资]！");
		FormName.jbgz.focus();
		return false;
	}
	if(!(isFloat(FormName.jbgz, "基本工资"))) {
		return false;
	}
	if(	javaTrim(FormName.gwgz)=="") {
		alert("请输入[岗位工资]！");
		FormName.gwgz.focus();
		return false;
	}
	if(!(isFloat(FormName.gwgz, "岗位工资"))) {
		return false;
	}
	if(	javaTrim(FormName.glgz)=="") {
		alert("请输入[工龄工资]！");
		FormName.glgz.focus();
		return false;
	}
	if(!(isFloat(FormName.glgz, "工龄工资"))) {
		return false;
	}
	if(	javaTrim(FormName.jtbt)=="") {
		alert("请输入[交通补贴]！");
		FormName.jtbt.focus();
		return false;
	}
	if(!(isFloat(FormName.jtbt, "交通补贴"))) {
		return false;
	}
	if(	javaTrim(FormName.dhbt)=="") {
		alert("请输入[通讯补贴]！");
		FormName.dhbt.focus();
		return false;
	}
	if(!(isFloat(FormName.dhbt, "通讯补贴"))) {
		return false;
	}
	if(	javaTrim(FormName.cb)=="") {
		alert("请输入[餐饮补贴]！");
		FormName.cb.focus();
		return false;
	}
	if(!(isFloat(FormName.cb, "餐饮补贴"))) {
		return false;
	}
	if(	javaTrim(FormName.buzhu)=="") {
		alert("请输入[其它补贴]！");
		FormName.buzhu.focus();
		return false;
	}
	if(!(isFloat(FormName.buzhu, "其它补贴"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
