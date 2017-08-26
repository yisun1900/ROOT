<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kmdm=null;
String xmmc1=null;
String xmmc2=null;
String xmmc3=null;
String xmmc4=null;
String dwbh=null;
String wherekmdm=cf.GB2Uni(request.getParameter("kmdm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kmdm,xmmc1,xmmc2,xmmc3,xmmc4,dwbh ";
	ls_sql+=" from  cw_kmdmb";
	ls_sql+=" where  (kmdm='"+wherekmdm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kmdm=cf.fillNull(rs.getString("kmdm"));
		xmmc1=cf.fillNull(rs.getString("xmmc1"));
		xmmc2=cf.fillNull(rs.getString("xmmc2"));
		xmmc3=cf.fillNull(rs.getString("xmmc3"));
		xmmc4=cf.fillNull(rs.getString("xmmc4"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
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

<form method="post" action="SaveEditCw_kmdmb.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="26%"> 
                <div align="right">科目代码</div>
  </td>
              <td width="26%"> 
                <input type="text" name="kmdm" size="20" maxlength="40"  value="<%=kmdm%>" >
  </td>
              <td width="26%"> 
                <div align="right">第一个核算项目所属类别名称</div>
  </td>
              <td width="22%"> 
                <input type="text" name="xmmc1" size="20" maxlength="80"  value="<%=xmmc1%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="26%"> 
                <div align="right">第二个核算项目所属类别名称</div>
  </td>
              <td width="26%"> 
                <input type="text" name="xmmc2" size="20" maxlength="80"  value="<%=xmmc2%>" >
  </td>
              <td width="26%"> 
                <div align="right">第三个核算项目所属类别名称</div>
  </td>
              <td width="22%"> 
                <input type="text" name="xmmc3" size="20" maxlength="80"  value="<%=xmmc3%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="26%"> 
                <div align="right">第四个核算项目所属类别名称</div>
  </td>
              <td width="26%"> 
                <input type="text" name="xmmc4" size="20" maxlength="80"  value="<%=xmmc4%>" >
  </td>
              <td width="26%"> 
                <div align="right">使用单位</div>
  </td>
              <td width="22%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<!--     <option value=""></option> -->
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
%>
    </select>
  </td>
</tr>
<input type="hidden" name="wherekmdm"  value="<%=wherekmdm%>" >
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
	if(	javaTrim(FormName.kmdm)=="") {
		alert("请输入[科目代码]！");
		FormName.kmdm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc1)=="") {
		alert("请输入[项目名称1]！");
		FormName.xmmc1.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[使用单位]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

