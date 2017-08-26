<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gcyszxmbm=null;
String gcyszxmmc=null;
String gcjdbm=null;
String dygcjdbm=null;
String sfhf=null;
String wheregcyszxmbm=cf.GB2Uni(request.getParameter("gcyszxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gcyszxmbm,gcyszxmmc,gcjdbm,dygcjdbm,sfhf ";
	ls_sql+=" from  dm_gcyszxmbm";
	ls_sql+=" where  (gcyszxmbm='"+wheregcyszxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcyszxmbm=cf.fillNull(rs.getString("gcyszxmbm"));
		gcyszxmmc=cf.fillNull(rs.getString("gcyszxmmc"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		dygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
		sfhf=cf.fillNull(rs.getString("sfhf"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
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

<form method="post" action="SaveEditDm_gcyszxmbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="20%" align="right"> 
                <span class="STYLE1">*</span>工程验收子项目编码  </td>
              <td width="30%"> 
                <input type="text" name="gcyszxmbm" size="20" maxlength="2"  value="<%=gcyszxmbm%>" >  </td>
              <td width="20%" align="right"><span class="STYLE1">*</span>验收分类</td>
              <td width="30%"><select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectToken(out,"2+材料进场验收&3+隐蔽工程验收&4+中期验收&5+完工验收",gcjdbm);
%>
              </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>工程验收子项目名称</td>
  <td colspan="3"><input type="text" name="gcyszxmmc" size="73" maxlength="50"  value="<%=gcyszxmmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否回访</td>
  <td><%
		cf.radioToken(out, "sfhf","Y+是&N+否",sfhf);
%></td>
  <td align="right">对应工程进度</td>
  <td><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:151PX">
    <option value=""></option>
    <%
		cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",dygcjdbm);
%>
  </select></td>
</tr>

<input type="hidden" name="wheregcyszxmbm"  value="<%=wheregcyszxmbm%>" >
            <tr> 
              <td height="2" colspan="4" align="center"> &nbsp; 
                  <input type="button"  value="保存" onClick="f_do(editform)">
              <input type="reset"  value="重输">              </td>
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
	if(	javaTrim(FormName.gcyszxmbm)=="") {
		alert("请输入[工程验收子项目编码]！");
		FormName.gcyszxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcyszxmmc)=="") {
		alert("请输入[工程验收子项目名称]！");
		FormName.gcyszxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("请选择[验收分类]！");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhf)) {
		alert("请输入[是否回访]！");
		FormName.sfhf[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
