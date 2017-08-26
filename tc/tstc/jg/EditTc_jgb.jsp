<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String bjjbbm=null;
String tcmc=null;
String mjdj=null;
String zxmj=null;
int yssl=0;
double tsf=0;
double wyjg=0;
double czjg=0;

String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,tcmc,mjdj,zxmj,yssl,tsf,wyjg,czjg ";
	ls_sql+=" from  tc_jgb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		mjdj=cf.fillNull(rs.getString("mjdj"));
		zxmj=cf.fillNull(rs.getString("zxmj"));
		yssl=rs.getInt("yssl");
		tsf=rs.getDouble("tsf");
		wyjg=rs.getDouble("wyjg");
		czjg=rs.getDouble("czjg");
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
<form method="post" action="SaveEditTc_jgb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">地区</td> 
  <td width="35%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select>  </td>
  <td align="right" width="15%">报价级别</td> 
  <td width="35%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">套餐名称</td> 
  <td width="35%"> 
    <input type="text" name="tcmc" size="20" maxlength="50"  value="<%=tcmc%>" >  </td>
  <td align="right" width="15%">平米单价</td> 
  <td width="35%"> 
    <input type="text" name="mjdj" size="20" maxlength="17"  value="<%=mjdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">最小面积</td> 
  <td width="35%"> 
    <input type="text" name="zxmj" size="20" maxlength="17"  value="<%=zxmj%>" >  </td>
  <td align="right" width="15%">&nbsp;  </td>
  <td width="35%">&nbsp;  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">油漆限定颜色数量</td>
  <td><input type="text" name="yssl" value="<%=yssl%>" size="20" maxlength="17" ></td>
  <td align="right">调色费</td>
  <td><input type="text" name="tsf" value="<%=tsf%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">每套卫浴价格</td>
  <td><input type="text" name="wyjg" value="<%=wyjg%>" size="20" maxlength="17" ></td>
  <td align="right">每套磁砖价格 </td>
  <td><input type="text" name="czjg" value="<%=czjg%>" size="20" maxlength="17" ></td>
</tr>
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("请输入[套餐名称]！");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.mjdj)=="") {
		alert("请输入[平米单价]！");
		FormName.mjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mjdj, "平米单价"))) {
		return false;
	}
	if(	javaTrim(FormName.zxmj)=="") {
		alert("请输入[最小面积]！");
		FormName.zxmj.focus();
		return false;
	}
	if(!(isFloat(FormName.zxmj, "最小面积"))) {
		return false;
	}

	if(	javaTrim(FormName.yssl)=="") {
		alert("请输入[油漆限定颜色数量]！");
		FormName.yssl.focus();
		return false;
	}
	if(!(isNumber(FormName.yssl, "油漆限定颜色数量"))) {
		return false;
	}
	if(	javaTrim(FormName.tsf)=="") {
		alert("请输入[调色费]！");
		FormName.tsf.focus();
		return false;
	}
	if(!(isFloat(FormName.tsf, "调色费"))) {
		return false;
	}
	
	if(	javaTrim(FormName.wyjg)=="") {
		alert("请输入[每套卫浴价格]！");
		FormName.wyjg.focus();
		return false;
	}
	if(!(isFloat(FormName.wyjg, "每套卫浴价格"))) {
		return false;
	}
	
	if(	javaTrim(FormName.czjg)=="") {
		alert("请输入[每套磁砖价格]！");
		FormName.czjg.focus();
		return false;
	}
	if(!(isFloat(FormName.czjg, "每套磁砖价格"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
