<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
      <div align="center">��λ��Ϣ��¼��</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
             <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
                  <input type="button"  value="¼����ĿרԱ" onClick="f_lr(insertform)" name="lr" disabled>
                  <input type="button"  value="�鿴��ĿרԱ" onClick="f_ck(insertform)" name="ck" disabled>
                </p>              </td>
            </tr>
             <tr bgcolor="#CCCCFF">
               <td bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ��ţ�5λ��</td>
               <td><input type="text" name="dwbh" value="" size="20" maxlength="5" onChange="changeDwbh(insertform)"></td>
               <td align="right"><font color="#CC0000">*</font>��λ����</td>
               <td><input type="text" name="dwmc" value="" size="20" maxlength="100" onChange="changeDwbh(insertform)"></td>
             </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td width="32%"> 
                <select name="dwlx" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changelx(insertform)">
                  <option value=""></option>
                  <option value="A0">�ܲ�</option>
                  <option value="A1">�ܲ�������</option>
                  <option value="F0">�ֹ�˾</option>
                  <option value="F1">�ֹ�˾������</option>
                  <option value="F2">����</option>
                  <option value="F3">���С��</option>
                  <option value="F4">�г�С��</option>
                  <option value="F5">����С��</option>
             </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td width="32%"> 
                <select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
              </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="32%">
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>�����ֹ�˾</td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(insertform)">
                  <option value=""></option>
              </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>�ϼ���λ</td>
              <td width="32%"> 
                <select name="ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>��˾����</td>
              <td bgcolor="#CCCCFF">
			  <input type="radio" name="sfjms" value="N" checked>ֱӪ��˾
			  <input type="radio" name="sfjms" value="Y">���˹�˾
			  <input type="radio" name="sfjms" value="Q">������˾			  </td>
              <td align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>�����־</td>
              <td bgcolor="#CCCCFF"><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value="N">δ����</option>
                <option value="Y">�ѳ���</option>
              </select></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <input type="text" name="bianma" value="" size="6" maxlength="2" >
                <font color="#FF0000"><strong>�ֹ�˾��¼</strong></font>(����ʩ���ӱ���)</td>
              <td width="18%" align="right">�绰����</td>
              <td width="32%"><input name="dhqh" type="text" value="" size="10" maxlength="10">
              <font color="#FF0000"><strong>�ֹ�˾����¼��</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������ʽ</td>
              <td width="32%"> 
                <select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs","");
%> 
              </select>              </td>
              <td width="18%" align="right">��׼����</td>
              <td width="32%"> 
                <input type="text" name="bzrs" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������λ</td>
              <td width="32%"> 
                <select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw","");
%> 
              </select>              </td>
              <td width="18%" align="right">��λ����</td>
              <td width="32%"> 
                <select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">��ͬ��ǰ׺</td>
              <td colspan="3"> 
              <input type="text" name="hthqz" value="" size="20" maxlength="20" >
              <strong><font color="#FF0000">����Ӧ¼�롾��ͬ��ǰ׺���������޷������ͬ��</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��λ��ַ</td>
              <td colspan="3"> 
                <input type="text" name="dwdz" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">��λ�绰</td>
              <td colspan="3"> 
                <input type="text" name="dwdh" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ͷ��绰</td>
              <td colspan="3"> 
                <input type="text" name="kfdh" size="72" maxlength="50"  value="" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��λ����</td>
              <td width="32%"> 
              <input type="text" name="dwcz" value="" size="20" maxlength="50" >              </td>
              <td width="18%" align="right">���</td>
              <td width="32%"><input name="xuhao" type="text" value="" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��λ������</td>
              <td width="32%"> 
              <input type="text" name="dwfzr" value="" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">��λEMail</td>
              <td width="32%"> 
                <input type="text" name="email" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">����ʱ��</td>
              <td width="32%" bgcolor="#FFFFFF"> 
              <input type="text" name="kdsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" bgcolor="#FFFFFF" align="right">�ص�ʱ��</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="gdsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
            
            
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
                </p>              </td>
            </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%
	cf.ajax(out);//����AJAX
%>

var czlx;

function changeDwbh(FormName) 
{
	if (FormName.dwlx.value=="F0")
	{
		strToSelect(insertform.ssfgs,insertform.dwbh.value+"+"+insertform.dwmc.value);
		return;
	}
}

function changelx(FormName) 
{
	FormName.ssdw.length=1;
	FormName.ssfgs.length=1;

	if(	javaTrim(FormName.dwlx)=="") 
	{
		return false;
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		FormName.dwlx.value="";
		return false;
	}

	if(!(isUpperCase(FormName.dwbh, "��λ���"))) {
		FormName.dwlx.value="";
		return false;
	}

	if (FormName.dwbh.value.length!=5)
	{
		alert("����[��λ���]����ӦΪ5λ��д��");
		FormName.dwbh.focus();
		FormName.dwlx.value="";
		return false;
	}

	if(	javaTrim(FormName.dwmc)=="") {
		alert("������[��λ����]��");
		FormName.dwmc.focus();
		FormName.dwlx.value="";
		return false;
	}

	czlx=1;

	var sql;

	if (FormName.dwlx.value=="A0")//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="A1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F0")
	{
		strToSelect(insertform.ssfgs,insertform.dwbh.value+"+"+insertform.dwmc.value);
		return;
	}
	else
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0') and cxbz='N'  order by dwbh";
	}


	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);

	openAjax(actionStr);
}

function changefgs(FormName) 
{
	if(	javaTrim(FormName.dwlx)=="") 
	{
		alert("��ѡ��[��λ����]��");
		FormName.dwlx.focus();
		return false;
	}

	FormName.ssdw.length=1;

	if(	javaTrim(FormName.ssfgs)=="") 
	{
		return false;
	}



	czlx=2;

	var sql;

	if (FormName.dwlx.value=="A0")//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="A1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F0")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='"+FormName.ssfgs.value+"' order by dwbh";
	}
	else if (FormName.dwlx.value=="F2")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='"+FormName.ssfgs.value+"' order by dwbh";
	}
	else if (FormName.dwlx.value=="F3" || FormName.dwlx.value=="F4" || FormName.dwlx.value=="F5")
	{
		sql="select dwbh,dwmc from sq_dwxx where ssfgs='"+FormName.ssfgs.value+"' and dwlx in('F1','F2') and cxbz='N'  order by dwlx,dwbh";
	}



	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (czlx==1)
	{
		strToSelect(insertform.ssfgs,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(insertform.ssdw,ajaxRetStr);
	}

}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	if(!(isUpperCase(FormName.dwbh, "��λ���"))) {
		return false;
	}

	if (FormName.dwbh.value.length!=5)
	{
		alert("����[��λ���]����ӦΪ5λ��д��");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.dwmc)=="") {
		alert("������[��λ����]��");
		FormName.dwmc.focus();
		return false;
	}

	if(	javaTrim(FormName.dwlx)=="") {
		alert("��ѡ��[��λ����]��");
		FormName.dwlx.focus();
		return false;
	}
	if(	javaTrim(FormName.dwflbm)=="") {
		alert("��ѡ��[��λ����]��");
		FormName.dwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdw)=="") {
		alert("��ѡ��[�ϼ���λ]��");
		FormName.ssdw.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.ssdqbm.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfjms)) {
		alert("��ѡ��[��˾����]��");
		FormName.sfjms[0].focus();
		return false;
	}

	if(!(isNumber(FormName.bzrs, "��׼����"))) {
		return false;
	}
	if(!(isDatetime(FormName.kdsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdsj, "�ص�ʱ��"))) {
		return false;
	}


	if (FormName.dwlx.value=="F0")//�ֹ�˾
	{
		if(	javaTrim(FormName.dhqh)=="") {
			alert("������[�绰����]��");
			FormName.dhqh.focus();
			return false;
		}
		if(!(isNumber(FormName.dhqh, "�绰����"))) {
			return false;
		}
		if(	javaTrim(FormName.bianma)=="") {
			alert("��ѡ��[����]��");
			FormName.bianma.focus();
			return false;
		}
		if (FormName.bianma.value.length!=2)
		{
			alert("����[����]����ӦΪ2λ��д��ĸ��");
			FormName.bianma.focus();
			return false;
		}
	}

	if(!(isInt(FormName.xuhao, "���"))) {
		return false;
	}

	
	
	FormName.action="SaveInsertSq_dwxx.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;


	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="InsertSq_xmzy.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="Sq_xmzyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
