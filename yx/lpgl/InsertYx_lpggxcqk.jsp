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
.STYLE1 {color: #0000FF}
-->
</style>
</head>
<%
String lrr=(String)session.getAttribute("yhmc");

String xqbh=cf.GB2Uni(request.getParameter("xqbh"));
String xqmc=cf.GB2Uni(request.getParameter("xqmc"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertYx_lpggxcqk.jsp" name="insertform" target="_blank">
<div align="center">��¼��¥�̹���������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE1">С�����</span></td>
    <td colspan="3"><input type="text" name="xqbh" value="<%=xqbh%>" size="20" maxlength="8" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE1">С������</span> </td>
    <td colspan="3"><input type="text" name="xqmc" value="<%=xqmc%>" size="70" maxlength="50" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���Ͷ����ʽ</td> 
  <td colspan="3"> 
    <input type="text" name="ggtfxs" value="" size="70" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ͷ��ʱ��</td> 
  <td width="32%"><input type="text" name="tfsj" value="" size="20" maxlength="50" ></td>
  <td align="right" width="18%">������</td> 
  <td width="32%"><input type="text" name="ggfy" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td colspan="3"><textarea name="xcmd" cols="69" rows="3"></textarea></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ч��</td> 
  <td colspan="3"> 
    <input type="text" name="xcxg" value="" size="70" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000FF">¼����</font> </td>
  <td><input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>  </td>
  <td align="right"><font color="#CC0000">*</font><font color="#0000FF">¼��ʱ�� </font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
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
	if(	javaTrim(FormName.xqbh)=="") {
		alert("������[С�����]��");
		FormName.xqbh.focus();
		return false;
	}
	if(!(isNumber(FormName.xqbh, "С�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("������[С������]��");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ggtfxs)=="") {
		alert("������[���Ͷ����ʽ]��");
		FormName.ggtfxs.focus();
		return false;
	}
	if(	javaTrim(FormName.tfsj)=="") {
		alert("������[Ͷ��ʱ��]��");
		FormName.tfsj.focus();
		return false;
	}
	if(	javaTrim(FormName.ggfy)=="") {
		alert("������[������]��");
		FormName.ggfy.focus();
		return false;
	}
	if(	javaTrim(FormName.xcmd)=="") {
		alert("������[��������]��");
		FormName.xcmd.focus();
		return false;
	}
	if(	javaTrim(FormName.xcxg)=="") {
		alert("������[����Ч��]��");
		FormName.xcxg.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>