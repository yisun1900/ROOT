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
	String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font>����ʩ����</div>              </td>
              <td width="32%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�೤����</td>
              <td width="32%"><input type="text" name="bzmc" value="" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����</td>
              <td><select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm","");
%>
              </select></td>
              <td align="right">��������</td>
              <td><input type="text" name="grsl" size="20" maxlength="50"  value="" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ù�������</td>
              <td><input name="yygrsl" type="text"  value="" size="20" maxlength="50" ></td>
              <td align="right">���ù�������</td>
              <td><input name="kygrsl" type="text"  value="" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>״̬</td>
              <td><%
	cf.radioToken(out, "tdbz","N+����&Y+ͣ��&K+����&L+��ְ","");
%></td>
              <td align="right">�Ա�</td>
              <td><input type="radio" name="xb"  value="M">
��
  <input type="radio" name="xb"  value="W">
Ů </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ְʱ��</td>
              <td><input name="rzsj" type="text" id="rzsj"  ondblclick="JSCalendar(this)" onKeyUp="keyGo(qyrq)" value="" size="20" maxlength="10"></td>
              <td align="right">��ְʱ��</td>
              <td><input name="lzsj" type="text" id="lzsj"  ondblclick="JSCalendar(this)" onKeyUp="keyGo(qyrq)" value="" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�绰</td>
              <td colspan="3"><input type="text" name="dh" value="" size="73" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>סַ</td>
              <td colspan="3"><input type="text" name="zz" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>������ϵ��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="jjlxr" value="" size="20" maxlength="20" >              </td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>��ϵ�˵绰</td>
              <td bgcolor="#FFFFFF"><input type="text" name="jjlxrdh" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>������ϵ�˵�ַ</td>
              <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text" id="jjlxrdz" value="" size="72" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>���֤��</td>
              <td width="32%"><input type="text" name="sfzh" value="" size="20" maxlength="18" ></td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ�ǩ�Ͷ���ͬ</td>
              <td width="32%"><input type="radio" name="sfqldht" value="Y" checked>
��
  <input type="radio" name="sfqldht" value="N">
��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ��ϱ���</td>
              <td colspan="3"><input type="radio" name="sfsbx" value="Y" checked>
��
  <input type="radio" name="sfsbx" value="N">
��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <P>
				<A HREF="�೤.xls"><B>����Ҽ����Ϊ������Excelģ��</B></A>&nbsp;&nbsp;&nbsp;
                <input name="button" type="button" onClick="LoadExc(insertform)"  value="����-Excel"></td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[����ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.bzmc)=="") {
		alert("������[�೤����]��");
		FormName.bzmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.tdbz)) {
		alert("��ѡ��[״̬]��");
		FormName.tdbz[0].focus();
		return false;
	}
	if(!(isNumber(FormName.grsl, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.yygrsl, "���ù�������"))) {
		return false;
	}
	if(!(isNumber(FormName.kygrsl, "���ù�������"))) {
		return false;
	}

	if(	javaTrim(FormName.dh)=="") {
		alert("������[�绰]��");
		FormName.dh.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfqldht)) {
		alert("��ѡ��[�Ƿ�ǩ�Ͷ���ͬ]��");
		FormName.sfqldht[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfsbx)) {
		alert("��ѡ��[�Ƿ��ϱ���]��");
		FormName.sfsbx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sfzh)=="") {
		alert("��ѡ��[���֤��]��");
		FormName.sfzh.focus();
		return false;
	}
	if(	javaTrim(FormName.zz)=="") {
		alert("��ѡ��[סַ]��");
		FormName.zz.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxr)=="") {
		alert("��ѡ��[������ϵ��]��");
		FormName.jjlxr.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdh)=="") {
		alert("��ѡ��[������ϵ�˵绰]��");
		FormName.jjlxrdh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdz)=="") {
		alert("��ѡ��[������ϵ�˵�ַ]��");
		FormName.jjlxrdz.focus();
		return false;
	}

	if(!(isDatetime(FormName.rzsj, "��ְʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj, "��ְʱ��"))) {
		return false;
	}

	FormName.action="SaveInsertSq_bzxx.jsp";
	FormName.submit();
	return true;
}

function LoadExc(FormName)//����FormName:Form������
{

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
