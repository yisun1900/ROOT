<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%

String dqbm=request.getParameter("dqbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int allsl=0;
int clsl=0;
int wbmsl=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	    allsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT count(*)";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and glflbm='1'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	    clsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT count(*)";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and glflbm='1'  and wlbm is null";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	    wbmsl=rs.getInt(1);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<CENTER>
  <p>更新：家装工料分析表（bj_jzglfxb）</p>
  <p>根据[家装材料价格表（bj_jzcljgb）]，修改【bj_jzglfxb】中的[物料编码]<BR>
  </p>
  <HR>
<form method="post" action="" name="loadform" target="_blank">
    <table width="100%" border="0">
      <tr align="center"> 
        <td height="34" align="right" width="25%">&nbsp;</td>
        <td height="34" align="left" width="75%">家装工料分析表（bj_jzglfxb）记录数：<%=allsl%></td>
      </tr>
      <tr align="center"> 
        <td height="34" align="right" width="25%">&nbsp;</td>
        <td height="34" align="left" width="75%">其中材料类记录数：<%=clsl%></td>
      </tr>
      <tr align="center">
        <td height="34" align="right" width="25%">&nbsp;</td>
        <td height="34" align="left" width="75%">材料类无【物料编码】记录数：<%=wbmsl%></td>
      </tr>
      <tr align="center"> 
        <td height="91" align="right" width="25%">&nbsp;</td>
        <td height="91" align="left" width="75%"> 
          <p>
            <input type="radio" name="xzfw" value="1">
            更新全部 </p>
          <p>
            <input type="radio" name="xzfw" value="2" checked>
            更新【物料编码】为空记录 </p>
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center" height="170"> 
          <p> 
            <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
            <input type="button"  value="【工料名称、型号规格、品牌】相匹配" onClick="f_do1(loadform)" >
          </p>
          <p> 
            <input type="button"  value="【工料名称、型号规格】相匹配" onClick="f_do2(loadform)" >
          </p>
          <p> 
            <input type="button"  value="【工料名称】相匹配" onClick="f_do3(loadform)" >
          </p>
          <p> 
            <input type="button"  value="查看【物料编码】为空记录" onClick="f_do4(loadform)" >
          </p>
          <p> 
            <input type="button"  value="根据【物料编码】更新【工料名称、型号规格、品牌】" onClick="f_do5(loadform)" >
          </p>
        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do1(FormName)
{
	if (!confirm("注意！修改后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="SaveUpdateBj_jzglfxb1.jsp";
	FormName.submit();
	return true;
} 
function f_do2(FormName)
{
	if (!confirm("注意！修改后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="SaveUpdateBj_jzglfxb2.jsp";
	FormName.submit();
	return true;
} 
function f_do3(FormName)
{
	if (!confirm("注意！修改后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="SaveUpdateBj_jzglfxb3.jsp";
	FormName.submit();
	return true;
} 
function f_do4(FormName)
{
	if (!confirm("注意！修改后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="EditNullBj_jzglfxb.jsp";
	FormName.submit();
	return true;
} 
function f_do5(FormName)
{
	if (!confirm("注意！修改后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="SaveUpdateMcPpGg.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>

