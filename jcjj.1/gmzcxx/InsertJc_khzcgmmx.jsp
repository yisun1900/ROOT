<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���Ĺ�����ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ssfgs=cf.executeQuery("select fgsbh from crm_khxx where khbh='"+khbh+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_khzcgmmx.jsp" name="insertform" target="_blank">
<div align="center">¼�룭�ͻ����Ĺ�����ϸ���ͻ���ţ�<%=khbh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#FF0000">*</font>���Ĵ���</td>
    <td><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlbm","");
%>
      </select>    </td>
    <td align="right"><font color="#FF0000">*</font>����С��</td>
    <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXl(insertform)">
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#FF0000">*</font>Ʒ�ƹ�Ӧ��</td>
    <td colspan="3"><select name="ppgys" style="FONT-SIZE:12PX;WIDTH:506PX">
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>ԭ��</td> 
  <td width="32%"> 
    <input type="text" name="yj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�ۺ��</td> 
  <td width="32%"> 
    <input type="text" name="zhj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>����</td> 
  <td width="32%"> 
    <input type="text" name="dj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>ʵ�տ�</td> 
  <td width="32%"> 
    <input type="text" name="ssk" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><input type="text" name="rq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="khbh" value="<%=khbh%>">      </td>
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
	//����Ajax
	cf.ajax(out);
%>

var czlx;

function changeDl(FormName)
{
	czlx=2;

	FormName.zcxlbm.length=1;
	FormName.ppgys.length=1;

	var sql="select zcxlmc from jdm_zcxlbm where zcdlmc='"+FormName.zcdlbm.value+"' order by zcxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function changeXl(FormName)
{
	czlx=3;

	FormName.ppgys.length=1;

	var sql="select sq_gysxx.gysmc c1,sq_gysxx.gysmc c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='<%=ssfgs%>' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+FormName.zcxlbm.value+"' order by sq_gysxx.gysmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (czlx==2)
	{
		strToItem2(insertform.zcxlbm,ajaxRetStr);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ppgys,ajaxRetStr);
	}
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppgys)=="") {
		alert("��ѡ��[Ʒ�ƹ�Ӧ������]��");
		FormName.ppgys.focus();
		return false;
	}
	if(	javaTrim(FormName.yj)=="") {
		alert("������[ԭ��]��");
		FormName.yj.focus();
		return false;
	}
	if(!(isFloat(FormName.yj, "ԭ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zhj)=="") {
		alert("������[�ۺ��]��");
		FormName.zhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhj, "�ۺ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("������[ʵ�տ�]��");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "ʵ�տ�"))) {
		return false;
	}
	if(!(isDatetime(FormName.rq, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
