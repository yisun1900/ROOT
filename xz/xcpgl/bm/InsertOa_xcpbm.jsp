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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertOa_xcpbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>ӡˢƷ����</td>
      <td width="32%"> 
        <select name="xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="getItemValue(xcpflbm,xcpbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflmc","");
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>�Ƿ�������</td>
      <td width="32%"> 
        <input type="radio" name="sfxsp"  value="N">
        ����Ҫ 
        <input type="radio" name="sfxsp"  value="Y">
        ��Ҫ </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>ӡˢƷ���루6λ��</td>
      <td width="32%"> 
        <input type="text" name="xcpbm" value="" size="20" maxlength="6" >
      </td>
      <td align="right" rowspan="4"><font color="#CC0000">*</font>����ȡ�ֹ�˾</td>
      <td rowspan="4"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' OR dwlx in('A0')","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>ӡˢƷ����</td>
      <td width="32%"> 
        <input type="text" name="xcpmc" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������λ</td>
      <td width="32%"> 
        <input type="text" name="jldw" value="" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>����</td>
      <td width="32%"> 
        <input type="text" name="dj" value="" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0033">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
      </td>
      <td align="right" width="18%">�������</td>
      <td width="32%"> 
        <input type="text" name="xh" value="" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0033">*</font><font color="#0000CC">��Ϣ¼����</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">
      </td>
      <td align="right" width="18%"><font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
      </td>
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
	if(	javaTrim(FormName.xcpflbm)=="") {
		alert("��ѡ��[ӡˢƷ����]��");
		FormName.xcpflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxsp)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxsp[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xcpbm)=="") {
		alert("������[ӡˢƷ����]��");
		FormName.xcpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xcpmc)=="") {
		alert("������[ӡˢƷ����]��");
		FormName.xcpmc.focus();
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
	if(!(isNumber(FormName.xh, "�������"))) {
		return false;
	}

	if(	!selectChecked(FormName.fgsbh)) {
		alert("������[����ȡ�ֹ�˾]��");
		FormName.fgsbh.focus();
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

	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
