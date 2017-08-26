<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpkfbm=null;
String kpkfmc=null;
String kfs=null;
String pfxmbm=null;
String kflx=null;
String wherekpkfbm=cf.GB2Uni(request.getParameter("kpkfbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kpkfbm,kpkfmc,kfs,pfxmbm,kflx ";
	ls_sql+=" from  kp_kpkfbm";
	ls_sql+=" where  (kpkfbm='"+wherekpkfbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpkfbm=cf.fillNull(rs.getString("kpkfbm"));
		kpkfmc=cf.fillNull(rs.getString("kpkfmc"));
		kfs=cf.fillNull(rs.getString("kfs"));
		pfxmbm=cf.fillNull(rs.getString("pfxmbm"));
		kflx=cf.fillNull(rs.getString("kflx"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_kpkfbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">考评扣分编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kpkfbm" size="20" maxlength="2"  value="<%=kpkfbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">考评扣分名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kpkfmc" size="20" maxlength="50"  value="<%=kpkfmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">扣分数</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kfs" size="20" maxlength="8"  value="<%=kfs%>" >
  </td>
  <td width="15%"> 
    <div align="right">扣为0分项目</div>
  </td>
  <td width="35%"> 
    <select name="pfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select pfxmbm,pfxmmc from kp_pfxmbm order by pfxmbm",pfxmbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">扣分类型</div>
  </td>
  <td width="35%"> 
    <select name="kflx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+扣分&2+某项分数为0",kflx);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherekpkfbm"  value="<%=wherekpkfbm%>" >
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpkfbm)=="") {
		alert("请输入[考评扣分编码]！");
		FormName.kpkfbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpkfmc)=="") {
		alert("请输入[考评扣分名称]！");
		FormName.kpkfmc.focus();
		return false;
	}
	if(!(isNumber(FormName.kfs, "扣分数"))) {
		return false;
	}
	if(	javaTrim(FormName.kflx)=="") {
		alert("请选择[扣分类型]！");
		FormName.kflx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
