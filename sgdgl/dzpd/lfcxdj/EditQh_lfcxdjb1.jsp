<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String djxh=null;
String khbh=null;
String zpnr=null;
String jsr=null;
String djrq=null;
String bz=null;
String wheredjxh=cf.GB2Uni(request.getParameter("djxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select djxh,khbh,zpnr,jsr,djrq,bz ";
	ls_sql+=" from  qh_lfcxdjb";
	ls_sql+=" where  (djxh='"+wheredjxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		djxh=cf.fillNull(rs.getString("djxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		zpnr=cf.fillNull(rs.getString("zpnr"));
		jsr=cf.fillNull(rs.getString("jsr"));
		bz=cf.fillNull(rs.getString("bz"));
		djrq=cf.fillNull(rs.getDate("djrq"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditQh_lfcxdjb1.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">登记序号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="djxh" size="20" maxlength="7"  value="<%=djxh%>" >
              </td>
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">赠品内容</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zpnr" size="20" maxlength="50"  value="<%=zpnr%>" >
              </td>
              <td width="15%"> 
                <div align="right">经手人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jsr" size="20" maxlength="8"  value="<%=jsr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">登记日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="djrq" size="20" maxlength="10"  value="<%=djrq%>" >
              </td>
              <td width="15%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%">
                <div align="right">备注</div>
              </td>
              <td colspan="3">
                <textarea name="bz" cols="81" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheredjxh"  value="<%=wheredjxh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="重输">
              </td>
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
	if(	javaTrim(FormName.djxh)=="") {
		alert("请输入[登记序号]！");
		FormName.djxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请选择[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zpnr)=="") {
		alert("请输入[赠品内容]！");
		FormName.zpnr.focus();
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[经手人]！");
		FormName.jsr.focus();
		return false;
	}
	if(!(isDatetime(FormName.djrq, "登记日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
