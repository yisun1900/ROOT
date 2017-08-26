<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>更换分公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String dwmc=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;

try {
	conn=cf.getConnection();
	
	ls_sql="select fgsbh,khxm,fwdz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();
%>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 更换分公司</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr>
              <td height="28" align="right" bgcolor="#CCCCFF"> 客户编号</td>
              <td bgcolor="#CCCCFF">
                <input name="khbh" type="text" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td bgcolor="#CCCCFF" align="right">&nbsp;</td>
              <td bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr>
              <td height="28" align="right" bgcolor="#CCCCFF"> 客户姓名 </td>
              <td bgcolor="#CCCCFF"><%=khxm%></td>
              <td bgcolor="#CCCCFF" align="right">房屋地址</td>
              <td bgcolor="#CCCCFF"><%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>新分公司</td>
              <td width="31%"> 
                <select name="newssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') order by dwbh","");
%> 
                </select>              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>原分公司</td>
              <td width="33%"> 
                <select name="oldssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
                </select>              </td>
            </tr>
            
            <tr> 
              <td colspan="4" align="center" ><input name="button" type="button" onClick="f_do(editform)"  value="开始更换分公司"></td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.newssfgs)=="") {
		alert("请选择[新分公司]！");
		FormName.newssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.oldssfgs)=="") {
		alert("请选择[原分公司]！");
		FormName.oldssfgs.focus();
		return false;
	}

	if (FormName.newssfgs.value==FormName.oldssfgs.value)
	{
		alert("请选择不同的[分公司]！");
		FormName.newssfgs.focus();
		return false;
	}


	FormName.action="SaveEnterGhFgs.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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








