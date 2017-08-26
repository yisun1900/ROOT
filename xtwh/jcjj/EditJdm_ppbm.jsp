<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String dwbh=null;
String zclb=null;
String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc,dwbh,zclb ";
	ls_sql+=" from  jdm_ppbm";
	ls_sql+=" where  (ppbm='"+whereppbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zclb=cf.fillNull(rs.getString("zclb"));
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

<form method="post" action="SaveEditJdm_ppbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">品牌编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ppbm" size="20" maxlength="2"  value="<%=ppbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">品牌名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ppmc" size="20" maxlength="50"  value="<%=ppmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">生产厂家</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc",dwbh);
%>
    </select>
  </td>
  <td width="15%"> 
                <div align="right">主材类别</div>
  </td>
  <td width="35%">
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlbm,zcdlmc from jdm_zcdlbm  order by zcdlbm",zclb);
%> 
                </select>
              </td>
</tr>
<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
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
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[品牌编码]！");
		FormName.ppbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请输入[品牌名称]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[生产厂家]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zclb)=="") {
		alert("请选择[主材类别]！");
		FormName.zclb.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
