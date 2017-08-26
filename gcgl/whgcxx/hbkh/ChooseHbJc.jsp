<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"050271")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}

%>
<%
	String ssfgs=request.getParameter("ssfgs");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:16">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>产品信息合并（<font color="#FF0000"><b><font color="#0000FF">把两个客户【产品信息】合并在一起，家装信息不变</font></b></font>）</p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="ViewHbCpKhxx.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="42%" height="36" align="right"> 
              分公司</td>
              <td width="58%" height="36"> <%
	out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	out.println("        </select>");
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td width="42%" align="right" height="49"><font color="#FF0000"><b>客户编号（合并产品信息）</b></font></td>
              <td width="58%" height="49"> 
                <input type="text" name="khbh" size="20" maxlength="7" >              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="42%" height="55" align="right"><font color="#0000FF">客户编号（产品信息被删除）</font></td>
              <td width="58%" height="55"> 
                <input type="text" name="khbh2" size="20" maxlength="7" >              </td>
            </tr>
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="继续" onClick="f_do(selectform)">              </td>
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
		alert("请输入[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[合并产品信息客户]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh2)=="") {
		alert("请输入[删除产品信息客户]！");
		FormName.khbh2.focus();
		return false;
	}

	if (FormName.khbh.value==FormName.khbh2.value)
	{
		alert("[合并产品信息客户]与[删除产品信息客户]不能相同！");
		FormName.khbh2.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
