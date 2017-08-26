<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%

String khxm=null;
String fwdz=null;
String lxfs=null;
String email=null;
String ssfgs=null;

String dhqh=null;
String khlxfs="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,email,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		email=cf.fillNull(rs.getString("email"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dhqh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dhqh=cf.fillNull(rs.getString("dhqh"));
	}
	rs.close();
	ps.close();

	if (dhqh==null || dhqh.equals(""))
	{
		out.println("错误！无电话区号，请联系系统管理员");
		return;
	}

	String lxr="";
	String lx="";
	String getdhqh="";
	String qhdh="";
	String dhhm="";
	String fenji="";
	ls_sql="select qhdh,lxr,dhhm,fj,dhqh,lx ";
	ls_sql+=" from  crm_khlxfs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qhdh=cf.fillNull(rs.getString("qhdh"));
		lxr=cf.fillNull(rs.getString("lxr"));
		dhhm=cf.fillNull(rs.getString("dhhm"));
		fenji=cf.fillNull(rs.getString("fj"));
		getdhqh=cf.fillNull(rs.getString("dhqh"));
		lx=cf.fillNull(rs.getString("lx"));

		khlxfs+=lxr+"^"+lx+"^"+dhqh+"^"+qhdh+"^"+dhhm+"^"+fenji+"*";
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
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
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> 修改联系方式（客户编号：<%=khbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF">
              <td align="right">客户姓名</td>
              <td width="84%" colspan="3"><%=khxm%>
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#CC0000">*</font><font color="#0000FF">联系方式</font></td>
              <td colspan="3"> 
                <input type="text" name="lxfs" size="70" maxlength="100"  value="<%=lxfs%>" readonly>
                <input type="hidden" name="khlxfs" value="<%=khlxfs%>"  >
                <input type="hidden" name="khxm" value="<%=khxm%>"  >
                <input name="button" type="button" onClick="if (javaTrim(khxm)=='') {alert('录入[客户姓名]');khxm.select();return false;};window.open('/dhzx/dhzx/getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="录入电话""></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">电子邮件</td>
              <td colspan="3"> 
                <input type="text" name="email" value="<%=email%>" size="40" maxlength="50">
                <font color="#FF0000">(注意：有多个邮箱<font color="#0000FF">用英文逗号</font>分隔)</font>              </td>
            </tr>
            
            <tr> 
              <td colspan="4" align="center" > 
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                  <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(FormName.lxfs.value=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}
	FormName.action="SaveEditLxfs.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
