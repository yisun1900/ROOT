<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���񶩵���ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_cgddCxListTj.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_ddbh" size="20" maxlength="9" >
              </td>
              <td width="21%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
              <td width="21%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="21%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">פ��Ҿӹ���</td>
              <td width="29%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>
              </td>
              <td width="21%" align="right">չ���Ҿӹ���</td>
              <td width="29%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��ĿרԱ</div>
              </td>
              <td width="29%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">�Ҿ����ʦ&nbsp;</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_cgsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%"> 
                <div align="right">�ƻ�����ʱ�� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhccsj" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%"> 
                <div align="right">ʵ����ʱ�� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sccsj" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">�ƻ�����ʱ�� ��</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhfcsj" size="20" maxlength="10" >
              </td>
              <td width="21%" align="right">��</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">ʵ����ʱ�� ��</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sfcsj" size="20" maxlength="10" >
              </td>
              <td width="21%" align="right">��</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">ǩ��ͬʱ�� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_qhtsj" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_qhtsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%" align="right">�ƻ���װ���� ��</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhazrq" size="20" maxlength="10" >
              </td>
              <td width="21%" align="right">��</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%"> 
                <div align="right">��װ���ʱ�� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sazrq" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">¼��ʱ�� ��</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_lrsj" size="20" value="" maxlength="10" >
              </td>
              <td width="21%" align="right">��</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_lrsj2" size="20" value="" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">¼����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_lrr" size="20" maxlength="20" >
              </td>
              <td width="21%"> 
                <div align="right">¼�벿��</div>
              </td>
              <td width="29%"> 
                <select name="jc_cgdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="29%"> 
                <select name="jc_cgdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_cgddzt order by clzt","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">�˵�ԭ��</div>
              </td>
              <td width="29%"> 
                <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="29%"> 
                <input type="radio" name="jc_cgdd_khlx" value="2">
                ��װ�ͻ� 
                <input type="radio" name="jc_cgdd_khlx" value="4">
                �Ǽ�װ�ͻ� </td>
              <td width="21%"> 
                <div align="right"></div>
              </td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="21%" height="37">��ʾ���</td>
              <td colspan="3" height="37"> 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
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
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.jc_cgdd_jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhccsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj2, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj2, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj2, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq, "�ƻ���װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq2, "�ƻ���װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq, "��װ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq2, "��װ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

