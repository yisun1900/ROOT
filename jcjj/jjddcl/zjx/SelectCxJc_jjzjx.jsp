<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+ssfgs+"'");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jc_jjzjxCxList.jsp" name="selectform">
<div align="center">�Ҿ�������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">������˾</td>
      <td width="31%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else if (yhjs.equals("G0"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dqbm='"+dqbm+"' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td width="19%" align="right">ǩԼ����</td>
      <td width="31%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
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
      <td align="right" width="19%">�������</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_ddbh" size="20" maxlength="9" >
      </td>
      <td align="right" width="19%">���������</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_zjxxh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ͻ����</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">�ͻ�����</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ݵ�ַ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="19%">��ϵ��ʽ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ͬ��</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">���ʦ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ʼ�</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">������ԭ��</td>
      <td width="31%"> 
        <select name="jc_jjzjx_zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">�Ҿ߹���</td>
      <td width="31%"> 
        <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("G0"))
	{
		out.println("<option value=\"\"></option>");
		String ls_sql=null;
		ls_sql=" select gysbh c1,gysmc c2 from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' and gysbm='"+dwbh+"' order by gysmc";
		cf.selectItem(out,ls_sql,"");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' order by gysmc","");
	}
%> 
        </select>
      </td>
      <td width="19%" align="right">�Ҿ߹���</td>
      <td width="31%"> 
        <input type="text" name="pdgcmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">�Ҿ�Ʒ��</td>
      <td width="31%"> 
        <select name="jjppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("G0"))
	{
		String ls_sql=null;
		ls_sql=" select distinct ppmc c1,ppmc c2 from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' and gysbm='"+dwbh+"' order by ppmc";
		cf.selectItem(out,ls_sql,"");
	}
	else{
		cf.selectItem(out,"select distinct ppmc c1,ppmc c2 from sq_gysxx where gyslb='3'  and dqbm='"+dqbm+"' order by ppmc","");
	}
%> 
        </select>
      </td>
      <td width="19%" align="right">�Ҿ�Ʒ��</td>
      <td width="31%"> 
        <input type="text" name="jjppmc2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">�Ҿ߹�Ӧ��</td>
      <td width="31%"> 
        <select name="jjgys" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("G0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select gys c1,gys c2 from sq_gysbm where gysbm='"+dwbh+"' order by gys","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct gys c1,gys||'��'||dqmc||'��' c2 from sq_gysxx,dm_dqbm where sq_gysxx.dqbm=dm_dqbm.dqbm(+) and gyslb='3' and sq_gysxx.dqbm='"+dqbm+"' order by gys","");
	}
%> 
        </select>
      </td>
      <td width="19%" align="right">�Ҿ߹�Ӧ��</td>
      <td width="31%"> 
        <input type="text" name="jjgys2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">�Ͳ��Ź���</td>
      <td width="31%"> 
        <select name="xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("G0"))
	{
		out.println("<option value=\"\"></option>");
		String ls_sql=null;
		ls_sql=" select gysbh c1,gysmc c2 from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' and gysbm='"+dwbh+"' order by gysmc";
		cf.selectItem(out,ls_sql,"");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' order by gysmc","");
	}
%> 
        </select>
      </td>
      <td width="19%" align="right">�Ͳ��Ź���</td>
      <td width="31%"> 
        <input type="text" name="xcmgcmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">�Ͳ���Ʒ��</td>
      <td width="31%"> 
        <select name="xcmppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("G0"))
	{
		String ls_sql=null;
		ls_sql=" select distinct ppmc c1,ppmc c2 from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' and gysbm='"+dwbh+"' order by ppmc";
		cf.selectItem(out,ls_sql,"");
	}
	else{
		cf.selectItem(out,"select distinct ppmc c1,ppmc c2 from sq_gysxx where gyslb='3'  and dqbm='"+dqbm+"' order by ppmc","");
	}
%> 
        </select>
      </td>
      <td width="19%" align="right">�Ͳ���Ʒ��</td>
      <td width="31%"> 
        <input type="text" name="xcmppmc2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">�Ͳ��Ź�Ӧ��</td>
      <td width="31%"> 
        <select name="xcmgys" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("G0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select gys c1,gys c2 from sq_gysbm where gysbm='"+dwbh+"' order by gys","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct gys c1,gys||'��'||dqmc||'��' c2 from sq_gysxx,dm_dqbm where sq_gysxx.dqbm=dm_dqbm.dqbm(+) and gyslb='3' and sq_gysxx.dqbm='"+dqbm+"' order by gys","");
	}
%> 
        </select>
      </td>
      <td width="19%" align="right">�Ͳ��Ź�Ӧ��</td>
      <td width="31%"> 
        <input type="text" name="xcmgys2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ȷ��ʱ��</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_qrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">ȷ��¼����</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_qrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ʵ���ʱ��</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_srksj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">���¼����</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_rkr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ƻ���װʱ��</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_jhazsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��װ���ʱ��</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_azwcsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼����</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">¼�벿��</td>
      <td width="31%"> 
        <select name="jc_jjzjx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+ssfgs+"' and  cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼��ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="jc_jjzjx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�������ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="zjxfssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="zjxfssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����״̬</td>
      <td width="31%"> 
        <select name="jc_jjzjx_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
			<option value=""></option>
			<option value="00">¼��δ���</option>
			<option value="01">¼�������</option>
			<option value="02">������ȷ��</option>
			<option value="04">��װ���</option>
			<option value="99">�˵�</option>
        </select>
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
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
	if(!(isNumber(FormName.jc_jjzjx_zjxxh, "���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjzjx_qrsj, "ȷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjzjx_srksj, "ʵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjzjx_jhazsj, "�ƻ���װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjzjx_azwcsj, "��װ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjzjx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjzjx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj2, "�������ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
