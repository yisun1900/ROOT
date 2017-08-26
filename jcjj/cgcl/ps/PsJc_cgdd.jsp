<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String azr=null;
String sazrq=null;
String azsm=null;
String aztzr=null;
String kazsj=null;
String jhazrq=null;
String aztzsj=null;
String ksazsj=null;
String ycyybm=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select ksazsj,ycyybm,azr,sazrq,azsm,aztzr,kazsj,aztzsj,jhazrq";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ycyybm=cf.fillNull(rs.getString("ycyybm"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		azr=cf.fillNull(rs.getString("azr"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azsm=cf.fillNull(rs.getString("azsm"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
	}

	if (ksazsj.equals(""))
	{
		ksazsj=cf.today();
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
<title>配送</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">橱柜订单处理--配送</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">协商安装时间</span></td>
              <td width="29%"> 
                <input type="text" name="kazsj" size="20" maxlength="20"  value="<%=kazsj%>" readonly>
              </td>
              <td width="21%" align="right"><span class="STYLE1">合同安装时间</span></td>
              <td width="29%"> 
                <input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">发安装通知人</span></td>
              <td bgcolor="#FFFFFF"> 
                <input type="text" name="aztzr" size="20" maxlength="20"  value="<%=aztzr%>" readonly>
              </td>
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">发安装通知时间</span></td>
              <td bgcolor="#FFFFFF"> 
                <input type="text" name="aztzsj" value="<%=aztzsj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF">配送录入人</td>
              <td bgcolor="#E8E8FF"> 
                <input type="text" name="pslrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td align="right" bgcolor="#E8E8FF">配送录入时间</td>
              <td bgcolor="#E8E8FF"> 
                <input type="text" name="pslrsj" size="20" maxlength="10" value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">配送说明</td>
              <td colspan="3" bgcolor="#E8E8FF"> 
                <textarea name="azsm" cols="71" rows="3"><%=azsm%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="center" height="51"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset" name="Reset" value="重输">
                <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
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
	if(	javaTrim(FormName.pslrr)=="") {
		alert("请输入[配送录入人]！");
		FormName.pslrr.focus();
		return false;
	}

	if(	javaTrim(FormName.pslrsj)=="") {
		alert("请输入[配送录入时间]！");
		FormName.pslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pslrsj, "配送录入时间"))) {
		return false;
	}

	FormName.action="SavePsJc_cgdd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
