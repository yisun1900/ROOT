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
      <div align="center">ľ�Ŷ�����ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_mmyddCxListTj.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">Ԥ�������</div>              </td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_yddbh" size="20" maxlength="9" >              </td>
              <td width="17%"> 
              <div align="right">����״̬</div>              </td>
              <td width="33%"> 
                <select name="jc_mmydd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt order by clzt","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�ͻ����</td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_khbh" size="20" maxlength="20" >              </td>
              <td width="17%" align="right">��ͬ��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ͻ�����</div>              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td width="17%"> 
              <div align="right">��ϵ��ʽ</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���ݵ�ַ</div>              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td width="17%"> 
              <div align="right">���ʦ</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ͬ�������� ��</td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��ͬ�������� ��</div>              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" >              </td>
              <td width="17%"> 
              <div align="right">��</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ʩ����</div>              </td>
              <td width="30%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right">�ʼ�����</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ǩԼ����</div>              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >              </td>
              <td width="17%"> 
              <div align="right">ǩԼ����</div>              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">פ��Ҿӹ���</td>
              <td width="30%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>              </td>
              <td width="17%" align="right">չ���Ҿӹ���</td>
              <td width="33%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">������</div>              </td>
              <td width="30%"> <%
	cf.radioToken(out, "jc_mmydd_wjqk","1+�ͻ��Թ�&2+��˾����","");
%> </td>
              <td width="17%"> 
              <div align="right">��ĿרԱ</div>              </td>
              <td width="33%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�����</div>              </td>
              <td width="30%"> 
                <select name="jc_mmydd_cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc c2 from jc_cxhd order by jsbz,cxhdbm","");
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right">�ɵ�����</div>              </td>
              <td width="33%"> 
                <select name="jc_mmydd_pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='1' order by gysmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�Թ������͵���˾</td>
              <td width="30%"> 
                <select name="jc_mmydd_wjsgsbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+���͹�˾&N+δ�͹�˾","");
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right">��ͬǩ����</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_htqdr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��ʵ�ӳ�ԭ��</div>              </td>
              <td width="30%"> 
                <select name="jc_mmydd_zsycyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm","");
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right">�ӳ�ԭ��</div>              </td>
              <td width="33%"> 
                <select name="jc_mmydd_mmycyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">�ƻ�����ʱ�� ��</td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_jhccsj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_jhccsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ǩ��ͬ���� ��</div>              </td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_htrq" size="20" maxlength="10" >              </td>
              <td width="17%"> 
              <div align="right">��</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_htrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">��ͬ��װʱ�� ��</div>              </td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_jhazsj" size="20" maxlength="10" >              </td>
              <td width="17%"> 
              <div align="right">��</div>              </td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_jhazsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">ʵ���ʱ�� ��</td>
              <td width="30%"> 
              <input type="text" name="srksj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="srksj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">Э�̰�װʱ�� ��</td>
              <td width="30%"> 
              <input type="text" name="kazsj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="kazsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����װ֪ͨʱ�� ��</td>
              <td width="30%"> 
              <input type="text" name="aztzsj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="aztzsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">��װ���ʱ�� ��</td>
              <td width="30%"> 
              <input type="text" name="azjssj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="azjssj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">¼��ʱ�� ��</td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_lrsj" size="20" maxlength="10" value="<%=cf.firstDay()%>">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="jc_mmydd_lrsj2" size="20" maxlength="10" value="<%=cf.today()%>">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">¼����</div>              </td>
              <td width="30%"> 
              <input type="text" name="jc_mmydd_lrr" size="20" maxlength="20" >              </td>
              <td width="17%"> 
              <div align="right">¼�벿��</div>              </td>
              <td width="33%"> 
                <select name="jc_mmydd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ͻ�����</td>
              <td><input type="radio" name="khlx" value="2">
                ��װ�ͻ�
                <input type="radio" name="khlx" value="4">
                �Ǽ�װ�ͻ�</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)" name="Button">
                <input type="reset"  value="����">              </td>
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
	if(!(isDatetime(FormName.crm_khxx_kgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhccsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq, "ǩ��ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq2, "ǩ��ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhazsj, "��ͬ��װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhazsj2, "��ͬ��װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.srksj, "ʵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.srksj2, "ʵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kazsj, "Э�̰�װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kazsj2, "Э�̰�װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.aztzsj, "����װ֪ͨʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.aztzsj2, "����װ֪ͨʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.azjssj, "��װ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.azjssj2, "��װ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
