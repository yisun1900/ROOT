<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_tsbxxckcjlCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="17%"> 
        <div align="right">�ֹ�˾</div>
      </td>
      <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td width="17%"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="33%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+ssfgs+"' order by dwbh","");
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
      <td width="17%" align="right">��ͬ��</td>
      <td width="33%"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="17%" align="right">�ͻ����</td>
      <td width="33%"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right">���ʦ</td>
      <td width="33%"> 
        <input type="text" name="sjs" size="20" maxlength="20">
      </td>
      <td width="17%" align="right">�ʼ�</td>
      <td width="33%"> 
        <input type="text" name="zjxm" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
      <td width="33%"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="17%" align="right">�ͻ�����</td>
      <td width="33%"> 
        <input type="text" name="khxm2" size="14" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></div>
      </td>
      <td width="33%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
      <td width="17%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="33%"> 
        <input type="text" name="lxfs2" size="14" maxlength="50">
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="71" maxlength="100">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right">���ݵ�ַ</div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz2" size="65" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_tsjl_lx","1+Ͷ��&2+����","");
%></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">Ͷ�߱��޼�¼��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_tsjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="17%">Ͷ����Դ</td>
      <td width="33%"> 
        <select name="crm_tsjl_slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ͷ�����ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">Ͷ�����س̶�</td>
      <td width="33%"> 
        <select name="crm_tsjl_yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">�᰸״̬</td>
      <td width="33%"> 
        <select name="crm_tsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="0">δ����</option>
          <option value="1">������</option>
          <option value="2">�ڴ���</option>
          <option value="3">�᰸</option>
          <option value="9">������</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ͷ�������</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_slr" size="20" maxlength="16" >
      </td>
      <td align="right" width="17%">�����¼��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_kcjlh" size="20" maxlength="11" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�᰸ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_jasj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_jasj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_kcsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_kcsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">������</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_kcr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">¼����</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼��ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_lrsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.crm_tsjl_slsj, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj2, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj, "�᰸ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj2, "�᰸ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxxckcjl_kcsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxxckcjl_kcsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxxckcjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxxckcjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
