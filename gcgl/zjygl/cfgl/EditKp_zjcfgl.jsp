<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cfjlh=null;
String zjxm=null;
String fgsbh=null;
String cfr=null;
String cfsj=null;
String cflxbm=null;
String cfyybm=null;
String fkze=null;
String kf=null;
String lrr=null;
String lrsj=null;
String lrdw=null;
String bz=null;
String wherecfjlh=cf.GB2Uni(request.getParameter("cfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cfjlh,zjxm,fgsbh,cfr,cfsj,cflxbm,cfyybm,fkze,kf,lrr,lrsj,lrdw,bz ";
	ls_sql+=" from  kp_zjcfgl";
	ls_sql+=" where  (cfjlh="+wherecfjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfjlh=cf.fillNull(rs.getString("cfjlh"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cfr=cf.fillNull(rs.getString("cfr"));
		cfsj=cf.fillNull(rs.getDate("cfsj"));
		cflxbm=cf.fillNull(rs.getString("cflxbm"));
		cfyybm=cf.fillNull(rs.getString("cfyybm"));
		fkze=cf.fillNull(rs.getString("fkze"));
		kf=cf.fillNull(rs.getString("kf"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
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
<form method="post" action="SaveEditKp_zjcfgl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">处罚记录号</td> 
  <td width="35%"> 
    <input type="text" name="cfjlh" size="20" maxlength="8"  value="<%=cfjlh%>" >
  </td>
  <td align="right" width="15%">工程担当</td> 
  <td width="35%"> 
    <input type="text" name="zjxm" size="20" maxlength="20"  value="<%=zjxm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">所属分公司</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",fgsbh);
%>
    </select>
  </td>
  <td align="right" width="15%">处罚人</td> 
  <td width="35%"> 
    <input type="text" name="cfr" size="20" maxlength="20"  value="<%=cfr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">处罚时间</td> 
  <td width="35%"> 
    <input type="text" name="cfsj" size="20" maxlength="10"  value="<%=cfsj%>" >
  </td>
  <td align="right" width="15%">处罚类型</td> 
  <td width="35%"> 
    <select name="cflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cflxbm,cflxmc from kp_cflxbm order by cflxbm",cflxbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">处罚原因</td> 
  <td width="35%"> 
    <select name="cfyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cfyybm,cfyymc from kp_cfyybm order by cfyybm",cfyybm);
%>
    </select>
  </td>
  <td align="right" width="15%">罚款总额</td> 
  <td width="35%"> 
    <input type="text" name="fkze" size="20" maxlength="17"  value="<%=fkze%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">扣分</td> 
  <td width="35%"> 
    <input type="text" name="kf" size="20" maxlength="8"  value="<%=kf%>" >
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >
  </td>
  <td align="right" width="15%">录入单位</td> 
  <td width="35%"> 
    <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh",lrdw);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="3"><%=bz%></textarea>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherecfjlh"  value="<%=wherecfjlh%>" >
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cfjlh)=="") {
		alert("请输入[处罚记录号]！");
		FormName.cfjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.cfjlh, "处罚记录号"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("请输入[工程担当]！");
		FormName.zjxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cfr)=="") {
		alert("请输入[处罚人]！");
		FormName.cfr.focus();
		return false;
	}
	if(	javaTrim(FormName.cfsj)=="") {
		alert("请输入[处罚时间]！");
		FormName.cfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cfsj, "处罚时间"))) {
		return false;
	}
	if(	javaTrim(FormName.cflxbm)=="") {
		alert("请选择[处罚类型]！");
		FormName.cflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cfyybm)=="") {
		alert("请选择[处罚原因]！");
		FormName.cfyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkze)=="") {
		alert("请输入[罚款总额]！");
		FormName.fkze.focus();
		return false;
	}
	if(!(isFloat(FormName.fkze, "罚款总额"))) {
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("请输入[扣分]！");
		FormName.kf.focus();
		return false;
	}
	if(!(isNumber(FormName.kf, "扣分"))) {
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
	if(	javaTrim(FormName.lrdw)=="") {
		alert("请选择[录入单位]！");
		FormName.lrdw.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
