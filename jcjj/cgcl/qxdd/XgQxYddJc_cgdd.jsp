<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String kclf=null;
String jctdyybm=null;
String tdsm=null;
String tdblr=null;
String tdsj=null;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jctdyybm,tdsm,kclf,tdblr,jc_cgdd.tdsj,jc_cgdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth";
	ls_sql+=" from  jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and (jc_cgdd.ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		jctdyybm=cf.fillNull(rs.getString("jctdyybm"));
		tdsm=cf.fillNull(rs.getString("tdsm"));
		kclf=cf.fillNull(rs.getString("kclf"));
		tdblr=cf.fillNull(rs.getString("tdblr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
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
<title>橱柜订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">橱柜订单---修改取消预订单 </div>
  
<form method="post" action="SaveXgQxYddJc_cgdd.jsp" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%"> 
        <div align="right">客户编号</div>
      </td>
      <td width="31%"> <%=khbh%></td>
      <td width="17%"> 
        <div align="right">合同号</div>
      </td>
      <td width="33%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%"> 
        <div align="right">客户姓名</div>
      </td>
      <td width="31%"> <%=khxm%>（<%=lxfs%>） </td>
      <td width="17%"> 
        <div align="right"></div>
      </td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right">房屋地址</td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right"><font color="#FF0000">*</font>扣测量费</td>
      <td width="35%"> 
        <input type="text" name="kclf" value="<%=kclf%>" size="20" maxlength="16" >
      </td>
      <td width="15%" align="right"><font color="#FF0000">*</font>退单原因</td>
      <td width="35%"> 
        <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm",jctdyybm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%"> 
        <div align="right"><font color="#FF0000">*</font><font color="#0000CC">退单办理人</font></div>
      </td>
      <td width="35%"> 
        <input type="text" name="tdblr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="15%"> 
        <div align="right"><font color="#FF0000">*</font>退单时间</div>
      </td>
      <td width="35%"> 
        <input type="text" name="tdsj" value="<%=tdsj%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right"><font color="#FF0000">*</font>退单说明</td>
      <td colspan="3"> 
        <textarea name="tdsm" rows="4" cols="72"><%=tdsm%></textarea>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(selectform)" name="button">
          <input type="reset"  value="重输" name="reset">
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kclf)=="") {
		alert("请选择[扣测量费]！");
		FormName.kclf.focus();
		return false;
	}
	if(!(isFloat(FormName.kclf, "扣测量费"))) {
		return false;
	}
	if(	javaTrim(FormName.jctdyybm)=="") {
		alert("请选择[退单原因]！");
		FormName.jctdyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tdblr)=="") {
		alert("请选择[退单办理人]！");
		FormName.tdblr.focus();
		return false;
	}
	if(	javaTrim(FormName.tdsj)=="") {
		alert("请选择[退单时间]！");
		FormName.tdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tdsj, "退单时间"))) {
		return false;
	}
	if(	javaTrim(FormName.tdsm)=="") {
		alert("请选择[退单说明]！");
		FormName.tdsm.focus();
		return false;
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
