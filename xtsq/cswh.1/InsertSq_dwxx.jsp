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
      <div align="center"> ��¼������</div>
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
              <td width="23%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td width="27%"> 
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
              <td width="22%" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td width="28%"> 
                <select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="23%" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="27%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
              </select>              </td>
              <td width="22%" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="28%">
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="23%" align="right"><font color="#CC0000">*</font>�����ֹ�˾</td>
              <td width="27%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(insertform)">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
%> 
              </select>              </td>
              <td width="22%" align="right"><font color="#CC0000">*</font>�ϼ���λ</td>
              <td width="28%"> 
                <select name="ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select dwbh,dwmc||'('||ssfgs||')' from sq_dwxx where dwlx in('A0','F0','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>��˾����</td>
              <td bgcolor="#CCCCFF">
			  <input type="radio" name="sfjms" value="N" checked>ֱӪ��˾
			  <input type="radio" name="sfjms" value="Y">���˹�˾
			  <input type="radio" name="sfjms" value="Q">������˾			  </td>
              <td align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>������־</td>
              <td bgcolor="#CCCCFF"><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value="N">δ����</option>
                <option value="Y">�ѳ���</option>
              </select></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="23%" align="right">����</td>
              <td width="27%"> 
                <input type="text" name="bianma" value="" size="6" maxlength="2" >
              ����ʩ���ӵȱ���ʹ�� </td>
              <td width="22%" align="right">�绰����</td>
              <td width="28%"><input name="dhqh" type="text" value="" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">������ʽ</td>
              <td width="27%"> 
                <select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs","");
%> 
              </select>              </td>
              <td width="22%" align="right">��׼����</td>
              <td width="28%"> 
                <input type="text" name="bzrs" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">������λ</td>
              <td width="27%"> 
                <select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw","");
%> 
              </select>              </td>
              <td width="22%" align="right">��λ����</td>
              <td width="28%"> 
                <select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="23%" align="right">��ͬ��ǰ׺</td>
              <td width="27%"> 
              <input type="text" name="hthqz" value="" size="20" maxlength="20" >              </td>
              <td width="22%" align="right">�������</td>
              <td width="28%">
                <input type="text" name="cwdm" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">��λ��ַ</td>
              <td colspan="3"> 
                <input type="text" name="dwdz" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" bgcolor="#FFFFFF" align="right">��λ�绰</td>
              <td colspan="3"> 
                <input type="text" name="dwdh" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">�ͷ��绰</td>
              <td colspan="3"> 
                <input type="text" name="kfdh" size="72" maxlength="50"  value="" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">��λ����</td>
              <td width="27%"> 
              <input type="text" name="dwcz" value="" size="20" maxlength="50" >              </td>
              <td width="22%" align="right">���</td>
              <td width="28%"><input name="xuhao" type="text" value="" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">��λ������</td>
              <td width="27%"> 
              <input type="text" name="dwfzr" value="" size="20" maxlength="20" >              </td>
              <td width="22%" align="right">��λEMail</td>
              <td width="28%"> 
                <input type="text" name="email" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">����ʱ��</td>
              <td width="27%" bgcolor="#FFFFFF"> 
              <input type="text" name="kdsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="22%" bgcolor="#FFFFFF" align="right">�ص�ʱ��</td>
              <td width="28%" bgcolor="#FFFFFF"> 
                <input type="text" name="gdsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr align="center" bgcolor="#CCCCFF"> 
              <td colspan="4" height="26"><b><font color="#FF0000">�������</font></b><font color="#FF0000"><b>��ֻ�зֹ�˾���ܲ���¼�룩</b></font></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">��װ�ͻ�����ҵ���տ����</td>
              <td bgcolor="#FFFFFF" width="27%"> 
                <input type="text" name="jryjbfb" value="" size="10" maxlength="20" >
              �� (��Էֹ�˾)</td>
              <td align="right" bgcolor="#FFFFFF" width="22%">��ƿͻ�����ҵ���տ����</td>
              <td bgcolor="#FFFFFF" width="28%"> 
                <input type="text" name="sjjryjbfb" value="" size="10" maxlength="20" >
                �� (��Էֹ�˾)</td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">Ͷ�߱��޹�Ӧ�̼��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcppbz","Y+�޶����޷�¼��&N+�޶�����¼��","");
%> <BR>
                <b><font color="#000099">Ͷ�߱���ʱ��[��Ӧ��]���������ȡ����</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">�����տ���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zcmmbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�","");
%>
                  <BR>
                  <b><font color="#000099">���������Ŀ�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">ľ���տ���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "mmbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�","");
%>
                  <BR>
                  <b><font color="#000099">������ľ�ſ�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">�����տ���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "cgjjbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�","");
%>
                  <BR>
              <b><font color="#000099">�����ճ����ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">�Ҿ��տ���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�","");
%>
                  <BR>
              <b><font color="#000099">�����ռҾ߿�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ûط�ʱ���Զ�����(4λ)</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="hfsjzdsz" value="" size="10" maxlength="4" >
                <br>
                <b><font color="#000099">���ݹ��̲����õĹ��̽��ȣ��Զ�������Ӧ�Ŀͷ��ط�ʱ�䣬��1λ�������طã���2λ�����ι��̻طã���3λ�����ڻطã���4λ���깤�ط� 
                ��1�����ã�0��������</font> </b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">������ѯ�ͻ�¼����</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zxkhlrjc","N+������&Y+����","");
%><b><br>
                <font color="#000099">��ѯ�ͻ����ϱ�����ǰ������¼�룬����������ǩ���Ǽ�</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">��ѯ�ͻ���ǰ¼������</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="zxkhlrts" value="" size="10" maxlength="8" >
                <br>
                <b><font color="#000099">ǩ���Ǽ��У�[��ѯ¼��ʱ��]��[ǩ��¼��ʱ��]���������С����</font>                </b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">����ǩ���ͻ���¼���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "qdkhbljc","N+������&Y+����","");
%><br>
                <b><font color="#000099">�Բ�¼ǩ���ͻ��������ƣ�����ĳ����󣬲�����¼</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">ǩ���ͻ���¼��������</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="qdkhblts" value="" size="10" maxlength="8" >
                <br>
                <b><font color="#000099">ǩ���Ǽ��У�[ǩ��¼��ʱ��]��[ǩԼʱ��]��������������</font></b>              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ɶ�����[<b>��ĿרԱ</b>]����</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "xmzyglbz","N+������&Y+����","");
%> <br>
                <b><font color="#000099">���ɼҾӶ�������ĿרԱ���Ҿӹ��ʵȽ��й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ɶ�����[<b>�Ҿӹ���</b>]����</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjgwglbz","N+������&Y+����","");
%> <br>
                <b><font color="#000099">���ɼҾӶ����ԼҾӹ��ʽ��й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ɶ�����[<b>�Ҿ����ʦ</b>]����</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjsjsglbz","N+������&Y+����","");
%> <br>
                <b><font color="#000099">���ɼҾӶ����ԼҾ����ʦ���й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFCC" align="right">�ͻ���Ϣ����ʱ��</td>
              <td colspan="3" bgcolor="#FFFFCC"><p>
                <input type="text" name="khxxglsj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">
                <strong><font color="#0000FF">��ֻ���ܲ����ã��ֹ�˾�������ô˲�����</font> </strong></p>              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFCC" align="right">ÿ��ҵ����תʱ��</td>
              <td colspan="3" bgcolor="#FFFFCC"> <%
	cf.radioToken(out, "jzyf","1+��ת����&2+��ת����","");
%> &nbsp;&nbsp;��ת���� 
                <input type="text" name="gdjzrq" value="" size="4" maxlength="2">
                ��<font color="#0000FF"><strong>��0��ʾ��ĩ)</strong></font> &nbsp;&nbsp; ���ռ�ʱ��24Сʱ�� 
                <input type="text" name="drjs" value="" size="4" maxlength="2">
              ʱ<strong><font color="#0000FF">��ֻ���ܲ����ã�</font> </strong></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���õ��ӱ��ۼ��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "dzbjjc","1+1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]<BR>&2+2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���]<BR>&3+3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬����¼����<BR>&6+6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬��¼����<BR>&4+4�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸ�<BR>&7+7��[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸģ��ɸ������Ż�<BR>&5+5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]","");
%></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ɶ�������С��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddblxs","2+2λС��&1+1λС��&0+������λ&-1+����ʮλ&-2+������λ&-3+����ǧλ","");
%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">���ɶ�����ϸ����С��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddmxblxs","2+2λС��&1+1λС��&0+������λ&-1+����ʮλ&-2+������λ&-3+����ǧλ","");
%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">���Ķ�������¼�뷽ʽ</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "djlrfs","1+¼�뵥�����ۿ�&2+¼���ۿ��㵥��&3+���ɴ���","");
%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">���ģ���׼���ñ���</td>
              <td><input type="text" name="bzlybl" size="14" maxlength="9" >
                �ٷֱ� </td>
              <td align="right">���Ķ����ɸĴ��������</td>
              <td><%
	cf.radioToken(out, "kgcxhdbl","Y+�ɸ�&N+���ɸ�","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������ñ���������</td>
              <td><input type="text" name="lyblxx" size="14" maxlength="9" >
                �ٷֱ�</td>
              <td align="right">�������ñ��������� </td>
              <td><input type="text" name="lyblsx" size="14" maxlength="9" >
                �ٷֱ�</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ӱ��۱�ע</td>
              <td colspan="3"><textarea name="dzbjbz" cols="71" rows="21"></textarea>              </td>
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
		if(	javaTrim(FormName.bzlybl)=="") {
			alert("������[��׼���ñ���]��");
			FormName.bzlybl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzlybl, "��׼���ñ���"))) {
			return false;
		}
		if(	javaTrim(FormName.lyblxx)=="") {
			alert("������[���ñ�������]��");
			FormName.lyblxx.focus();
			return false;
		}
		if(!(isFloat(FormName.lyblxx, "���ñ�������"))) {
			return false;
		}
		if(	javaTrim(FormName.lyblsx)=="") {
			alert("������[���ñ�������]��");
			FormName.lyblsx.focus();
			return false;
		}
		if(!(isFloat(FormName.lyblsx, "���ñ�������"))) {
			return false;
		}
 
		if(	javaTrim(FormName.bianma)=="") {
			alert("��ѡ��[����]��");
			FormName.bianma.focus();
			return false;
		}
		if(	javaTrim(FormName.jryjbfb)=="") {
			alert("��ѡ��[��װ�ͻ�����ҵ���տ����]��");
			FormName.jryjbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.jryjbfb, "��װ�ͻ�����ҵ���տ����"))) {
			return false;
		}
		if(parseFloat(FormName.jryjbfb.value)<0 || parseInt(FormName.jryjbfb.value)>100) 
		{
			alert("[��װ�ͻ�����ҵ���տ����]����ֻ����0��100֮��");
			FormName.jryjbfb.select();
			return false;
		}
		if(	javaTrim(FormName.sjjryjbfb)=="") {
			alert("��ѡ��[��ƿͻ�����ҵ���տ����]��");
			FormName.sjjryjbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.sjjryjbfb, "��ƿͻ�����ҵ���տ����"))) {
			return false;
		}

		if(parseFloat(FormName.sjjryjbfb.value)<0 || parseInt(FormName.sjjryjbfb.value)>100) 
		{
			alert("[��ƿͻ�����ҵ���տ����]����ֻ����0��100֮��");
			FormName.sjjryjbfb.select();
			return false;
		}

		if(	!radioChecked(FormName.jcppbz)) {
			alert("��ѡ��[Ͷ�߱��޹�Ӧ�̼��]��");
			FormName.jcppbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zcmmbz)) {
			alert("��ѡ��[�����տ���]��");
			FormName.zcmmbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.mmbz)) {
			alert("��ѡ��[ľ���տ���]��");
			FormName.mmbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.cgjjbz)) {
			alert("��ѡ��[�����տ���]��");
			FormName.cgjjbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjbz)) {
			alert("��ѡ��[�Ҿ��տ���]��");
			FormName.jjbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zxkhlrjc)) {
			alert("��ѡ��[������ѯ�ͻ�¼����]��");
			FormName.zxkhlrjc[0].focus();
			return false;
		}
		if (FormName.zxkhlrjc[1].checked)
		{
			if(	javaTrim(FormName.zxkhlrts)=="") {
				alert("��ѡ��[��ѯ�ͻ���ǰ¼������]��");
				FormName.zxkhlrts.focus();
				return false;
			}
			if(!(isNumber(FormName.zxkhlrts, "��ѯ�ͻ���ǰ¼������"))) {
				return false;
			}
		}
		else{
			FormName.zxkhlrts.value="";
		}


		if(	!radioChecked(FormName.qdkhbljc)) {
			alert("��ѡ��[����ǩ���ͻ���¼���]��");
			FormName.qdkhbljc[0].focus();
			return false;
		}
		if (FormName.qdkhbljc[1].checked)
		{
			if(	javaTrim(FormName.qdkhblts)=="") {
				alert("��ѡ��[ǩ���ͻ���¼��������]��");
				FormName.qdkhblts.focus();
				return false;
			}
			if(!(isNumber(FormName.qdkhblts, "ǩ���ͻ���¼��������"))) {
				return false;
			}
		}
		else{
			FormName.qdkhblts.value="";
		}

		if(	!radioChecked(FormName.dzbjjc)) {
			alert("��ѡ��[���õ��ӱ��ۼ��]��");
			FormName.dzbjjc[0].focus();
			return false;
		}

		if(	javaTrim(FormName.hfsjzdsz)=="") {
			alert("��ѡ��[���ûط�ʱ���Զ�����]��");
			FormName.hfsjzdsz.focus();
			return false;
		}
		if (FormName.hfsjzdsz.value.length!=4)
		{
			alert("[���ûط�ʱ���Զ�����]����4λ��");
			FormName.hfsjzdsz.focus();
			return false;
		}


		if(	!radioChecked(FormName.xmzyglbz)) {
			alert("��ѡ��[���ɶ�������ĿרԱ����]��");
			FormName.xmzyglbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjgwglbz)) {
			alert("��ѡ��[���ɶ����ԼҾӹ��ʹ���]��");
			FormName.jjgwglbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjsjsglbz)) {
			alert("��ѡ��[���ɶ����ԼҾ����ʦ���˱�־]��");
			FormName.jjsjsglbz[0].focus();
			return false;
		}

		if(	!radioChecked(FormName.jcddblxs)) {
			alert("��ѡ��[���ɶ�������С��]��");
			FormName.jcddblxs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jcddmxblxs)) {
			alert("��ѡ��[���ɶ�����ϸ����С��]��");
			FormName.jcddmxblxs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.djlrfs)) {
			alert("��ѡ��[���Ķ�������¼�뷽ʽ]��");
			FormName.djlrfs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.kgcxhdbl)) {
			alert("��ѡ��[���Ķ����ɸĴ��������]��");
			FormName.kgcxhdbl[0].focus();
			return false;
		}
		if (FormName.djlrfs[2].checked)
		{
			if (FormName.kgcxhdbl[0].checked)
			{
				alert("���󣡵��۲��ɴ��ۣ�����ѡ�񡾲��ɸġ�");
				FormName.kgcxhdbl[1].focus();
				return false;
			}
		}
	}

	if(!(isDatetime(FormName.khxxglsj, "�ͻ���Ϣ����ʱ��"))) {
		return false;
	}
	if (FormName.dwlx.value=="A0")
	{
		if(	javaTrim(FormName.khxxglsj)=="") {
			alert("��ѡ��[�ͻ���Ϣ����ʱ��]��");
			FormName.khxxglsj.focus();
			return false;
		}


		if(	!radioChecked(FormName.jzyf)) {
			alert("��ѡ��[��ת�·�]��");
			FormName.jzyf[0].focus();
			return false;
		}

		if(	javaTrim(FormName.gdjzrq)=="") {
			alert("��ѡ��[��ת����]��");
			FormName.gdjzrq.focus();
			return false;
		}
		if(!(isInt(FormName.gdjzrq, "��ת����"))) {
			return false;
		}

		if(parseInt(FormName.gdjzrq.value)<0 || parseInt(FormName.gdjzrq.value)>31) 
		{
			alert("[��ת����]����ֻ����0��31֮�䣬0��ʾ��ĩ");
			FormName.gdjzrq.select();
			return gdjzrq;
		}

		if (parseInt(FormName.gdjzrq.value)==0 || parseInt(FormName.gdjzrq.value)>10)
		{
			if(FormName.jzyf[1].checked) 
			{
				alert("����ֻ��ѡ��[��ת����]");
				FormName.jzyf[0].focus();
				return false;
			}
		}

		
		if(	javaTrim(FormName.drjs)=="") {
			alert("��ѡ��[���ռ�ʱ]��");
			FormName.drjs.focus();
			return false;
		}
		if(!(isInt(FormName.drjs, "���ռ�ʱ"))) {
			return false;
		}

		if(parseInt(FormName.drjs.value)<=0 || parseInt(FormName.drjs.value)>24) 
		{
			alert("[���ռ�ʱ]����ֻ����0��24֮��");
			FormName.drjs.select();
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
