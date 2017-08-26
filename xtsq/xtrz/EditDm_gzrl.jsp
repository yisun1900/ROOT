<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rq=null;
String nian=null;
String yue=null;
String ri=null;
String jjrbz=null;
String jjrlx=null;
String whererq=cf.GB2Uni(request.getParameter("rq"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rq,nian,yue,ri,jjrbz,jjrlx ";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where  (rq=TO_DATE('"+whererq+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rq=cf.fillNull(rs.getDate("rq"));
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		jjrbz=cf.fillNull(rs.getString("jjrbz"));
		jjrlx=cf.fillNull(rs.getString("jjrlx"));
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
<form method="post" action="SaveEditDm_gzrl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">日期</span></td> 
  <td width="32%"> 
    <input type="text" name="rq" size="20" maxlength="10"  value="<%=rq%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">年</span></td> 
  <td width="32%"> 
    <input type="text" name="nian" size="20" maxlength="4"  value="<%=nian%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">月</span></td> 
  <td width="32%"> 
    <input type="text" name="yue" size="20" maxlength="2"  value="<%=yue%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">日</span></td> 
  <td width="32%"> 
    <input type="text" name="ri" size="20" maxlength="2"  value="<%=ri%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>节假日标志</td>
  <td><%
	cf.radioToken(out, "jjrbz","Y+是&N+否",jjrbz);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>节假日类型</td> 
  <td colspan="3"><%
	cf.radioToken(out, "jjrlx","1+周六&2+周日&3+节日&8+其它&9+非节假日",jjrlx);
%></td>
  </tr>
<input type="hidden" name="whererq"  value="<%=whererq%>" >
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
	if(	javaTrim(FormName.rq)=="") {
		alert("请输入[日期]！");
		FormName.rq.focus();
		return false;
	}
	if(!(isDatetime(FormName.rq, "日期"))) {
		return false;
	}
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月]！");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ri)=="") {
		alert("请输入[日]！");
		FormName.ri.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjrbz)) {
		alert("请选择[节假日标志]！");
		FormName.jjrbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjrlx)) {
		alert("请选择[节假日类型]！");
		FormName.jjrlx[0].focus();
		return false;
	}
	if (FormName.jjrbz[0].checked)
	{
		if (FormName.jjrlx[4].checked)
		{
			alert("节假日类型错误！应选择[节假日]！");
			FormName.jjrlx[0].focus();
			return false;
		}
	}
	else{
		if (!FormName.jjrlx[4].checked)
		{
			alert("节假日类型错误！应选择[非节假日]！");
			FormName.jjrlx[4].focus();
			return false;
		}
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
