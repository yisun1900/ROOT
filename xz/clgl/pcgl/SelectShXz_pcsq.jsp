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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_pcsqShList.jsp" name="selectform">
  <div align="center">�ɳ� </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�������</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sqxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">�ɳ�״̬</td>
      <td width="32%"> 
        <select name="xz_pcsq_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="1">�����ɳ�</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ó�ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_ycsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_ycsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_fhsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_fhsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ó�����</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_ycsy" size="20" maxlength="200" >
      </td>
      <td align="right" width="18%">Ŀ�ĵ�</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_mdd" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">���벿��</td>
      <td width="32%"> 
        <select name="xz_pcsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else  
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�������� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ɳ���</td>
      <td width="32%"> 
        <select name="xz_pcsq_qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm order by qcph","");
%> 
        </select>
      </td>
      <td align="right" width="18%">�ɳ���</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_pzr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�����ͺ�</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_qcxh" size="20" maxlength="40" >
      </td>
      <td align="right" width="18%">˾������</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ɳ�ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_pzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_pzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼����</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">¼��ʱ��</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.xz_pcsq_sqxh, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_ycsj, "�ó�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_ycsj2, "�ó�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_fhsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_fhsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_sqrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_sqrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_pzsj, "�ɳ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_pzsj2, "�ɳ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>