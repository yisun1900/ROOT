<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String yhmc=null;
String khfs=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wherekhzq=cf.GB2Uni(request.getParameter("khzq"));
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
String whereyhmc=cf.getParameter(request,"yhmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,yhmc,khfs,lrr,lrsj,bz ";
	ls_sql+=" from  cw_jrzjyjkh";
	ls_sql+=" where  (khzq='"+wherekhzq+"') and  (dwbh='"+wheredwbh+"') and  (yhmc='"+whereyhmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		khfs=cf.fillNull(rs.getString("khfs"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jrzjyjkh.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">所属部门</td> 
  <td width="32%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
    </select>  </td>
  <td align="right" width="18%">姓名</td> 
  <td width="32%"> 
    <input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">考核分数</td> 
  <td width="32%"> 
    <input type="text" name="khfs" size="20" maxlength="17"  value="<%=khfs%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" ></td>
  <td align="right">录入时间</td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
<input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
<input type="hidden" name="whereyhmc"  value="<%=whereyhmc%>" >
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[所属部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[姓名]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.khfs)=="") {
		alert("请输入[考核分数]！");
		FormName.khfs.focus();
		return false;
	}
	if(!(isFloat(FormName.khfs, "考核分数"))) {
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
