<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="sgdtjb.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    �ͻ����  </td>
  <td width="33%"> 
    <input type="text" name="cw_gdjsjl_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="19%"> 
    ʩ����  </td>
  <td width="31%"> 
    <select name="cw_gdjsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> �����¼�� </td>
  <td><input type="text" name="cw_gdjsjl_gdjsjlh" size="20" maxlength="9" >  </td>
  <td align="right"> �ͻ����� </td>
  <td><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ���ݵ�ַ </td>
  <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right"> ��ϵ��ʽ </td>
  <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ���ʦ </td>
  <td><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
  <td align="right"> ��ͬ�� </td>
  <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> �ʼ� </td>
  <td><input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >  </td>
  <td align="right">��װ��־</td>
  <td><select name="cw_gdjsjl_jzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"1+��װ&2+��װ","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    ������  </td>
  <td width="33%"> 
    <select name="cw_gdjsjl_tdjs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+Ӧ�����̿��ܶ�&2+ʵ�տ�&3+ǩԼ��&4+ʵ�ʳɱ�&5+������&9+����","");
%>
    </select>  </td>
  <td align="right" width="19%"> 
    ��������  </td>
  <td width="31%"> 
    <input type="text" name="cw_gdjsjl_glftd" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���㲿������</td>
  <td><input type="text" name="cw_gdjsjl_jsr" size="20" maxlength="20" ></td>
  <td align="right">���㵥λ</td>
  <td><select name="cw_gdjsjl_jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">���㲿����ʱ�� ��</td>
  <td width="33%"><input type="text" name="cw_gdjsjl_jssj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">��</td>
  <td width="31%"><input type="text" name="cw_gdjsjl_jssj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� ��</td>
  <td><input type="text" name="cw_gdjsjl_spsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_gdjsjl_spsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������</td>
  <td><input type="text" name="cw_gdjsjl_spr" size="20" maxlength="20" ></td>
  <td align="right">��������</td>
  <td><%
	cf.radioToken(out, "cw_gdjsjl_spjl","3+ͨ��&4+δͨ��","");
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�������ʱ�� ��</td>
  <td width="33%"><input type="text" name="cw_gdjsjl_cwjssj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">��</td>
  <td width="31%"><input type="text" name="cw_gdjsjl_cwjssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ��������� </td>
  <td><input type="text" name="cw_gdjsjl_cwjsr" size="20" maxlength="20" >
  </td>
  <td align="right">������� </td>
  <td><select name="cw_gdjsjl_jsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectToken(out,"1+���㲿����&2+��������&3+�������","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">�ֹ�˾</div></td>
  <td bgcolor="#FFFFCC"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
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
  <td align="right" width="19%">&nbsp;</td>
  <td width="31%">&nbsp;</td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.cw_gdjsjl_glftd, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_jssj, "���㲿����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_jssj2, "���㲿����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_spsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_spsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_cwjssj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_cwjssj2, "�������ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
