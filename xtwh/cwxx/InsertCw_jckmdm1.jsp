<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+fgsbh+"'");

%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jckmdm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���</td>
      <td width="32%"> 
        <input type="text" name="xuhao" value="" size="20" maxlength="8" >      </td>
      <td align="right" width="19%">��Ŀ����</td>
      <td width="31%"> 
        <input type="text" name="kmdm" value="" size="20" maxlength="40" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��Ŀ����</td>
      <td width="32%"> 
        <input type="text" name="kmmc" value="" size="20" maxlength="50" >      </td>
      <td align="right" width="19%">����</td>
      <td width="31%"> 
        <input type="radio" name="yefx" value="��">��
        <input type="radio" name="yefx" value="��">��      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" height="22" align="right">�տ�����</td>
      <td height="22" colspan="3"> 
        <input type="radio" name="fklxbm" value="21" <%if (fklxbm.equals("21")) out.print("CHECKED");%>>
        ľ�ſ� 
        <input type="radio" name="fklxbm" value="22" <%if (fklxbm.equals("22")) out.print("CHECKED");%>>
        ����� 
        <input type="radio" name="fklxbm" value="23" <%if (fklxbm.equals("23")) out.print("CHECKED");%>>
        ���Ŀ� 
        <input type="radio" name="fklxbm" value="24" <%if (fklxbm.equals("24")) out.print("CHECKED");%>>
        �Ҿ߿�
        <input type="radio" name="fklxbm" value="81" <%if (fklxbm.equals("81")) out.print("CHECKED");%>>
        ���� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��Ӧ��</td>
      <td colspan="3">
        <select name="cwdm" style="FONT-SIZE:12PX;WIDTH:532PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cwdm,gys||'�����룺'||cwdm||'��' from sq_gysxx where dqbm='"+dqbm+"' and cwdm is not null order by gys","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�����־</td>
      <td width="32%"> 
        <input type="radio" name="jdbz"  value="1">
        �裨�˿ 
        <input type="radio" name="jdbz"  value="0">
        �����տ </td>
      <td align="right" width="19%">�ֹ�˾����</td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') and dwbh='"+fgsbh+"' order by dwbh","");
%> 
        </select>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.xuhao)=="") {
		alert("������[���]��");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isNumber(FormName.xuhao, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.kmdm)=="") {
		alert("������[��Ŀ����]��");
		FormName.kmdm.focus();
		return false;
	}
	if(	javaTrim(FormName.kmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.kmmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.fklxbm)) {
		alert("��ѡ��[�տ�����]��");
		FormName.fklxbm[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jdbz)) {
		alert("��ѡ��[�����־]��");
		FormName.jdbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.yefx)) {
		alert("��ѡ��[����]��");
		FormName.yefx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾����]��");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
