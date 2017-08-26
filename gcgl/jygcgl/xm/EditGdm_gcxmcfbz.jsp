<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmbm=null;
String wgjbbm=null;
String xzzwbm=null;
String zgyq=null;
String sgdkf=null;
String sgdfkje=null;
String ygkf=null;
String ygfkje=null;
String bz=null;
String wherexmbm=cf.GB2Uni(request.getParameter("xmbm"));
String wherewgjbbm=cf.GB2Uni(request.getParameter("wgjbbm"));
String wherexzzwbm=cf.getParameter(request,"xzzwbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmbm,wgjbbm,xzzwbm,zgyq,sgdkf,sgdfkje,ygkf,ygfkje,bz ";
	ls_sql+=" from  gdm_gcxmcfbz";
	ls_sql+=" where  (xmbm='"+wherexmbm+"') and  (wgjbbm='"+wherewgjbbm+"') and  (xzzwbm='"+wherexzzwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmbm=cf.fillNull(rs.getString("xmbm"));
		wgjbbm=cf.fillNull(rs.getString("wgjbbm"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		zgyq=cf.fillNull(rs.getString("zgyq"));
		sgdkf=cf.fillNull(rs.getString("sgdkf"));
		sgdfkje=cf.fillNull(rs.getString("sgdfkje"));
		ygkf=cf.fillNull(rs.getString("ygkf"));
		ygfkje=cf.fillNull(rs.getString("ygfkje"));
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
<form method="post" action="SaveEditGdm_gcxmcfbz.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">项目编码</td> 
  <td width="32%"> 
    <input type="text" name="xmbm" size="20" maxlength="5"  value="<%=xmbm%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">违规级别</td>
  <td><select name="wgjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select wgjbbm,wgjbmc from gdm_wgjbbm order by wgjbbm",wgjbbm);
%>
  </select></td>
  <td align="right">整改要求</td>
  <td><select name="zgyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select zgyq c1,zgyq c2 from gdm_zgyq order by zgyq",zgyq);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">处罚人员职务</td> 
  <td width="32%"> 
    <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",xzzwbm);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">员工罚款金额</td>
  <td><input type="text" name="ygfkje" size="20" maxlength="17"  value="<%=ygfkje%>" ></td>
  <td align="right">员工扣分</td>
  <td><input type="text" name="ygkf" size="20" maxlength="8"  value="<%=ygkf%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队罚款金额</td> 
  <td width="32%"><input type="text" name="sgdfkje" size="20" maxlength="17"  value="<%=sgdfkje%>" ></td>
  <td align="right" width="18%">施工队扣分</td> 
  <td width="32%"><input type="text" name="sgdkf" size="20" maxlength="8"  value="<%=sgdkf%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
<input type="hidden" name="wherexmbm"  value="<%=wherexmbm%>" >
<input type="hidden" name="wherewgjbbm"  value="<%=wherewgjbbm%>" >
<input type="hidden" name="wherexzzwbm"  value="<%=wherexzzwbm%>" >
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
	if(	javaTrim(FormName.xmbm)=="") {
		alert("请输入[项目编码]！");
		FormName.xmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wgjbbm)=="") {
		alert("请选择[违规级别]！");
		FormName.wgjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("请选择[处罚人员职务]！");
		FormName.xzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdkf)=="") {
		alert("请输入[施工队扣分]！");
		FormName.sgdkf.focus();
		return false;
	}
	if(!(isNumber(FormName.sgdkf, "施工队扣分"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfkje)=="") {
		alert("请输入[施工队罚款金额]！");
		FormName.sgdfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfkje, "施工队罚款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.ygkf)=="") {
		alert("请输入[员工扣分]！");
		FormName.ygkf.focus();
		return false;
	}
	if(!(isNumber(FormName.ygkf, "员工扣分"))) {
		return false;
	}
	if(	javaTrim(FormName.ygfkje)=="") {
		alert("请输入[员工罚款金额]！");
		FormName.ygfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.ygfkje, "员工罚款金额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
