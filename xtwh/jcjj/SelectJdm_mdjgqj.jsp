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

<form method="post" action="Jdm_mdjgqjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�Ŷ��۸��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mdjgqjbm" size="20" maxlength="2" >
              </td>
              <td width="15%"> 
                <div align="right">�Ŷ��۸�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mdjgqj" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ʼ��ȣ�>��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qskd" size="20" maxlength="8" > mm
              </td>
              <td width="15%"> 
                <div align="right">��ֹ��ȣ�<=��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzkd" size="20" maxlength="8" > mm
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ʼ�߶ȣ�>��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qsgd" size="20" maxlength="8" > mm
              </td>
              <td width="15%"> 
                <div align="right">��ֹ�߶ȣ�<=��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzgd" size="20" maxlength="8" > mm
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">������</td>
              <td width="35%"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select mlx,mlxmc from jdm_mlx order by mlx","");
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
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
	if(!(isNumber(FormName.qskd, "��ʼ���"))) {
		return false;
	}
	if(!(isNumber(FormName.zzkd, "��ֹ���"))) {
		return false;
	}
	if(!(isNumber(FormName.qsgd, "��ʼ�߶�"))) {
		return false;
	}
	if(!(isNumber(FormName.zzgd, "��ֹ�߶�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
