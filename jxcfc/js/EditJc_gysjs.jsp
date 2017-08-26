<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gys=null;
String jssj=null;
String jsr=null;
String cbzj=null;
String ycfzj=null;
String qtfzj=null;
String kcfy=null;
String jsje=null;
String jssm=null;
String cwzq=null;
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//表示录入存盘直接转过来
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gys,jssj,jsr,cbzj,ycfzj,qtfzj,kcfy,jsje,jssm,cwzq ";
	ls_sql+=" from  jc_fcgysjs";
	ls_sql+=" where  (jsjlh="+jsjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gys=cf.fillNull(rs.getString("gys"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		cbzj=cf.fillNull(rs.getString("cbzj"));
		ycfzj=cf.fillNull(rs.getString("ycfzj"));
		qtfzj=cf.fillNull(rs.getString("qtfzj"));
		kcfy=cf.fillNull(rs.getString("kcfy"));
		jsje=cf.fillNull(rs.getString("jsje"));
		jssm=cf.fillNull(rs.getString("jssm"));
		cwzq=cf.fillNull(rs.getString("cwzq"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<form method="post" action="SaveEditJc_gysjs.jsp" name="editform" target="_blank">
<div align="center">请修改信息（结算记录号：<%=jsjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">供应商</font></td> 
  <td width="32%"><%=gys%> </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">结算人</font></td>
  <td><input type="text" name="jsr" size="20" maxlength="20"  value="<%=jsr%>" readonly></td>
  <td align="right"><font color="#FF0000">*</font>结算时间</td>
  <td><input type="text" name="jssj" size="20" maxlength="10"  value="<%=jssj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">材料成本</font></td> 
  <td width="32%"><input type="text" name="cbzj" size="20" maxlength="17"  value="<%=cbzj%>" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>扣除费用</td> 
  <td width="32%"> 
    <input type="text" name="kcfy" size="20" maxlength="17"  value="<%=kcfy%>" onChange="f_jsjg(editform)">  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">结算金额</font></td> 
  <td width="32%"> 
    <input type="text" name="jsje" size="20" maxlength="17"  value="<%=jsje%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算说明</td> 
  <td colspan="3"> 
    <textarea name="jssm" cols="71" rows="3"><%=jssm%></textarea>    </td>
  </tr>
<input type="hidden" name="jsjlh"  value="<%=jsjlh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	  <input type="button"  value="打印" onClick="window.open('ViewJc_gysjs.jsp?jsjlh=<%=jsjlh%>')"  />
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var jsje=FormName.cbzj.value*1.0-FormName.kcfy.value*1.0;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.jssj)=="") {
		alert("请输入[结算时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "结算时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[结算人]！");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.cbzj)=="") {
		alert("请输入[材料成本]！");
		FormName.cbzj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbzj, "材料成本"))) {
		return false;
	}

	if(	javaTrim(FormName.kcfy)=="") {
		alert("请输入[扣除费用]！");
		FormName.kcfy.focus();
		return false;
	}
	if(!(isFloat(FormName.kcfy, "扣除费用"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("请输入[结算金额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "结算金额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
