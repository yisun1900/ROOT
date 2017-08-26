<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String sgd=null;
String fksj=null;
String fkr=null;
String fkje=null;
String fkyy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String shr=null;
String shsj=null;
String shsm=null;
String fkjlh=cf.GB2Uni(request.getParameter("fkjlh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sgd,fksj,fkr,fkje,fkyy,lrr,lrsj,lrbm,bz,shr,shsj,shsm ";
	ls_sql+=" from  cw_sgdfkjl";
	ls_sql+=" where  (fkjlh='"+fkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgd=cf.fillNull(rs.getString("sgd"));
		fksj=cf.fillNull(rs.getDate("fksj"));
		fkr=cf.fillNull(rs.getString("fkr"));
		fkje=cf.fillNull(rs.getString("fkje"));
		fkyy=cf.fillNull(rs.getString("fkyy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shsm=cf.fillNull(rs.getString("shsm"));
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
<title>施工队罚款－修改审核</title>
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
<form method="post" action="SaveXgShCw_sgdfkjl.jsp" name="editform">
<div align="center">施工队罚款－修改审核</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">罚款记录号</span></td>
    <td><input type="text" name="fkjlh" value="<%=fkjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">施工队</span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','') from sq_sgd where sgd='"+sgd+"'",sgd);
%>
      </select>    </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">罚款人</span></td>
  <td><%=fkr%></td>
  <td align="right"><span class="STYLE3">罚款时间</span></td>
  <td><%=fksj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">罚款原因</span></td>
  <td colspan="3"><%=fkyy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE3">录入人</span></td> 
  <td width="35%"><%=lrr%></td>
  <td align="right" width="15%"><span class="STYLE3">录入时间</span></td> 
  <td width="35%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">录入部门</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE3">备注</span></td> 
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>罚款金额</td>
  <td><input type="text" name="fkje" size="20" maxlength="17"  value="<%=fkje%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">审核人</span></td>
  <td><input type="text" name="shr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">审核时间</span></td>
  <td><input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>审核说明</td>
  <td colspan="3"><textarea name="shsm" cols="75" rows="3"><%=shsm%></textarea></td>
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
	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[罚款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "罚款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.shsm)=="") {
		alert("请输入[审核说明]！");
		FormName.shsm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
