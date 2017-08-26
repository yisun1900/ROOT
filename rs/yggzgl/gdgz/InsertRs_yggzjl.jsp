<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String xh=null;

try {
	conn=cf.getConnection();

	//自动产生序号
	ls_sql="select NVL(max(TO_NUMBER(substr(xh,6,5)))+1,1)";
	ls_sql+=" from  rs_yggzjl";
	ls_sql+=" where lrbm='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getString(1);
	}
	rs.close();
	ps.close();
	xh=cf.addZero(xh,5);
	xh=dwbh+xh;

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if(rs!=null) rs.close();
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 计算工资（序号：<%=xh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">发薪日期</td>
              <td width="35%"> 
                <input type="text" name="fxrq" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">发薪公司</td>
              <td width="35%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">工资开始日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ksrq" value="<%=cf.firstDay(-1)%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">工资终止日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzrq" value="<%=cf.lastDay(-1)%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">录入人</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000FF">录入时间</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000FF">录入部门</font></td>
              <td width="35%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="15%" align="right">正常考勤天数</td>
              <td width="35%"><input type="text" name="qqts" value="" size="20" maxlength="10" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="94"> 
                <p> 
                  <input type="hidden" name="xh" value="<%=xh%>" >
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="button"  value="导出工资" onClick="f_dcgz(insertform)" name="dcgz" disabled>
                  <input type="button"  value="导入工资" onClick="f_drgz(insertform)" name="drgz" disabled>
                  <input type="reset"  value="重输" name="reset">
                </p>
                <p> 
                  <input type="button"  value="自动计算工资" onClick="f_jsgz(insertform)" name="jsgz" disabled>
                  <input type="button"  value="查看工资" onClick="f_ckgz(insertform)" name="ckgz" >
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
		alert("请输入[发薪公司]！");
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
	if(	javaTrim(FormName.qqts)=="") {
		alert("请选择[正常考勤天数]！");
		FormName.qqts.focus();
		return false;
	}
	if(!(isFloat(FormName.qqts, "正常考勤天数"))) {
		return false;
	}

	FormName.action="SaveInsertRs_yggzjl.jsp";
	FormName.submit();
	FormName.dcgz.disabled=false;
	FormName.drgz.disabled=false;
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
