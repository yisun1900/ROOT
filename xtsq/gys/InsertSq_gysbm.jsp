<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼�빩Ӧ��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="31%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��Ӧ������</td>
              <td colspan="3"> 
                <input type="text" name="gys" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��Ӧ�̵�ַ</td>
              <td colspan="3"> 
                <input type="text" name="gysdz" value="" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��Ӧ�̵绰</td>
              <td colspan="3"> 
                <input type="text" name="gysdh" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��Ӧ�̴���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="gyscz" value="" size="20" maxlength="50" >
              </td>
              <td width="18%"> 
                <div align="right">EMail</div>
              </td>
              <td width="32%"> 
                <input type="text" name="email" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������</td>
              <td width="31%"> 
                <input type="text" name="cwdm" value="" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right">��Ӧ�̸�����</td>
              <td width="32%"> 
                <input type="text" name="gysfzr" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4">ϵͳ��Ȩ</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ɵ�½ϵͳ��־</td>
              <td width="31%"><%
	cf.radioToken(out, "kdlxtbz","Y+�ɵ�½&N+���ɵ�½","");
%></td>
              <td rowspan="4" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
              <td rowspan="4"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�û���¼��</td>
              <td width="31%"> 
                <input type="text" name="yhdlm" value="" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�û�����</td>
              <td width="31%"> 
                <input type="text" name="yhkl" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�û�����</td>
              <td width="31%"> 
                <input type="text" name="yhmc" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="70" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.gys)=="") {
		alert("������[��Ӧ������]��");
		FormName.gys.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysdh)=="") {
		alert("������[��Ӧ�̵绰]��");
		FormName.gysdh.focus();
		return false;
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.yhdlm)!="") 
	{
		if(	javaTrim(FormName.yhkl)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhkl.focus();
			return false;
		}
		if(	javaTrim(FormName.yhmc)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhmc.focus();
			return false;
		}
		if(	!radioChecked(FormName.kdlxtbz)) {
			alert("��ѡ��[�ɵ�½ϵͳ��־]��");
			FormName.kdlxtbz[0].focus();
			return false;
		}

	}
	

	FormName.action="SaveInsertSq_gysbm.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
