<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�����ֹ�˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�����ֹ�˾</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_dwxxGhFgsList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��λ���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="sq_dwxx_dwbh" size="20" maxlength="5" >
              </td>
              <td width="17%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="33%"> 
                <select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="A0">�ܲ�</option>
                  <option value="A1">�ܲ�������</option>
                  <option value="F0">�ֹ�˾</option>
                  <option value="F1">�ֹ�˾������</option>
                  <option value="F2">����</option>
                  <option value="F3">����С��</option>
                  <option value="J0">������</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��λ���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="sq_dwxx_dwjc" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_dwxx_dwmc" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��λ����</td>
              <td width="30%"> 
                <select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">��������</td>
              <td width="33%"> 
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�Ƿ����ü��ɶ���</td>
              <td width="30%"> 
                <input type="radio" name="jcppbz" value="Y">
                ���� 
                <input type="radio" name="jcppbz" value="N">
                ��</td>
              <td width="17%" align="right">�Ƿ����õ��ӱ���</td>
              <td width="33%"> 
                <input type="radio" name="qydzbjbz" value="1">
                δ�� 
                <input type="radio" name="qydzbjbz" value="2">
                ���� 
                <input type="radio" name="qydzbjbz" value="3">
                ȫ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">ǩ���Ǽ�ʱ����</td>
              <td width="30%"> 
                <input type="radio" name="djsjjcbz" value="Y">
                �� 
                <input type="radio" name="djsjjcbz" value="N">
                �� </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��������</td>
              <td width="30%"> 
                <select name="sq_dwxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">�Ƿ������</td>
              <td width="33%"> 
                <select name="sfjms" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">��</option>
                  <option value="Y">��</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�����ֹ�˾</td>
              <td width="30%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
                </select>
              </td>
              <td width="17%" align="right">�ϼ���λ</td>
              <td width="33%"> 
                <select name="sq_dwxx_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||ssfgs||')' from sq_dwxx where dwlx in('A0','F0','F2')  order by dwlx,ssfgs,dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ͬ��ǰ׺</td>
              <td width="30%"> 
                <input type="text" name="hthqz" value="" size="20" maxlength="5" >
              </td>
              <td width="17%" align="right">������־</td>
              <td width="33%"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ����</option>
                  <option value="Y">�ѳ���</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="20%" align="right">������λ</td>
              <td width="30%">
                <select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw","");
%> 
                </select>
              </td>
              <td width="17%" align="right">��λ����</td>
              <td width="33%">
                <select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��λ��ַ</td>
              <td width="30%"> 
                <input type="text" name="sq_dwxx_dwdz" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right">��ĿרԱ</td>
              <td width="33%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��λ������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="sq_dwxx_dwfzr" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">��λ�绰</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_dwxx_dwdh" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="sq_dwxx_dwcz" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">��λEMail</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_dwxx_email" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">��ѯ�������</td>
              <td colspan="3"> 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="sq_dwxx.dwbh">��λ���</option>
                  <option value="sq_dwxx.dwmc">��λ����</option>
                  <option value="sq_dwxx.ssfgs">�����ֹ�˾</option>
                  <option value="sq_dwxx.dwlx">��λ����</option>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
