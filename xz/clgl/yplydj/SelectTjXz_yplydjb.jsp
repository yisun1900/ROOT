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
String lrr=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Xz_yplydjbTjList.jsp" name="selectform">
  <div align="center">��������ͳ��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�����ƺ�</td>
      <td width="31%"> 
        <select name="xz_yplydjb_qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm order by qcph","");
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by qcph","");
	}
%> 
        </select>
      </td>
      <td align="right" width="17%">�ͱ��</td>
      <td width="33%"> 
        <select name="xz_yplydjb_ybh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="90#">90#</option>
          <option value="91#">91#</option>
          <option value="92#">92#</option>
          <option value="93#">93#</option>
          <option value="94#">94#</option>
          <option value="95#">95#</option>
          <option value="96#">96#</option>
          <option value="97#">97#</option>
          <option value="98#">98#</option>
          <option value="99#">99#</option>
          <option value="����">����</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�������� ��</td>
      <td width="31%"> 
        <input type="text" name="xz_yplydjb_lyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="xz_yplydjb_lyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�������� ��</td>
      <td width="31%"> 
        <input type="text" name="xz_yplydjb_lysl" size="20" maxlength="9" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="xz_yplydjb_lysl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������</td>
      <td width="31%"> 
        <input type="text" name="xz_yplydjb_lyr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">�����ֹ�˾</td>
      <td width="33%"> 
        <select name="xz_yplydjb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼����</td>
      <td width="31%"> 
        <input type="text" name="xz_yplydjb_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">¼��ʱ��</td>
      <td width="33%"> 
        <input type="text" name="xz_yplydjb_lrsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">��������ͳ��</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">�����ֹ�˾</option>
          <option value="qcph">�����ƺ�</option>
          <option value="lyrq">��������</option>
          <option value="lyr">������</option>
          <option value="ybh">�ͱ��</option>
        </select>
        �ڶ��� 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">�����ֹ�˾</option>
          <option value="qcph">�����ƺ�</option>
          <option value="lyrq">��������</option>
          <option value="lyr">������</option>
          <option value="ybh">�ͱ��</option>
        </select>
        ������ 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">�����ֹ�˾</option>
          <option value="qcph">�����ƺ�</option>
          <option value="lyrq">��������</option>
          <option value="lyr">������</option>
          <option value="ybh">�ͱ��</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">��ʾ���</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
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
	if(!(isFloat(FormName.xz_yplydjb_lysl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.xz_yplydjb_lysl2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_yplydjb_lyrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_yplydjb_lyrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_yplydjb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
		alert("��ѡ��[ͳ����]��");
		FormName.tj1.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
