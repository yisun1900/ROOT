<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmbm=null;
String xmmc=null;
String rcjcdlbm=null;
String jcnr=null;
String rcjclxbm=null;
String wherexmbm=cf.GB2Uni(request.getParameter("xmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmbm,xmmc,rcjcdlbm,jcnr,rcjclxbm ";
	ls_sql+=" from  dm_rcjcxm";
	ls_sql+=" where  (xmbm='"+wherexmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmbm=cf.fillNull(rs.getString("xmbm"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		rcjcdlbm=cf.fillNull(rs.getString("rcjcdlbm"));
		jcnr=cf.fillNull(rs.getString("jcnr"));
		rcjclxbm=cf.fillNull(rs.getString("rcjclxbm"));
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
<form method="post" action="SaveEditDm_rcjcxm.jsp" name="editform">
<div align="center">日常检查项目－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>日常检查类型</td>
    <td><select name="rcjclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select rcjclxbm,rcjclxmc from dm_rcjclxbm order by rcjclxbm",rcjclxbm);
%>
      </select>    </td>
    <td align="right"><span class="STYLE1">*</span>日常检查大类</td>
    <td><select name="rcjcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select rcjcdlbm,rcjcdlmc from dm_rcjcdlbm order by rcjcdlbm",rcjcdlbm);
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>项目编码</td> 
  <td width="32%"> 
    <input type="text" name="xmbm" size="20" maxlength="4"  value="<%=xmbm%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>项目名称</td>
  <td colspan="3"><input type="text" name="xmmc" size="73" maxlength="100"  value="<%=xmmc%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>检查内容</td> 
  <td colspan="3"> 
    <textarea name="jcnr" cols="72" rows="3"><%=jcnr%></textarea>  </td>
  </tr>
<input type="hidden" name="wherexmbm"  value="<%=wherexmbm%>" >
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
	if(	javaTrim(FormName.xmbm)=="") {
		alert("请输入[项目编码]！");
		FormName.xmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.rcjcdlbm)=="") {
		alert("请选择[日常检查大类]！");
		FormName.rcjcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jcnr)=="") {
		alert("请输入[检查内容]！");
		FormName.jcnr.focus();
		return false;
	}
	if(	javaTrim(FormName.rcjclxbm)=="") {
		alert("请选择[日常检查类型]！");
		FormName.rcjclxbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
