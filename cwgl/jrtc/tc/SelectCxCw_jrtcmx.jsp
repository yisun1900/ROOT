<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jrtcmxCxList.jsp" name="selectform">
<div align="center">��ϸ��ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_khzq" size="20" maxlength="6" >  </td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">���ݵ�ַ</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ͬ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">�ص���־</td> 
  <td width="32%"> 
    <select name="cw_jrtcmx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ײͿͻ�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cw_jrtcmx_tckh","1+����&2+�ײ�","");
%>  </td>
  <td align="right" width="18%">�곤</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_dianz" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ա</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_weny" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">����ҵ��</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_khjl" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦ</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_sjs" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">����Ա</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_cly" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_zjxm" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">С������</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_xqzg" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С���鳤</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_xqzz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">С��רԱ</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_xqzy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ӫ������</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wlyxzg" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">Ӫ��רԱ</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_yxzy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��վ�߻�</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wzch" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">��ҳ���</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wysj" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��վ����Ա</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wzcxy" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">�绰רԱ</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_dhzy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��վ�ƹ�Ա</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wztgy" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">˾��</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_siji" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cw_jrtcmx_lx","1+ǩ�����&2+�������","");
%>  </td>
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="cw_jrtcmx_lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="18%">�� </td>
  <td width="32%"><input type="text" name="cw_jrtcmx_lrsj2" size="20" maxlength="10" >  </td>
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
	if(!(isDatetime(FormName.cw_jrtcmx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrtcmx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
