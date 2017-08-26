<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bjbbh=null;
String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String tcmc=null;
int fwmj=0;
double tcjg=0;
double pmzjdj=0;
double tlgbzjj=0;
String wherebjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bjbbh,dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj ";
	ls_sql+=" from  bj_tcjgb";
	ls_sql+=" where  (bjbbh='"+wherebjbbh+"') and  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		fwmj=rs.getInt("fwmj");
		tcjg=rs.getDouble("tcjg");
		pmzjdj=rs.getDouble("pmzjdj");
		tlgbzjj=rs.getDouble("tlgbzjj");
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
<form method="post" action="SaveEditBj_tcjgb.jsp" name="editform">
<div align="center">套餐价格表－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>报价版本号</td> 
  <td colspan="3"> 
    <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjbbh c1,bjbbh c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') order by bj_dzbjbb.dqbm,bjbbh",bjbbh);
%>
    </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>地区</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>报价级别</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' order by bjjbbm",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>户型</td> 
  <td width="32%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>套内基准面积</td> 
  <td width="32%"><input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐名称</td> 
  <td colspan="3"> 
    <input type="text" name="tcmc" size="73" maxlength="50"  value="<%=tcmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>套餐价格</td> 
  <td width="32%"> 
    <input type="text" name="tcjg" size="20" maxlength="17"  value="<%=tcjg%>" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>平米增加单价</td> 
  <td width="32%"> 
    <input type="text" name="pmzjdj" size="20" maxlength="17"  value="<%=pmzjdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>涂料改为壁纸加价</td>
  <td><input type="text" name="tlgbzjj" value="<%=tlgbzjj%>" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<input type="hidden" name="wherebjbbh"  value="<%=wherebjbbh%>" >
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
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
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
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
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[套内基准面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "套内基准面积"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("请输入[套餐价格]！");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "套餐价格"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjdj)=="") {
		alert("请输入[平米增加单价]！");
		FormName.pmzjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjdj, "平米增加单价"))) {
		return false;
	}
	if(	javaTrim(FormName.tlgbzjj)=="") {
		alert("请输入[涂料改为壁纸加价]！");
		FormName.tlgbzjj.focus();
		return false;
	}
	if(!(isFloat(FormName.tlgbzjj, "涂料改为壁纸加价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
