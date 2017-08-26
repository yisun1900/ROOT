<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%

String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String gysddph=request.getParameter("gysddph");
String gysmc=null;
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
try { 
	conn=cf.getConnection();

	ls_sql="select gysmc ";
	ls_sql+=" from  jxc_gysdd";
	ls_sql+=" where gysddph='"+gysddph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="">
<div align="center"><b>[<%=gysmc%>]订单<b></div>
<div align="center">&nbsp;</div>
<div align="center"><b>订单编号：[<a href="ViewJxc_gysdd.jsp?gysddph=<%=gysddph%>" target="_back"><%=gysddph%></a>]<b></div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>配送方式</td>
      <td width="34%"> 
        <input type="radio" name="psfs" value="1">
        配送 
        <input type="radio" name="psfs" value="2">
        自提 
        <input type="radio" name="psfs" value="9">
        其它 </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>要求到货时间</td>
      <td width="33%"> 
        <input type="text" name="yqdhsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>收货分公司</td>
      <td width="34%"> 
        <select name="shfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
//	if (yhjs.equals("A0") || yhjs.equals("A1"))
//	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F0') or dwbh='99999'  order by dwmc","");
//	}
//	else
//	{
//	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' order by dwmc","");
//	}
%>
  </select></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%"> 
      &nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">下单人</font></td>
      <td width="34%"> 
        <input type="text" name="xdr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">下单时间</font></td>
      <td width="33%"> 
        <input type="text" name="xdsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="gysddph" value="<%=gysddph%>">
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
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
	if(	!radioChecked(FormName.psfs)) {
		alert("请选择[配送方式]！");
		FormName.psfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.yqdhsj)=="") {
		alert("请输入[要求到货时间]！");
		FormName.yqdhsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yqdhsj, "要求到货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xdr)=="") {
		alert("请输入[下单人]！");
		FormName.xdr.focus();
		return false;
	}
	if(	javaTrim(FormName.shfgs)=="") {
		alert("请输入[收货分公司]！");
		FormName.shfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.xdsj)=="") {
		alert("请输入[下单时间]！");
		FormName.xdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xdsj, "下单时间"))) {
		return false;
	}

	FormName.action="savexdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
