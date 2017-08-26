<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
String dwbh=null;

try {
	conn=cf.getConnection();

	stmt = conn.createStatement();
	ls_sql="select count(distinct dwbh)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where "+cf.arrayToInSQL(khbh,"khbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("错误！只能同一个店面的客户，才能批量分配");
		return;
	}


	ls_sql="select dwbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh[0]+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=rs.getString("dwbh");
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

<html>
<head>
<title>派客户经理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="SavePlFpKhjl.jsp" name="editform">
		  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td colspan="2" align="center" height="41"><b><font color="#000066">批量派客户经理</font></b></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="38%" align="right" height="45">客户经理 </td>
      <td width="62%" height="45"> 
                <select name="khjl" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm='03' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
%> 
                </select>      </td>
    </tr>
    <tr> 
      <td colspan="2" height="2"> 
        <div align="center"> <%
	for (int i=0;i<khbh.length ;i++ )
	{
		%> 
          <input type="hidden" name="khbh" value="<%=khbh[i]%>" >
          <%
	}

%> 
          <input type="button"  value="开始分配" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.khjl)=="") {
		alert("请输入[客户经理]！");
		FormName.khjl.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
