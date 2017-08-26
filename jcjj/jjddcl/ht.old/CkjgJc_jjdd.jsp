<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String ddbh=request.getParameter("ddbh");
String qhtr=null;
String qhtsj=null;
String htbz=null;

int jjhtze=0;
int wjhtze=0;
int dqhtze=0;
int htze=0;
int zsje=0;
int ssje=0;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select qhtr,qhtsj,htbz,htze,zsje,ssje";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qhtr=cf.fillNull(rs.getString("qhtr"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htbz=cf.fillNull(rs.getString("htbz"));
		htze=rs.getInt("htze");
		zsje=rs.getInt("zsje");
		ssje=rs.getInt("ssje");
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
<title>签订合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">查看合同价格</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">签合同人</font></td>
              <td width="29%"> 
                <input type="text" name="qhtr" size="20" maxlength="20"  value="<%=qhtr%>" readonly>
              </td>
              <td width="22%" align="right"><font color="#0000CC">签合同时间</font></td>
              <td width="28%"> 
                <input type="text" name="qhtsj" size="20" maxlength="20"  value="<%=qhtsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">合同总额</td>
              <td width="29%">
                <input type="text" name="htze" size="20" maxlength="20"  value="<%=htze%>"  onchange="f_ssje(insertform)">
              </td>
              <td width="22%" align="right">&nbsp;</td>
              <td width="28%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">赠送金额</td>
              <td width="29%"> 
                <input type="text" name="zsje" size="20" maxlength="20"  value="<%=zsje%>" onchange="f_ssje(insertform)">
              </td>
              <td width="22%" align="right">实收金额</td>
              <td width="28%"> 
                <input type="text" name="ssje" size="20" maxlength="20"  value="<%=ssje%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">合同备注</td>
              <td colspan="3"> 
                <textarea name="htbz" cols="71" rows="3"><%=htbz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ssje(FormName)//参数FormName:Form的名称
{
	FormName.ssje.value=FormName.htze.value-FormName.zsje.value;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.htze)=="") {
		alert("请输入[合同总额]！");
		FormName.htze.focus();
		return false;
	}
	if(!(isInt(FormName.htze, "合同总额"))) {
		return false;
	}
	if(	javaTrim(FormName.zsje)=="") {
		alert("请输入[赠送金额]！");
		FormName.zsje.focus();
		return false;
	}
	if(!(isInt(FormName.zsje, "赠送金额"))) {
		return false;
	}
	if(	javaTrim(FormName.ssje)=="") {
		alert("请输入[实收金额]！");
		FormName.ssje.focus();
		return false;
	}
	if(!(isInt(FormName.ssje, "实收金额"))) {
		return false;
	}

	f_ssje(FormName);
	FormName.action="SaveCkjgJc_jjdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
