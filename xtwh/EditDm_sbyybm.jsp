<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sbyybm=null;
String sbyymc=null;
String dmzxzt=null;
String fgszxzt=null;
String wheresbyybm=cf.GB2Uni(request.getParameter("sbyybm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select sbyybm,sbyymc,dmzxzt,fgszxzt ";
	ls_sql+=" from  dm_sbyybm";
	ls_sql+=" where  (sbyybm='"+wheresbyybm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sbyymc=cf.fillNull(rs.getString("sbyymc"));
		dmzxzt=cf.fillNull(rs.getString("dmzxzt"));
		fgszxzt=cf.fillNull(rs.getString("fgszxzt"));
	}
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

<form method="post" action="SaveEditDm_sbyybm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">失败原因编码</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sbyybm" size="20" maxlength="2"  value="<%=sbyybm%>" >
              </td>
              <td width="18%"> 
                <div align="right">失败原因名称</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sbyymc" size="20" maxlength="50"  value="<%=sbyymc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">店面咨询状态</td>
              <td width="32%"> 
                <select name="dmzxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"2+店面退回客户&4+公司签单失败",dmzxzt);
%> 
                </select>
              </td>
              <td width="18%" align="right">分公司咨询状态</td>
              <td width="32%"> 
                <select name="fgszxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"2+店面退回客户&4+公司签单失败",fgszxzt);
%> 
                </select>
              </td>
            </tr>
            <input type="hidden" name="wheresbyybm"  value="<%=wheresbyybm%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
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
	if(	javaTrim(FormName.sbyybm)=="") {
		alert("请输入[失败原因编码]！");
		FormName.sbyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.sbyymc)=="") {
		alert("请输入[失败原因名称]！");
		FormName.sbyymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
