<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<form method="post" action="Xz_dnsbbxsqCxList.jsp" name="selectform">
<div align="center">��ѯ�����Լ��豸��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td width="22%" align="right">���޷ֹ�˾</td> 
  <td width="28%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
%>
    </select></td>
  <td width="19%" align="right">���޲���</td> 
  <td width="31%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�̶��ʲ����</td>
  <td><input type="text" name="gsbh" size="20" maxlength="20" >  </td>
  <td align="right">�̶��ʲ�����</td>
  <td><input type="text" name="gdzcmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�̶��ʲ������ڱ��</td>
  <td><input type="text" name="bmbh" size="20" maxlength="20" >  </td>
  <td align="right">�̶��ʲ�����</td>
  <td><select name="gdzcflmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gdzcflmc c1,gdzcflmc c2 from xz_gdzcflbm order by gdzcflbm","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͺ�</td>
  <td><input type="text" name="xh" size="20" maxlength="50" >  </td>
  <td align="right">Ʒ��</td>
  <td><input type="text" name="pp" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����(CPU)</td>
  <td><input type="text" name="pz1" size="20" maxlength="50" >  </td>
  <td align="right">����(�ڴ�)</td>
  <td><input type="text" name="pz2" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����(Ӳ��)</td>
  <td><input type="text" name="pz3" size="20" maxlength="50" >  </td>
  <td align="right">����(����)</td>
  <td><input type="text" name="pz4" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����(�Կ�)</td>
  <td><input type="text" name="pz5" size="20" maxlength="50" >  </td>
  <td align="right">����(��ʾ��)</td>
  <td><input type="text" name="pz6" size="20" maxlength="50" >  </td>
</tr>

<tr bgcolor="#E8E8FF">
  <td align="right">���޴���״̬</td>
  <td colspan="3"><input type="radio" name="clzt" value="1">
    δ����
      <input type="radio" name="clzt" value="2">
      ����
      <input type="radio" name="clzt" value="3">
      ά����
      <input type="radio" name="clzt" value="4">
      �ɹ���
      <input type="radio" name="clzt" value="5">
      ������
      <input type="radio" name="clzt" value="6">
      ��� </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="22%" align="right">�������</td> 
  <td width="28%"><input type="text" name="bxxh" size="20" maxlength="8" ></td>
  <td width="19%" align="right">����������</td> 
  <td width="31%"> 
    <input type="text" name="sqr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">���Լ��豸����</td> 
  <td width="28%"> 
    <select name="dnsbflmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dnsbflmc c1,dnsbflmc c2 from xz_dnsbflbm order by dnsbflbm","");
%>
    </select>  </td>
  <td align="right" width="19%">�豸������</td> 
  <td width="31%"> 
    <input type="text" name="bgr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">�豸���Ƿ�����Ҫ����</td> 
  <td width="28%">
    <INPUT type="radio" name="sfyzysj" value="N">��
    <INPUT type="radio" name="sfyzysj" value="Y">��  </td> 
  <td align="right" width="19%">���Լ��豸����</td> 
  <td width="31%"> 
    <select name="dnsbgzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dnsbgzmc c1,dnsbgzmc c2 from xz_dnsbgzbm order by dnsbgzbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">¼����</td> 
  <td width="28%"><input type="text" name="lrr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">������</td> 
  <td width="31%"><input type="text" name="jsr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">ά����</td>
  <td><input type="text" name="wxr" size="20" maxlength="20" >  </td>
  <td align="right">ά�޷���</td>
  <td><input type="text" name="wxfy" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" bgcolor="#FFFFCC">�������� �� </td>
  <td><input type="text" name="bxrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">��</td>
  <td><input type="text" name="bxrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ϣ��������� ��</td>
  <td><input type="text" name="jhlqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jhlqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">����ʱ�� �� </td>
  <td><input type="text" name="jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ά��¼��ʱ�� ��</td>
  <td><input type="text" name="wxlrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="wxlrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="22%" align="right">ά�����ʱ�� ��</td> 
  <td width="28%"> 
    <input type="text" name="wcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td width="19%" align="right">��</td> 
  <td width="31%"><input type="text" name="wcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFCC">
  <td align="right">��ѯ�������</td>
  <td colspan="3">��һ��
    <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value="xz_dnsbbxsq.clzt">����״̬</option>
        <option value="xz_dnsbbxsq.bxxh">�������</option>
        <option value="xz_dnsbbxsq.fgsbh">���޷ֹ�˾</option>
        <option value="xz_dnsbbxsq.dwbh">���޲���</option>
        <option value="xz_dnsbbxsq.sqr">����������</option>
        <option value="xz_dnsbbxsq.bxrq">��������</option>
        <option value="xz_dnsbbxsq.jhlqrq">ϣ���������</option>
        <option value="xz_dnsbbxsq.dnsbflmc">���Լ��豸����</option>
        <option value="xz_dnsbbxsq.bgr">�豸������</option>
        <option value="xz_dnsbbxsq.xz_dnsbbxsq.sfyzysj">�豸���Ƿ�����Ҫ����</option>
        <option value="xz_dnsbbxsq.dnsbgzmc">���Լ��豸���Ϸ���</option>
        <option value="xz_dnsbbxsq.jsr">������</option>
        <option value="xz_dnsbbxsq.jssj">����ʱ��</option>
        <option value="xz_dnsbbxsq.wxbm">ά�޲���</option>
        <option value="xz_dnsbbxsq.wxr">ά����</option>
        <option value="xz_dnsbbxsq.wxlrsj">ά��¼��ʱ��</option>
        <option value="xz_dnsbbxsq.wcsj">ά�����ʱ��</option>

        <option value="xz_dnsbbxsq.gdzcflmc">�̶��ʲ�����</option>
        <option value="xz_dnsbbxsq.gsbh">�̶��ʲ����</option>
        <option value="xz_dnsbbxsq.gdzcmc">�̶��ʲ�����</option>
        <option value="xz_dnsbbxsq.bmbh">�����ڲ����</option>
        <option value="xz_dnsbbxsq.xh">�ͺ�</option>
        <option value="xz_dnsbbxsq.pp">Ʒ��</option>
        <option value="xz_dnsbbxsq.pz1">����(CPU)</option>
        <option value="xz_dnsbbxsq.pz2">����(�ڴ�)</option>
        <option value="xz_dnsbbxsq.pz3">����(Ӳ��)</option>
        <option value="xz_dnsbbxsq.pz4">����(����)</option>
        <option value="xz_dnsbbxsq.pz5">����(�Կ�)</option>
        <option value="xz_dnsbbxsq.pz6">����(��ʾ��)</option>
      </select>
    �ڶ���
    <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="xz_dnsbbxsq.clzt">����״̬</option>
        <option value="xz_dnsbbxsq.bxxh" selected>�������</option>
        <option value="xz_dnsbbxsq.fgsbh">���޷ֹ�˾</option>
        <option value="xz_dnsbbxsq.dwbh">���޲���</option>
        <option value="xz_dnsbbxsq.sqr">����������</option>
        <option value="xz_dnsbbxsq.bxrq">��������</option>
        <option value="xz_dnsbbxsq.jhlqrq">ϣ���������</option>
        <option value="xz_dnsbbxsq.dnsbflmc">���Լ��豸����</option>
        <option value="xz_dnsbbxsq.bgr">�豸������</option>
        <option value="xz_dnsbbxsq.xz_dnsbbxsq.sfyzysj">�豸���Ƿ�����Ҫ����</option>
        <option value="xz_dnsbbxsq.dnsbgzmc">���Լ��豸���Ϸ���</option>
        <option value="xz_dnsbbxsq.jsr">������</option>
        <option value="xz_dnsbbxsq.jssj">����ʱ��</option>
        <option value="xz_dnsbbxsq.wxbm">ά�޲���</option>
        <option value="xz_dnsbbxsq.wxr">ά����</option>
        <option value="xz_dnsbbxsq.wxlrsj">ά��¼��ʱ��</option>
        <option value="xz_dnsbbxsq.wcsj">ά�����ʱ��</option>

        <option value="xz_dnsbbxsq.gdzcflmc">�̶��ʲ�����</option>
        <option value="xz_dnsbbxsq.gsbh">�̶��ʲ����</option>
        <option value="xz_dnsbbxsq.gdzcmc">�̶��ʲ�����</option>
        <option value="xz_dnsbbxsq.bmbh">�����ڲ����</option>
        <option value="xz_dnsbbxsq.xh">�ͺ�</option>
        <option value="xz_dnsbbxsq.pp">Ʒ��</option>
        <option value="xz_dnsbbxsq.pz1">����(CPU)</option>
        <option value="xz_dnsbbxsq.pz2">����(�ڴ�)</option>
        <option value="xz_dnsbbxsq.pz3">����(Ӳ��)</option>
        <option value="xz_dnsbbxsq.pz4">����(����)</option>
        <option value="xz_dnsbbxsq.pz5">����(�Կ�)</option>
        <option value="xz_dnsbbxsq.pz6">����(��ʾ��)</option>
    </select>
    ������
    <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="xz_dnsbbxsq.clzt">����״̬</option>
        <option value="xz_dnsbbxsq.bxxh">�������</option>
        <option value="xz_dnsbbxsq.fgsbh">���޷ֹ�˾</option>
        <option value="xz_dnsbbxsq.dwbh">���޲���</option>
        <option value="xz_dnsbbxsq.sqr">����������</option>
        <option value="xz_dnsbbxsq.bxrq">��������</option>
        <option value="xz_dnsbbxsq.jhlqrq">ϣ���������</option>
        <option value="xz_dnsbbxsq.dnsbflmc">���Լ��豸����</option>
        <option value="xz_dnsbbxsq.bgr">�豸������</option>
        <option value="xz_dnsbbxsq.xz_dnsbbxsq.sfyzysj">�豸���Ƿ�����Ҫ����</option>
        <option value="xz_dnsbbxsq.dnsbgzmc">���Լ��豸���Ϸ���</option>
        <option value="xz_dnsbbxsq.jsr">������</option>
        <option value="xz_dnsbbxsq.jssj">����ʱ��</option>
        <option value="xz_dnsbbxsq.wxbm">ά�޲���</option>
        <option value="xz_dnsbbxsq.wxr">ά����</option>
        <option value="xz_dnsbbxsq.wxlrsj">ά��¼��ʱ��</option>
        <option value="xz_dnsbbxsq.wcsj">ά�����ʱ��</option>

        <option value="xz_dnsbbxsq.gdzcflmc">�̶��ʲ�����</option>
        <option value="xz_dnsbbxsq.gsbh">�̶��ʲ����</option>
        <option value="xz_dnsbbxsq.gdzcmc">�̶��ʲ�����</option>
        <option value="xz_dnsbbxsq.bmbh">�����ڲ����</option>
        <option value="xz_dnsbbxsq.xh">�ͺ�</option>
        <option value="xz_dnsbbxsq.pp">Ʒ��</option>
        <option value="xz_dnsbbxsq.pz1">����(CPU)</option>
        <option value="xz_dnsbbxsq.pz2">����(�ڴ�)</option>
        <option value="xz_dnsbbxsq.pz3">����(Ӳ��)</option>
        <option value="xz_dnsbbxsq.pz4">����(����)</option>
        <option value="xz_dnsbbxsq.pz5">����(�Կ�)</option>
        <option value="xz_dnsbbxsq.pz6">����(��ʾ��)</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">��ʾ���</td>
  <td colspan="3"><input type="radio" name="xsfg" value="1" checked>
    ��ҳ
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ����
    <input type="text" name="myxssl" size="7" maxlength="13" value="30">  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isNumber(FormName.bxxh, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "ϣ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq2, "ϣ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.wxlrsj, "ά��¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.wxlrsj2, "ά��¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "ά�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.wcsj2, "ά�����ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.wxfy, "ά�޷���"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
