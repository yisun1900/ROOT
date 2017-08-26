<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xuhao=null;
String kmdm=null;
String kmmc=null;
String yefx=null;
String fklxbm=null;
String gysbh=null;
String jdbz=null;
String fgsbh=null;
String cwdm=null;
String dqbm=null;
String wherexuhao=cf.GB2Uni(request.getParameter("xuhao"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xuhao,kmdm,kmmc,yefx,fklxbm,gysbh,jdbz,fgsbh,cwdm ";
	ls_sql+=" from  cw_jckmdm";
	ls_sql+=" where  (xuhao="+wherexuhao+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=cf.fillNull(rs.getString("xuhao"));
		kmdm=cf.fillNull(rs.getString("kmdm"));
		kmmc=cf.fillNull(rs.getString("kmmc"));
		yefx=cf.fillNull(rs.getString("yefx"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		gysbh=cf.fillNull(rs.getString("gysbh"));
		jdbz=cf.fillNull(rs.getString("jdbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jckmdm.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">序号</td>
      <td width="34%"> 
        <input type="text" name="xuhao" size="20" maxlength="8"  value="<%=xuhao%>" >      </td>
      <td align="right" width="14%">科目代码</td>
      <td width="36%"> 
        <input type="text" name="kmdm" size="20" maxlength="40"  value="<%=kmdm%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">科目名称</td>
      <td width="34%"> 
        <input type="text" name="kmmc" size="20" maxlength="50"  value="<%=kmmc%>" >      </td>
      <td align="right" width="14%">余额方向</td>
      <td width="36%"> 
<%
	cf.radioToken(out, "yefx","借+借&贷+贷",yefx);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" height="22" align="right">收款类型</td>
      <td height="22" colspan="3"> 
        <input type="radio" name="fklxbm" value="21" <%if (fklxbm.equals("21")) out.print("CHECKED");%>>
        木门款 
        <input type="radio" name="fklxbm" value="22" <%if (fklxbm.equals("22")) out.print("CHECKED");%>>
        橱柜款 
        <input type="radio" name="fklxbm" value="23" <%if (fklxbm.equals("23")) out.print("CHECKED");%>>
        主材款 
        <input type="radio" name="fklxbm" value="24" <%if (fklxbm.equals("24")) out.print("CHECKED");%>>
        家具款
        <input type="radio" name="fklxbm" value="81" <%if (fklxbm.equals("81")) out.print("CHECKED");%>>
        辅材 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">供应商</td>
      <td colspan="3"> 
        <select name="cwdm" style="FONT-SIZE:12PX;WIDTH:452PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cwdm,gys||'（代码：'||cwdm||'）' from sq_gysxx where dqbm='"+dqbm+"' and cwdm is not null order by gys",cwdm);
%> 
        </select>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">借贷标志</td>
      <td width="34%"> <%
	cf.radioToken(out, "jdbz","1+借（退款）&0+贷（收款）",jdbz);
%> </td>
      <td align="right" width="14%">分公司名称</td>
      <td width="36%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>      </td>
    </tr>
    <input type="hidden" name="wherexuhao"  value="<%=wherexuhao%>" >
    <tr> 
      <td colspan="4" height="2"> 
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
	if(	javaTrim(FormName.xuhao)=="") {
		alert("请输入[序号]！");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isNumber(FormName.xuhao, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.kmdm)=="") {
		alert("请输入[科目代码]！");
		FormName.kmdm.focus();
		return false;
	}
	if(	javaTrim(FormName.kmmc)=="") {
		alert("请输入[科目名称]！");
		FormName.kmmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.fklxbm)) {
		alert("请选择[收款类型]！");
		FormName.fklxbm[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jdbz)) {
		alert("请选择[借贷标志]！");
		FormName.jdbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.yefx)) {
		alert("请选择[余额方向]！");
		FormName.yefx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司名称]！");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
