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
<form method="post" action="Jc_cxhdCxList.jsp" name="selectform">
<div align="center">�����������ѯ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���������</td>
      <td width="31%"> 
        <input type="text" name="jc_cxhd_cxhdbm" size="20" maxlength="7" >
      </td>
      <td align="right" width="20%">���������</td>
      <td width="30%"> 
        <input type="text" name="jc_cxhd_cxhdmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ֹ�˾</td>
      <td width="31%"> 
        <select name="jc_cxhd_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
      <td align="right" width="20%">����</td>
      <td width="30%"> 
        <input type="text" name="jc_cxhd_dj" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���̷��ۿ�</td>
      <td width="31%"> 
        <input type="text" name="jc_cxhd_gcfzk" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">���������ۿ�</td>
      <td width="30%"> 
        <input type="text" name="jc_cxhd_gczxzk" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������ۿ�</td>
      <td width="31%"> 
        <input type="text" name="jc_cxhd_glfzk" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">��������</td>
      <td width="30%"> 
        <input type="text" name="jc_cxhd_fjmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�����</td>
      <td colspan="3">
        <input type="radio" name="hdlx" value="1">
        �޻ 
        <input type="radio" name="hdlx" value="2">
        ��˾� 
        <input type="radio" name="hdlx" value="3">
        С��� 
		<input type="radio" name="hdlx" value="4">
		չ��
		<input type="radio" name="hdlx" value="5">
		�г��</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ۿ�����</td>
      <td colspan="3">
        <input type="radio" name="zklx" value="1">
        ǩԼ��ֱ�Ӵ��� 
        <input type="radio" name="zklx" value="2">
        ǩԼ����ۣ�����ʱ���� 
        <input type="radio" name="zklx" value="4">
        ���ۿ�</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ɹ��������</td>
      <td width="31%"><%
	cf.radioToken(out, "kgxqthd","1+���ɹ���&2+�ɹ���","");
%></td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������־</td>
      <td width="31%"> 
        <INPUT type="radio" name="jc_cxhd_jsbz" value="N" >
        δ���� 
        <INPUT type="radio" name="jc_cxhd_jsbz" value="Y" >
        ���� </td>
      <td align="right" width="20%">������־</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_cxhd_spbz","N+δ����&Y+����","");
%> </td>
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
	if(!(isNumber(FormName.jc_cxhd_dj, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_cxhd_gcfzk, "���̷��ۿ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_cxhd_gczxzk, "���������ۿ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_cxhd_glfzk, "������ۿ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
