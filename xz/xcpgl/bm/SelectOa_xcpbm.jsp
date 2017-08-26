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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Oa_xcpbmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">印刷品编码</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_xcpbm" size="20" maxlength="6" >
      </td>
      <td align="right" width="15%">印刷品名称</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_xcpmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">计量单位</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_jldw" size="20" maxlength="20" >
      </td>
      <td align="right" rowspan="3">印刷品分类</td>
      <td rowspan="3"> 
        <select name="oa_xcpbm_xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">单价</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_dj" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">是否需审批</td>
      <td width="35%"><%
	cf.radioToken(out, "oa_xcpbm_sfxsp","N+不需要&Y+需要","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">序号</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_xh" size="20" maxlength="8" >
      </td>
      <td align="right" width="15%">可领取分公司</td>
      <td width="35%"> 
        <select name="oa_xcpbm_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入部门</td>
      <td width="35%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") )
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
      <td align="right" width="15%">录入人</td>
      <td width="35%">
        <input type="text" name="lrr" size="20" maxlength="20" >
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
	if(!(isFloat(FormName.oa_xcpbm_dj, "单价"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_xcpbm_xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
