<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">¼��Ʒ�ƹ�Ӧ��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertSq_gysxx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeDq(insertform)">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
                </select>
              </td>
              <td rowspan="5"> 
                <div align="right"><font color="#FF0000">*</font>�����ֹ�˾</div>
              </td>
              <td rowspan="5"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font>��Ӧ�����</div>
              </td>
              <td width="31%"> 
                <select name="gyslb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">ľ��</option>
                  <option value="2">����</option>
                  <option value="3">�Ҿ�</option>
                  <option value="4">����</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">����С��</td>
              <td width="31%"> 
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm order by zcxlmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right"><font color="#FF0000">*</font>Ʒ������</td>
              <td width="31%">
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ppbm,ppmc from sq_ppxx order by ppmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������</td>
              <td width="31%">
                <input type="text" name="cwdm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>Ʒ�ƹ�Ӧ������</td>
              <td colspan="3"> 
                <input type="text" name="gysmc" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>��Ӧ������</td>
              <td colspan="3"> 
                <select name="gysbm" style="FONT-SIZE:12PX;WIDTH:512PX">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>�Ƿ����Ż�</td>
              <td width="31%"> 
                <input type="radio" name="sfyyh" value="N">
                �� 
                <input type="radio" name="sfyyh" value="Y">
                �� </td>
              <td width="18%" align="right">ÿ�հ�װ��������</td>
              <td width="32%"> 
                <input type="text" name="mrazhs" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">�Żݿ�ʼʱ��</td>
              <td width="31%"> 
                <input type="text" name="yhkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">�Żݽ���ʱ��</td>
              <td width="32%"> 
                <input type="text" name="yhjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">�Ż�����</td>
              <td colspan="3"> 
                <textarea name="yhnr" cols="70" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="70" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
              </td>
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

<%
	//����Ajax
	cf.ajax(out);
%>

function changeDq(FormName)
{
	FormName.gysbm.length=1;

	if(	javaTrim(FormName.dqbm)=="") {
		return false;
	}

	var sql="select gysbm,gys||'��'||dqmc||'��' c2 from sq_gysbm,dm_dqbm where sq_gysbm.dqbm=dm_dqbm.dqbm and sq_gysbm.dqbm='"+FormName.dqbm.value+"' order by gys";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	strToSelect(insertform.gysbm,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gyslb)=="") {
		alert("��ѡ��[��Ӧ�����]��");
		FormName.gyslb.focus();
		return false;
	}
	if (FormName.gyslb.value=="4")
	{
		if(	javaTrim(FormName.zclb)=="") {
			alert("��ѡ��[�������]��");
			FormName.zclb.focus();
			return false;
		}
	}
	else{
		FormName.zclb.value="";
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("��ѡ��[Ʒ������]��");
		FormName.ppbm.focus();
		return false;
	}

	if(	javaTrim(FormName.gysmc)=="") {
		alert("������[Ʒ�ƹ�Ӧ������]��");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("��ѡ��[��Ӧ������]��");
		FormName.gysbm.focus();
		return false;
	}


	if(!(isNumber(FormName.mrazhs, "ÿ�հ�װ��������"))) {
		return false;
	}


	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("������[�Żݿ�ʼʱ��]��");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "�Żݿ�ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("������[�Żݽ���ʱ��]��");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "�Żݽ���ʱ��"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[�Żݿ�ʼʱ��]���ܴ���[�Żݽ���ʱ��]��");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("������[�Ż�����]��");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.submit();

	return true;
}

//-->
</SCRIPT>
