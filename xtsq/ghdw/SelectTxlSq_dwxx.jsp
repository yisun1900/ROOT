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
      <div align="center">ͨѶ¼��ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_dwxxTxlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��λ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwbh" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="35%"> 
                <select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="A0">�ܲ�</option>
                  <option value="A1">�ܲ�������</option>
                  <option value="F0">�ֹ�˾</option>
                  <option value="F1">�ֹ�˾������</option>
                  <option value="F2">����</option>
                  <option value="S0">ʩ����</option>
                  <option value="S1">ֱ��ʩ����</option>
                  <option value="S2">ʩ������</option>
                  <option value="G0" selected>��Ӧ��</option>
                  <option value="J0">������</option>
                  <option value="Y0">�칫��Ʒ��λ</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right">��Ӧ�����</td>
              <td width="31%"> 
                <select name="gyslb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">ľ��</option>
                  <option value="2">����</option>
                  <option value="3">�Ҿ�</option>
                  <option value="4">����</option>
                </select>
              </td>
              <td width="18%" align="right">�������</td>
              <td width="32%"> 
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlbm,zcdlmc from jdm_zcdlbm  order by zcdlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��λ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwjc" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwmc" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��������</td>
              <td width="35%"> 
                <select name="sq_dwxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
                </select>
              </td>
              <td width="15%" align="right">�Ƿ������</td>
              <td width="35%"> 
                <select name="sfjms" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">��</option>
                  <option value="Y">��</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�����ֹ�˾</td>
              <td width="31%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
                </select>
              </td>
              <td width="18%" align="right">�ϼ���λ</td>
              <td width="32%"> 
                <select name="sq_dwxx_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ͬ��ǰ׺</td>
              <td width="31%"> 
                <input type="text" name="hthqz" value="" size="20" maxlength="5" >
              </td>
              <td width="18%" align="right">�����־</td>
              <td width="32%"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ����</option>
                  <option value="Y">�ѳ���</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��λ��ַ</td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwdz" size="20" maxlength="100" >
              </td>
              <td width="15%" align="right">��ĿרԱ</td>
              <td width="35%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��λ������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwfzr" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">��λ�绰</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwdh" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="sq_dwxx_dwcz" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">��λEMail</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_email" size="20" maxlength="50" >
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
