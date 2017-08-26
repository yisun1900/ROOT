<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xuhao=null;
String kmdm=null;
String kmmc=null;
String kmlb=null;
String yefx=null;
String qm=null;
String xmfzhs=null;
String fklxbm=null;
String fkcs=null;
String jdbz=null;
String fgsbh=null;
String wherexuhao=cf.GB2Uni(request.getParameter("xuhao"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xuhao,kmdm,kmmc,kmlb,yefx,qm,xmfzhs,fklxbm,fkcs,jdbz,fgsbh ";
	ls_sql+=" from  cw_jzkmdm";
	ls_sql+=" where  (xuhao="+wherexuhao+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=cf.fillNull(rs.getString("xuhao"));
		kmdm=cf.fillNull(rs.getString("kmdm"));
		kmmc=cf.fillNull(rs.getString("kmmc"));
		kmlb=cf.fillNull(rs.getString("kmlb"));
		yefx=cf.fillNull(rs.getString("yefx"));
		qm=cf.fillNull(rs.getString("qm"));
		xmfzhs=cf.fillNull(rs.getString("xmfzhs"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fkcs=cf.fillNull(rs.getString("fkcs"));
		jdbz=cf.fillNull(rs.getString("jdbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
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
<form method="post" action="SaveEditCw_jzkmdm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xuhao" size="20" maxlength="8"  value="<%=xuhao%>" >
  </td>
  <td align="right" width="15%">科目代码</td> 
  <td width="35%"> 
    <input type="text" name="kmdm" size="20" maxlength="40"  value="<%=kmdm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">科目名称</td> 
  <td width="35%"> 
    <input type="text" name="kmmc" size="20" maxlength="50"  value="<%=kmmc%>" >
  </td>
  <td align="right" width="15%">科目类别</td> 
  <td width="35%"> 
    <input type="text" name="kmlb" size="20" maxlength="20"  value="<%=kmlb%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">余额方向</td> 
  <td width="35%"> 
    <input type="text" name="yefx" size="20" maxlength="10"  value="<%=yefx%>" >
  </td>
  <td align="right" width="15%">全名</td> 
  <td width="35%"> 
    <input type="text" name="qm" size="20" maxlength="50"  value="<%=qm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目辅助核算</td> 
  <td width="35%"> 
    <input type="text" name="xmfzhs" size="20" maxlength="50"  value="<%=xmfzhs%>" >
  </td>
  <td align="right" width="15%">收款类型</td> 
  <td width="35%"> 
    <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where pzfl='1' order by fklxbm",fklxbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">收款期数</td> 
  <td width="35%"> 
    <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs",fkcs);
%>
    </select>
  </td>
  <td align="right" width="15%">借贷标志</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "jdbz","1+借（退款）&0+贷（收款）",jdbz);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司名称</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherexuhao"  value="<%=wherexuhao%>" >
    <tr> 
      <td colspan="4" height="2">
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
	if(!(isNumber(FormName.fkcs, "收款期数"))) {
		return false;
	}
	if(	!radioChecked(FormName.jdbz)) {
		alert("请选择[借贷标志]！");
		FormName.jdbz[0].focus();
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
