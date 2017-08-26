<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String nian=null;
String yue=null;
String ygbh=null;
String bianhao=null;
String yhmc=null;
String dwbh=null;
String qqts=null;
String cqts=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,nian,yue,ygbh,bianhao,yhmc,dwbh,qqts,cqts,bz ";
	ls_sql+=" from  rs_cqtjb";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		qqts=cf.fillNull(rs.getString("qqts"));
		cqts=cf.fillNull(rs.getString("cqts"));
		bz=cf.fillNull(rs.getString("bz"));
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

<form method="post" action="SaveEditRs_cqtjb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">年</div>
              </td>
              <td width="35%"> 
                <input type="text" name="nian" size="20" maxlength="4"  value="<%=nian%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">月</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yue" size="20" maxlength="2"  value="<%=yue%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">员工序号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">工号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">所属部门</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">员工姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">全勤天数</td>
              <td width="35%"> 
                <input type="text" name="qqts" size="20" maxlength="8"  value="<%=qqts%>" >
              </td>
              <td width="15%" align="right">出勤天数</td>
              <td width="35%"> 
                <input type="text" name="cqts" size="20" maxlength="8"  value="<%=cqts%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月]！");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(!(isNumber(FormName.qqts, "全勤天数"))) {
		return false;
	}
	if(!(isNumber(FormName.cqts, "出勤天数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
