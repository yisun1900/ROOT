<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>


<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_zpsq.jsp" name="insertform" target="_blank" id="insertform">
<div align="center">��¼������</div>
<table width="100%" border="1" style="FONT-SIZE:12"  bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�걨�ֹ�˾</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,sqbm,<%=dwstr%>)">
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
  <td align="right" width="15%">���벿��</td> 
  <td width="35%"> 
    <select name="sqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
<tr bgcolor="#FFFFFF">

  <td align="right" width="15%">����ְ��</td> 
  <td width="35%"> 
    <select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">����Ա��</td> 
  <td width="35%"> 
    <input type="text" name="zprs" value="" size="20" maxlength="8" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)">
    <option value=""></option>
    <option value="1">ȱԱ����</option>
    <option value="2">�������</option>
    <option value="3">��������</option>
    <option value="0">����</option>
    </select>
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" value="" size="20" maxlength="20" disabled>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" value="" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">ϣ������ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ա�Ҫ��</td> 
  <td width="35%"> 
    <select name="xbyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">����</option>
    <option value="1">��</option>
    <option value="2">Ů</option>
    </select>
  </td>
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <select name="hyyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">����</option>
    <option value="1">�ѻ�</option>
    <option value="2">δ��</option>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="nlyq" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">ѧ��Ҫ��</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">����</option>
    <option value="1">��ר</option>
    <option value="2">��ѧ</option>
    <option value="3">˶ʿ</option>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">

  <td align="right" width="15%">רҵҪ��</td> 
  <td width="35%"> 
    <input type="text" name="zy" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">��������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="wy" value="" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="jsjnl" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">��������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" value="" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="gx" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="jn" value="" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="qt" value="" size="20" maxlength="200" >
  </td>
  <td align="right" width="15%">����״̬����</td> 
  <td width="35%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='01' and  ztbm not in ('0188','0199') order by ztbm","");
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������Ա��������</td> 
  <td width="35%" colspan="3"> 
    <textarea name="rygznr" cols="72" rows=""></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼���˷ֹ�˾</td> 
  <td width="35%"> 
	<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	%>
	  </select>  </td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="72" rows=""></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function setText(obj)
{
	var valsel = obj.value;
	var textid = document.getElementById("zbqt");
	if(valsel != "0")
	 textid.disabled = true;
	else
	 textid.disabled = false;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("��ѡ��[�걨�ֹ�˾]��");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sqbm)=="") {
		alert("������[���벿��]��");
		FormName.sqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zbzw)=="") {
		alert("��ѡ��[����ְ��]��");
		FormName.zbzw.focus();
		return false;
	}
	if(	javaTrim(FormName.zprs)=="") {
		alert("������[����Ա��]��");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "����Ա��"))) {
		return false;
	}
	if(	javaTrim(FormName.zpfy)=="") {
		alert("������[��Ƹ����]��");
		FormName.zpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zpfy, "��Ƹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.zbly)=="") {
		alert("��ѡ��[��������]��");
		FormName.zbly.focus();
		return false;
	}
	if(	javaTrim(FormName.xwdgsj)=="") {
		alert("������[ϣ������ʱ��]��");
		FormName.xwdgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "ϣ������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xbyq)=="") {
		alert("��ѡ��[�Ա�Ҫ��]��");
		FormName.xbyq.focus();
		return false;
	}
	if(	javaTrim(FormName.hyyq)=="") {
		alert("��ѡ��[����Ҫ��]��");
		FormName.hyyq.focus();
		return false;
	}
	if(	javaTrim(FormName.nlyq)=="") {
		alert("������[����Ҫ��]��");
		FormName.nlyq.focus();
		return false;
	}
	if(	javaTrim(FormName.xl)=="") {
		alert("��ѡ��[ѧ��Ҫ��]��");
		FormName.xl.focus();
		return false;
	}
	if(	javaTrim(FormName.zy)=="") {
		alert("������[רҵҪ��]��");
		FormName.zy.focus();
		return false;
	}
	if(	javaTrim(FormName.wy)=="") {
		alert("������[��������Ҫ��]��");
		FormName.wy.focus();
		return false;
	}
	if(	javaTrim(FormName.jsjnl)=="") {
		alert("������[���������Ҫ��]��");
		FormName.jsjnl.focus();
		return false;
	}
	if(	javaTrim(FormName.gzjy)=="") {
		alert("������[��������Ҫ��]��");
		FormName.gzjy.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("������[����Ҫ��]��");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.jn)=="") {
		alert("������[����Ҫ��]��");
		FormName.jn.focus();
		return false;
	}
	if(	javaTrim(FormName.qt)=="") {
		alert("������[����Ҫ��]��");
		FormName.qt.focus();
		return false;
	}
	if(	javaTrim(FormName.rygznr)=="") {
		alert("������[������Ա��������]��");
		FormName.rygznr.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("��ѡ��[����״̬����]��");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	FormName.savebutton.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
