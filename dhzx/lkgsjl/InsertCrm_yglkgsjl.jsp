<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrbm=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_yglkgsjl.jsp" name="insertform" target="_blank">
<div align="center">¼���뿪��˾����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">Ա�����</span></td> 
  <td width="32%"><input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ա����</td> 
  <td width="32%"><select name="rylx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rylx c1,rylx c2 from dm_rylx order by rylx","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">Ա������</span></td> 
  <td width="32%"> 
    <input type="text" name="yhmc" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">Ա������</span></td> 
  <td width="32%"> 
    <select name="ygbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ƻ��뿪����</td> 
  <td width="32%"><input type="text" name="jhlkrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�뿪��˾Ŀ��</td> 
  <td width="32%"><select name="lkgsmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select lkgsmd c1,lkgsmd c2 from dm_lkgsmd order by lkgsmd","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ƻ��뿪ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="jhlksj" value="" size="8" maxlength="9" >
    <strong>��¼��Сʱ�� </strong></td>
  <td align="right" width="18%">�ƻ�����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="jhfhsj" value="" size="8" maxlength="9" >
    <strong>��¼��Сʱ�� </strong> </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�뿪��˾˵��</td>
  <td colspan="3"><textarea name="lkgssm" cols="72" rows="3"></textarea></td>
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
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button" name="bc" value="����" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbm)=="") {
		alert("��ѡ��[Ա������]��");
		FormName.ygbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rylx)=="") {
		alert("��ѡ��[��Ա����]��");
		FormName.rylx.focus();
		return false;
	}
	if(	javaTrim(FormName.jhlkrq)=="") {
		alert("������[�ƻ��뿪����]��");
		FormName.jhlkrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlkrq, "�ƻ��뿪����"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlksj)=="") {
		alert("������[�ƻ��뿪ʱ��]��");
		FormName.jhlksj.focus();
		return false;
	}
	if(!(isFloat(FormName.jhlksj, "�ƻ��뿪ʱ��"))) {
		return false;
	}
	if (FormName.jhlksj.value<0 || FormName.jhlksj.value>24)
	{
		alert("[�ƻ��뿪ʱ��]ֻ����0��24Сʱ֮�䣡");
		FormName.jhlksj.select();
		return false;
	}
	if(!(isFloat(FormName.jhfhsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if (FormName.jhfhsj.value<0 || FormName.jhfhsj.value>24)
	{
		alert("[�ƻ�����ʱ��]ֻ����0��24Сʱ֮�䣡");
		FormName.jhfhsj.select();
		return false;
	}
	if(	javaTrim(FormName.lkgsmd)=="") {
		alert("��ѡ��[�뿪��˾Ŀ��]��");
		FormName.lkgsmd.focus();
		return false;
	}
	if(	javaTrim(FormName.lkgssm)=="") {
		alert("������[�뿪��˾˵��]��");
		FormName.lkgssm.focus();
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.bc.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
