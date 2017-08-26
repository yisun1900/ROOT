<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String ssfgs=null;
String gys=null;
String jssj=null;
String jsr=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double fk=0;
double kzbjbl=0;
double kzbjje=0;
double qtkk=0;
double kcfy=0;
double jsje=0;
double ljfkbl=0;
double ljfkje=0;
String jssm=null;
String cwzq=null;
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ssfgs,fkbl,fkje,gys,jssj,jsr,cbzj,ycfzj,qtfzj,fk,kzbjbl,kzbjje,qtkk,kcfy,jsje,jssm,cwzq,fk,kzbjbl,kzbjje,qtkk ";
	ls_sql+=" from  jc_gysjs";
	ls_sql+=" where jsjlh="+jsjlh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ljfkbl=rs.getDouble("fkbl");
		ljfkje=rs.getDouble("fkje");
		gys=cf.fillNull(rs.getString("gys"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		cbzj=rs.getDouble("cbzj");
		ycfzj=rs.getDouble("ycfzj");
		qtfzj=rs.getDouble("qtfzj");
		kcfy=rs.getDouble("kcfy");
		jsje=rs.getDouble("jsje");
		jssm=cf.fillNull(rs.getString("jssm"));
		cwzq=cf.fillNull(rs.getString("cwzq"));
		fk=rs.getDouble("fk");
		kzbjbl=rs.getDouble("kzbjbl");
		kzbjje=rs.getDouble("kzbjje");
		qtkk=rs.getDouble("qtkk");
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


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_gysjsfkjl.jsp" name="insertform"  >
<div align="center">供应商结算付款记录</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="18%" height="24" align="right"><span class="STYLE1">结算记录号</span></td> 
  <td width="32%"><%=jsjlh%></td>
  <td align="right" width="18%"><span class="STYLE1">结算金额</span></td> 
  <td width="32%"><%=jsje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">累计付款比例</span></td>
  <td><%=ljfkbl%>%</td>
  <td align="right"><span class="STYLE1">累计付款金额</span></td>
  <td><%=ljfkje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">供应商</span></td> 
  <td colspan="3"><%=gys%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">结算说明</span></td>
  <td colspan="3"><%=jssm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>付款比例</td>
  <td><input type="text" name="fkbl" value="" size="10" maxlength="9" onChange="f_jsjg(insertform)">
    %</td>
  <td align="right"><span class="STYLE2">*</span><span class="STYLE1">付款金额</span></td>
  <td><input type="text" name="fkje" value="" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>付款人</td> 
  <td width="32%"><input type="text" name="fkr" value="<%=yhmc%>" size="20" maxlength="20" ></td>
  <td align="right" width="18%"><span class="STYLE2">*</span>付款时间</td> 
  <td width="32%"><input type="text" name="fksj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*<span class="STYLE1">录入人</span></span></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">录入时间</span></td> 
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="ssfgs" value="<%=ssfgs%>"  >
	<input type="hidden" name="jsjlh" value="<%=jsjlh%>"  >
	<input type="hidden" name="gys" value="<%=gys%>"  >
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	var fkje=<%=jsje%>/100*FormName.fkbl.value;
	fkje=round(fkje,2);
	FormName.fkje.value=fkje;

}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.jsjlh, "结算记录号"))) {
		return false;
	}
	if(	javaTrim(FormName.gys)=="") {
		alert("请输入[供应商]！");
		FormName.gys.focus();
		return false;
	}
	if(	javaTrim(FormName.fkbl)=="") {
		alert("请输入[付款比例]！");
		FormName.fkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fkbl, "付款比例"))) {
		return false;
	}
	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[付款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "付款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.fkr)=="") {
		alert("请输入[付款人]！");
		FormName.fkr.focus();
		return false;
	}
	if(	javaTrim(FormName.fksj)=="") {
		alert("请输入[付款时间]！");
		FormName.fksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fksj, "付款时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
