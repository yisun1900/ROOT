<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String jhazrq=null;
String kjxsj=null;
String qhtr=null;
String qhtsj=null;
String htbz=null;
double jjje=0;
double xcmje=0;
double cpjjje=0;
double htze=0;
double zqjjje=0;
double zqxcmje=0;
double zqcpjjje=0;
double wdzje=0;

double jjzkl=0;
String dzyy=null;
String khbh=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jc_jjdd.khbh,jhazrq,kjxsj,qhtr,qhtsj,htbz,htze,jjje,xcmje,cpjjje,wdzje,zqjjje,zqxcmje,zqcpjjje,jjzkl,dzyy";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		qhtr=cf.fillNull(rs.getString("qhtr"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htbz=cf.fillNull(rs.getString("htbz"));
		jjje=rs.getDouble("jjje");
		xcmje=rs.getDouble("xcmje");
		cpjjje=rs.getDouble("cpjjje");
		htze=rs.getDouble("htze");
		zqjjje=rs.getDouble("zqjjje");
		zqxcmje=rs.getDouble("zqxcmje");
		zqcpjjje=rs.getDouble("zqcpjjje");
		wdzje=rs.getDouble("wdzje");
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();


	String jjwjbz="";
	ls_sql="select crm_khxx.jjwjbz";
	ls_sql+=" from  crm_khxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
	}
	rs.close();

	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">家具订单处理--签订合同（订单号：<%=ddbh%>）
	<input type="button"  value="打印合同" onClick="window.open('/jcjj/dygl/jjht.jsp?ddbh=<%=ddbh%>')"></div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>订单折扣</td>
      <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="jjzkl" size="8" maxlength="8" value="<%=jjzkl%>" onChange="f_jsjg(insertform)">
          <b><font color="#0000FF">（>0且<=10）
          <input type="hidden" name="zqjjje" size="20" maxlength="20"  value="<%=zqjjje%>" readonly onChange="f_wdzje(insertform)" >
          <input type="hidden" name="zqxcmje" size="20" maxlength="20"  value="<%=zqxcmje%>" readonly onChange="f_wdzje(insertform)" >
          <input type="hidden" name="zqcpjjje" size="20" maxlength="20"  value="<%=zqcpjjje%>" readonly onChange="f_wdzje(insertform)" >
          <input type="hidden" name="wdzje" size="20" maxlength="20"  value="<%=wdzje%>" readonly>
          <input type="hidden" name="jjje" size="20" maxlength="20"  value="<%=jjje%>" onChange="f_wdzje(insertform)" readonly>
          <input type="hidden" name="xcmje" size="20" maxlength="20"  value="<%=xcmje%>" onChange="f_wdzje(insertform)" readonly>
          <input type="hidden" name="cpjjje" size="20" maxlength="20"  value="<%=cpjjje%>" onChange="f_wdzje(insertform)" readonly>
          <input type="hidden" name="htze" size="20" maxlength="20"  value="<%=htze%>" readonly>
          </font></b></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">打折原因</td>
      <td colspan="3" bgcolor="#FFFFFF"><textarea name="dzyy" cols="71" rows="2"><%=dzyy%></textarea></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>计划安装日期</td>
      <td width="29%"> 
        <input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>"  ondblclick="JSCalendar(this)">      </td>
      <td width="22%" align="right"><font color="#FF0033">*</font>可减项截止时间</td>
      <td width="28%"> 
        <input type="text" name="kjxsj" size="20" maxlength="10"  value="<%=cf.addDay(7)%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font><font color="#0000CC">签合同人</font></td>
      <td width="29%"> 
        <input type="text" name="qhtr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>      </td>
      <td width="22%" align="right"><font color="#FF0033">*</font>签合同时间</td>
      <td width="28%"> 
        <input type="text" name="qhtsj" size="20" maxlength="20"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)" onBlur="f_getrq(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">合同备注</td>
      <td colspan="3"> 
        <textarea name="htbz" cols="71" rows="2"><%=htbz%></textarea>      </td>
    </tr>
    <tr > 
      <td colspan="4" align="center" > 
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
          <input type="button"  value="存盘" onClick="f_do(insertform)" name="button">
          <input type="reset" name="Reset" value="重输">
            <input type="button"  value="录入柜体" onClick="f_lrmm(insertform)" name="lrmm" disabled>
            <input type="button"  value="查看柜体" onClick="f_ckmm(insertform)" name="ckmm" disabled>
            <input type="button"  value="录入型材门" onClick="f_lrbgmmm(insertform)" name="lrbgmmm" disabled>
            <input type="button"  value="查看型材门" onClick="f_ckbgmmm(insertform)" name="ckbgmmm" disabled>
        <input type="button"  value="录入成品家具" onClick="f_lrcpjj(insertform)" name="lrcpjj" disabled>
        <input type="button"  value="查看成品家具" onClick="f_ckcpjj(insertform)" name="ckcpjj" disabled>      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4" height="435"> 
	  <iframe width="100%" height="100%" src="" name="childframe" marginwidth="0" marginheight="0" scrolling="YES" frameborder="0">        </iframe> </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_getrq(FormName)
{
	FormName.kjxsj.value=addDay(FormName.qhtsj.value,7);
}

function f_wdzje(FormName)//参数FormName:Form的名称
{
	var wdzje=0;
	wdzje=FormName.zqjjje.value*1.0+FormName.zqxcmje.value*1.0+FormName.zqcpjjje.value*1.0;
	wdzje=round(wdzje,2);
	FormName.wdzje.value=wdzje;

	FormName.jjje.value=FormName.zqjjje.value*FormName.jjzkl.value/10;
	FormName.xcmje.value=FormName.zqxcmje.value*FormName.jjzkl.value/10;
	FormName.cpjjje.value=FormName.zqcpjjje.value*FormName.jjzkl.value/10;


	var je=0;
	je=FormName.jjje.value*1.0+FormName.xcmje.value*1.0+FormName.cpjjje.value*1.0;
	je=round(je,2);
	FormName.htze.value=je;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_wdzje(FormName);	

	if(	javaTrim(FormName.jjzkl)=="") {
		alert("请输入[订单折扣]！");
		FormName.jjzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.jjzkl, "订单折扣"))) {
		return false;
	}
	if (FormName.jjzkl.value<=0 || FormName.jjzkl.value>10)
	{
		alert("错误！[订单折扣]应该在0和10之间！");
		FormName.jjzkl.select();
		return false;
	}
	if (FormName.jjzkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.jjje)=="") {
		alert("请输入[家具合同金额]！");
		FormName.jjje.focus();
		return false;
	}
	if(!(isFloat(FormName.jjje, "家具合同金额"))) {
		return false;
	}
	if(	javaTrim(FormName.xcmje)=="") {
		alert("请输入[型材门合同金额]！");
		FormName.xcmje.focus();
		return false;
	}
	if(!(isFloat(FormName.xcmje, "型材门合同金额"))) {
		return false;
	}
	if(	javaTrim(FormName.cpjjje)=="") {
		alert("请输入[成品家具合同金额-折后]！");
		FormName.cpjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.cpjjje, "成品家具合同金额-折后"))) {
		return false;
	}

	if(	javaTrim(FormName.htze)=="") {
		alert("请输入[合同总额]！");
		FormName.htze.focus();
		return false;
	}
	if(!(isFloat(FormName.htze, "合同总额"))) {
		return false;
	}
/*
	if (parseFloat(FormName.htze.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.htze.select();
		return false;
	}
*/
	if(	javaTrim(FormName.zqjjje)=="") {
		alert("请输入[家具合同金额－折前]！");
		FormName.zqjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqjjje, "家具合同金额－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zqxcmje)=="") {
		alert("请输入[型材门合同金额－折前]！");
		FormName.zqxcmje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqxcmje, "型材门合同金额－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zqcpjjje)=="") {
		alert("请输入[成品家具合同金额－折前]！");
		FormName.zqcpjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqcpjjje, "成品家具合同金额－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[未打折金额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折金额"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.htze.value))
	{
		alert("[未打折金额]不能小于[合同总额]！");
		FormName.htze.select();
		return false;
	}

	if(	javaTrim(FormName.jhazrq)=="") {
		alert("请输入[计划安装日期]！");
		FormName.jhazrq.focus();
		return false;
	}

	if(!(isDatetime(FormName.jhazrq, "计划安装日期"))) {
		return false;
	}

	if(	javaTrim(FormName.kjxsj)=="") {
		alert("请输入[可减项截止时间]！");
		FormName.kjxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "可减项截止时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtr)=="") {
		alert("请输入[签合同人]！");
		FormName.qhtr.focus();
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[签合同时间]！");
		FormName.qhtsj.focus();
		return false;
	}
		if(!(isDatetime(FormName.qhtsj, "签合同时间"))) {
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveHtJc_jjdd.jsp";
	FormName.submit();
	FormName.lrmm.disabled=false;
	FormName.ckmm.disabled=false;
	FormName.lrbgmmm.disabled=false;
	FormName.ckbgmmm.disabled=false;
	FormName.lrcpjj.disabled=false;
	FormName.ckcpjj.disabled=false;
	return true;
}

function f_lrmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="InsertJc_jjgtmx.jsp";
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

	FormName.target="childframe";
	FormName.action="Jc_jjgtmxList.jsp?";
	FormName.submit();
	return true;
}
function f_lrbgmmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="InsertJc_jjxcmmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckbgmmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="Jc_jjxcmmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrcpjj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="InsertJc_cpjjddmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckcpjj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="Jc_cpjjddmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
