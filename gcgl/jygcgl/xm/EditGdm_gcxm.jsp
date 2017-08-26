<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String bz=null;
String wherexmbm=cf.GB2Uni(request.getParameter("xmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmbm,xmmc,xmdlbm,xmxlbm,bz ";
	ls_sql+=" from  gdm_gcxm";
	ls_sql+=" where  (xmbm='"+wherexmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmbm=cf.fillNull(rs.getString("xmbm"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
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
<form method="post" action="" name="editform" target="_blank">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">项目编码</td> 
  <td width="32%"> 
    <input type="text" name="xmbm" size="20" maxlength="5"  value="<%=xmbm%>" >  </td>
  <td align="right" width="18%">项目名称</td> 
  <td width="32%"> 
    <input type="text" name="xmmc" size="20" maxlength="100"  value="<%=xmmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">项目大类</td> 
  <td width="32%"> 
    <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xmdlbm,xmdlmc from gdm_xmdlbm order by xmdlbm",xmdlbm);
%>
    </select>  </td>
  <td align="right" width="18%">项目小类</td> 
  <td width="32%"> 
    <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xmxlbm,xmxlmc from gdm_xmxlbm order by xmdlbm,xmxlbm",xmxlbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
<input type="hidden" name="wherexmbm"  value="<%=wherexmbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="button" onClick="f_lr(editform)"  value="录入处罚">
	  <input type="button" onClick="f_ck(editform)"  value="查看处罚">
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
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}

	FormName.action="SaveEditGdm_gcxm.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmbm)=="") {
		alert("请输入[项目编码]！");
		FormName.xmbm.focus();
		return false;
	}

	FormName.action="InsertGdm_gcxmcfbz.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmbm)=="") {
		alert("请输入[项目编码]！");
		FormName.xmbm.focus();
		return false;
	}

	FormName.action="Gdm_gcxmcfbzList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
