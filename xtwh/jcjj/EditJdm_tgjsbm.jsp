<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tgjsbm=null;
String tgjsmc=null;
String dy=null;
String xydy=null;
String wheretgjsbm=cf.GB2Uni(request.getParameter("tgjsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tgjsbm,tgjsmc,dy,xydy ";
	ls_sql+=" from  jdm_tgjsbm";
	ls_sql+=" where  (tgjsbm='"+wheretgjsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tgjsbm=cf.fillNull(rs.getString("tgjsbm"));
		tgjsmc=cf.fillNull(rs.getString("tgjsmc"));
		dy=cf.fillNull(rs.getString("dy"));
		xydy=cf.fillNull(rs.getString("xydy"));
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

<form method="post" action="SaveEditJdm_tgjsbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">地柜进深区间编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="tgjsbm" size="20" maxlength="2"  value="<%=tgjsbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">地柜进深区间名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="tgjsmc" size="20" maxlength="50"  value="<%=tgjsmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">大于（mm）</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dy" size="20" maxlength="8"  value="<%=dy%>" >
  </td>
  <td width="15%"> 
    <div align="right">小于等于（mm）</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xydy" size="20" maxlength="8"  value="<%=xydy%>" >
  </td>
</tr>
<input type="hidden" name="wheretgjsbm"  value="<%=wheretgjsbm%>" >
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
	if(	javaTrim(FormName.tgjsbm)=="") {
		alert("请输入[地柜进深区间编码]！");
		FormName.tgjsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tgjsmc)=="") {
		alert("请输入[地柜进深区间名称]！");
		FormName.tgjsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dy)=="") {
		alert("请输入[大于（mm）]！");
		FormName.dy.focus();
		return false;
	}
	if(!(isNumber(FormName.dy, "大于（mm）"))) {
		return false;
	}
	if(	javaTrim(FormName.xydy)=="") {
		alert("请输入[小于等于（mm）]！");
		FormName.xydy.focus();
		return false;
	}
	if(!(isNumber(FormName.xydy, "小于等于（mm）"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
