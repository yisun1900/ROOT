<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String sfxmbm=null;
String sfbfb=null;
String qsz=null;
String jzz=null;
String dqbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,sfxmbm,sfbfb,qsz,jzz,dqbm ";
	ls_sql+=" from  bj_sfbl";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		sfbfb=cf.fillNull(rs.getString("sfbfb"));
		qsz=cf.fillNull(rs.getString("qsz"));
		jzz=cf.fillNull(rs.getString("jzz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
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

	String dwstr=cf.getItemData("select sfxmbm,sfxmmc,dqbm from bdm_sfxmbm where sflx in('1','3','5','6','7','8','9','B','C') order by dqbm,sfxmbm");
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

<form method="post" action="SaveEditBj_sfbl.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right">地区名称</td>
  <td width="35%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(dqbm,sfxmbm,<%=dwstr%>)">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td width="15%" align="right">&nbsp;</td>
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收费项目</td>
  <td><select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sflx in('1','3','5','6','7','8','9','B','C') and dqbm='"+dqbm+"' order by sfxmbm",sfxmbm);
%>
  </select></td>
  <td align="right">收费百分比</td>
  <td><input type="text" name="sfbfb" size="10" maxlength="17"  value="<%=sfbfb%>" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right">起始值> </td>
  <td width="35%"><input type="text" name="qsz" size="20" maxlength="17"  value="<%=qsz%>" ></td>
  <td width="15%" align="right">截止值<=</td>
  <td width="35%"><input type="text" name="jzz" size="20" maxlength="17"  value="<%=jzz%>" ></td>
</tr>

<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
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
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("请选择[收费项目]！");
		FormName.sfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sfbfb)=="") {
		alert("请输入[收费百分比]！");
		FormName.sfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sfbfb, "收费百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.qsz)=="") {
		alert("请输入[起始值>]！");
		FormName.qsz.focus();
		return false;
	}
	if(!(isFloat(FormName.qsz, "起始值>"))) {
		return false;
	}
	if(	javaTrim(FormName.jzz)=="") {
		alert("请输入[截止值<=]！");
		FormName.jzz.focus();
		return false;
	}
	if(!(isFloat(FormName.jzz, "截止值<="))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区名称]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
