<%@ page contentType="text/html;charset=GBK" %>
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
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">年</td>
              <td width="35%"> 
                <input type="text" name="nian" value="<%=cf.getDataStr(cf.addMonth(-1),"YYYY")%>" size="20" maxlength="4" >              </td>
              <td width="15%" align="right">月</td>
              <td width="35%"> 
                <input type="text" name="yue" value="<%=cf.getDataStr(cf.addMonth(-1),"MM")%>" size="20" maxlength="2" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">所属分公司</td>
              <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              </select></td>
              <td align="right">所属部门</td>
              <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}

%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">员工姓名</td>
              <td width="35%"><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx  where sfzszg in('Y','N') and dwbh='"+dwbh+"' ","");
	}
	else{
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx  where sfzszg in('Y','N') and ssfgs='"+ssfgs+"' ","");
	}
%>
              </select></td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">全勤天数</td>
              <td width="35%"> 
                <input type="text" name="qqts" value="" size="20" maxlength="8" >              </td>
              <td width="15%" align="right">出勤天数</td>
              <td width="35%"> 
                <input type="text" name="cqts" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button"  value="导出出勤统计表" onClick="f_dc(insertform)" >
                <input type="button"  value="导入出勤统计表" onClick="f_dr(insertform)" >
                <input type="button"  value="查看出勤统计表" onClick="f_ck(insertform)" >
                <input type="reset"  value="重输" name="reset">              </td>
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
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月]！");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[所属部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工姓名]！");
		FormName.ygbh.focus();
		return false;
	}

	if(	javaTrim(FormName.qqts)=="") {
		alert("请输入[全勤天数]！");
		FormName.qqts.focus();
		return false;
	}
	if(!(isNumber(FormName.qqts, "全勤天数"))) {
		return false;
	}
	if(	javaTrim(FormName.cqts)=="") {
		alert("请输入[出勤天数]！");
		FormName.cqts.focus();
		return false;
	}
	if(!(isNumber(FormName.cqts, "出勤天数"))) {
		return false;
	}

	FormName.action="SaveInsertRs_cqtjb.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月]！");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.action="expCqtjb.jsp";
	FormName.submit();
	return true;
}
function f_dr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月]！");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.action="loadData.jsp";
	FormName.submit();
	return true;
}
function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月]！");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.action="Rs_cqtjbCkList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
