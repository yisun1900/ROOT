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
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
                <input type="reset"  value="����">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td width="19%" align="right">�ɵ�½��־</td>
              <td width="31%">
                <input type="radio" name="kdlbz" value="01">
                �ɵ�½ 
                <input type="radio" name="kdlbz" value="02">
                ���ɵ�½ </td>
              <td width="17%" align="right">�ͻ���½��</td>
              <td width="33%">
                <input type="text" name="yhdlm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "crm_khxx_xb","M+��&W+Ů","");
%> </td>
              <td width="17%"> 
                <div align="right">ְҵ</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_zybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" bgcolor="#E8E8FF" align="right">��������</td>
              <td width="31%"> 
                <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">��ͬ��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
              <td width="17%"> 
                <div align="right">���֤����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sfzhm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">���� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fj" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="31%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,crm_khxx_dwbh,<%=dwstr%>)">
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
              <td width="17%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
              <td width="19%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">�ʼ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">ÿƽ�׾���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_pmjj" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">����ǩԼ�� ��</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�ۿ��ʣ�&gt;0��&lt;=10�� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zkl" size="20" maxlength="9" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zkl2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ�ȯ</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "crm_khxx_sffj","Y+��&N+��","");
%> </td>
              <td width="17%"> 
                <div align="right">�Ƿ�����֤</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "crm_khxx_sfyrz","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ǩԼ���� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value=""  >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ͬ�������� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ʵ�ʿ������� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">��ͬ�������� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">ʵ�ʿ������� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ʵ������� ��</td>
              <td width="31%"> 
                <input type="text" name="sjwjrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="sjwjrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">���̽���</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�깤��־</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+δ�깤&2+���깤","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">�ɵ�����״̬</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�����ɵ�&2+�ɵ�&3+�ܾ��ɵ�&4+�����ɵ�&5+����ԭ��&6+ͬ�����","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">����־</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_wjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+δ���&2+�����","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd order by sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">ʩ������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ���ط�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sfxhf" size="20" maxlength="1" >
              </td>
              <td width="17%"> 
                <div align="right">�ط�����</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">�ط����� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hfrq" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hfrq2" size="20" maxlength="10" >
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isNumber(FormName.crm_khxx_fj, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fj2, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fwmj, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye, "����ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "����ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zkl, "�ۿ���"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zkl2, "�ۿ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "ʵ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "ʵ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq2, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_hfrq, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_hfrq2, "�ط�����"))) {
		return false;
	}

	FormName.action="Crm_khxxCxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
