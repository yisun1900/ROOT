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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_gdzcbTjList.jsp" name="selectform">
  <div align="center">�̶��ʲ�ͳ��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ǰ���ֹܷ�˾</td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_gdzcb_fgsbh,xz_gdzcb_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="19%">��ǰ���ܲ���</td>
      <td width="31%"> 
        <select name="xz_gdzcb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�̶��ʲ����</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_gsbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">�̶��ʲ�����</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_gdzcmc" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�����ڲ����</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_bmbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">�̶��ʲ�����</td>
      <td width="31%"> 
        <select name="xz_gdzcb_gdzcflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gdzcflbm,gdzcflmc from xz_gdzcflbm order by gdzcflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ͺ�</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_xh" size="20" maxlength="30" >
      </td>
      <td align="right" width="19%">Ʒ��</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_pp" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">����(CPU)</td>
      <td width="32%"> 
        <input type="text" name="pz1" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">����(�ڴ�)</td>
      <td width="31%"> 
        <input type="text" name="pz2" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">����(Ӳ��)</td>
      <td width="32%"> 
        <input type="text" name="pz3" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">����(����)</td>
      <td width="31%"> 
        <input type="text" name="pz4" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">����(�Կ�)</td>
      <td width="32%"> 
        <input type="text" name="pz5" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">����(��ʾ��)</td>
      <td width="31%"> 
        <input type="text" name="pz6" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_grsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_grsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�Ƿ��ѱ���</td>
      <td width="32%"> <%
	cf.radioToken(out, "xz_gdzcb_sfybf","Y+��&N+��","");
%> </td>
      <td align="right" width="19%">������</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_bgr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ƽ�ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="yjsj" value="" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="yjsj2" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%">
        <input type="text" name="xz_gdzcb_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ʲ������ֹ�˾</td>
      <td width="32%"> 
        <select name="ssfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' ","");
	}
%> 
        </select>
      </td>
      <td align="right" width="19%">¼����</td>
      <td width="31%">
        <input type="text" name="xz_gdzcb_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">�̶��ʲ�ͳ�Ʊ�</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="gdzcflmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.gsbh">�̶��ʲ����</option>
          <option value="xz_gdzcb.gdzcmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.bmbh">�����ڲ����</option>
          <option value="xz_gdzcb.xh">�ͺ�</option>
          <option value="xz_gdzcb.pp">Ʒ��</option>
          <option value="xz_gdzcb.sl">����</option>
          <option value="xz_gdzcb.grsj">����ʱ��</option>
          <option value="xz_gdzcb.lrsj">¼��ʱ��</option>
          <option value="xz_gdzcb.grj">�����</option>
          <option value="xz_gdzcb.bgr">������</option>
          <option value="dwmc">��ǰ���ܲ���</option>
          <option value="DECODE(xz_gdzcb.sfybf,'Y','��','N','��')">�Ƿ��ѱ���</option>
          <option value="xz_gdzcb.pz1">����(CPU)</option>
          <option value="xz_gdzcb.pz2">����(�ڴ�)</option>
          <option value="xz_gdzcb.pz3">����(Ӳ��)</option>
          <option value="xz_gdzcb.pz4">����(����)</option>
          <option value="xz_gdzcb.pz5">����(�Կ�)</option>
          <option value="xz_gdzcb.pz6">����(��ʾ��)</option>
        </select>
        �ڶ��� 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="gdzcflmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.gsbh">�̶��ʲ����</option>
          <option value="xz_gdzcb.gdzcmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.bmbh">�����ڲ����</option>
          <option value="xz_gdzcb.xh">�ͺ�</option>
          <option value="xz_gdzcb.pp">Ʒ��</option>
          <option value="xz_gdzcb.sl">����</option>
          <option value="xz_gdzcb.grsj">����ʱ��</option>
          <option value="xz_gdzcb.lrsj">¼��ʱ��</option>
          <option value="xz_gdzcb.grj">�����</option>
          <option value="xz_gdzcb.bgr">������</option>
          <option value="dwmc">��ǰ���ܲ���</option>
          <option value="DECODE(xz_gdzcb.sfybf,'Y','��','N','��')">�Ƿ��ѱ���</option>
          <option value="xz_gdzcb.pz1">����(CPU)</option>
          <option value="xz_gdzcb.pz2">����(�ڴ�)</option>
          <option value="xz_gdzcb.pz3">����(Ӳ��)</option>
          <option value="xz_gdzcb.pz4">����(����)</option>
          <option value="xz_gdzcb.pz5">����(�Կ�)</option>
          <option value="xz_gdzcb.pz6">����(��ʾ��)</option>
        </select>
        ������ 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="gdzcflmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.gsbh">�̶��ʲ����</option>
          <option value="xz_gdzcb.gdzcmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.bmbh">�����ڲ����</option>
          <option value="xz_gdzcb.xh">�ͺ�</option>
          <option value="xz_gdzcb.pp">Ʒ��</option>
          <option value="xz_gdzcb.sl">����</option>
          <option value="xz_gdzcb.grsj">����ʱ��</option>
          <option value="xz_gdzcb.lrsj">¼��ʱ��</option>
          <option value="xz_gdzcb.grj">�����</option>
          <option value="xz_gdzcb.bgr">������</option>
          <option value="dwmc">��ǰ���ܲ���</option>
          <option value="DECODE(xz_gdzcb.sfybf,'Y','��','N','��')">�Ƿ��ѱ���</option>
          <option value="xz_gdzcb.pz1">����(CPU)</option>
          <option value="xz_gdzcb.pz2">����(�ڴ�)</option>
          <option value="xz_gdzcb.pz3">����(Ӳ��)</option>
          <option value="xz_gdzcb.pz4">����(����)</option>
          <option value="xz_gdzcb.pz5">����(�Կ�)</option>
          <option value="xz_gdzcb.pz6">����(��ʾ��)</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">��ʾ���</td>
      <td colspan="3"> 
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.xz_gdzcb_grsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_grsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "�ƽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj2, "�ƽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
		alert("��ѡ��[ͳ����]��");
		FormName.tj1.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
