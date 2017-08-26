<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xm=null;
String gx=null;
String csnf=null;
String gzdw=null;
String zw=null;
String lxdh=null;
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wherexm=cf.getParameter(request,"xm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xm,gx,csnf,gzdw,zw,lxdh ";
	ls_sql+=" from  rs_jtzl";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (xm='"+wherexm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xm=cf.fillNull(rs.getString("xm"));
		gx=cf.fillNull(rs.getString("gx"));
		csnf=cf.fillNull(rs.getString("csnf"));
		gzdw=cf.fillNull(rs.getString("gzdw"));
		zw=cf.fillNull(rs.getString("zw"));
		lxdh=cf.fillNull(rs.getString("lxdh"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>修改家庭资料</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_jtzl.jsp" name="editform">
<div align="center">修改家庭资料（员工序号：<%=whereygbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">姓名</td> 
  <td width="35%"> 
    <input type="text" name="xm" size="20" maxlength="20"  value="<%=xm%>" >
  </td>
  <td align="right" width="15%">关系</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="20"  value="<%=gx%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">出生年份</td> 
  <td width="35%"> 
    <input type="text" name="csnf" size="20" maxlength="4"  value="<%=csnf%>" >
  </td>
  <td align="right" width="15%">工作单位</td> 
  <td width="35%"> 
    <input type="text" name="gzdw" size="20" maxlength="100"  value="<%=gzdw%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">职务</td> 
  <td width="35%"> 
    <input type="text" name="zw" size="20" maxlength="50"  value="<%=zw%>" >
  </td>
  <td align="right" width="15%">联系电话</td> 
  <td width="35%"> 
    <input type="text" name="lxdh" size="20" maxlength="50"  value="<%=lxdh%>" >
  </td>
</tr>
<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
<input type="hidden" name="wherexm"  value="<%=wherexm%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
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
	if(	javaTrim(FormName.xm)=="") {
		alert("请输入[姓名]！");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("请输入[关系]！");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.csnf)=="") {
		alert("请输入[出生年份]！");
		FormName.csnf.focus();
		return false;
	}
	if(	javaTrim(FormName.gzdw)=="") {
		alert("请输入[工作单位]！");
		FormName.gzdw.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("请输入[职务]！");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.lxdh)=="") {
		alert("请输入[联系电话]！");
		FormName.lxdh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
