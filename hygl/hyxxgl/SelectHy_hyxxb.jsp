<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

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

<form method="post" action="Hy_hyxxbList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��Ա���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hybh" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">�Ƿ�����</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_sfzf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+����&N+δ����","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <div align="right">ˮ�ʷ�������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hykh" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right"> 
                <div align="right">����ר����</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','2','3') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_fwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+��������&2+��ֵ����","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������� ��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_rhrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_rhrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��Ч���� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_yxrq" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_yxrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hymm" size="20" maxlength="12" >
              </td>
              <td width="19%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hyxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "hy_hyxxb_xb","M+��&W+Ů","");
%> </td>
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_yzbm" size="20" maxlength="12" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��Ա��ַ</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="hy_hyxxb_hydz" size="57" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�绰</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_dh" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">�ֻ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_sj" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_dzxx" size="20" maxlength="40" >
              </td>
              <td width="19%"> 
                <div align="right">���֤����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_sfzhm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������� ��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_csrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_csrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ְҵ</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_zydm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,zymc from hy_zydmb order by xh","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">������</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_ysrdm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,ysrdm from hy_ysrdmb order by xh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������� ��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_jhjnr" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_jhjnr2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" height="28"> 
                <div align="right">����״��</div>
              </td>
              <td width="31%" height="28"> <%
	cf.radioToken(out, "hy_hyxxb_hyzk","Y+�ѻ�&N+δ��","");
%> </td>
              <td width="19%" height="28"> 
                <div align="right">��������</div>
              </td>
              <td width="31%" height="28"> 
                <input type="text" name="hy_hyxxb_arxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_arsr" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_arsr2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�۸�ӡ��</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_jgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jgyxbm,jgyxmc from hy_jgyxbm order by jgyxbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">����ӡ��</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_fwyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwyxbm,fwyxmc from hy_fwyxbm order by fwyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���ӡ��</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_fgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgyxbm,fgyxmc from hy_fgyxbm order by fgyxbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">����ӡ��</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_gyyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gyyxbm,gyyxmc from hy_gyyxbm order by gyyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ר����</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_zdfgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zdfgbm,zdfgmc from hy_zdfgbm order by zdfgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">ƽʱ����</div>
              </td>
              <td width="31%"> 
                <select name="hy_hyxxb_psahbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select psahbm,psahmc  from hy_psahbm order by psahbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ϲ����ֽ��־</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_bzzz" size="20" value="">
              </td>
              <td width="19%"> 
                <div align="right">��֪ͬ��Ʒ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_sztlpp" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ϲ��ȥ���̵�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_shop" size="20" value="">
              </td>
              <td width="19%"> 
                <div align="right">ϲ����ױƷƷ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_hzppp" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ϲ����װƷ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_fzpp" size="20" value="">
              </td>
              <td width="19%"> 
                <div align="right">��Ϣ¼����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_xxlrr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������� ��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_gmcs" size="20" maxlength="8" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_gmcs2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�����ܽ�� ��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_xfzje" size="20" maxlength="17" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_xfzje2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_jf" size="20" maxlength="8" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_jf2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">δ�һ����� ��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_wdhjf" size="20" maxlength="8" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="hy_hyxxb_wdhjf2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(!(isDatetime(FormName.hy_hyxxb_csrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_csrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_jhjnr, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_jhjnr2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_arsr, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_arsr2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_rhrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_rhrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_yxrq, "��Ч����"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_yxrq2, "��Ч����"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_gmcs, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_gmcs2, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxxb_xfzje, "�����ܽ��"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxxb_xfzje2, "�����ܽ��"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_jf, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_jf2, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_wdhjf, "δ�һ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_wdhjf2, "δ�һ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
