<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xtbm=null;
String jg=null;
String wherextbm=cf.GB2Uni(request.getParameter("xtbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xtbm,jg ";
	ls_sql+=" from  jc_xtjg";
	ls_sql+=" where  (xtbm='"+wherextbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xtbm=cf.fillNull(rs.getString("xtbm"));
		jg=cf.fillNull(rs.getString("jg"));
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

<form method="post" action="SaveEditJc_xtjg.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">箱体</div>
  </td>
  <td width="35%"> 
    <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xtbm,xtmc from jdm_xtbm order by xtbm",xtbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">价格</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jg" size="20" maxlength="9"  value="<%=jg%>" >
  </td>
</tr>
<input type="hidden" name="wherextbm"  value="<%=wherextbm%>" >
	    <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
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
	if(	javaTrim(FormName.xtbm)=="") {
		alert("请选择[箱体]！");
		FormName.xtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jg)=="") {
		alert("请输入[价格]！");
		FormName.jg.focus();
		return false;
	}
	if(!(isFloat(FormName.jg, "价格"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
