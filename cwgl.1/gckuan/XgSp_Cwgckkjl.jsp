<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String spbz=null;
String spyj=null;
String spr=null;
String spsj=null;
String wherekkjlh=cf.GB2Uni(request.getParameter("kkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select spbz,spyj,spr,spsj ";
	ls_sql+=" from  cw_gckkjl";
	ls_sql+=" where  (kkjlh='"+wherekkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		spbz=cf.fillNull(rs.getString("spbz"));
		spyj=cf.fillNull(rs.getString("spyj"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
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
      <div align="center"><strong>维护审批</strong></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveXgSpCwgckkjl.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">审批人</div>  </td>
  <td width="35%"><input type="text" name="spr" size="20" maxlength="20"  value="<%=spr%>" readonly>  </td>
  <td width="15%"> 
    <div align="right">审批时间</div>  </td>
  <td width="35%"><input type="text" name="spsj" size="20" maxlength="10"  value="<%=spsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审批标志</td>
  <td colspan="3">
<%
	cf.radioToken(out, "spbz","3+审批通过&4+审批未通过",spbz);
%>
	</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">审批意见</div>  </td>
  <td colspan="3"><textarea name="spyj" cols="69" rows="3"><%=spyj%></textarea> 
    <div align="right"></div>  </td>
  </tr>
<input type="hidden" name="wherekkjlh"  value="<%=wherekkjlh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
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
	if(	!radioChecked(FormName.spbz)) {
		alert("请选择[审批标志]！");
		FormName.spbz[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
