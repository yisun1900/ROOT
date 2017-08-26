<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String pfxmbm=null;
String pfxmmc=null;
String fz=null;
String kpdlbm=null;
String wherepfxmbm=cf.GB2Uni(request.getParameter("pfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pfxmbm,pfxmmc,fz,kpdlbm ";
	ls_sql+=" from  kp_pfxmbm";
	ls_sql+=" where  (pfxmbm='"+wherepfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pfxmbm=cf.fillNull(rs.getString("pfxmbm"));
		pfxmmc=cf.fillNull(rs.getString("pfxmmc"));
		fz=cf.fillNull(rs.getString("fz"));
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
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

<form method="post" action="SaveEditKp_pfxmbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">评分项目编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="pfxmbm" size="20" maxlength="2"  value="<%=pfxmbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">评分项目名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="pfxmmc" size="20" maxlength="50"  value="<%=pfxmmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">分值</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fz" size="20" maxlength="8"  value="<%=fz%>" >
  </td>
  <td width="15%"> 
    <div align="right">对应考评大类</div>
  </td>
  <td width="35%"> 
    <select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm",kpdlbm);
%>
    </select>
  </td>
</tr>
<input type="hidden" name="wherepfxmbm"  value="<%=wherepfxmbm%>" >
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
	if(	javaTrim(FormName.pfxmbm)=="") {
		alert("请输入[评分项目编码]！");
		FormName.pfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pfxmmc)=="") {
		alert("请输入[评分项目名称]！");
		FormName.pfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fz)=="") {
		alert("请输入[分值]！");
		FormName.fz.focus();
		return false;
	}
	if(!(isNumber(FormName.fz, "分值"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
