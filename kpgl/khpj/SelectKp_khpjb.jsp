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
        <form method="post" action="Kp_khpjbList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kp_khpjb_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="18%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="74" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">ǩԼ���� ��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ʼ�</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">���̽���</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "kp_khpjb_gcjd","1+����&2+��������&3+������","");
%> </td>
              <td width="18%"> 
                <div align="right">��������ʩ���̶�</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "kp_khpjb_wmsgcd","1+����&2+��������&3+������","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ʩ�����������</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "kp_khpjb_ctfw","1+����&2+��������&3+������","");
%> </td>
              <td width="18%"> 
                <div align="right">��˾���Ͳ���</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "kp_khpjb_pscl","1+����&2+��������&3+������","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ʩ���Ӵ������</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "kp_khpjb_dmcl","1+����&2+��������&3+������","");
%> </td>
              <td width="18%"> 
                <div align="right">���Ч��</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "kp_khpjb_sjxg","1+����&2+��������&3+������","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��Ʒ���</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "kp_khpjb_sjfw","1+����&2+��������&3+������","");
%> </td>
              <td width="18%"> 
                <div align="right">�������</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "kp_khpjb_jlfw","1+����&2+��������&3+������","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kp_khpjb_lrr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">ʩ������</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "kp_khpjb_sgzl","1+����&2+��������&3+������","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">¼��ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="kp_khpjb_lrsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="kp_khpjb_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)" name="button">
                <input type="reset"  value="����" name="reset">
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
	if(!(isDatetime(FormName.kp_khpjb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_khpjb_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
