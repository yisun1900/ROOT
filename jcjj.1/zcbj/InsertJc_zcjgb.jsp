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
String clxlbmstr=cf.getItemData("select zcxlmc c1,zcxlmc c2,zcdlmc from jdm_clxlbm order by zcdlmc,clxlbm");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");

String ppstr=null;
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
	ppstr=cf.getItemData("select sq_gysxx.gysmc c1,sq_gysxx.gysmc c2,zclb from sq_gysxx where sq_gysxx.gyslb='4' order by sq_gysxx.zclb,sq_gysxx.gysmc,sq_gysxx.dqbm");
}
else{
	ppstr=cf.getItemData("select sq_gysxx.gysmc c1,sq_gysxx.gysmc c2,zclb from sq_gysxx where sq_gysxx.gyslb='4' and sq_gysxx.dqbm='"+dqbm+"' order by sq_gysxx.dqbm,sq_gysxx.zclb,sq_gysxx.gysmc");
}
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
              <td width="18%" align="right"><strong><font color="#FF0000">*</font></strong>�Ƿ��Ƽ���Ʒ</td>
              <td width="32%"><%
	cf.radioToken(out, "sftjcp","Y+��&N+��","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>���Ĵ���</td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(cldlbm,clxlbm,<%=clxlbmstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_cldlbm  order by cldlbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>����С��</td>
              <td width="32%"> 
                <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(clxlbm,dwbh,<%=ppstr%>);selectItem(clxlbm,gys,<%=ppstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_clxlbm order by clxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>��Ʒ��</td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>
              </td>
              <td width="18%" align="right">�ڲ�����</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>��������</td>
              <td colspan="3"> 
                <input type="text" name="zcmc" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���/ϵ��</td>
              <td colspan="3"> 
                <input type="text" name="zclbbm" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ͺ�</td>
              <td colspan="3"> 
                <input type="text" name="xh" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���</td>
              <td colspan="3"> 
                <input type="text" name="gg" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ɫ</td>
              <td width="32%"> 
                <input type="text" name="zcysbm" value="" size="20" maxlength="100" >
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>������λ</td>
              <td width="32%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>�г����              </td>
              <td width="32%"> 
                <input type="text" name="lsj" value="" size="20" maxlength="9" >
              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>�����޼�              </td>
              <td width="32%"> 
                <input type="text" name="yhj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����</td>
              <td width="32%"> 
                <input type="text" name="cbj" value="" size="20" maxlength="9" >
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�������</td>
              <td width="32%"> 
                <input type="text" name="jsbl" value="100" size="12" maxlength="8" >
                % <font color="#0000CC">���ٷֱȣ�</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>��������</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="cxhdbl" value="" size="12" maxlength="8" >
                % <font color="#0000CC">���ٷֱȣ�</font> </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>�Ƿ��д���</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="radio" name="sfycx" value="N">
                û���� 
                <input type="radio" name="sfycx" value="Y">
                �д��� </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" height="2">������ʼʱ��</td>
              <td width="32%" height="2" bgcolor="#E8E8FF"> 
                <input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right" height="2">��������ʱ��</td>
              <td width="32%" height="2"> 
                <input type="text" name="cxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">������</td>
              <td width="32%"> 
                <input type="text" name="cxj" value="" size="20" maxlength="9" >
              </td>
              <td width="18%" align="right">���������</td>
              <td width="32%"> 
                <input type="text" name="cxcbj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">�����ڼ�������</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="lscxhdbl" value="" size="12" maxlength="9" >
                % <font color="#0000CC">���ٷֱȣ�</font> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�Ƿ��л�</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="radio" name="sfyh" value="Y" checked>
                �л� 
                <input type="radio" name="sfyh" value="N">
                �޻� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ�������</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="radio" name="sfbhpj" value="Y">
                ���� 
                <input type="radio" name="sfbhpj" value="N">
                ������ </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">�������</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="pjts" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                ��Ʒ����              </td>
              <td width="32%"> 
                <input type="text" name="cpjb" value="" size="20" maxlength="50" >
              </td>
              <td width="18%" align="right"> 
                �������              </td>
              <td width="32%"> 
                <input type="text" name="fgsx" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ʒ˵��</td>
              <td colspan="3"> 
                <input type="text" name="cpsm" size="73" maxlength="200">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <input type="text" name="cd" value="" size="20" maxlength="50" >
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                  <input type="button"  value="�������" onClick="bc.disabled=false;" >
                  <input type="reset"  value="����" name="reset">
                </p>
              </td>
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

function getThisOne(lx)
{
	if ("<%=yhjs%>"=="G0")
	{
		return;
	}

	var sql;

	fieldName=lx;

	if (lx=="zcdlbm")
	{
		if (zcdlbmMark==0)
		{
			var sql="select cldlmc from jxc_cldlbm where cldllb in('1','3')  order by cldlmc";
			var actionStr="/ajax/getstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zcdlbmMark=1;
		}
	}
	else if (lx=="zcxlbm")
	{
		if (zcxlbmMark==0)
		{
			if (selectform.zcdlbm.value=="")
			{
				zcxlbmMark=0;
				selectform.zcdlbm.focus();
				alert("��ѡ�����Ĵ��ࡿ");
				return;
			}

			sql="select clxlmc from jxc_clxlbm where cldlmc='"+selectform.zcdlbm.value+"' order by clxlmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			zcxlbmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.crm_khxx_dwbh,ajaxRetStr);
	}
	else if (fieldName=="lrbm")
	{
		strToSelect(selectform.jc_zcdd_dwbh,ajaxRetStr);
	}
	else if (fieldName=="clgw")
	{
		strToSelect(selectform.clgw,ajaxRetStr);
	}
	else if (fieldName=="ztjjgw")
	{
		strToSelect(selectform.ztjjgw,ajaxRetStr);
	}
	else if (fieldName=="xmzy")
	{
		strToSelect(selectform.xmzy,ajaxRetStr);
	}
	else if (fieldName=="jjsjs")
	{
		strToSelect(selectform.jjsjs,ajaxRetStr);
	}
	else if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="ppbm")
	{
		strToItem2(selectform.ppbm,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="zcdlbm")
	{
		strToItem2(selectform.zcdlbm,ajaxRetStr);
	}
	else if (fieldName=="zcxlbm")
	{
		strToItem2(selectform.zcxlbm,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToItem(selectform.crm_khxx_sgd,ajaxRetStr);
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��Ʒ��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcmc)=="") {
		alert("������[��������]��");
		FormName.zcmc.focus();
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
	if(	javaTrim(FormName.yhj)=="") {
		alert("������[�����޼�]��");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "�����޼�"))) {
		return false;
	}
	if(	javaTrim(FormName.cbj)=="") {
		alert("������[�����]��");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "�����"))) {
		return false;
	}
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
		if(	javaTrim(FormName.cxcbj)=="") {
			alert("������[���������]��");
			FormName.cxcbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcbj, "���������"))) {
			return false;
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
	}
	else{
		FormName.cxj.value="";
		FormName.cxcbj.value="";
		FormName.lscxhdbl.value="";
		FormName.cxkssj.value="";
		FormName.cxjzsj.value="";
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



	FormName.action="SaveInsertJc_zcjgb.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

//-->
</SCRIPT>
