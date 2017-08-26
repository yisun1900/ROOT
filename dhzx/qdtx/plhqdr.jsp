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
String zxdm=null;
String sjsbh=null;
try {
	conn=cf.getConnection();

	stmt = conn.createStatement();
	ls_sql="select count(distinct zxdm)";
	ls_sql+=" from  crm_zxkhxx";
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

	ls_sql="select zxdm,sjsbh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh[0]+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zxdm=rs.getString("zxdm");
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
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
<title>换签单人</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="SavePlhqdr.jsp" name="editform">
		  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td colspan="2" align="center" height="41"><b><font color="#000066">换签单人</font></b></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="38%" align="right" height="52">咨询店面</td>
      <td width="62%" height="52"> 
        <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"' order by dwbh",zxdm);
%> 
        </select>      </td>
    </tr>
    
    <tr bgcolor="#FFFFCC"> 
      <td width="38%" align="right" height="45">签单人 </td>
      <td width="62%" height="45"> 
		<select name="qdr" style="FONT-SIZE:12PX;WIDTH:152PX"  >
		  <option value=""></option>
		  <%
cf.selectItem(out,"select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx where dwbh='"+zxdm+"' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
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
          <input type="button"  value="更换" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.zxdm)=="") {
		alert("请输入[咨询店面]！");
		FormName.zxdm.focus();
		return false;
	}
	if(	javaTrim(FormName.qdr)=="") {
		alert("请输入[签单人]！");
		FormName.qdr.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
