<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #CC0000}
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	String yhjs=(String)session.getAttribute("yhjs");
%>


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertSq_fxfzr.jsp" name="insertform" target="_blank">
<div align="center">��¼��ʩ���������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�����ֹ�˾</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
%>
    </select>  </td>
  <td align="right" width="18%">ʩ����</td> 
  <td width="32%"><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value=""></option>
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sgdmc","");
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����������</td>
  <td><input type="text" name="fzrmc" value="" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ա�</td> 
  <td width="32%"> 
    <input type="radio" name="xb"  value="M">��
    <input type="radio" name="xb"  value="W">Ů  </td>
  <td align="right" width="18%">�绰</td> 
  <td width="32%"> 
    <input type="text" name="dh" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">סַ</td> 
  <td width="32%"> 
    <input type="text" name="zz" value="" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">���֤��</td> 
  <td width="32%"> 
    <input type="text" name="sfzh" value="" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td colspan="3"><input type="radio" name="lx"  value="1">
    ľ��
      <input type="radio" name="lx"  value="2">
      ���߹�
      <input type="radio" name="lx"  value="3">
      ˮ�繤
      <input type="radio" name="lx"  value="4">
      ���Ṥ </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="75" rows="2"></textarea></td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[����ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.fzrmc)=="") {
		alert("������[�����������]��");
		FormName.fzrmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
