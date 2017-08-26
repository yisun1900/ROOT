<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010211")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String[] ygbh=request.getParameterValues("ygbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="100%"> 
      <div align="center"><font color="#000099"><b>客户资料授权</b></font> 
      </div>
    </td>
  </tr>
  <tr> 
    <td colspan="2" align="center"> 
      <input type="button"  value="存盘" onClick="f_do(insertform)">
      <input type="reset"  value="重输" name="reset">
    </td>
  </tr>
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="SavePlFgsYgbhSq.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="41%" align="right"><font color="#CC0000">*</font>客户资料授权范围</td>
              <td width="59%">
<%
	cf.radioToken(out, "kfgssq","1+授权单个分公司<BR>&2+授权多个分公司","");
%>
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="41%" align="right"> <font color="#000099"><b></b></font> 
                <font color="#CC0000">*</font>请选择分公司（可多选）<BR>
              </td>
              <td width="59%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:252PX" size="30" multiple>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwlx in('A0','F0') order by cxbz,dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="2" align="center"> 
<%
	for (int i=0;i<ygbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ygbh"  value="<%=ygbh[i]%>" >
		<%
	}
%>
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	!radioChecked(FormName.kfgssq)) {
		alert("请选择[客户资料授权范围]！");
		FormName.kfgssq[0].focus();
		return false;
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("请输入[授权分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
