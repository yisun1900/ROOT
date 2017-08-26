<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kdjgqjbm=null;
String kdjgqj=null;
String qskd=null;
String zzkd=null;
String mmdglxbm=null;
String wherekdjgqjbm=cf.GB2Uni(request.getParameter("kdjgqjbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kdjgqjbm,kdjgqj,qskd,zzkd,mmdglxbm ";
	ls_sql+=" from  jdm_kdjgqj";
	ls_sql+=" where  (kdjgqjbm='"+wherekdjgqjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kdjgqjbm=cf.fillNull(rs.getString("kdjgqjbm"));
		kdjgqj=cf.fillNull(rs.getString("kdjgqj"));
		qskd=cf.fillNull(rs.getString("qskd"));
		zzkd=cf.fillNull(rs.getString("zzkd"));
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

<form method="post" action="SaveEditJdm_kdjgqj.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">宽度价格区间编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kdjgqjbm" size="20" maxlength="2"  value="<%=kdjgqjbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">宽度价格区间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kdjgqj" size="20" maxlength="50"  value="<%=kdjgqj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">起始宽度（>）</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qskd" size="20" maxlength="8"  value="<%=qskd%>" > mm
  </td>
  <td width="15%"> 
    <div align="right">终止宽度（<=）</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zzkd" size="20" maxlength="8"  value="<%=zzkd%>" > mm
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">订购类型</div>
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
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherekdjgqjbm"  value="<%=wherekdjgqjbm%>" >
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
	if(	javaTrim(FormName.kdjgqjbm)=="") {
		alert("请输入[宽度价格区间编码]！");
		FormName.kdjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kdjgqj)=="") {
		alert("请输入[宽度价格区间]！");
		FormName.kdjgqj.focus();
		return false;
	}
	if(	javaTrim(FormName.qskd)=="") {
		alert("请输入[起始宽度]！");
		FormName.qskd.focus();
		return false;
	}
	if(!(isNumber(FormName.qskd, "起始宽度"))) {
		return false;
	}
	if(	javaTrim(FormName.zzkd)=="") {
		alert("请输入[终止宽度]！");
		FormName.zzkd.focus();
		return false;
	}
	if(!(isNumber(FormName.zzkd, "终止宽度"))) {
		return false;
	}
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("请选择[订购类型]！");
		FormName.mmdglxbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
