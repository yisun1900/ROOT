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
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String yhdlm=(String)session.getAttribute("yhdlm");
String sjs=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='04'");
if (sjs==null)
{
	sjs="";
}
String ywy=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='19'");
if (ywy==null)
{
	ywy="";
}
String ssfgs=(String)session.getAttribute("ssfgs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_dmjdjlCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�����ֹ�˾</td>
      <td width="33%"> 
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"crm_sjsjdjl_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(crm_sjsjdjl_ssfgs,crm_sjsjdjl_zxdm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"crm_sjsjdjl_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> 
      </td>
      <td align="right" width="17%">��ѯ����</td>
      <td width="33%"> 
        <select name="crm_dmjdjl_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
      <td align="right" width="17%" bgcolor="#FFFFFF">�ͻ����</td>
      <td width="33%"> 
        <input type="text" name="crm_dmjdjl_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">��ѯ״̬</td>
      <td width="33%"> 
        <select name="crm_dmjdjl_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"0+δ�������&1+�������&2+���ʦ�ύ�ɵ�&3+��ǩԼ&4+�ɵ�&5+�ɵ����δͨ��","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ͻ�����</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="17%">�Ա�</td>
      <td width="33%"> <%
	cf.radioToken(out, "crm_zxkhxx_xb","M+��&W+Ů","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">���ݵ�ַ</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="17%">��ϵ��ʽ</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����ӵ���¼��</td>
      <td width="33%"> 
        <input type="text" name="crm_dmjdjl_dmjdjlh" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">ʧ��ԭ��</td>
      <td width="33%"> 
        <select name="crm_dmjdjl_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�״�����˾ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ʼʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_dmjdjl_kssj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_dmjdjl_kssj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ʼ¼����</td>
      <td width="33%"> 
        <input type="text" name="crm_dmjdjl_kslrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">����¼����</td>
      <td width="33%"> 
        <input type="text" name="crm_dmjdjl_jslrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_dmjdjl_jssj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_dmjdjl_jssj2" size="20" maxlength="10" >
      </td>
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
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dmjdjl_kssj, "��ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dmjdjl_kssj2, "��ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dmjdjl_jssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dmjdjl_jssj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
