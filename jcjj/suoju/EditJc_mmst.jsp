<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String wjjbm=null;
String mmstbm=null;
String bm=null;
String wherewjjbm=cf.GB2Uni(request.getParameter("wjjbm"));
String wheremmstbm=cf.GB2Uni(request.getParameter("mmstbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wjjbm,mmstbm,bm ";
	ls_sql+=" from  jc_mmst";
	ls_sql+=" where  (wjjbm='"+wherewjjbm+"') and  (mmstbm='"+wheremmstbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjjbm=cf.fillNull(rs.getString("wjjbm"));
		mmstbm=cf.fillNull(rs.getString("mmstbm"));
		bm=cf.fillNull(rs.getString("bm"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="SaveEditJc_mmst.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">五金件</div>
  </td>
  <td width="35%"> 
    <select name="wjjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select wjjbm,wjjmc from jdm_wjjbm order by wjjbm",wjjbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">锁体</div>
  </td>
  <td width="35%"> 
    <select name="mmstbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select mmstbm,mmstmc from jdm_mmstbm order by mmstbm",mmstbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bm" size="20" maxlength="20"  value="<%=bm%>" >
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherewjjbm"  value="<%=wherewjjbm%>" >
<input type="hidden" name="wheremmstbm"  value="<%=wheremmstbm%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>
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
	if(	javaTrim(FormName.wjjbm)=="") {
		alert("请选择[五金件]！");
		FormName.wjjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmstbm)=="") {
		alert("请选择[锁体]！");
		FormName.mmstbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
