<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">¼�����Ʒ���ı�����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��������</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
%> 
                </select>              </td>
              <td width="18%" align="right"><strong><font color="#FF0000">*</font></strong>�Ƿ��Ƽ���Ʒ</td>
              <td width="32%"><%
	cf.radioToken(out, "sftjcp","Y+��&N+��","N");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>���Ĵ���</td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>����С��</td>
              <td width="32%"> 
                <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm order by clxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>��Ʒ��</td>
              <td width="32%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>��������</td>
              <td colspan="3"> 
                <input type="text" name="clmc" value="" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���/ϵ��</td>
              <td colspan="3"> 
                <input type="text" name="cllbbm" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ͺ�</td>
              <td colspan="3"> 
                <input type="text" name="xh" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���</td>
              <td colspan="3"> 
                <input type="text" name="gg" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ɫ</td>
              <td width="32%"> 
                <input type="text" name="clysbm" value="" size="20" maxlength="100" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>������λ</td>
              <td width="32%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>�г����              </td>
              <td width="32%"> 
                <input type="text" name="lsj" value="" size="20" maxlength="9" >              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>���ۼ�              </td>
              <td width="32%"> 
                <input type="text" name="xsj" value="" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"><font color="#FF0000">*</font>��������޼�</td>
              <td><input name="zdxsj" type="text" id="zdxsj" value="0" size="20" maxlength="9" ></td>
              <td align="right"><font color="#FF0000">*</font>ҵ���������</td>
              <td><input name="yjjrbl" type="text" value="100" size="10" maxlength="9" >
              % <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"><font color="#FF0000">*</font>���㷽ʽ</td>
              <td><%
	cf.radioToken(out, "jsfs","1+�����&2+�������","");
%></td>
              <td align="right"><font color="#FF0000">*</font>��������</td>
              <td><input type="text" name="cxhdbl" value="" size="10" maxlength="8" >
% <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����</td>
              <td width="32%"> 
                <input type="text" name="cbj" value="" size="20" maxlength="9" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�������</td>
              <td width="32%"> 
                <input type="text" name="jsbl" value="" size="10" maxlength="8" >
                % <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            
            <tr bgcolor="#E8E8FF">
              <td align="right" height="2"><font color="#FF0000">*</font>�Ƿ��д���</td>
              <td height="2" bgcolor="#E8E8FF"><input type="radio" name="sfycx" value="N">
û����
  <input type="radio" name="sfycx" value="Y">
�д��� </td>
              <td align="right" height="2">������</td>
              <td height="2"><input type="text" name="cxj" value="" size="20" maxlength="9" ></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" height="2">������ʼʱ��</td>
              <td width="32%" height="2" bgcolor="#E8E8FF"> 
                <input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right" height="2">��������ʱ��</td>
              <td width="32%" height="2"> 
                <input type="text" name="cxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">���������</td>
              <td width="32%"><input type="text" name="cxcbj" value="" size="20" maxlength="9" ></td>
              <td width="18%" align="right">�����������</td>
              <td width="32%"><input type="text" name="cxjsbl" value="" size="10" maxlength="9" >
% <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">�����ڼ�������</td>
              <td width="32%"> 
                <input type="text" name="lscxhdbl" value="" size="10" maxlength="9" >
                % <font color="#0000CC">���ٷֱȣ�</font> </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>������ҵ���������</td>
              <td width="32%"><input name="cxyjjrbl" type="text" value="" size="10" maxlength="9" >
% <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ��л�</td>
              <td bgcolor="#FFFFFF"><input type="radio" name="sfyh" value="Y" checked>
�л�
  <input type="radio" name="sfyh" value="N">
�޻� </td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ�������</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="radio" name="sfbhpj" value="Y">
                ���� 
                <input name="sfbhpj" type="radio" value="N" checked>
                ������ </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">�������</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="pjts" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                ��Ʒ����              </td>
              <td width="32%"> 
                <input type="text" name="cpjb" value="" size="20" maxlength="50" >              </td>
              <td width="18%" align="right"> 
                �������              </td>
              <td width="32%"> 
                <input type="text" name="fgsx" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ʒ˵��</td>
              <td colspan="3"> 
                <input type="text" name="cpsm" size="73" maxlength="200">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <input type="text" name="cd" value="" size="20" maxlength="50" >              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���۷�ʽ</td>
              <td colspan="3"><%
	cf.radioToken(out, "xsfs","1+����Ʒ&4+��������","1");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                  <input type="button"  value="�������" onClick="bc.disabled=false;" >
                  <input type="reset"  value="����" name="reset">
                </p>              </td>
            </tr>
          </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>

var fieldName="";

function changeDl(FormName)
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		FormName.cldlbm.selectedIndex=0;
		return false;
	}

	FormName.clxlbm.length=1;
	FormName.ppmc.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	fieldName="cldlbm";

	var sql;
	sql="select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlbm";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function changeXl(FormName)
{
	FormName.ppmc.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	fieldName="ppmc";

	var sql;
	sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dwlx in('A0','F0') and cxbz='N' and dqbm='"+FormName.dqbm.value+"') and jxc_ppxx.cldl='"+FormName.cldlbm.value+"' order by jxc_ppxx.ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;
//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="cldlbm")
	{
		strToItem2(insertform.clxlbm,ajaxRetStr);

		changeXl(insertform);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(insertform.ppmc,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sftjcp)) {
		alert("��ѡ��[�Ƿ��Ƽ���Ʒ]��");
		FormName.sftjcp[0].focus();
		return false;
	}

	if(	javaTrim(FormName.cldlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.clmc)=="") {
		alert("������[��������]��");
		FormName.clmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("������[�г����]��");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "�г����"))) {
		return false;
	}
	if(	javaTrim(FormName.xsj)=="") {
		alert("������[���ۼ�]��");
		FormName.xsj.focus();
		return false;
	}
	if(!(isFloat(FormName.xsj, "���ۼ�"))) {
		return false;
	}
	if(	!radioChecked(FormName.jsfs)) {
		alert("��ѡ��[���㷽ʽ]��");
		FormName.jsfs[0].focus();
		return false;
	}
	if (FormName.jsfs[0].checked)
	{
		if(	javaTrim(FormName.cbj)=="") {
			alert("������[�����]��");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "�����"))) {
			return false;
		}
		if (parseFloat(FormName.cbj.value)==0)
		{
			alert("���ѣ���[�����]���㣬[�����]=0");
		}

		FormName.jsbl.value="";
	}
	else{
		if(	javaTrim(FormName.jsbl)=="") {
			alert("������[�������]��");
			FormName.jsbl.focus();
			return false;
		}
		if(!(isFloat(FormName.jsbl, "�������"))) {
			return false;
		}
		if (parseFloat(FormName.jsbl.value)<0 || parseFloat(FormName.jsbl.value)>100)
		{
			alert("����[�������]Ӧ��0��100֮��");
			FormName.jsbl.focus();
			return false;
		}
		if (parseFloat(FormName.jsbl.value)==0)
		{
			alert("���ѣ���[�������]���㣬[�������]=0");
		}

		FormName.cbj.value="";
	}

	if(	javaTrim(FormName.zdxsj)=="") {
		alert("������[��������޼�]��");
		FormName.zdxsj.focus();
		return false;
	}
	if(!(isFloat(FormName.zdxsj, "��������޼�"))) {
		return false;
	}

	if(	javaTrim(FormName.yjjrbl)=="") {
		alert("������[ҵ���������]��");
		FormName.yjjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yjjrbl, "ҵ���������"))) {
		return false;
	}

	if(	javaTrim(FormName.cxhdbl)=="") {
		alert("������[��������]��");
		FormName.cxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.cxhdbl.value)<0 || parseFloat(FormName.cxhdbl.value)>100)
	{
		alert("����[��������]Ӧ��0��100֮��");
		FormName.cxhdbl.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("��ѡ��[�Ƿ��д���]��");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxj)=="") {
			alert("������[������]��");
			FormName.cxj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxj, "������"))) {
			return false;
		}

		if (FormName.jsfs[0].checked)
		{
			if(	javaTrim(FormName.cxcbj)=="") {
				alert("������[���������]��");
				FormName.cxcbj.focus();
				return false;
			}
			if(!(isFloat(FormName.cxcbj, "���������"))) {
				return false;
			}
			if (parseFloat(FormName.cxcbj.value)==0)
			{
				alert("���ѣ���[�����]���㣬[���������]=0");
			}

			FormName.cxjsbl.value="";
		}
		else{
			if(	javaTrim(FormName.cxjsbl)=="") {
				alert("������[�����������]��");
				FormName.cxjsbl.focus();
				return false;
			}
			if(!(isFloat(FormName.cxjsbl, "�����������"))) {
				return false;
			}
			if (parseFloat(FormName.cxjsbl.value)<0 || parseFloat(FormName.cxjsbl.value)>100)
			{
				alert("����[�����������]Ӧ��0��100֮��");
				FormName.cxjsbl.focus();
				return false;
			}
			if (parseFloat(FormName.cxjsbl.value)==0)
			{
				alert("���ѣ���[�������]���㣬[�����������]=0");
			}

			FormName.cxcbj.value="";
		}

		
		
		
		
		if(	javaTrim(FormName.lscxhdbl)=="") {
			alert("������[�����ڼ�������]��");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.lscxhdbl, "�����ڼ�������"))) {
			return false;
		}
		if (parseFloat(FormName.lscxhdbl.value)<0 || parseFloat(FormName.lscxhdbl.value)>100)
		{
			alert("����[�����ڼ�������]Ӧ��0��100֮��");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(	javaTrim(FormName.cxkssj)=="") {
			alert("������[������ʼʱ��]��");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjzsj)=="") {
			alert("������[��������ʱ��]��");
			FormName.cxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjzsj, "��������ʱ��"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjzsj.value)
		{
			alert("[������ʼʱ��]���ܴ���[��������ʱ��]��");
			FormName.cxjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.cxyjjrbl)=="") {
			alert("������[������ҵ���������]��");
			FormName.cxyjjrbl.focus();
			return false;
		}
		if(!(isFloat(FormName.cxyjjrbl, "������ҵ���������"))) {
			return false;
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxcbj.value="";
		FormName.lscxhdbl.value="";
		FormName.cxkssj.value="";
		FormName.cxjzsj.value="";
		FormName.cxyjjrbl.value="";
	}

	if(	!radioChecked(FormName.sfyh)) {
		alert("��ѡ��[�Ƿ��л�]��");
		FormName.sfyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbhpj)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfbhpj[0].focus();
		return false;
	}
	if (FormName.sfbhpj[0].checked)
	{
		if(	javaTrim(FormName.pjts)=="") {
			alert("������[�������]��");
			FormName.pjts.focus();
			return false;
		}
		if(!(isNumber(FormName.pjts, "�������"))) {
			return false;
		}
	}
	else{
		FormName.pjts.value="";
	}



	FormName.action="SaveInsertJxc_clbm.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

//-->
</SCRIPT>
