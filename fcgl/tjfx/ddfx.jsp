<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
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
<form method="post" action="" name="selectform">
  <div align="center">订单查询统计</div>
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
      <td align="right" width="16%">材料大类</td>
      <td width="34%"> 
        <select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
			cf.selectItem(out,"select cldlbm,cldlmc from cl_cldlbm order by cldlbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
	  <td align="right" width="16%">材料名称</td>
      <td width="34%"> 
        <input type="text" name="clmc" size="20" maxlength="100" >
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
	<tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">录入时间 从</td>
      <td width="34%"> 
        <input type="text" name="lrsj" size="20" value="<%=cf.firstDay()%>" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="16%">到</td>
      <td width="34%"> 
        <input type="text" name="lrsj2" size="20" value="<%=cf.lastDay()%>" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>

    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="订单总计" onClick="f_do(selectform,'zj')" name="button3">
        <input type="button"  value="分公司订单统计" onClick="f_do(selectform,'yl')" name="button2">
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
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请选择[打印时间]！");
		FormName.lrsj.select();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "打印时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj2)=="") {
		alert("请选择[打印时间]！");
		FormName.lrsj2.select();
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "打印时间"))) {
		return false;
	}
	
	if (lx=='yl')
	{
		FormName.action="ddfxYlList.jsp";
	}
	else 
	{
		FormName.action="ddfxYlTjList.jsp";
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>

