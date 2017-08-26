<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>客户完结归档登记</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dadbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select dadbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dadbh=cf.fillNull(rs.getString("dadbh"));
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><b>客户完结归档登记</b></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
             <tr bgcolor="#FFFFFF">
               <td width="48%" align="right"><span class="STYLE2">*</span>档案袋编号</td>
               <td width="52%" bgcolor="#FFFFFF"><input name="dadbh" type="text" value="<%=dadbh%>" size="20" maxlength="20"></td>
             </tr>
             <tr bgcolor="#FFFFFF">
               <td align="right"><span class="STYLE1"><span class="STYLE2">*</span>归档人</span></td>
               <td bgcolor="#FFFFFF"><input type="text" name="dagdr" value="<%=yhmc%>" size="10" maxlength="20" readonly></td>
             </tr>
             <tr bgcolor="#FFFFFF"> 
              <td align="right"> 
                <span class="STYLE1"><span class="STYLE2">*</span>归档时间</span></td>
              <td bgcolor="#FFFFFF"><input type="text" name="dagdsj" value="<%=cf.today()%>" size="10" maxlength="10" readonly></td>
            </tr>
           <tr align="center"> 
			 <td colspan="3"> 
				  <input type="hidden" name="khbh" value="<%=khbh%>" >

             <input type="button"  value="存盘" onClick="f_do(insertform)" name="save">
           </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dadbh)=="") {
		alert("请输入[档案袋编号]！");
		FormName.dadbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dagdr)=="") {
		alert("请输入[归档人]！");
		FormName.dagdr.focus();
		return false;
	}


	if(	javaTrim(FormName.dagdsj)=="") {
		alert("请输入[归档时间]！");
		FormName.dagdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.dagdsj, "归档时间"))) {
		return false;
	}

	FormName.action="SaveGddj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
