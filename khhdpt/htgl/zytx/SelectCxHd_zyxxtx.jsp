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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Hd_zyxxtxCxList.jsp" name="selectform">
  <div align="center">��Ҫ���Ѳ�ѯ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">�ֹ�˾</td>
      <td width="32%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td align="right" width="19%">ǩԼ����</td>
      <td width="31%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ͬ��</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">�ͻ����</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtx_khbh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ͻ�����</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="19%">���ݵ�ַ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ϵ��ʽ</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
      <td align="right" width="19%">���ʦ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">ǩԼ���� ��</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">ʩ����</td>
      <td width="32%"> 
        <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
//		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
        </select>
      </td>
      <td align="right" width="19%">�ʼ�</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�������</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtx_txxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">���ѵȼ�</td>
      <td width="31%">
        <input type="radio" name="txdj" value="1">
        һ�� 
        <input type="radio" name="txdj" value="2">
        ��Ҫ 
        <input type="radio" name="txdj" value="3">
        �ر���Ҫ </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ѷ���</td>
      <td width="32%"> 
        <select name="hd_zyxxtx_txfl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+��������&2+������������&3+��������&4+���ɲ�Ʒ����&9+��������","");
%> 
        </select>
      </td>
      <td align="right" width="19%">���ѱ���</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtx_txbt" size="20" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ͻ��Ƿ��Ѳ鿴</td>
      <td width="32%"><%
	cf.radioToken(out, "hd_zyxxtx_khsfyck","N+δ�鿴&Y+�Ѳ鿴","");
%> </td>
      <td align="right" width="19%">�ͻ��Ƿ��������</td>
      <td width="31%">
        <input type="radio" name="sfyxkhly" value="N">
        ������ 
        <input type="radio" name="sfyxkhly" value="Y">
        ���� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ͻ��鿴ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtx_khcksj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtx_khcksj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�����Ƿ��Ѳ鿴</td>
      <td width="32%"> <%
	cf.radioToken(out, "hd_zyxxtxly_lysfyck","N+δ�鿴&Y+�Ѳ鿴","");
%> </td>
      <td align="right" width="19%">���Բ鿴��</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtxly_lyckr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���Բ鿴ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtxly_lycksj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtxly_lycksj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtx_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtx_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼����</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtx_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">¼�벿��</td>
      <td width="31%"> 
        <select name="hd_zyxxtx_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%> 
        </select>
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
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtx_khcksj, "�ͻ��鿴ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtx_khcksj2, "�ͻ��鿴ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtxly_lycksj, "���Բ鿴ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtxly_lycksj2, "���Բ鿴ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
