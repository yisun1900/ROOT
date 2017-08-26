<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ssfgs=null;
String hflx=null;
String khsksd=null;
String khsjzd=null;
String hfbl=null;
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String wherehflx=cf.GB2Uni(request.getParameter("hflx"));
String wherekhsksd=cf.GB2Uni(request.getParameter("khsksd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ssfgs,hflx,khsksd,khsjzd,hfbl ";
	ls_sql+=" from  hf_hfblsz";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"') and  (hflx='"+wherehflx+"') and  (khsksd="+wherekhsksd+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		hflx=cf.fillNull(rs.getString("hflx"));
		khsksd=cf.fillNull(rs.getString("khsksd"));
		khsjzd=cf.fillNull(rs.getString("khsjzd"));
		hfbl=cf.fillNull(rs.getString("hfbl"));
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
<form method="post" action="SaveEditHf_hfblsz.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",ssfgs);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">回访类型</td>
  <td colspan="3"><%
	cf.radioToken(out, "hflx","1+飞单回访&2+在施工回访&3+完工回访",hflx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户数开始点</td> 
  <td width="32%"> 
    <input type="text" name="khsksd" size="20" maxlength="8"  value="<%=khsksd%>" >  </td>
  <td align="right" width="18%">客户数截至点</td> 
  <td width="32%"> 
    <input type="text" name="khsjzd" size="20" maxlength="8"  value="<%=khsjzd%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">回访比例</td> 
  <td width="32%"> 
    <input type="text" name="hfbl" size="10" maxlength="9"  value="<%=hfbl%>" >
    %  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
<input type="hidden" name="wherehflx"  value="<%=wherehflx%>" >
<input type="hidden" name="wherekhsksd"  value="<%=wherekhsksd%>" >
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	!radioChecked(FormName.hflx)) {
		alert("请选择[回访类型]！");
		FormName.hflx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.khsksd)=="") {
		alert("请输入[客户数开始点]！");
		FormName.khsksd.focus();
		return false;
	}
	if(!(isInt(FormName.khsksd, "客户数开始点"))) {
		return false;
	}
	if(	javaTrim(FormName.khsjzd)=="") {
		alert("请输入[客户数截至点]！");
		FormName.khsjzd.focus();
		return false;
	}
	if(!(isInt(FormName.khsjzd, "客户数截至点"))) {
		return false;
	}
	if(	javaTrim(FormName.hfbl)=="") {
		alert("请输入[回访比例]！");
		FormName.hfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.hfbl, "回访比例"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
