<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bjxh=null;
String gtxh=null;
String ddbh=null;
String jjbjmcbm=null;
String bjcd=null;
String bjkd=null;
String sl=null;
String dj=null;
String je=null;
String bz=null;
String wherebjxh=cf.GB2Uni(request.getParameter("bjxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bjxh,gtxh,ddbh,jjbjmcbm,bjcd,bjkd,sl,dj,je,bz ";
	ls_sql+=" from  jc_ddbjmx";
	ls_sql+=" where  (bjxh="+wherebjxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjxh=cf.fillNull(rs.getString("bjxh"));
		gtxh=cf.fillNull(rs.getString("gtxh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		jjbjmcbm=cf.fillNull(rs.getString("jjbjmcbm"));
		bjcd=cf.fillNull(rs.getString("bjcd"));
		bjkd=cf.fillNull(rs.getString("bjkd"));
		sl=cf.fillNull(rs.getString("sl"));
		dj=cf.fillNull(rs.getString("dj"));
		je=cf.fillNull(rs.getString("je"));
		bz=cf.fillNull(rs.getString("bz"));
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
      <div align="center"> 请修改柜体配件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_ddbjmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right">柜体序号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="gtxh" size="20" maxlength="8"  value="<%=gtxh%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">板件名称</div>
              </td>
              <td width="33%"> 
                <select name="jjbjmcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jjbjmcbm,jjbjmc from jdm_jjbjmcbm order by jjbjmcbm",jjbjmcbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">单价</div>
              </td>
              <td width="33%"> 
                <input type="text" name="dj" size="20" maxlength="8"  value="<%=dj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">板件长度（mm）</div>
              </td>
              <td width="33%"> 
                <input type="text" name="bjcd" size="20" maxlength="8"  value="<%=bjcd%>" >
              </td>
              <td width="17%"> 
                <div align="right">板件宽度（mm）</div>
              </td>
              <td width="33%"> 
                <input type="text" name="bjkd" size="20" maxlength="8"  value="<%=bjkd%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">数量</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" >
              </td>
              <td width="17%"> 
                <div align="right">金额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="je" size="20" maxlength="8"  value="<%=je%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherebjxh"  value="<%=wherebjxh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="hidden" name="bjxh" size="20" maxlength="8"  value="<%=bjxh%>" >
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
	if(	javaTrim(FormName.bjxh)=="") {
		alert("请输入[板件序号]！");
		FormName.bjxh.focus();
		return false;
	}
	if(!(isNumber(FormName.bjxh, "板件序号"))) {
		return false;
	}
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}
	if(!(isNumber(FormName.gtxh, "柜体序号"))) {
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjbjmcbm)=="") {
		alert("请选择[板件名称]！");
		FormName.jjbjmcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.bjcd, "板件长度（mm）"))) {
		return false;
	}
	if(!(isNumber(FormName.bjkd, "板件宽度（mm）"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
	}
	if(!(isNumber(FormName.dj, "单价"))) {
		return false;
	}
	if(!(isNumber(FormName.je, "金额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
