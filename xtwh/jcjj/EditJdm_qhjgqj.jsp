<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String qhjgqjbm=null;
String qhjgqj=null;
String qshd=null;
String zzhd=null;
String mmdglxbm=null;
String whereqhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select qhjgqjbm,qhjgqj,qshd,zzhd,mmdglxbm ";
	ls_sql+=" from  jdm_qhjgqj";
	ls_sql+=" where  (qhjgqjbm='"+whereqhjgqjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qhjgqjbm=cf.fillNull(rs.getString("qhjgqjbm"));
		qhjgqj=cf.fillNull(rs.getString("qhjgqj"));
		qshd=cf.fillNull(rs.getString("qshd"));
		zzhd=cf.fillNull(rs.getString("zzhd"));
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
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

<form method="post" action="SaveEditJdm_qhjgqj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">木门订购类型</td>
              <td width="35%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm);
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">墙厚价格区间编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qhjgqjbm" size="20" maxlength="2"  value="<%=qhjgqjbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">墙厚价格区间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qhjgqj" size="20" maxlength="50"  value="<%=qhjgqj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">起始厚度（>）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qshd" size="20" maxlength="8"  value="<%=qshd%>" >
                mm </td>
              <td width="15%"> 
                <div align="right">终止厚度（<=）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzhd" size="20" maxlength="8"  value="<%=zzhd%>" >
                mm </td>
            </tr>
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
		alert("请输入[墙厚价格区间编码]！");
		FormName.qhjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.qhjgqj)=="") {
		alert("请输入[墙厚价格区间]！");
		FormName.qhjgqj.focus();
		return false;
	}
	if(	javaTrim(FormName.qshd)=="") {
		alert("请输入[起始厚度]！");
		FormName.qshd.focus();
		return false;
	}
	if(!(isNumber(FormName.qshd, "起始厚度"))) {
		return false;
	}
	if(	javaTrim(FormName.zzhd)=="") {
		alert("请输入[终止厚度]！");
		FormName.zzhd.focus();
		return false;
	}
	if(!(isNumber(FormName.zzhd, "终止厚度"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
