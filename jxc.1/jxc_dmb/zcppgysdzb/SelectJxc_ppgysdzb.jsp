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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_ppgysdzbList.jsp" name="selectform">
<div align="center">���ģ����ձ�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�ֹ�˾</td>
  <td width="32%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
    <%
	if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
	}
	else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
  </select></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ��</td> 
  <td><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(selectform)">
    <option value=""></option>
    <%
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc from jxc_ppxx where jxc_ppxx.pplb='1' order by ppmc","");
%>
  </select></td>
  <td align="right">��Ʒ��</td>
  <td><input name="ppmc" type="text"  value="" size="20" maxlength="50"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ��</td> 
  <td><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
  <td align="right">��Ӧ��</td>
  <td><input name="gysmc" type="text"  value="" size="20" maxlength="50"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�û���¼��</td>
  <td><input type="text" name="yhdlm" size="20" maxlength="16" >  </td>
  <td align="right">�û�����</td>
  <td><input type="text" name="yhkl" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�û�����</td>
  <td><input type="text" name="yhmc" size="20" maxlength="20" >  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ɵ�½ϵͳ��־</td>
  <td><input type="radio" name="kdlxtbz" value="Y">
    �ɵ�½
    <input type="radio" name="kdlxtbz" value="N">
    ���ɵ�½ </td>
  <td align="right">�Ƿ�����</td>
  <td><input type="radio" name="sfsd" value="Y">
    ����
    <input type="radio" name="sfsd" value="N">
    δ���� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ѿ���½ʧ�ܴ���</td>
  <td><input type="text" name="lxdlsbcs" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="lxdlsbcs2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����޸�ʱ��</td>
  <td><input type="text" name="mmxgsj" size="20" maxlength="10" >  </td>
  <td align="right">��</td>
  <td><input type="text" name="mmxgsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʹ������</td>
  <td><input type="text" name="mmsyzq" size="20" maxlength="8" >
    �� </td>
  <td align="right">��</td>
  <td><input type="text" name="mmsyzq2" size="20" maxlength="8" >
    �� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����½ʧ�ܴ���</td>
  <td><input type="text" name="yxdlsbcs" size="20" maxlength="8" >  </td>
  <td align="right">��</td>
  <td><input type="text" name="yxdlsbcs2" size="20" maxlength="8" ></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%
	cf.ajax(out);//����AJAX
%>


function changeFgs(FormName) 
{
	if (FormName.ssfgs.value=="")
	{
		return;
	}

	FormName.gysbm.length=1;

	var sql;
	sql="select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','��������','N','����������') from jxc_gysxx where jxc_gysxx.cllx='1'  and dqbm in(select dqbm from sq_dwxx where dwbh='"+FormName.ssfgs.value+"') order by sfhz desc,gysmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.gysbm,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.ppbm, "��Ʒ�Ʊ���"))) {
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	if(!(isNumber(FormName.lxdlsbcs, "�Ѿ���½ʧ�ܴ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.mmxgsj, "�����޸�ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.mmsyzq, "����ʹ������"))) {
		return false;
	}
	if(!(isNumber(FormName.yxdlsbcs, "�����½ʧ�ܴ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
