<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�±���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <div align="center">��С��ͳ�� </div>
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td align="right" width="19%" height="2">�ֹ�˾</td>
      <td width="31%" height="2"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
      <td width="17%" height="2" align="right">ǩԼ����</td>
      <td width="33%" height="2"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
    <tr> 
      <td align="right" width="19%" height="2">ǩԼʱ�� ��</td>
      <td width="31%" height="2"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value="<%=cf.firstDay()%>">
      </td>
      <td width="17%" height="2" align="right">��</td>
      <td width="33%" height="2"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="19%" height="2">ǩԼ�Χ ��</td>
      <td width="31%" height="2"> 
        <input type="text" name="qye" size="17" maxlength="10" value="">
        Ԫ </td>
      <td width="17%" height="2" align="right">��</td>
      <td width="33%" height="2"> 
        <input type="text" name="qye2" size="17" maxlength="10" value="">
        Ԫ</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF">�ͻ������ȵ����<BR>
        <b>���ɶ�ѡ��</b></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="9" multiple >
          <option value=""></option>
		  <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm","");
%> 
        </select>
      </td>
      <td width="17%" align="right" bgcolor="#E8E8FF">�ͻ���������λ��<BR>
        <b>���ɶ�ѡ��</b></td>
      <td width="33%" bgcolor="#E8E8FF"> 
        <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="9" multiple >
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF">�ͻ���������<BR>
        <b>���ɶ�ѡ��</b></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
          <option value=""></option>
          <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
        </select>
      </td>
      <td width="17%" align="right" bgcolor="#E8E8FF">�ͻ�������<BR>
        <b>���ɶ�ѡ��</b></td>
      <td width="33%" bgcolor="#E8E8FF"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple >
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="19%" align="right">�ͻ���������<BR>
        <b>���ɶ�ѡ��</b></td>
      <td width="31%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple >
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
        </select>
      </td>
      <td width="17%" align="right">�ͻ�ְҵ<BR>
        <b>���ɶ�ѡ��</b></td>
      <td width="33%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple >
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="19%" height="29">��ʾ���</td>
      <td height="29" colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="41" colspan="4"> 
        <input type="button"  value="������С��ͳ��" onClick="f_do1(selectform)">
        <input type="button"  value="���ߴ�С��ͳ��" onClick="f_do2(selectform)">
        <input type="button"  value="�ȵ������С��ͳ��" onClick="f_do3(selectform)">
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
function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ"))) {
		return false;
	}


	if (FormName.qye.value!="" || FormName.qye2.value!="")
	{
		if(	javaTrim(FormName.qye)=="") {
			alert("������[ǩԼ�Χ]��");
			FormName.qye.focus();
			return false;
		}
		if(!(isFloat(FormName.qye, "ǩԼ�Χ"))) {
			return false;
		}
		if(	javaTrim(FormName.qye2)=="") {
			alert("������[ǩԼ�Χ]��");
			FormName.qye2.focus();
			return false;
		}
		if(!(isFloat(FormName.qye2, "ǩԼ�Χ"))) {
			return false;
		}

		FormName.action="dzxtjbje.jsp";
	}
	else{

		FormName.action="dzxtjb1.jsp";
	}

	FormName.submit();
	return true;
}

function f_do2(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ"))) {
		return false;
	}


	if (FormName.qye.value!="" || FormName.qye2.value!="")
	{
		if(	javaTrim(FormName.qye)=="") {
			alert("������[ǩԼ�Χ]��");
			FormName.qye.focus();
			return false;
		}
		if(!(isFloat(FormName.qye, "ǩԼ�Χ"))) {
			return false;
		}
		if(	javaTrim(FormName.qye2)=="") {
			alert("������[ǩԼ�Χ]��");
			FormName.qye2.focus();
			return false;
		}
		if(!(isFloat(FormName.qye2, "ǩԼ�Χ"))) {
			return false;
		}

		FormName.action="dzxtjbje.jsp";
	}
	else{

		FormName.action="dzxtjb2.jsp";
	}

	FormName.submit();
	return true;
}


function f_do3(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ"))) {
		return false;
	}


	if (FormName.qye.value!="" || FormName.qye2.value!="")
	{
		if(	javaTrim(FormName.qye)=="") {
			alert("������[ǩԼ�Χ]��");
			FormName.qye.focus();
			return false;
		}
		if(!(isFloat(FormName.qye, "ǩԼ�Χ"))) {
			return false;
		}
		if(	javaTrim(FormName.qye2)=="") {
			alert("������[ǩԼ�Χ]��");
			FormName.qye2.focus();
			return false;
		}
		if(!(isFloat(FormName.qye2, "ǩԼ�Χ"))) {
			return false;
		}

		FormName.action="dzxtjbje.jsp";
	}
	else{

		FormName.action="dzxtjb3.jsp";
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
