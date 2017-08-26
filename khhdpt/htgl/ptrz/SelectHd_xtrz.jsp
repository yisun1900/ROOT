<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Hd_xtrzList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFCC"> 
   <td align="right" width="18%">分公司</td>
      <td width="32%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
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
      <td align="right" width="18%">签约店面</td>
      <td width="32%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">IP地址</td>
      <td width="35%"> <input type="text" name="ip" size="20" maxlength="30" > 
      </td>
      <td align="right" width="15%">用户登陆名</td>
      <td width="35%"> <input type="text" name="yhdlm" size="20" maxlength="16" > 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">用户口令</td>
      <td width="35%"> <input type="text" name="yhkl" size="20" maxlength="20" > 
      </td>
      <td align="right" width="15%">客户编号</td>
      <td width="35%"> <input type="text" name="khbh" size="20" maxlength="20" > 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">客户姓名</td>
      <td width="35%"> <input type="text" name="khxm" size="20" maxlength="50" > 
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">登陆时间</td>
      <td><input type="text" name="dlsj" size="20" maxlength="10" ></td>
      <td align="right">到</td>
      <td><input type="text" name="dlsj2" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">退出时间</td>
      <td width="35%"> <input type="text" name="tcsj" size="20" maxlength="10" > 
      </td>
      <td align="right" width="15%">到 </td>
      <td width="35%"><input type="text" name="tcsj2" size="20" maxlength="10" > 
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> <input type="button"  value="查询" onClick="f_do(selectform)"> 
        <input type="reset"  value="重输"> </td>
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
	if(!(isDatetime(FormName.dlsj, "登陆时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tcsj, "退出时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
