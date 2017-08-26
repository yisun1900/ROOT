<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
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
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_kcpdjlCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">盘点批号</td> 
  <td width="35%"> 
    <input type="text" name="pdph" size="20" maxlength="16" >  </td>
  <td align="right" width="15%">盘点状态</td> 
  <td width="35%"><select name="pdzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value=""></option>
    <option value="1">正在盘点</option>
    <option value="2">盘点结束</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(selectform)">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where (1=1)  order by dqmc","");
	}
	else
	{
	out.print("<option value=\"\"></option>");
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm in (select dm_dqbm.dqbm dqbm from dm_dqbm,sq_dwxx,sq_yhxx,sq_sqfgs where sq_yhxx.yhdlm='"+yhdlm+"' and sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_dwxx.dqbm=dm_dqbm.dqbm union all select dqbm from dm_dqbm where dqbm='"+dqbm+"' )group by dqbm,dqmc order by dqmc","");	
	}
%>
  </select></td>
  <td align="right">仓库</td>
  <td><select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.print("<option value=\"\"></option>");
	}
	else
	{
	out.print("<option value=\"\"></option>");
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' and dqbm='"+dqbm+"'  order by ckmc","");
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"><select name="pdrssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
 <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F0') or dwbh='99999' order by dwmc","");
	}
	else
	{
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in (select sq_dwxx.dwbh dwbh from sq_dwxx,sq_yhxx,sq_sqfgs where dwlx in('A0','F0') and sq_yhxx.yhdlm='"+yhdlm+"' and sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs=sq_dwxx.dwbh union all select dwbh from sq_dwxx where dwbh='"+ssfgs+"') group by dwbh,dwmc order by dwbh","");
	}
	
%>
  </select></td>
  <td align="right" width="15%">所属部门</td> 
  <td width="35%"><select name="pdrssbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'  order by dwmc","");
	
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">盘点时间 从</td> 
  <td width="35%"><input type="text" name="pdsj" size="20" maxlength="10" ></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="pdsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">盘点人</td> 
  <td width="35%"><input type="text" name="pdr" size="20" maxlength="50" ></td>
  <td align="right" width="15%">盘点类别</td> 
  <td width="35%"><select name="pdlb" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value="0">主材</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"> 
    <input type="text" name="bz" size="60" maxlength="200" >      </td>
  </tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<%
	//启用Ajax
	cf.ajax(out);
%>
function changedqbm(FormName)
{
	if (FormName.dqbm.value=='')
	{
		return;
	}

//	FormName.ckbh.length=0;

	var actionStr="/jxcfc/jxc_rkgl/myajax.jsp?yhdlm=<%=yhdlm%>&dqbm="+FormName.dqbm.value;

//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
		selectform.ckbh.length=1;
		var value3=getStrValue(ajaxRetStr,3);
		strToSelect(selectform.ckbh,value3);

//		selectform.gysmc.length=1;
//		var value4=getStrValue(ajaxRetStr,4);
//		value4="%TOTO洁具供应商+TOTO洁具供应商%XXXX供应商+XXXX供应商  ";
//		value4=trim(value4);
//		strToSelect(selectform.gysmc,value4);

}
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.pdph, "盘点批号"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "盘点时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj2, "盘点时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
