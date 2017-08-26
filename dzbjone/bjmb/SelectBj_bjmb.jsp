<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_bjmbList.jsp" name="selectform">
  <div align="center">家装模板--维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">所属分公司</td>
      <td width="34%"> 
        <select name="sq_yhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
%> 
        </select>
      </td>
      <td align="right" width="16%">所属部门</td>
      <td width="34%"> 
        <select name="sq_yhxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">用户登陆名</td>
      <td width="34%"> 
        <input type="text" name="bj_bjmb_yhdlm" size="20" maxlength="16" >
      </td>
      <td align="right" width="16%">员工名称</td>
      <td width="34%"> 
        <input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">员工状态</td>
      <td width="34%"> <%
	cf.radioToken(out, "sq_yhxx_sfzszg","M+实习生&Y+转正&N+试用期&D+待岗&S+辞职&T+辞退","");
%> </td>
      <td align="right" width="16%">模板名称</td>
      <td width="34%"> 
        <input type="text" name="bj_bjmb_mbmc" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">模板类型</td>
      <td width="34%"> <%
	cf.radioToken(out, "bj_bjmb_mblx","1+公用模板&2+私人模板","");
%> </td>
      <td align="right" width="16%">&nbsp; </td>
      <td width="34%">&nbsp; </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
