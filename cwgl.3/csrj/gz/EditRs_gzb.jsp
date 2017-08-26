<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khzq=null;
String ssfgs=null;
String fxrq=null;
String ksrq=null;
String zzrq=null;
String qqts=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sfksb=null;
String sfkywx=null;
String wherekhzq=cf.GB2Uni(request.getParameter("khzq"));
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khzq,ssfgs,fxrq,ksrq,zzrq,qqts,lrr,lrsj,lrbm,bz,sfksb,sfkywx ";
	ls_sql+=" from  rs_gzb";
	ls_sql+=" where  (khzq='"+wherekhzq+"') and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khzq=cf.fillNull(rs.getString("khzq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		fxrq=cf.fillNull(rs.getDate("fxrq"));
		ksrq=cf.fillNull(rs.getDate("ksrq"));
		zzrq=cf.fillNull(rs.getDate("zzrq"));
		qqts=cf.fillNull(rs.getString("qqts"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sfksb=cf.fillNull(rs.getString("sfksb"));
		sfkywx=cf.fillNull(rs.getString("sfkywx"));
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>考核周期</td> 
  <td width="32%"> 
    <input type="text" name="khzq" size="20" maxlength="6"  value="<%=khzq%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>发薪日期</td> 
  <td width="32%"> 
    <input type="text" name="fxrq" size="20" maxlength="10"  value="<%=fxrq%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>全勤天数</td> 
  <td width="32%"><input type="text" name="qqts" size="20" maxlength="9"  value="<%=qqts%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>工资开始日期</td>
  <td><input type="text" name="ksrq" size="20" maxlength="10"  value="<%=ksrq%>" readonly></td>
  <td align="right"><span class="STYLE1">*</span>工资终止日期</td>
  <td><input type="text" name="zzrq" size="20" maxlength="10"  value="<%=zzrq%>" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣社保</td>
  <td><%
	cf.radioToken(out, "sfksb","Y+扣社保&N+不扣社保",sfksb);
%></td>
  <td align="right"><span class="STYLE1">*</span>是否扣意外险</td>
  <td><%
	cf.radioToken(out, "sfkywx","Y+扣除&N+不扣除",sfkywx);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",lrbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <p>
	    <input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
	    <input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
	    <input type="button"  value="保存" onClick="f_do(editform)">
	    <input name="button6" type="button" onClick="f_jsgz(editform)"  value="计算工资">
	    <input name="button7" type="button" onClick="f_ckgz(editform)"  value="查看工资">
	    <input type="reset"  value="重输">
	  </p>
	  <p>
	    <input type="button" onClick="f_jstc(editform)"  value="计算提成">  
	    <input type="button" onClick="window.open('ViewTc.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')"  value="提成明细">

	    <input type="button" onClick="window.open('ViewQdTc.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')"  value="签单提成">
	    <input type="button" onClick="window.open('ViewJsTc.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')"  value="结算提成">
	    <input type="button" onClick="window.open('ViewTdTc.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')"  value="退单提成">
	    <input type="button" onClick="window.open('ViewSjfTc.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')"  value="设计费提成">
	    <input type="button" onClick="window.open('ViewZcTc.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')"  value="主材提成">
	  </p>
	</div>      </td>
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
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.fxrq)=="") {
		alert("请输入[发薪日期]！");
		FormName.fxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.fxrq, "发薪日期"))) {
		return false;
	}
	if(	javaTrim(FormName.qqts)=="") {
		alert("请输入[全勤天数]！");
		FormName.qqts.focus();
		return false;
	}
	if(!(isFloat(FormName.qqts, "全勤天数"))) {
		return false;
	}
	if(	javaTrim(FormName.ksrq)=="") {
		alert("请输入[工资开始日期]！");
		FormName.ksrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.ksrq, "工资开始日期"))) {
		return false;
	}
	if(	javaTrim(FormName.zzrq)=="") {
		alert("请输入[工资终止日期]！");
		FormName.zzrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zzrq, "工资终止日期"))) {
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
	if(	!radioChecked(FormName.sfksb)) {
		alert("请选择[是否扣社保]！");
		FormName.sfksb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkywx)) {
		alert("请选择[是否扣意外险]！");
		FormName.sfkywx[0].focus();
		return false;
	}

	FormName.action="SaveEditRs_gzb.jsp";
	FormName.submit();
	return true;
}

function f_jsgz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}


	FormName.action="jsgz.jsp";
	FormName.submit();
	return true;
}

function f_ckgz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}


	FormName.action="ViewGz.jsp";
	FormName.submit();
	return true;
}

function f_jstc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}


	FormName.action="jstc.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
