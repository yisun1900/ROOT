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
<form method="post" action="Xz_pcsqCxList.jsp" name="selectform">
  <div align="center">�ɳ�����ѯ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�������</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sqxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="15%">�ɳ�״̬</td>
      <td width="35%"> 
        <select name="xz_pcsq_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">�����ɳ�</option>
          <option value="2">���ɳ�</option>
          <option value="3">��ͬ��</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ó�ʱ�� ��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_ycsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_ycsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����ʱ�� ��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_fhsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_fhsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ó�����</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_ycsy" size="20" maxlength="200" >
      </td>
      <td align="right" width="15%">Ŀ�ĵ�</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_mdd" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">���벿��</td>
      <td width="35%"> 
        <select name="xz_pcsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�������� ��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sqrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sqrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���ɳ���</td>
      <td width="35%"> 
        <select name="xz_pcsq_qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm order by qcph","");
%> 
        </select>
      </td>
      <td align="right" width="15%">�ɳ���</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_pzr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�����ͺ�</td>
      <td width="35%"> 
        <input type="text" name="xz_qcdm_qcxh" size="20" maxlength="40" >
      </td>
      <td align="right" width="15%">˾������</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ɳ�ʱ�� ��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_pzsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_pzsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">¼����</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">¼��ʱ��</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_lrsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">��ѯ�������</td>
      <td colspan="3">��һ�� 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="xz_pcsq.pzsj desc">�ɳ�ʱ��</option>
          <option value="xz_pcsq.sqxh">�������</option>
          <option value="xz_pcsq.dwbh">���벿��</option>
          <option value="xz_pcsq.qcph">�����ƺ�</option>
          <option value="xz_pcsq.lrsj desc">¼��ʱ��</option>
          <option value="xz_pcsq.sqrq desc">��������</option>
          <option value="xz_pcsq.clzt">�ɳ�״̬</option>
          <option value="xz_pcsq.ycsj desc">�ó�ʱ��</option>
          <option value="xz_pcsq.fhsj desc">����ʱ��</option>
          <option value="xz_pcsq.sjxm">˾������</option>
        </select>
        �ڶ��� 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="xz_pcsq.pzsj desc">�ɳ�ʱ��</option>
          <option value="xz_pcsq.sqxh">�������</option>
          <option value="xz_pcsq.dwbh">���벿��</option>
          <option value="xz_pcsq.qcph">�����ƺ�</option>
          <option value="xz_pcsq.lrsj desc">¼��ʱ��</option>
          <option value="xz_pcsq.sqrq desc">��������</option>
          <option value="xz_pcsq.clzt">�ɳ�״̬</option>
          <option value="xz_pcsq.ycsj desc">�ó�ʱ��</option>
          <option value="xz_pcsq.fhsj desc">����ʱ��</option>
          <option value="xz_pcsq.sjxm">˾������</option>
        </select>
        ������ 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="xz_pcsq.pzsj desc">�ɳ�ʱ��</option>
          <option value="xz_pcsq.sqxh">�������</option>
          <option value="xz_pcsq.dwbh">���벿��</option>
          <option value="xz_pcsq.qcph">�����ƺ�</option>
          <option value="xz_pcsq.lrsj desc">¼��ʱ��</option>
          <option value="xz_pcsq.sqrq desc">��������</option>
          <option value="xz_pcsq.clzt">�ɳ�״̬</option>
          <option value="xz_pcsq.ycsj desc">�ó�ʱ��</option>
          <option value="xz_pcsq.fhsj desc">����ʱ��</option>
          <option value="xz_pcsq.sjxm">˾������</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">��ʾ���</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
        <input type="text" name="myxssl" size="7" maxlength="13" value="30">
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
