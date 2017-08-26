<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhkl=null;
String kdlbz=null;
String yhmc=null;
String yhdlm=null;
String lxfs=null;
String fwdz=null;
 String zlsmqk=null;



String hth=cf.GB2Uni(request.getParameter("hth"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select sfzh,kdlbz,khxm,hth,lxfs,fwdz,zlsmqk,yhdlm,yhkl ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (hth='"+hth+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhmc=cf.fillNull(rs.getString("khxm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		kdlbz=cf.fillNull(rs.getString("kdlbz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		zlsmqk=cf.fillNull(rs.getString("zlsmqk"));
		
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
    <td width="100%"> <div align="center"> 系统授权</div></td>
  </tr>
  <tr> 
    <td width="100%" > <div align="center"> 
        <form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="21%" bgcolor="#CCCCFF"> <div align="right"><font color="#FF0000">*</font>用户登陆名</div></td>
              <td colspan="2" bgcolor="#CCCCFF"> <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" > 
                <div align="right"></div></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCCFF"><div align="right">用户名称</div></td>
              <td bgcolor="#CCCCFF"> <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly></td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#CCCCFF"> <div align="right"><font color="#FF0000">*</font>用户口令</div></td>
              <td width="32%" bgcolor="#CCCCFF"> <input type="text" name="yhkl" size="20" maxlength="10"  value="<%=yhkl%>" > 
              </td>
            </tr>
            <td width="21%" align="right" bordercolor="#CCCCFF" bgcolor="#CCCCFF"><font color="#FF0000">*</font>可登陆系统标志</td>
            <td width="32%" bgcolor="#CCCCFF"> 
              <%
	cf.radioToken(out, "kdlbz","01+可登陆&02+不可登陆","");
%>
            </td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#FFFFFF"> <div align="right">电话</div></td>
              <td width="32%" bgcolor="#FFFFFF"> <input type="text" name="dh" size="20" maxlength="30"  value="<%=lxfs%>" > 
              </td>
            </tr>
            <tr> 
              <td width="21%" align="right" bgcolor="#FFFFFF">住址</td>
              <td colspan="2" bgcolor="#FFFFFF"> <input type="text" name="zz" size="71" maxlength="100"  value="<%=fwdz%>" > 
              </td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#FFFFFF"> <div align="right">出生日期</div></td>
              <td colspan="2" bgcolor="#FFFFFF"> <input type="text" name="csrq" size="20" maxlength="10"  value="" > 
                <div align="right"></div></td>
            </tr>
            <tr> 
              <td bgcolor="#FFFFFF"><div align="right">EMail</div></td>
              <td colspan="2" bgcolor="#FFFFFF"> <input type="text" name="email" size="20" maxlength="50"  value="" ></td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#FFFFFF"> <div align="right">备注</div></td>
              <td colspan="2" bgcolor="#FFFFFF"> <textarea name="bz" cols="55" rows="3"><%=zlsmqk%></textarea> 
              </td>
            </tr>
            <input type="hidden" name="hth"  value="<%=hth%>" >
            <tr> 
              <td colspan="3" height="2"> <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div></td>
            </tr>
          </table>
        </form>
      </div></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
/*	
*/
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[用户名称]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.yhkl)=="") {
		alert("请输入[用户名称]！");
		FormName.yhkl.focus();
		return false;
	}
	if(	!radioChecked(FormName.kdlbz)) {
		alert("请选择[可登陆系统标志]！");
		FormName.kdlbz[0].focus();
		return false;
	}
	
	
	if(!(isDatetime(FormName.csrq, "出生日期"))) {
		return false;
	}
	

	FormName.action="SaveEditSq_khxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
