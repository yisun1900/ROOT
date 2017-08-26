<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String ssfgs=null;
String sjsjb=null;
String yjxx=null;
String yjsx=null;
String khgz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,ssfgs,sjsjb,yjxx,yjsx,khgz ";
	ls_sql+=" from  rs_khgzjsfs";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sjsjb=cf.fillNull(rs.getString("sjsjb"));
		yjxx=cf.fillNull(rs.getString("yjxx"));
		yjsx=cf.fillNull(rs.getString("yjsx"));
		khgz=cf.fillNull(rs.getString("khgz"));
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
<form method="post" action="SaveEditRs_khgzjsfs.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">序号</td> 
  <td width="32%"> 
    <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">分公司</td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh",ssfgs);
%>
  </select></td>
  <td align="right">设计师级别</td>
  <td><select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb",sjsjb);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">业绩下限</td> 
  <td width="32%"><input type="text" name="yjxx" size="20" maxlength="17"  value="<%=yjxx%>" ></td>
  <td align="right" width="18%">业绩上限</td> 
  <td width="32%"><input type="text" name="yjsx" size="20" maxlength="17"  value="<%=yjsx%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">考核工资</td> 
  <td width="32%"><input type="text" name="khgz" size="20" maxlength="17"  value="<%=khgz%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sjsjb)=="") {
		alert("请选择[设计师级别]！");
		FormName.sjsjb.focus();
		return false;
	}
	if(	javaTrim(FormName.yjxx)=="") {
		alert("请输入[业绩下限]！");
		FormName.yjxx.focus();
		return false;
	}
	if(!(isFloat(FormName.yjxx, "业绩下限"))) {
		return false;
	}
	if(	javaTrim(FormName.yjsx)=="") {
		alert("请输入[业绩上限]！");
		FormName.yjsx.focus();
		return false;
	}
	if(!(isFloat(FormName.yjsx, "业绩上限"))) {
		return false;
	}
	if(	javaTrim(FormName.khgz)=="") {
		alert("请输入[考核工资]！");
		FormName.khgz.focus();
		return false;
	}
	if(!(isFloat(FormName.khgz, "考核工资"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
