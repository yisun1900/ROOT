<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_clbmCxList.jsp" name="selectform">
  <div align="center">出库查询统计</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">分公司</td>
      <td width="34%"><%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
			out.println("        </select>");
		}
		else{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
			out.println("        </select>");
		}
		%></td>
      <td align="right" width="16%">类型</td>
      <td width="34%">
        <input type="radio" name="leixing" value="1" checked>
        正常
		<input type="radio" name="leixing" value="2">
        赠送 
        <input type="radio" name="leixing" value="9">
        全部 </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="16%">出库时间 从</td>
      <td width="34%">
        <input type="text" name="cksj" size="20" maxlength="10" value="<%=cf.firstDay()%>">
      </td>
      <td align="right" width="16%">到</td>
      <td width="34%">
        <input type="text" name="cksj2" size="20" maxlength="10" value="<%=cf.lastDay()%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">材料大类</td>
      <td width="34%"> 
        <select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
			cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
%> 
        </select>
      </td>
      <td align="right" width="16%">材料规格</td>
      <td width="34%"> 
        <input type="text" name="clgg" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">材料编码</td>
      <td width="34%"> 
        <input type="text" name="clbm" size="20" maxlength="4" >
      </td>
      <td align="right" width="16%">材料名称</td>
      <td width="34%"> 
        <input type="text" name="clmc" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">利润计算方式</td>
      <td width="34%"> 
        <input type="radio" name="lrjsfs" value="1">
        差价方式 
        <input type="radio" name="lrjsfs" value="2">
        百分比方式 </td>
      <td width="16%"> 
        <div align="right">计量单位</div>
      </td>
      <td width="34%"> 
        <select name="jldwmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%> 
        </select>
      </td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
/*
	if(	javaTrim(FormName.fgs)=="") {
		alert("请选择[分公司]！");
		FormName.fgs.focus();
		return false;
	}
*/

	if(!(isDatetime(FormName.cksj, "出库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cksj2, "出库时间"))) {
		return false;
	}


	FormName.action="ckfxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
