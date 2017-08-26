<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hflxbm=null;
String hflxmc=null;
String hfdl=null;
String sjjg=null;
String sfzdsz=null;
String wherehflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hflxbm,hflxmc,hfdl,sjjg,sfzdsz ";
	ls_sql+=" from  dm_hflxbm";
	ls_sql+=" where  (hflxbm='"+wherehflxbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		hflxmc=cf.fillNull(rs.getString("hflxmc"));
		hfdl=cf.fillNull(rs.getString("hfdl"));
		sjjg=cf.fillNull(rs.getString("sjjg"));
		sfzdsz=cf.fillNull(rs.getString("sfzdsz"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditDm_hflxbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="17%" align="right"> 
                回访类型编码  </td>
              <td width="33%"> 
                <input type="text" name="hflxbm" size="20" maxlength="2"  value="<%=hflxbm%>" >  </td>
              <td width="18%" align="right"> 
                回访类型名称  </td>
              <td width="32%"> 
                <input type="text" name="hflxmc" size="20" maxlength="50"  value="<%=hflxmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否自动设置</td>
  <td><%
	cf.radioToken(out, "sfzdsz","1+自动设置&2+手动设置",sfzdsz);
%></td>
  <td align="right">回访时间间隔 </td>
  <td><input type="text" name="sjjg" size="20" maxlength="8"  value="<%=sjjg%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%" align="right"> 
                回访大类  </td>
              <td width="33%"> 
                <select name="hfdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+咨询客户回访&2+在施工程回访&3+保修客户回访&4+投诉报修回访",hfdl);
%>
    </select>  </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
</tr>
	    <tr> 
              <td height="2" colspan="4" align="center"> 
<input type="hidden" name="wherehflxbm"  value="<%=wherehflxbm%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
              <input type="reset"  value="重输"></td>
          </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("请输入[回访类型编码]！");
		FormName.hflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxmc)=="") {
		alert("请输入[回访类型名称]！");
		FormName.hflxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdl)=="") {
		alert("请选择[回访大类]！");
		FormName.hfdl.focus();
		return false;
	}
	if(!(isNumber(FormName.sjjg, "回访时间间隔"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfzdsz)) {
		alert("请选择[是否自动设置]！");
		FormName.sfzdsz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
