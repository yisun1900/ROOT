<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cldlbm=null;
String cldlmc=null;
double qybfb=0;
String wherecldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cldlbm,cldlmc,qybfb ";
	ls_sql+=" from  cl_cldlbm";
	ls_sql+=" where  (cldlbm='"+wherecldlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		qybfb=rs.getDouble("qybfb");
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
<form method="post" action="SaveEditCl_cldlbm.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">材料大类编码</td>
      <td width="33%"> 
        <input type="text" name="cldlbm" size="10" maxlength="2"  value="<%=cldlbm%>" readonly>
        <font color="red">（2位数字或字母）</font> </td>
      <td align="right" width="17%">材料大类名称</td>
      <td width="33%"> 
        <input type="text" name="cldlmc" size="20" maxlength="50"  value="<%=cldlmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">签约百分比</td>
      <td width="33%"> 
        <input type="text" name="qybfb" value="<%=qybfb%>" size="10" maxlength="15" >
        %</td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <input type="hidden" name="wherecldlbm"  value="<%=wherecldlbm%>" >
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请输入[材料大类编码]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	FormName.cldlbm.value.length!=2) {
		alert("[材料大类编码]应该为2位！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("请输入[材料大类名称]！");
		FormName.cldlmc.focus();
		return false;
	}

	if(	javaTrim(FormName.qybfb)=="") {
		alert("请输入[签约百分比]！");
		FormName.qybfb.focus();
		return false;
	}

	if(!(isFloat(FormName.qybfb, "签约百分比"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
