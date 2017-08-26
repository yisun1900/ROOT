<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mmdglxbm=null;
String mmdglxmc=null;
String tdjjl=null;
String jjfs=null;
String bz=null;
String wheremmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mmdglxbm,mmdglxmc,tdjjl,jjfs,bz ";
	ls_sql+=" from  jc_mmdglx";
	ls_sql+=" where  (mmdglxbm='"+wheremmdglxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mmdglxmc=cf.fillNull(rs.getString("mmdglxmc"));
		tdjjl=cf.fillNull(rs.getString("tdjjl"));
		jjfs=cf.fillNull(rs.getString("jjfs"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
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

<form method="post" action="SaveEditJc_mmdglx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><span class="STYLE1">*</span>木门订购类型编码</div>              </td>
              <td width="33%"> 
                <input type="text" name="mmdglxbm" size="20" maxlength="2"  value="<%=mmdglxbm%>" >              </td>
              <td width="18%"> 
                <div align="right"><span class="STYLE1">*</span>木门订购类型名称</div>              </td>
              <td width="32%"> 
                <input type="text" name="mmdglxmc" size="20" maxlength="50"  value="<%=mmdglxmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>计价方式</td>
              <td colspan="3"><%
	cf.radioToken(out, "jjfs","11+木门<BR>&12+双口哑口<BR>&13+双口窗套<BR>&14+单口哑口<BR>&15+单口窗套<BR>&21+门连窗<BR>&22+门顶窗<BR>&31+外飘窗立口<BR>&32+外飘窗平台上口<BR>&41+平方米计价<BR>&42+延米计价<BR>&43+分段平方米计价<BR>&44+分段延米计价<BR>&45+分段按长度计价",jjfs);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><span class="STYLE1">*</span>特单加价率</div>              </td>
              <td width="33%"> 
                <input type="text" name="tdjjl" size="20" maxlength="9"  value="<%=tdjjl%>" >
                % </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="wheremmdglxbm"  value="<%=wheremmdglxbm%>" >
            <tr> 
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>              </td>
              <td width="33%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>              </td>
              <td width="32%" height="2"> 
                <input type="reset"  value="重输">              </td>
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
		alert("请输入[木门订购类型编码]！");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxmc)=="") {
		alert("请输入[木门订购类型名称]！");
		FormName.mmdglxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjfs)) {
		alert("请选择[计价方式]！");
		FormName.jjfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.tdjjl)=="") {
		alert("请输入[特单加价率]！");
		FormName.tdjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.tdjjl, "特单加价率"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
