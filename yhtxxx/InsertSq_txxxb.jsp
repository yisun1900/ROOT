<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String[] ygbh=request.getParameterValues("ygbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertSq_txxxb.jsp" name="insertform"  >
<div align="center">¼������</div>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td width="32%"><select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="01">��ѯ�ط�</option>
    <option value="02">��ʩ���̻ط�</option>
    <option value="03">Ͷ�߱��޻ط�</option>
    <option value="04">Ͷ�߱���</option>
  </select></td>
  <td width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��ʼ��������</td>
  <td><input type="text" name="kstxsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>��ʼ����ʱ��</td>
  <td><input type="text" name="kstxsj1" size="6" maxlength="5"  value="" > 
    ��ʽ HH��MM(Сʱ������)</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���Ѵ���</td>
  <td><input type="text" name="txcs" value="1" size="10" maxlength="8"></td>
  <td align="right"><span class="STYLE1">*</span>�������Ѽ��</td>
  <td><input type="text" name="txjg" value="0" size="10" maxlength="8">
  Сʱ</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���ѷ�ʽ</td> 
  <td colspan="3"> 
    <input type="radio" name="txfs"  value="1">ϵͳ
    <input type="radio" name="txfs"  value="2">�绰
    <input type="radio" name="txfs"  value="3">����
    <input type="radio" name="txfs"  value="4">����
    <input type="radio" name="txfs"  value="9">ȫ��  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���ѹؼ���</td> 
  <td colspan="3"> 
    <input type="text" name="txgjz" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td colspan="3"><textarea name="txnr" cols="72" rows="7"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
<%
	for (int i=0;i<ygbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ygbh" value="<%=ygbh[i]%>" >
		<%
	}
%>
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>



<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.txfs)) {
		alert("��ѡ��[���ѷ�ʽ]��");
		FormName.txfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.txlx)=="") {
		alert("��ѡ��[��������]��");
		FormName.txlx.focus();
		return false;
	}
	if(	javaTrim(FormName.txgjz)=="") {
		alert("������[���ѹؼ���]��");
		FormName.txgjz.focus();
		return false;
	}
	if(	javaTrim(FormName.txnr)=="") {
		alert("������[��������]��");
		FormName.txnr.focus();
		return false;
	}
	if(	javaTrim(FormName.kstxsj)=="") {
		alert("������[��ʼ��������]��");
		FormName.kstxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kstxsj, "��ʼ��������"))) {
		return false;
	}
	if(	javaTrim(FormName.kstxsj1)=="") {
		alert("������[��ʼ����ʱ��]��");
		FormName.kstxsj1.focus();
		return false;
	}

	if(	javaTrim(FormName.txcs)=="") {
		alert("��ѡ��[���Ѵ���]��");
		FormName.txcs.focus();
		return false;
	}
	if(!(isNumber(FormName.txcs, "���Ѵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.txjg)=="") {
		alert("��ѡ��[�������Ѽ��]��");
		FormName.txjg.focus();
		return false;
	}
	if(!(isNumber(FormName.txjg, "�������Ѽ��"))) {
		return false;
	}
	
	
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
