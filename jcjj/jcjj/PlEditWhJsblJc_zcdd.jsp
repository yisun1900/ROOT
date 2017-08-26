<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String sfjs="";
try {
	conn=cf.getConnection();

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="select sfjs";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfjs=cf.fillNull(rs.getString("sfjs"));
		}
		rs.close();
		ps.close();

		if (!sfjs.equals("N") && !sfjs.equals("C") && !sfjs.equals("P"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
		{
			out.println("错误！订单【"+ddbh[i]+"】已结算，不能修改");
			return;
		}
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
      <div align="center">维护－厂商结算比例</div> 
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>正常品厂商结算比例</td>
              <td><input type="text" name="fdbl" value="" size="10" maxlength="20"  >
%</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td width="45%" align="right"><font color="#FF0000">*</font>特价品厂商结算比例</td>
              <td width="55%"><input type="text" name="tjpfdbl" value="" size="10" maxlength="20"  >
%</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>安装费结算比例</td>
              <td><input name="azfjsbl" type="text" value="" size="10" maxlength="20"  >
                %</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>远程费结算比例</td>
              <td><input name="ycfjsbl" type="text" value="" size="10" maxlength="20"  >
                %</td>
            </tr>
            
            
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center">
				<%
				for (int i=0;i<ddbh.length ;i++ )
				{
					%>
                  <input type="hidden" name="ddbh"  value="<%=ddbh[i]%>" >
					<%
				}
				%>
                  <input type="button" value="保存" onClick="f_do(editform)">
                </div>              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.fdbl)=="") {
		alert("请输入[正常品厂商结算比例]！");
		FormName.fdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fdbl, "正常品厂商结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.fdbl.value)<0 || parseFloat(FormName.fdbl.value)>100) {
		alert("错误！[正常品厂商结算比例]应在0与100之间");
		FormName.fdbl.select();
		return false;
	}

	if(	javaTrim(FormName.tjpfdbl)=="") {
		alert("请输入[特价品厂商结算比例]！");
		FormName.tjpfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjpfdbl, "特价品厂商结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tjpfdbl.value)<0 || parseFloat(FormName.tjpfdbl.value)>100) {
		alert("错误！[特价品厂商结算比例]应在0与100之间");
		FormName.tjpfdbl.select();
		return false;
	}

	if(	javaTrim(FormName.azfjsbl)=="") {
		alert("请输入[安装费结算比例]！");
		FormName.azfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.azfjsbl, "安装费结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.azfjsbl.value)<0 || parseFloat(FormName.azfjsbl.value)>100) {
		alert("错误！[安装费结算比例]应在0与100之间");
		FormName.azfjsbl.select();
		return false;
	}

	if(	javaTrim(FormName.ycfjsbl)=="") {
		alert("请输入[远程费结算比例]！");
		FormName.ycfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfjsbl, "远程费结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.ycfjsbl.value)<0 || parseFloat(FormName.ycfjsbl.value)>100) {
		alert("错误！[远程费结算比例]应在0与100之间");
		FormName.ycfjsbl.select();
		return false;
	}


	FormName.action="SavePlEditWhJsblJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
