<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String jhccsj=null;
String sccsj=null;
String ccbz=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jhccsj,sccsj,ccbz";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		sccsj=cf.fillNull(rs.getDate("sccsj"));
		ccbz=cf.fillNull(rs.getString("ccbz"));
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
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>橱柜初测</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">橱柜初测</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">初测录入人</td>
              <td width="29%"> 
                <input type="text" name="ccr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="22%" align="right">　</td>
              <td width="28%"> 
                　
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">计划初测时间</td>
              <td width="29%"> 
                <input type="text" name="jhccsj" size="20" maxlength="20"  value="<%=jhccsj%>" readonly>
              </td>
              <td width="22%" align="right">实际初测时间</td>
              <td width="28%"> 
                <input type="text" name="sccsj" size="20" maxlength="20"  value="<%=cf.today()%>" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">初测备注</td>
              <td colspan="3"> 
                <textarea name="ccbz" cols="71" rows="3"><%=ccbz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                <p> 
                  <input type="button"  value="录入橱柜明细" onClick="f_lrmm(insertform)" name="lrmm" disabled>
                  <input type="button"  value="查看橱柜明细" onClick="f_ckmm(insertform)" name="ckmm" disabled>
                </p>
                <p> 
                  <input type="button"  value="录入五金明细" onClick="f_lrwj(insertform)" name="lrwj" disabled>
                  <input type="button"  value="查看五金明细" onClick="f_ckwj(insertform)" name="ckwj" disabled>
                </p>
                <p> 
                  <input type="button"  value="录入电器明细" onClick="f_lrbl(insertform)" name="lrbl" disabled>
                  <input type="button"  value="查看电器明细" onClick="f_ckbl(insertform)" name="ckbl" disabled>
                </p>
                </div>
              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ccr)=="") {
		alert("请输入[初测录入人]！");
		FormName.ccr.focus();
		return false;
	}
	if(	javaTrim(FormName.sccsj)=="") {
		alert("请输入[实初测时间]！");
		FormName.sccsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sccsj, "实初测时间"))) {
		return false;
	}
/*
	if(	javaTrim(FormName.ccbz)=="") {
		alert("请输入[初测备注]！");
		FormName.ccbz.focus();
		return false;
	}
*/
	FormName.action="SaveCcJc_cgdd.jsp";
	FormName.submit();
	FormName.lrmm.disabled=false;
	FormName.ckmm.disabled=false;
	FormName.lrwj.disabled=false;
	FormName.ckwj.disabled=false;
	FormName.lrbl.disabled=false;
	FormName.ckbl.disabled=false;
	return true;
}
function f_lrmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgccdmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgccdmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgwjccdmx.jsp";
	FormName.submit();
	return true;
}

function f_ckwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgwjccdmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgdqccdmx.jsp";
	FormName.submit();
	return true;
}

function f_ckbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgdqccdmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
