<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tsjlh=null;
String clmc=null;
String sl=null;
String dj=null;
String clf=null;
String llr=null;
String llsj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsjlh,clmc,sl,dj,clf,llr,llsj,lrr,lrsj,bz ";
	ls_sql+=" from  crm_wxclfmx";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		clmc=cf.fillNull(rs.getString("clmc"));
		sl=cf.fillNull(rs.getString("sl"));
		dj=cf.fillNull(rs.getString("dj"));
		clf=cf.fillNull(rs.getString("clf"));
		llr=cf.fillNull(rs.getString("llr"));
		llsj=cf.fillNull(rs.getDate("llsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_wxclfmx.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入序号</span></td>
    <td><input type="text" name="lrxh" value="<%=lrxh%>" size="20" maxlength="8" readonly>    </td>
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">报修记录号</span></td>
    <td><input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="10" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>材料名称</td> 
  <td colspan="3"> 
    <input type="text" name="clmc" size="73" maxlength="100"  value="<%=clmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>数量</td>
  <td><input type="text" name="sl" size="20" maxlength="17"  value="<%=sl%>" onChange="f_jsje(editform)"></td>
  <td align="right"><span class="STYLE1">*</span>单价</td>
  <td><input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" onChange="f_jsje(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">材料费</span></td> 
  <td width="32%"><input type="text" name="clf" size="20" maxlength="17"  value="<%=clf%>" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>领料人</td> 
  <td width="32%"> 
    <input type="text" name="llr" size="20" maxlength="20"  value="<%=llr%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>领料时间</td> 
  <td width="32%"> 
    <input type="text" name="llsj" size="20" maxlength="10"  value="<%=llsj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>    </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
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
function f_jsje(FormName)//参数FormName:Form的名称
{
	var clf=FormName.sl.value*FormName.dj.value*1.0 ;
	clf=round(clf,2);
	FormName.clf.value=clf;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jsje(FormName);

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
