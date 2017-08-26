<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%	
	String yhmc=(String)session.getAttribute("yhmc");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
	String dwflbm=cf.executeQuery("select dwflbm from sq_dwxx where dwbh='"+dwbh+"'");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_txsqdCxList.jsp" name="selectform">
  <div align="center">查询调休申请</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="17%">所属分公司</td>
      <td width="33%"> 
<%

	if (yhjs.equals("A0"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' and dwlx in('A0','A1','F0','F1','F2') order by ssfgs,dwbh");

        out.println("        <select name=\"rs_txsqd_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(rs_txsqd_fgsbh,rs_txsqd_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else if (yhjs.equals("A1") && dwflbm.equals("04"))//04：人事部
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' and dwlx in('A0','A1','F0','F1','F2') order by ssfgs,dwbh");

        out.println("        <select name=\"rs_txsqd_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(rs_txsqd_fgsbh,rs_txsqd_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"rs_txsqd_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}

%>
      </td>
      <td align="right" width="18%">所属部门</td>
      <td width="32%"> 
        <select name="rs_txsqd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
	else if (yhjs.equals("A1") && dwflbm.equals("04"))//04：人事部
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
	else if ( (yhjs.equals("F0") || yhjs.equals("F1")) && dwflbm.equals("04"))//04：人事部
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and  ssfgs='"+ssfgs+"' and  cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">员工序号</td>
      <td width="33%"> 
        <input type="text" name="rs_txsqd_ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">员工名称</td>
      <td width="32%"> 
        <input type="text" name="rs_txsqd_yhmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">性别</td>
      <td width="33%"> <%
	cf.radioToken(out, "rs_txsqd_xb","M+男&W+女","");
%> </td>
      <td align="right" width="18%">职务</td>
      <td width="32%"> 
        <select name="rs_txsqd_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="31">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">申请序号</td>
      <td width="33%"> 
        <input type="text" name="rs_txsqd_sqxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入人</td>
      <td width="33%"> 
<%
	if (yhjs.equals("A0"))
	{
		%>
		<input type="text" name="rs_txsqd_lrr" size="20" maxlength="20" >
		<%
	}
	else if (yhjs.equals("A1") && dwflbm.equals("04"))//04：人事部
	{
		%>
		<input type="text" name="rs_txsqd_lrr" size="20" maxlength="20" >
		<%
	}
	else if ( (yhjs.equals("F0") || yhjs.equals("F1")) && dwflbm.equals("04"))//04：人事部
	{
		%>
		<input type="text" name="rs_txsqd_lrr" size="20" maxlength="20" >
		<%
	}
	else{
		%>
		<input type="text" name="rs_txsqd_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
		<%
	}
%>
      </td>
      <td align="right" width="18%">录入部门</td>
      <td width="32%"> 
        <select name="rs_txsqd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
	else{
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' and a.ssfgs='"+ssfgs+"' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入时间 从</td>
      <td width="33%"> 
        <input type="text" name="rs_txsqd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_txsqd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">申请日期 从</td>
      <td width="33%"> 
        <input type="text" name="sqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="sqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="32">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">处理状态</td>
      <td width="33%"> 
        <select name="rs_txsqd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+等待审批&02+正在审批&03+审批通过&04+审批取消","");
%> 
        </select>
      </td>
      <td align="right" width="18%">审批状态</td>
      <td width="32%"> 
        <select name="rs_txsqd_ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='07' order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审批序号</td>
      <td width="33%"> 
        <input type="text" name="rs_txsqd_spxh" size="20" maxlength="16" >
      </td>
      <td align="right" width="18%">审核结论</td>
      <td width="32%"> 
        <select name="rs_txsqd_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审核时间 从</td>
      <td width="33%"> 
        <input type="text" name="rs_txsqd_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_txsqd_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审核人</td>
      <td width="33%"> 
        <input type="text" name="rs_txsqd_shr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
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
	if(!(isNumber(FormName.rs_txsqd_ygbh, "员工序号"))) {
		return false;
	}

	if(!(isDatetime(FormName.rs_txsqd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_txsqd_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq2, "申请日期"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_txsqd_spxh, "审批序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_txsqd_shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_txsqd_shsj2, "审核时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
