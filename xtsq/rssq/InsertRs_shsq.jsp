<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<div align="center">
 

<form method="post" action="" name="selectform">

    <table width="44%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" >
          <div align="center">用户组 </div>
        </td>
      </tr>
      <tr bgcolor="#FFFFCC">
        <td width="59%" height="25" > 
          <div align="center">
            <select name="yhzbh" style="FONT-SIZE:12PX;WIDTH:230PX" onChange="f_do(selectform)">
              <option value=""></option>
              <%
	cf.selectItem(out,"select yhzbh,yhzmc  from sq_yhz order by yhzmc","");
	%> 
            </select>
          </div>
        </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" >&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <div align="center">选择--审核类型</div>
        </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="01" onclick="f_do(selectform)">
          招聘 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="02" onclick="f_do(selectform)">
          培训 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="03" onclick="f_do(selectform)">
          变动 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="04" onclick="f_do(selectform)">
          费用审批 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="06" onclick="f_do(selectform)">
          二次入职 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="07" onclick="f_do(selectform)">
          调休申请 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="08" onclick="f_do(selectform)">
          加班申请 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="09" onclick="f_do(selectform)">
          考勤卡修正单 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="10" onclick="f_do(selectform)">
          请假单 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="11" onclick="f_do(selectform)">
          出差申请 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="12" onclick="f_do(selectform)">
          增设岗位申请 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="13" onclick="f_do(selectform)">
          辞职申请 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="14" onclick="f_do(selectform)">
          退回人员申请 </td>
      </tr>
    </table>
</form>
</div>

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yhzbh)=="") {
		alert("请选择[用户组]！");
		FormName.yhzbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.ztlx)) {
//		alert("请选择[审核类型]！");
		FormName.ztlx[0].focus();
		return false;
	}

	FormName.action="InsertRs_shsq1.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

