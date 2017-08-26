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
String cjfw=request.getParameter("cjfw");
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int clsl=0;

try {
	conn=cf.getConnection();

	if (cjfw.equals("0"))
	{
		ls_sql="SELECT count(*)";
		ls_sql+="  FROM crm_zxkhxx";
		ls_sql+=" where zxzt in('0','1','2','5')";
		ls_sql+=" and ssfgs in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clsl =rs.getInt(1);
		}
		rs.close();
		ps.close();

	}
	else if (cjfw.equals("1"))
	{
		ls_sql="SELECT count(*)";
		ls_sql+="  FROM crm_khxx";
		ls_sql+=" where crm_khxx.gcjdbm in('1') and fgsbh in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clsl =rs.getInt(1);
		}
		rs.close();
		ps.close();

	}
	else if (cjfw.equals("2"))
	{
		ls_sql="SELECT count(*)";
		ls_sql+="  FROM crm_khxx";
		ls_sql+=" where crm_khxx.gcjdbm in('1','2') and fgsbh in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clsl =rs.getInt(1);
		}
		rs.close();
		ps.close();

	}
	else if (cjfw.equals("3"))
	{
		ls_sql="SELECT count(*)";
		ls_sql+="  FROM crm_khxx";
		ls_sql+=" where (crm_khxx.gdjsjd='0' or crm_khxx.gdjsjd is null) and fgsbh in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clsl =rs.getInt(1);
		}
		rs.close();
		ps.close();
	}
	else if (cjfw.equals("4"))
	{
		clsl=1;
	}

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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
  <p>重建：客户工料分析表（bj_khglfxb）</p>
  <p>根据【家装工料分析表bj_jzglfxb】和【电子报价】，重建:客户工料分析表（bj_khglfxb）<BR>
  </p>
  <HR>
<form method="post" action="" name="loadform" target="_blank">
    <table width="100%" border="0">
      <tr align="center"> 
        <td height="34" align="right" width="25%">&nbsp;</td>
        <td height="34" align="left" width="75%">客户数：<%=clsl%></td>
      </tr>
      <tr> 
        <td colspan="2" align="center" height="170"> 
          <p> 
            <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
            <input type="hidden" name="cjfw"  value="<%=cjfw%>" >
            <input type="hidden" name="khbh"  value="<%=khbh%>" >
            <input type="button"  value="更新：电子报价工料分析表（bj_khglfxb）" onClick="f_do1(loadform)" >
          </p>
          <p> 
            <input type="button"  value="更新：增减前工料分析表（bj_khglfxbq）" onClick="f_do2(loadform)" >
          </p>
          <p> 
            <input type="button"  value="更新：增减后工料分析表（bj_khglfxbh）"  onClick="f_do3(loadform)">
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
	FormName.action="SaveUpdateBj_khglfxb.jsp";
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
	FormName.action="SaveUpdateBj_khglfxbq.jsp";
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
	FormName.action="SaveUpdateBj_khglfxbh.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

