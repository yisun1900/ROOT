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
String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
String fgsbh=cf.executeQuery("select fgsbh from oa_xcplqsq where sqxh="+sqxh);
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertOa_xcplqmx.jsp" name="insertform" target="_blank">
  <div align="center">ӡˢƷ��ȡ��ϸ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>ӡˢƷ����</td>
      <td width="32%"> 
        <select name="xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefl(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflbm","");
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">�������</font></td>
      <td width="32%"> 
        <input type="text" name="sqxh" value="<%=sqxh%>" size="20" maxlength="8" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>ӡˢƷ</td>
      <td width="32%"> 
        <select name="xcpbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changebm(insertform)">
          <option value=""></option>
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>�ƻ���ȡ����</td>
      <td width="32%"> 
        <input type="text" name="jhlqsl" value="" size="20" maxlength="16" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">������λ</font></td>
      <td width="32%"> 
        <input type="text" name="jldw" value="" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%"><font color="#0000CC">�Ƿ�������</font></td>
      <td width="32%"> 
        <input type="text" name="sfxspmc" value="" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="sfxsp" value="" size="20" maxlength="20" >
        <input type="hidden" name="xcpmc" value="" size="20" maxlength="50" >
        <input type="hidden" name="dj" value="" size="20" maxlength="17" >
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
//��ѯҳ��ʹ�ã���������������
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	field.add(op1);
}

function changefl(FormName)
{
	if(	javaTrim(FormName.xcpflbm)=="") 
	{
		return false;
	}
	
	FormName.xcpmc.value=""
	FormName.jldw.value=""
	FormName.dj.value=""
	FormName.xcpbm.length=1;
	
	var str="InsertOa_xcplqmxCx.jsp?fgsbh=<%=fgsbh%>&sqxh=<%=sqxh%>&xcpflbm="+FormName.xcpflbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function changebm(FormName)
{
	if(	javaTrim(FormName.xcpbm)=="") 
	{
		return false;
	}
	
	FormName.xcpmc.value=""
	FormName.jldw.value=""
	FormName.dj.value=""
	
	var str="InsertOa_xcplqmxCx.jsp?fgsbh=<%=fgsbh%>&xcpbm="+FormName.xcpbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("������[�������]��");
		FormName.sqxh.focus();
		return false;
	}
	if(!(isNumber(FormName.sqxh, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.xcpflbm)=="") {
		alert("��ѡ��[ӡˢƷ����]��");
		FormName.xcpflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xcpbm)=="") {
		alert("������[ӡˢƷ]��");
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
	if(	javaTrim(FormName.jhlqsl)=="") {
		alert("������[�ƻ���ȡ����]��");
		FormName.jhlqsl.focus();
		return false;
	}
	if(!(isFloat(FormName.jhlqsl, "�ƻ���ȡ����"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
