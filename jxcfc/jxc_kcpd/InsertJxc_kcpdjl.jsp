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
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_kcpdjl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">地区</td> 
  <td width="35%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(insertform)">
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
  </select>   </td>
  <td align="right" width="15%">仓库</td> 
  <td width="35%"><select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
  <td align="right" width="15%">盘点人</td> 
  <td width="35%"> 
    <input type="text" name="pdr" value="<%=yhmc%>" size="20" maxlength="50" readonly>  </td>
  <td align="right" width="15%">分公司</td> 
  <td width="35%">
  <select name="pdrssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">盘点时间</td> 
  <td width="35%"> 
    <input type="text" name="pdsj" value="<%=cf.today()%>" size="20" maxlength="50" readonly>  </td>
  <td align="right" width="15%">盘点类别</td> 
  <td width="35%">
  <select name="pdlb" style="FONT-SIZE:12PX;WIDTH:152PX" >
   <option value="1">辅材</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="2" ></textarea>     </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
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
	var sql=" select jxc_ckmc.ckbh,jxc_ckmc.ckmc from jxc_ckmc,jxc_kgy where jxc_kgy.ckbh=jxc_ckmc.ckbh  and jxc_kgy.yhdlm='<%=yhdlm%>' and jxc_ckmc.dqbm="+FormName.dqbm.value;

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	//window.open(actionStr);
	openAjax(actionStr);
}
function getAjax(ajaxRetStr) 
{
	insertform.ckbh.length=1;
	strToSelect(insertform.ckbh,ajaxRetStr);
}


/*function getAjax(ajaxRetStr) 
{
		insertform.ckbh.length=1;
		var value3=getStrValue(ajaxRetStr,1);
		strToSelect(insertform.ckbh,value);

//		insertform.gysmc.length=1;
//		var value4=getStrValue(ajaxRetStr,4);
//		value4="%TOTO洁具供应商+TOTO洁具供应商%XXXX供应商+XXXX供应商  ";
//		value4=trim(value4);
//		strToSelect(insertform.gysmc,value4);

}*/

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请输入[仓库编号]！");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.pdr)=="") {
		alert("请输入[盘点人]！");
		FormName.pdr.focus();
		return false;
	}
	if(	javaTrim(FormName.pdrssfgs)=="") {
		alert("请输入[盘点人所属分公司]！");
		FormName.pdrssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
