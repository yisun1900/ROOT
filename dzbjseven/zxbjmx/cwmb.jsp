<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ά��ģ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<%
	String yhdlm=(String)session.getAttribute("yhdlm");
	String khbh=request.getParameter("khbh");
	String fgsbh=cf.executeQuery("select ssfgs from crm_zxkhxx where khbh='"+khbh+"'");
%>
<body bgcolor="#FFFFFF">
<div align="center"></div>
<form method="post" action="" name="editform" target="_blank">
		<input name="fgsbh" type="hidden" value="<%=fgsbh%>">
		<input name="khbh" type="hidden" value="<%=khbh%>">
  <HR>
  <table width="100%" border="0" style="FONT-SIZE:16">
    <tr> 
      <td align="center" height="27" colspan="2"> 
        <p><b>1������Ϊģ��</b></p>
        </td>
    </tr>
    <tr>
      <td width="32%" height="57" align="right">&nbsp;</td>
      <td width="68%" height="57"> <b><font color="#FF0000">�ѡ���Ŀ���͡����䡿��Ϣ�����������������湤������ 
        <BR>
        �磺һ���ҡ������ҡ������Ҷ�������׼ģ�壬�Ա�������������ʱֱ�ӵ���</font></b>
      </td>
    </tr>
    <tr> 
      <td width="32%" height="57" align="right">ģ������</td>
      <td width="68%" height="57"> 
        <input type="text" name="newmbmc" size="30" maxlength="40">
        <input type="button"  value="����ģ��" onClick="f_bcmb(editform)">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td height="29" colspan="2" align="center">
        <p><b>2��ɾ��ģ��</b></p>
        <p><b>��<font color="#FF0000">�ѱ����ģ��ɾ��</font>��</b></p>
      </td>
    </tr>
    <tr> 
      <td width="32%" height="60" align="right">ģ������</td>
      <td width="68%" height="60"> 
        <select name="mbmc" style="FONT-SIZE:12PX;WIDTH:224PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct mbmc||'+'||yhdlm c1,mbmc||DECODE(bj_bjmbfjxx.mblx,'1','������ģ�壩','2','��˽��ģ�壩') c2  from bj_bjmbfjxx where yhdlm='"+yhdlm+"' and mblx='2' order by c1","");
%> 
        </select>
        <input type="button"  value="ɾ��ģ��" onClick="f_scmb(editform)">
        <input type="button"  value="�鿴ģ��" onClick="f_ckmb(editform)">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" height="27" colspan="2">
        <p><b>3������Ϊ��ʱ����</b></p>
        <p><b>��<font color="#FF0000">�ѡ�������Ŀ���͡�������Ϣ��������������ʱ���棬�Ա��ͻ��Ӽ��ֱ�������ѡ��</font>��</b></p>
      </td>
    </tr>
    <tr> 
      <td width="32%" height="59" align="right">��ʱ��������</td>
      <td width="68%" height="59"> 
        <input type="text" name="lsbjmc" size="30" maxlength="40">
        <input type="button"  value="������ʱ����" onClick="f_bclsbj(editform)" name="button">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td height="29" colspan="2" align="center">
        <p><b>4��ɾ����ʱ����</b></p>
        <p><b>��<font color="#FF0000">�ѱ������ʱ����ɾ��</font>��</b></p>
      </td>
    </tr>
    <tr> 
      <td width="32%" height="58" align="right">��ʱ��������</td>
      <td width="68%" height="58"> 
        <select name="sclsbjmc" style="FONT-SIZE:12PX;WIDTH:224PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mbmc,mbmc||'��'||bjjbmc||'��'  from bj_mbbjmc,bdm_bjjbbm where bj_mbbjmc.bjjb=bdm_bjjbbm.bjjbbm and khbh='"+khbh+"' order by mbmc","");
%> 
        </select>
        <input type="button"  value="ɾ����ʱ����" onClick="f_sclsbj(editform)" name="button2">
        <input type="button"  value="�鿴��ʱ����" onClick="f_cklsbj(editform)" name="button22">
      </td>
    </tr>
  </table>
  <HR>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_bcmb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.newmbmc)=="") {
		alert("������[��ģ������]��");
		FormName.newmbmc.focus();
		return false;
	}

	FormName.action="SaveCwmb.jsp";
	FormName.submit();
	return true;
}
function f_bclsbj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.lsbjmc)=="") {
		alert("������[��ʱ��������]��");
		FormName.lsbjmc.focus();
		return false;
	}

	FormName.action="SaveLsbj.jsp";
	FormName.submit();
	return true;
}
function f_scmb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.mbmc)=="") {
		alert("��ѡ��Ҫɾ����[ģ������]��");
		FormName.mbmc.focus();
		return false;
	}

	if ( confirm("ע�⣬ɾ���󲻿ɻָ���ȷʵҪɾ����") )	{
		FormName.action="DeleteCwmb.jsp";
		FormName.submit();
		return true;
	}

}
function f_ckmb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.mbmc)=="") {
		alert("��ѡ��[ģ������]��");
		FormName.mbmc.focus();
		return false;
	}

	FormName.action="ViewBj_bjmb.jsp";
	FormName.submit();
	return true;
}
function f_sclsbj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sclsbjmc)=="") {
		alert("��ѡ��Ҫɾ����[��ʱ��������]��");
		FormName.sclsbjmc.focus();
		return false;
	}

	if ( confirm("ע�⣬ɾ���󲻿ɻָ���ȷʵҪɾ����") )	{
		FormName.action="DeleteLsbj.jsp";
		FormName.submit();
		return true;
	}

}
function f_cklsbj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sclsbjmc)=="") {
		alert("��ѡ��[��ʱ��������]��");
		FormName.sclsbjmc.focus();
		return false;
	}

	FormName.action="ViewBj_lsbj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
