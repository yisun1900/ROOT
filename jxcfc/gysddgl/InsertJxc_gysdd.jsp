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
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
String sgph=cf.GB2Uni(request.getParameter("sgph"));

%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_gysdd.jsp" name="insertform">
<div align="center">�깺��תΪ��Ӧ�̶���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>�µ���˾</td> 
  <td width="32%">
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">�깺����</font></td> 
  <td width="32%"><input type="text" name="sgph" value="<%=sgph%>" size="20" maxlength="13" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>�ɹ����</td> 
  <td width="32%"><input name="cglb" type="radio"  value="J" checked>
    ���Ųɹ�</td>
  <td align="right" width="18%"><font color="#CC0000">*</font>�������</td> 
  <td width="32%"><input name="cllb" type="radio"  value="1" checked>
    ���� </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>���ͷ�ʽ</td> 
  <td width="32%"><input type="radio" name="psfs"  value="1">
    ����
      <input type="radio" name="psfs"  value="2">
      ��ȡ
      <input type="radio" name="psfs"  value="3">
      ���� </td>
  <td align="right" width="18%">Ҫ�󵽻�ʱ��</td> 
  <td width="32%"><input type="text" name="yqdhsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><span class="STYLE2 STYLE1"><font color="#0000CC">¼����</font></span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#CC0000">*</font><span class="STYLE1"><font color="#0000CC">¼��ʱ��</font></span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right"><font color="#CC0000">*</font>�Ƿ�ֱ������깺��λ</td>
  <td><input name="sfrksgdw" type="radio"  value="Y" >����깺��λ
  <input name="sfrksgdw" type="radio"  value="N" >��  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�µ���˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sgph)=="") {
		alert("������[�깺����]��");
		FormName.sgph.focus();
		return false;
	}
	if(	javaTrim(FormName.cglb)=="") {
		alert("������[�ɹ����]��");
		FormName.cglb.focus();
		return false;
	}
	if(	javaTrim(FormName.cllb)=="") {
		alert("������[�������]��");
		FormName.cllb.focus();
		return false;
	}
	if(	!radioChecked(FormName.psfs)) {
		alert("��ѡ��[���ͷ�ʽ]��");
		FormName.psfs[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yqdhsj, "Ҫ�󵽻�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfrksgdw)) {
		alert("��ѡ��[�Ƿ�ֱ������깺��λ]��");
		FormName.sfrksgdw[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
