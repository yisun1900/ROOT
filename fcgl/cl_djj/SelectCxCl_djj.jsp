<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_djjCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ֹ�˾</td>
      <td width="33%"> <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"cl_djj_dwbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
			out.println("        </select>");
		}
		else{
			out.println("        <select name=\"cl_djj_dwbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
			out.println("        </select>");
		}
%> </td>
      <td align="right" width="17%">����״̬</td>
      <td width="33%"> 
        <select name="cl_djj_czzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">δ�ύ</option>
          <option value="2">���ύ</option>
          <option value="3">�Ѵ�ӡ</option>
          <option value="9">δ��ӡ</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ͻ�����</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="17%">���ݵ�ַ</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ϵ��ʽ</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
      <td align="right" width="17%">��ͬ��</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">���ʦ</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">�ʼ�</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">ǩԼ���� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�������</td>
      <td width="33%"> 
        <input type="text" name="cl_djj_czxh" size="20" maxlength="9" >
      </td>
      <td align="right" width="17%">�ͻ����</td>
      <td width="33%"> 
        <input type="text" name="cl_djj_khbh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�Ƿ��������</td>
      <td width="33%"><%
	cf.radioToken(out, "cl_djj_sfjm","1+������&2+�������","");
%> </td>
      <td align="right" width="17%">�������״̬</td>
      <td width="33%"><%
	cf.radioToken(out, "cl_djj_shzt","1+δ���&2+һ�����&3+�������","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼����</td>
      <td width="33%"> 
        <input type="text" name="cl_djj_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">ʩ����</td>
      <td width="33%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where cxbz='N' order by ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼��ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="cl_djj_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="cl_djj_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ӡʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="dysj" size="20" value="" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="dysj2" size="20" value="" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%">һ�������</td>
      <td width="33%">
        <input type="text" name="shr" size="20" value="" maxlength="20">
      </td>
      <td align="right" width="17%">���������</td>
      <td width="33%">
        <input type="text" name="ejshr" size="20" value="" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">һ����˽���</td>
      <td width="33%"> 
        <input type="radio" name="shjl" value="1">
        ͬ�� 
        <input type="radio" name="shjl" value="2">
        ��ͬ��</td>
      <td align="right" width="17%">������˽���</td>
      <td width="33%"> 
        <input type="radio" name="shjl" value="1">
        ͬ�� 
        <input type="radio" name="shjl" value="2">
        ��ͬ��</td>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.cl_djj_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cl_djj_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dysj, "��ӡʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dysj2, "��ӡʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
