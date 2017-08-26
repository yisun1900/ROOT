<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String xmzy=null;
String wheredwbh=request.getParameter("dwbh");
String wherexmzy=request.getParameter("xmzy");
String ssfgs=cf.executeQuery("select ssfgs from sq_dwxx where dwbh='"+wheredwbh+"'");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,xmzy ";
	ls_sql+=" from  sq_xmzy";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (xmzy='"+wherexmzy+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
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

<form method="post" action="SaveEditSq_xmzy.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">单位编号</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">项目专员</div>
  </td>
  <td width="35%"> 
    <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"'  order by yhmc",xmzy);
%>
    </select>
  </td>
</tr>
<input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
<input type="hidden" name="wherexmzy"  value="<%=wherexmzy%>" >
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmzy)=="") {
		alert("请选择[项目专员]！");
		FormName.xmzy.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
