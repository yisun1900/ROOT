<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String fgsbh=null;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cxhdmc,fgsbh";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();


	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk ";
	ls_sql+=" from  jc_cxhdbffyzk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
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
<title>促销活动增减项折扣</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">促销活动部分费用折扣</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="4" ><div align="center">
            <input type="button"  value="保存" onClick="f_do(insertform)">
            <input type="reset"  value="重输">
            <input type="hidden" name="cxhdbm" size="20" maxlength="7"  value="<%=cxhdbm%>" readonly>
                <br>
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">促销活动编码</font></td>
      <td width="32%"><%=cxhdbm%></td>
      <td align="right" width="18%"><font color="#0000FF">促销活动名称</font></td>
      <td width="32%"><%=cxhdmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>工程－辅材费折扣</td>
      <td><input type="text" name="clfzk" size="8" maxlength="9"  value="<%=clfzk%>" >
          <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
      <td align="right"><font color="#FF0000">*</font>工程－主材费折扣</td>
      <td><input type="text" name="zcfzk" size="8" maxlength="9"  value="<%=zcfzk%>" >
          <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>工程－人工费折扣</td>
      <td><input type="text" name="rgfzk" size="8" maxlength="9"  value="<%=rgfzk%>" >
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>工程－运输费折扣</td>
      <td><input type="text" name="ysfzk" size="8" maxlength="8" value="<%=ysfzk%>">
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>工程－机械费折扣</td>
      <td><input type="text" name="jxfzk" size="8" maxlength="8" value="<%=jxfzk%>">
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>工程－损耗费折扣</td>
      <td><input type="text" name="shfzk" size="8" maxlength="8" value="<%=shfzk%>">
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>工程－其它费折扣</td>
      <td><input type="text" name="qtfzk" size="8" maxlength="8" value="<%=qtfzk%>">
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
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
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}

	if(	javaTrim(FormName.clfzk)=="") {
		alert("请输入[辅材费折扣]！");
		FormName.clfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.clfzk, "辅材费折扣"))) {
		return false;
	}
	if (FormName.clfzk.value<0 || FormName.clfzk.value>10)
	{
		alert("错误！[辅材费折扣]应该在0和10之间！");
		FormName.clfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcfzk)=="") {
		alert("请输入[主材费折扣]！");
		FormName.clfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcfzk, "主材费折扣"))) {
		return false;
	}
	if (FormName.zcfzk.value<0 || FormName.zcfzk.value>10)
	{
		alert("错误！[主材费折扣]应该在0和10之间！");
		FormName.zcfzk.select();
		return false;
	}
	if(	javaTrim(FormName.rgfzk)=="") {
		alert("请输入[人工费折扣]！");
		FormName.rgfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfzk, "人工费折扣"))) {
		return false;
	}
	if (FormName.rgfzk.value<0 || FormName.rgfzk.value>10)
	{
		alert("错误！[人工费折扣]应该在0和10之间！");
		FormName.rgfzk.select();
		return false;
	}
	if(	javaTrim(FormName.ysfzk)=="") {
		alert("请输入[运输费折扣]！");
		FormName.ysfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysfzk, "运输费折扣"))) {
		return false;
	}
	if (FormName.ysfzk.value<0 || FormName.ysfzk.value>10)
	{
		alert("错误！[运输费折扣]应该在0和10之间！");
		FormName.ysfzk.select();
		return false;
	}
	if(	javaTrim(FormName.jxfzk)=="") {
		alert("请输入[机械费折扣]！");
		FormName.jxfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.jxfzk, "机械费折扣"))) {
		return false;
	}
	if (FormName.jxfzk.value<0 || FormName.jxfzk.value>10)
	{
		alert("错误！[机械费折扣]应该在0和10之间！");
		FormName.jxfzk.select();
		return false;
	}
	if(	javaTrim(FormName.shfzk)=="") {
		alert("请输入[损耗费折扣]！");
		FormName.shfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.shfzk, "损耗费折扣"))) {
		return false;
	}
	if (FormName.shfzk.value<0 || FormName.shfzk.value>10)
	{
		alert("错误！[损耗费折扣]应该在0和10之间！");
		FormName.shfzk.select();
		return false;
	}
	if(	javaTrim(FormName.qtfzk)=="") {
		alert("请输入[其它费折扣]！");
		FormName.qtfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfzk, "其它费折扣"))) {
		return false;
	}
	if (FormName.qtfzk.value<0 || FormName.qtfzk.value>10)
	{
		alert("错误！[其它费折扣]应该在0和10之间！");
		FormName.qtfzk.select();
		return false;
	}
	
	FormName.action="SaveInsertJc_cxhdbffyzk.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
