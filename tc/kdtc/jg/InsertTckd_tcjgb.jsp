<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTckd_tcjgb.jsp" name="insertform" target="_blank">
<div align="center">¼�룭�ײͼ۸��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>����</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font>���ۼ���</td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
	%>
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>����</td>
  <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>���ڻ�׼���</td>
  <td><input type="text" name="fwmj" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ײ�����</td> 
  <td colspan="3"> 
    <input type="text" name="tcmc" value="" size="73" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�ײͼ۸�</td> 
  <td width="32%"> 
    <input type="text" name="tcjg" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>ƽ�����ӵ���</td> 
  <td width="32%"> 
    <input type="text" name="pmzjdj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>Ϳ�ϸ�Ϊ��ֽ�Ӽ�</td>
  <td><input type="text" name="tlgbzjj" value="" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>�ذ廻���ש�շ�</td>
  <td><input name="dbhddzjj" type="text" value="" size="20" maxlength="17" ></td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      
	<input type="button" onClick="f_dr(insertform)"  value="���뱨��">
	<input type="button" onClick="f_dc(insertform)"  value="��������">
	<P>
	<A HREF="�ײͼ۸��.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A>	</td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[���ڻ�׼���]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���ڻ�׼���"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("������[�ײͼ۸�]��");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "�ײͼ۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjdj)=="") {
		alert("������[ƽ�����ӵ���]��");
		FormName.pmzjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjdj, "ƽ�����ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.tlgbzjj)=="") {
		alert("������[Ϳ�ϸ�Ϊ��ֽ�Ӽ�]��");
		FormName.tlgbzjj.focus();
		return false;
	}
	if(!(isFloat(FormName.tlgbzjj, "Ϳ�ϸ�Ϊ��ֽ�Ӽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.dbhddzjj)=="") {
		alert("������[�ذ廻���ש�շ�]��");
		FormName.dbhddzjj.focus();
		return false;
	}
	if(!(isFloat(FormName.dbhddzjj, "�ذ廻���ש�շ�"))) {
		return false;
	}

	FormName.action="SaveInsertTckd_tcjgb.jsp";
	FormName.submit();
	return true;
}

function f_dr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="LoadDataTc.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpTckd_tcjgb.jsp";
	FormName.submit();
	return true;
}
</SCRIPT>
