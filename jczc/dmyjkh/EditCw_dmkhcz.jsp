<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=null;
String nian=null;
String yue=null;
String khcz=null;
String mbcz=null;
String lrr=null;
String lrsj=null;
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
String wherenian=cf.GB2Uni(request.getParameter("nian"));
String whereyue=cf.GB2Uni(request.getParameter("yue"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,nian,yue,khcz,mbcz,lrr,lrsj ";
	ls_sql+=" from  cw_dmkhcz";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (nian='"+wherenian+"') and  (yue='"+whereyue+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		khcz=cf.fillNull(rs.getString("khcz"));
		mbcz=cf.fillNull(rs.getString("mbcz"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<form method="post" action="SaveEditCw_dmkhcz.jsp" name="editform">
<div align="center">修改--店面考核产值</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC">单位</font></td>
      <td width="35%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	%> 
        </select>
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">年</font></td>
      <td width="35%"> 
        <input type="text" name="nian" size="20" maxlength="4"  value="<%=nian%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">月</font></td>
      <td width="35%"> 
        <input type="text" name="yue" size="20" maxlength="2"  value="<%=yue%>" readonly>
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font>考核产值</td>
      <td width="35%">
        <input type="text" name="khcz" size="20" maxlength="17"  value="<%=khcz%>" >
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font>目标产值</td>
      <td width="35%">
        <input type="text" name="mbcz" size="20" maxlength="17"  value="<%=mbcz%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入人</font></td>
      <td width="35%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入时间</font></td>
      <td width="35%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
    <input type="hidden" name="wherenian"  value="<%=wherenian%>" >
    <input type="hidden" name="whereyue"  value="<%=whereyue%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>
      </td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月]！");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.khcz)=="") {
		alert("请输入[考核产值]！");
		FormName.khcz.focus();
		return false;
	}
	if(!(isFloat(FormName.khcz, "考核产值"))) {
		return false;
	}
	if(	javaTrim(FormName.mbcz)=="") {
		alert("请输入[目标产值]！");
		FormName.mbcz.focus();
		return false;
	}
	if(!(isFloat(FormName.mbcz, "目标产值"))) {
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
