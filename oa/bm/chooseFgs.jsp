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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 复制－办公用品编码</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveChooseFgs.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="40%" align="right" height="49">被复制公司</td>
              <td width="60%" height="49"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
        out.println("        </select>");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="40%" align="right" height="45">需要复制编码公司</td>
              <td width="60%" height="45"> 
                <select name="fgsbh1" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
        out.println("        </select>");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="复制" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[被复制公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh1)=="") {
		alert("请输入[需要复制编码公司]！");
		FormName.fgsbh1.focus();
		return false;
	}

	if (FormName.fgsbh.value==FormName.fgsbh1.value)
	{
		alert("[被复制公司]与[需要复制编码公司]不能相同！");
		FormName.fgsbh1.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
