<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String aztzr=null;
String kazsj=null;
String jhazrq=null;
String azsjbz=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select aztzr,kazsj,azsjbz,jhazrq";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		aztzr=cf.fillNull(rs.getString("aztzr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
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
<title>安装通知</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">协商安装时间</td>
	<td  width="10%">录入人</td>
	<td  width="20%">录入时间</td>
	<td  width="50%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql=" SELECT kazsj,lrr,lrsj,bz";
	ls_sql+=" FROM jc_jjazsjjl ";
    ls_sql+=" where ddbh='"+ddbh+"'";
    ls_sql+=" order by lrsj,kazsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>


<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">修改安装通知（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">协商安装时间</td>
              <td width="29%"><input type="text" name="kazsj" size="20" maxlength="20"  value="<%=kazsj%>" readonly></td>
              <td width="21%" align="right">合同安装时间</td>
              <td width="29%"><input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>" readonly></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">发安装通知人</td>
              <td><input type="text" name="aztzr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
              <td><div align="right">发安装通知时间</div></td>
              <td><input type="text" name="aztzsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">安装时间说明</td>
              <td colspan="3"> 
                <textarea name="azsjbz" cols="71" rows="3"><%=azsjbz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                </div>              </td>
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
	if(	javaTrim(FormName.aztzr)=="") {
		alert("请输入[发安装通知人]！");
		FormName.aztzr.focus();
		return false;
	}
	if(	javaTrim(FormName.aztzsj)=="") {
		alert("请输入[发安装通知时间]！");
		FormName.aztzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.aztzsj, "发安装通知时间"))) {
		return false;
	}

	FormName.action="SaveXgAztzJc_jjdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
