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

<form method="post" action="Hy_khxxbCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ˮ�ʷ�������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_khxxb_hykh" size="20" maxlength="10" >
              </td>
              <td width="14%"> 
                <div align="right">�������</div>
              </td>
              <td width="34%"> 
                <select name="hy_khxxb_kdlb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ��ѷ���</div>
              </td>
              <td width="33%"> 
                <select name="hy_khxxb_sfyfk" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+δ����&Y+�ѷ���","");
%> 
                </select>
              </td>
              <td width="14%"> 
                <div align="right">�տ���λ</div>
              </td>
              <td width="34%"> 
                <select name="hy_khxxb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">�������� ��</td>
              <td width="33%"> 
                <input type="text" name="hy_khxxb_fkrq" size="20" maxlength="10" >
              </td>
              <td width="14%" align="right">��</td>
              <td width="34%">
                <input type="text" name="hy_khxxb_fkrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_khxxb_fkr" size="20" maxlength="16" >
              </td>
              <td width="14%"> 
                <div align="right"></div>
              </td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ���ʹ��</div>
              </td>
              <td width="33%"> 
                <select name="hy_khxxb_sfysy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δʹ��</option>
                  <option value="Y">��ʹ��</option>
                </select>
              </td>
              <td width="14%"> 
                <div align="right">��Ա���</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hy_khxxb_hybh" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����ʹ������ ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_khxxb_syrq" size="20" maxlength="10" >
              </td>
              <td width="14%"> 
                <div align="right">��</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hy_khxxb_syrq2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.hy_khxxb_fkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_khxxb_fkrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_khxxb_syrq, "����ʹ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_khxxb_syrq2, "����ʹ������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
