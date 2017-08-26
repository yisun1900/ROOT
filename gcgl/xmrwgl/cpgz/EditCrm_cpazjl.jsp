<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String azjlh=null;
String khbh=null;
String cpflbm=null;
String azjg=null;
String smsj=null;
String smr=null;
String azsm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String whereazjlh=cf.GB2Uni(request.getParameter("azjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select azjlh,khbh,cpflbm,azjg,smsj,smr,azsm,lrr,lrsj,lrbm ";
	ls_sql+=" from  crm_cpazjl";
	ls_sql+=" where  (azjlh='"+whereazjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		azjlh=cf.fillNull(rs.getString("azjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		cpflbm=cf.fillNull(rs.getString("cpflbm"));
		azjg=cf.fillNull(rs.getString("azjg"));
		smsj=cf.fillNull(rs.getDate("smsj"));
		smr=cf.fillNull(rs.getString("smr"));
		azsm=cf.fillNull(rs.getString("azsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
.STYLE2 {color: #0000FF}
.STYLE3 {color: #0000CC}
.STYLE5 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_cpazjl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>安装记录号</td> 
  <td width="32%"> 
    <input type="text" name="azjlh" size="20" maxlength="10"  value="<%=azjlh%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>客户编号</td> 
  <td width="32%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品分类</td> 
  <td width="32%"> 
    <select name="cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm",cpflbm);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>安装结果</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "azjg","1+未完成&2+安装成功&3+安装失败",azjg);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>上门时间</td> 
  <td width="32%"> 
    <input type="text" name="smsj" size="20" maxlength="10"  value="<%=smsj%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>上门人</td> 
  <td width="32%"> 
    <input type="text" name="smr" size="20" maxlength="20"  value="<%=smr%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">安装说明</td> 
  <td colspan="3"> 
    <textarea name="azsm" cols="71" rows="3"><%=azsm%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<input type="hidden" name="whereazjlh"  value="<%=whereazjlh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.azjlh)=="") {
		alert("请输入[安装记录号]！");
		FormName.azjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpflbm)=="") {
		alert("请选择[产品分类]！");
		FormName.cpflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.azjg)) {
		alert("请选择[安装结果]！");
		FormName.azjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.smsj)=="") {
		alert("请输入[上门时间]！");
		FormName.smsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.smsj, "上门时间"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
