<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String blxhbm=null;
String bzdj=null;
String dj=null;
String sl=null;
String bz=null;
String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,blxhbm,bzdj,dj,sl,bz ";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		blxhbm=cf.fillNull(rs.getString("blxhbm"));
		bzdj=cf.fillNull(rs.getString("bzdj"));
		dj=cf.fillNull(rs.getString("dj"));
		sl=cf.fillNull(rs.getString("sl"));
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
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">调整合同价格</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveTjJc_blddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">预订单编号</font></td>
              <td width="35%"> 
                <input type="text" name="yddbh" size="20" maxlength="9"  value="<%=yddbh%>" readonly>              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">玻璃型号</td>
              <td colspan="3">
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:520PX" onChange="changelx(editform)">
                  <%
	cf.selectItem(out,"select blxhbm,blxh||'（'||blyt||'）'||'￥:'||jg from jc_blbj,jdm_blytbm where jc_blbj.blytbm=jdm_blytbm.blytbm(+) and blxhbm='"+blxhbm+"'",blxhbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">订购数量</td>
              <td><input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" readonly></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#FF0000">*</font><b>客户单价</b></td>
              <td width="35%"> 
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" >              </td>
              <td width="15%" align="right"><font color="#0000CC">标准单价</font></td>
              <td width="35%"><input type="text" name="bzdj" size="20" maxlength="9"  value="<%=bzdj%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
            <tr> 
              <td width="15%" height="2">&nbsp;</td>
              <td width="35%" height="2" align="right">                <input type="button"  value="保存" onClick="f_do(editform)">              </td>
              <td width="15%" height="2">&nbsp;</td>
              <td width="35%" height="2"> 
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
function changelx(FormName)//参数FormName:Form的名称
{
	FormName.dj.value=FormName.blxhbm.options[FormName.blxhbm.selectedIndex].text.substring(FormName.blxhbm.options[FormName.blxhbm.selectedIndex].text.indexOf(":")+1);
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[客户单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "客户单价"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
