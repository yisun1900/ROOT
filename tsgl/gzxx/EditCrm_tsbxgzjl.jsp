<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String tsjlh=null;
String khbh=null;
String qksm=null;
String lrsj=null;
String lrr=null;
String lrbm=null;
String lx=null;
String gzjlh=cf.GB2Uni(request.getParameter("gzjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsjlh,khbh,qksm,lrsj,lrr,lrbm,lx ";
	ls_sql+=" from  crm_tsbxgzjl";
	ls_sql+=" where  (gzjlh='"+gzjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		qksm=cf.fillNull(rs.getString("qksm"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		lx=cf.fillNull(rs.getString("lx"));
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
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_tsbxgzjl.jsp" name="editform">
<div align="center">维护跟踪信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">跟踪记录号</span></td>
  <td width="33%"><input type="text" name="gzjlh" value="<%=gzjlh%>" size="20" maxlength="12" readonly></td>
  <td width="17%" align="right"><span class="STYLE1">*</span>类型</td>
  <td width="33%"><%
	cf.radioToken(out, "lx","1+客诉专员&2+客服",lx);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">投诉报修记录号</span></td>
  <td><input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="10" readonly></td>
  <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>客户编号</span></td>
  <td><input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">情况说明</td> 
  <td colspan="3"><textarea name="qksm" cols="71" rows="6"><%=qksm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
  </select>
  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<input type="hidden" name="gzjlh"  value="<%=gzjlh%>" >
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.qksm)=="") {
		alert("请输入[情况说明]！");
		FormName.qksm.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
