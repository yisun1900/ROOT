<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fxrq=null;
String ssfgs=null;
String ksrq=null;
String zzrq=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fxrq,ssfgs,ksrq,zzrq,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  rs_yggzjl";
	ls_sql+=" where  (xh='"+xh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fxrq=cf.fillNull(rs.getDate("fxrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ksrq=cf.fillNull(rs.getDate("ksrq"));
		zzrq=cf.fillNull(rs.getDate("zzrq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
      <div align="center"> 修改工资（序号：<%=xh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="325" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">发薪日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="fxrq" size="20" maxlength="10"  value="<%=fxrq%>" >
              </td>
              <td width="17%"> 
                <div align="right">发薪公司</div>
              </td>
              <td width="33%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">工资开始日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ksrq" size="20" maxlength="10"  value="<%=ksrq%>" >
              </td>
              <td width="17%"> 
                <div align="right">工资终止日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="zzrq" size="20" maxlength="10"  value="<%=zzrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">录入人</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#0000FF">录入时间</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">录入部门</font></div>
              </td>
              <td width="33%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="81"> 
                <p> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="button"  value="导出工资" onClick="f_dcgz(editform)" name="dcgz" >
                  <input type="button"  value="导入工资" onClick="f_drgz(editform)" name="drgz" >
                  <input type="reset"  value="重输">
                </p>
                  
                <p> 
                  <input type="button"  value="自动计算工资" onClick="f_jsgz(editform)" name="jsgz" >
                  <input type="button"  value="查看工资" onClick="f_ckgz(editform)" name="ckgz" >
                  <input type="hidden" name="xh"  value="<%=xh%>" >
                </p>
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
	if(	javaTrim(FormName.fxrq)=="") {
		alert("请输入[发薪日期]！");
		FormName.fxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.fxrq, "发薪日期"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[发薪公司]！");
		FormName.ssfgs.focus();
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

	FormName.action="SaveEditRs_yggzjl.jsp";
	FormName.submit();
	return true;
}
function f_dcgz(FormName)//参数FormName:Form的名称
{

	FormName.action="expGz.jsp";
	FormName.submit();
	FormName.jsgz.disabled=false;
	return true;
}
function f_drgz(FormName)//参数FormName:Form的名称
{

	FormName.action="loadData.jsp";
	FormName.submit();
	FormName.jsgz.disabled=false;
	return true;
}
function f_xggz(FormName)//参数FormName:Form的名称
{

	FormName.action="editGz.jsp";
	FormName.submit();
	FormName.jsgz.disabled=false;
	return true;
}
function f_jsgz(FormName)//参数FormName:Form的名称
{

	FormName.action="jsGz.jsp";
	FormName.submit();
	FormName.ckgz.disabled=false;
	return true;
}
function f_ckgz(FormName)//参数FormName:Form的名称
{

	FormName.action="ckGz.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
