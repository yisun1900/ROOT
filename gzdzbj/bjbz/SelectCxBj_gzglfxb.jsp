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
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_gzglfxbCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���ϱ����</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_glbxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="15%">���ۼ���</td>
      <td width="35%"><%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <select name="bj_gzglfxb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
        </select>
      </td>
      <td align="right" width="15%">��Ŀ���</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_xmbh" size="20" maxlength="16" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��Ŀ����</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_xmmc" size="20" maxlength="100" >
      </td>
      <td align="right" width="15%">��Ŀ����</td>
      <td width="35%"> 
        <select name="bj_gzglfxb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ĿС��</td>
      <td width="35%"> 
        <select name="bj_gzglfxb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
        </select>
      </td>
      <td align="right" width="15%">���Ϸ���</td>
      <td width="35%"> 
        <select name="bj_gzglfxb_glflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��������</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_glmc" size="20" maxlength="100" >
      </td>
      <td align="right" width="15%">Ʒ��</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_pp" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ͺŹ��</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_xhgg" size="20" maxlength="100" >
      </td>
      <td align="right" width="15%">������λ</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_jldwbm" size="20" maxlength="2" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_xhl" size="20" maxlength="17" >
      </td>
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_dj" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">¼����</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">¼��ʱ��</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_lrsj" size="20" maxlength="10" >
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
	if(	javaTrim(FormName.bj_gzglfxb_dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.bj_gzglfxb_dqbm.focus();
		return false;
	}

	if(!(isNumber(FormName.bj_gzglfxb_glbxh, "���ϱ����"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_gzglfxb_xhl, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_gzglfxb_dj, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_gzglfxb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
