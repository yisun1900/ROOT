<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

long lrxh=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(lrxh)+1,1)";
	ls_sql+=" from  crm_wxclfmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lrxh=rs.getLong(1);
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_wxclfmx.jsp" name="insertform"  >
<div align="center">请录入－维修材料领取明细</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入序号</span></td> 
  <td width="32%"> 
    <input type="text" name="lrxh" value="<%=lrxh%>" size="20" maxlength="8" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">报修记录号</span></td> 
  <td width="32%"> 
    <input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>材料名称</td> 
  <td colspan="3"> 
    <input type="text" name="clmc" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>数量</td>
  <td><input type="text" name="sl" value="" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right"><span class="STYLE1">*</span>单价</td>
  <td><input type="text" name="dj" value="" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">材料费</span></td> 
  <td width="32%"><input type="text" name="clf" value="" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>领料人</td> 
  <td width="32%"> 
    <input type="text" name="llr" value="<%=yhmc%>" size="20" maxlength="20" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>领料时间</td> 
  <td width="32%"> 
    <input type="text" name="llsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
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
function f_jsje(FormName)//参数FormName:Form的名称
{
	var clf=FormName.sl.value*FormName.dj.value*1.0 ;
	clf=round(clf,2);
	FormName.clf.value=clf;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jsje(FormName);

	if(	javaTrim(FormName.lrxh)=="") {
		alert("请输入[录入序号]！");
		FormName.lrxh.focus();
		return false;
	}
	if(!(isNumber(FormName.lrxh, "录入序号"))) {
		return false;
	}
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请输入[报修记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.clmc)=="") {
		alert("请输入[材料名称]！");
		FormName.clmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.llr)=="") {
		alert("请输入[领料人]！");
		FormName.llr.focus();
		return false;
	}
	if(	javaTrim(FormName.llsj)=="") {
		alert("请输入[领料时间]！");
		FormName.llsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.llsj, "领料时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
