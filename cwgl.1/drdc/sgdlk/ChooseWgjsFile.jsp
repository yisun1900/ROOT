<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ʩ�����깤���㣭����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<CENTER><B>ʩ�����깤���㣭����</B><BR><HR>
<form method="post" action="DisChooseWgjsFile.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center"><b>��ѡ������EXECEL�ļ�</b></td>
      </tr>
      <tr> 
        <td width="15%" height="2" align="right">&nbsp;</td>
        <td width="85%" height="2">ѡ��ֹ�˾��<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      </tr>
      <tr> 
        <td width="15%" height="49" align="right">&nbsp;</td>
        <td width="85%" height="49">�� Ŀ�� �룺 
          <select name="kmdm" style="FONT-SIZE:13PX;WIDTH:330PX" >
            <option value=""></option>
            <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select kmdm,kmdm||' '||kmmc from cw_jzkmdm order by fgsbh,kmdm","115.04");
	}
	else{
		cf.selectItem(out,"select kmdm,kmdm||' '||kmmc from cw_jzkmdm where fgsbh='"+ssfgs+"' order by kmdm","115.04");
	}
%> 
          </select>
        </td>
      </tr>
      <tr> 
        <td width="15%" height="48" align="center">&nbsp;</td>
        <td width="85%" height="48">ƾ ֤ժ Ҫ�� 
          <input type="text" name="fexp" maxlength="254" size="45" value="ʩ�����깤����">
        </td>
      </tr>
      <tr>
        <td width="15%" height="45" align="center">&nbsp;</td>
        <td width="85%" height="45"><font color="#FF0033">*</font>����С�� 
          <input type="radio" name="blxs" value="0" checked>
          ��������ȡ�� 
          <input type="radio" name="blxs" value="1">
          ����С��1λ 
          <input type="radio" name="blxs" value="2">
          ����С��2λ </td>
      </tr>
      <tr> 
        <td width="15%" height="45" align="center">&nbsp; </td>
        <td width="85%" height="45"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="����" onclick="f_onclick(loadform)">
          </p>
        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}

	if(	javaTrim(FormName.kmdm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.kmdm.focus();
		return false;
	}

	if(	javaTrim(FormName.fexp)=="") {
		alert("��ѡ��[ƾ֤ժҪ]��");
		FormName.fexp.focus();
		return false;
	}

	if(	javaTrim(FormName.loadName)=="") {
		alert("��ѡ��[�����ļ�]��");
		FormName.loadName.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>