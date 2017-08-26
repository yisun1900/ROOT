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
<form method="post" action="Jxc_ckmcCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
<td align="right" width="15%">所属地区</td> 
  <td width="35%"> 
   <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where (1=1)  order by dqmc","");
	}
	else
	{
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm in (select dm_dqbm.dqbm dqbm from dm_dqbm,sq_dwxx,sq_yhxx,sq_sqfgs where sq_yhxx.yhdlm='"+yhdlm+"' and sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_dwxx.dqbm=dm_dqbm.dqbm union all select dqbm from dm_dqbm where dqbm='"+dqbm+"' )group by dqbm,dqmc order by dqmc","");	
	}
%>
  </select>  </td>
  
  <td align="right" width="15%">仓库类型</td> 
  <td width="35%"><select name="select" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
   <option value="0">总部仓库</option>
	<option value="1">分公司仓库</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">仓库编号</td> 
  <td width="35%"> 
    <input type="text" name="ckbh" size="20" maxlength="4" >  </td>
  <td align="right" width="15%">仓库名称  </td>
  <td width="35%"><input type="text" name="ckmc" size="20" maxlength="50" ></td>
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
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
