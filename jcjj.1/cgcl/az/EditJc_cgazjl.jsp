<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String smrq=null;
String zcsmyybm=null;
String azqk=null;
String lrr=null;
String lrsj=null;
String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
String wheresmrq=cf.GB2Uni(request.getParameter("smrq"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ddbh,smrq,zcsmyybm,azqk,lrr,lrsj ";
	ls_sql+=" from  jc_cgazjl";
	ls_sql+=" where  (ddbh='"+whereddbh+"') and  (smrq=TO_DATE('"+wheresmrq+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		smrq=cf.fillNull(rs.getDate("smrq"));
		zcsmyybm=cf.fillNull(rs.getString("zcsmyybm"));
		azqk=cf.fillNull(rs.getString("azqk"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
      <div align="center"> 请修改橱柜安装记录（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_cgazjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" height="14"> 
                <div align="right">上门日期</div>
              </td>
              <td width="35%" height="14"> 
                <input type="text" name="smrq" size="20" maxlength="10"  value="<%=smrq%>" >
              </td>
              <td width="15%" height="14"> 
                <div align="right">再次上门原因</div>
              </td>
              <td width="35%" height="14"> 
                <select name="zcsmyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcsmyybm,zcsmyy from jdm_zcsmyybm order by zcsmyybm",zcsmyybm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">安装情况</td>
              <td colspan="3"> 
                <textarea name="azqk" cols="71" rows="5"><%=azqk%></textarea>
              </td>
            </tr>
            <input type="hidden" name="whereddbh"  value="<%=whereddbh%>" >
            <input type="hidden" name="wheresmrq"  value="<%=wheresmrq%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>
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
	if(	javaTrim(FormName.smrq)=="") {
		alert("请输入[上门日期]！");
		FormName.smrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.smrq, "上门日期"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
