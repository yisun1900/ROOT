<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhjs=(String)session.getAttribute("yhjs");
String hwbh=null;
String hwmc=null;
String hjbh=null;
String wherehwbh=cf.GB2Uni(request.getParameter("hwbh"));
String ckbh=null;
String dqbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select hwbh,hwmc,hjbh ";
	ls_sql+=" from  jxc_hwmc";
	ls_sql+=" where  (hwbh='"+wherehwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hwbh=cf.fillNull(rs.getString("hwbh"));
		hwmc=cf.fillNull(rs.getString("hwmc"));
		hjbh=cf.fillNull(rs.getString("hjbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select ckbh ";
	ls_sql+=" from  jxc_hjmc";
	ls_sql+=" where  (hjbh='"+hjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from  jxc_ckmc";
	ls_sql+=" where  (ckbh='"+ckbh+"')  ";
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_hwmc.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">所属地区</td> 
  <td width="35%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(editform)">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc",dqbm);
	}
	else
	{
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm in (select dm_dqbm.dqbm dqbm from dm_dqbm,sq_dwxx,sq_yhxx,sq_sqfgs where sq_yhxx.yhdlm='"+yhdlm+"' and sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_dwxx.dqbm=dm_dqbm.dqbm union all select dqbm from dm_dqbm where dqbm='"+dqbm+"' )group by dqbm,dqmc order by dqmc",dqbm);	
	}
	%>
  </select></td>
  <td align="right" width="15%">所属仓库</td> 
  <td width="35%"><select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc where dqbm='"+dqbm+"' and ckbh='"+ckbh+"' order by ckmc",ckbh);
	}
	else
	{
	cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc where dqbm='"+dqbm+"' and ckbh='"+ckbh+"'  order by ckmc",ckbh);
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">所属货架</td>
  <td>
  <select name="hjbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select hjbh,hjmc from jxc_hjmc where hjbh='"+hjbh+"' order by hjmc",hjbh);

%>
  </select></td>
  <td align="right">货位编号</td>
  <td><input type="text" name="hwbh" size="20" maxlength="8"  value="<%=hwbh%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">货位名称</td> 
  <td width="35%"colspan="3" ><input type="text" name="hwmc" size="50" maxlength="50"  value="<%=hwmc%>" ></td>
</tr>
<input type="hidden" name="wherehwbh"  value="<%=wherehwbh%>" >
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
	if(	javaTrim(FormName.hwbh)=="") {
		alert("请输入[货位编号]！");
		FormName.hwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hwmc)=="") {
		alert("请输入[货位名称]！");
		FormName.hwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hjbh)=="") {
		alert("请输入[所属货架]！");
		FormName.hjbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
