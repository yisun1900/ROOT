<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgd=null;
String sgbz=null;
String fksj=null;
String fkr=null;
String fkje=null;
String fkyy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String fdbh=null;
String fkjlh=cf.GB2Uni(request.getParameter("fkjlh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fdbh,sgd,sgbz,fksj,fkr,fkje,fkyy,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_sgdfkjl";
	ls_sql+=" where  (fkjlh='"+fkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fdbh=cf.fillNull(rs.getString("fdbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fksj=cf.fillNull(rs.getDate("fksj"));
		fkr=cf.fillNull(rs.getString("fkr"));
		fkje=cf.fillNull(rs.getString("fkje"));
		fkyy=cf.fillNull(rs.getString("fkyy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
.STYLE2 {color: #0000FF}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_sgdfkjl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE3">罚款记录号</span></td>
    <td><input type="text" name="fkjlh" value="<%=fkjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE3">施工队</span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','') from sq_sgd where sgd='"+sgd+"'",sgd);
%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>罚款金额</td>
    <td><input type="text" name="fkje" size="20" maxlength="17"  value="<%=fkje%>" ></td>
    <td align="right">班长</td>
    <td><select name="sgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select bzmc c1,bzmc c2 from sq_bzxx where sgd='"+sgd+"' and tdbz in('N','Y') order by bzmc",sgbz);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>罚单编号</td>
    <td><input name="fdbh" type="text" value="<%=fdbh%>" size="20" maxlength="17" ></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>罚款人</td>
  <td><input type="text" name="fkr" size="20" maxlength="20"  value="<%=fkr%>" ></td>
  <td align="right"><span class="STYLE1">*</span>罚款时间</td>
  <td><input type="text" name="fksj" size="20" maxlength="10"  value="<%=fksj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>罚款原因</td> 
  <td colspan="3"><textarea name="fkyy" cols="75" rows="6"><%=fkyy%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE3">录入人</span></td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE3">录入时间</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="75" rows="2"><%=bz%></textarea></td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fkjlh)=="") {
		alert("请输入[罚款记录号]！");
		FormName.fkjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.fdbh)=="") {
		alert("请输入[罚单编号]！");
		FormName.fdbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fksj)=="") {
		alert("请输入[罚款时间]！");
		FormName.fksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fksj, "罚款时间"))) {
		return false;
	}
	if(	javaTrim(FormName.fkr)=="") {
		alert("请输入[罚款人]！");
		FormName.fkr.focus();
		return false;
	}
	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[罚款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "罚款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.fkyy)=="") {
		alert("请输入[罚款原因]！");
		FormName.fkyy.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
