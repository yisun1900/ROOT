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
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
		<td align="right" width="15%"><font color="red">ͳ��ʱ��</font> �ӣ�</td> 
		<td width="35%"> <input type="text" name="tjsj" size="20" maxlength="10" >
		</td>
		<td width="15%"> <div align="right">��</div></td>
		<td width="35%"> <input type="text" name="tjsj2" size="20" maxlength="10" >
		</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ϴ���</td> 
  <td width="35%"> 
    <select name="cldlbm" style="FONT-SIZE:12px;WIDTH:152px">
		<option value=""></option>
		<%
		cf.selectItem(out,"select cldlbm,cldlmc from cl_cldlbm order by cldlmc","");
		%>
	</select>
  </td>
  <td align="right" width="15%">�ֹ�˾</td> 
  <td width="35%"> 
   <%
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
		%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
	<select name="clbm" style="FONT-SIZE:12px;WIDTH:152px">
		<option value=""></option>
		<%
		cf.selectItem(out,"select clbm,clmc from cl_clbm order by clmc","");
		%>
	</select>
  </td>
  <td align="right" width="15%">���Ϲ��</td> 
  <td width="35%"> 
    <input type="text" name="clgg" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������㷽ʽ</td> 
  <td width="35%"> 
	<select name="lrjsfs" style="FONT-SIZE:12PX;WIDTH:152PX"> 
	<option value=""></option>
	<option value="1">��۷�ʽ</option>
	<option value="2">�ٷֱȷ�ʽ</option>
	</select>
  </td>
  <td width="15%"> <div align="right">������λ</div></td>
              <td width="35%"> 
			  <select name="jldwbm" style="FONT-SIZE:12px;WIDTH:152px">
                <option value=""></option>
				<%
				cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
				%>
                </select>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ٷֱ� ��</td> 
  <td width="35%"> 
    <input type="text" name="lrbfb" size="20" maxlength="9" >%
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> 
    <input type="text" name="lrbfb2" size="20" maxlength="9" >%
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ϵ��� ��</td> 
  <td width="35%"> 
    <input type="text" name="cldj" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> 
    <input type="text" name="cldj2" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ǩԼ�ٷֱ� ��</td> 
  <td width="35%"> 
    <input type="text" name="qybfb" size="20" maxlength="9" >%
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> 
    <input type="text" name="qybfb2" size="20" maxlength="9" >%
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
/*
	if(	javaTrim(FormName.tjsj)=="") {
		alert("������[ͳ��ʱ��]��");
		FormName.tjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tjsj, "ͳ��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tjsj2)=="") {
		alert("������[ͳ��ʱ��]��");
		FormName.tjsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.tjsj2, "ͳ��ʱ��"))) {
		return false;
	}
*/
	if(!(isFloat(FormName.lrbfb, "����ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lrbfb2, "����ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.cldj, "���ϵ���"))) {
		return false;
	}
	if(!(isFloat(FormName.cldj2, "���ϵ���"))) {
		return false;
	}
	if(!(isFloat(FormName.qybfb, "ǩԼ�ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.qybfb2, "ǩԼ�ٷֱ�"))) {
		return false;
	}

	FormName.action="tjfxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
