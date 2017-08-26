<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mmdglxbm=null;
String qhjgqjbm=null;
String mmjjl=null;
String wheremmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
String whereqhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mmdglxbm,qhjgqjbm,mmjjl ";
	ls_sql+=" from  jc_qhcbjjb";
	ls_sql+=" where  (mmdglxbm='"+wheremmdglxbm+"') and  (qhjgqjbm='"+whereqhjgqjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		qhjgqjbm=cf.fillNull(rs.getString("qhjgqjbm"));
		mmjjl=cf.fillNull(rs.getString("mmjjl"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="SaveEditJc_qhcbjjb.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">木门订购类型</div>
  </td>
  <td width="35%"> 
    <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">墙厚价格区间</div>
  </td>
  <td width="35%"> 
    <select name="qhjgqjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select qhjgqjbm,qhjgqj from jdm_qhjgqj order by qhjgqjbm",qhjgqjbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">每米加价率</div>
  </td>
  <td width="35%"> 
    <input type="text" name="mmjjl" size="20" maxlength="9"  value="<%=mmjjl%>" >%
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wheremmdglxbm"  value="<%=wheremmdglxbm%>" >
<input type="hidden" name="whereqhjgqjbm"  value="<%=whereqhjgqjbm%>" >
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
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("请选择[木门订购类型]！");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.qhjgqjbm)=="") {
		alert("请选择[墙厚价格区间]！");
		FormName.qhjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmjjl)=="") {
		alert("请输入[每米加价率]！");
		FormName.mmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.mmjjl, "每米加价率"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
