<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�һ��û�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=request.getParameter("yhdlm");
String ssfgs=cf.executeQuery("select ssfgs from sq_yhxx where yhdlm='"+yhdlm+"' and sfzszg in('Y','N','C') and kdlxtbz='Y'");
String dwbh=cf.executeQuery("select dwbh from sq_yhxx where yhdlm='"+yhdlm+"' and sfzszg in('Y','N','C') and kdlxtbz='Y'");
String sfyxzhmm=cf.executeQuery("select sfyxzhmm from sq_yhxx where yhdlm='"+yhdlm+"' and sfzszg in('Y','N','C') and kdlxtbz='Y'");
if (sfyxzhmm==null || !sfyxzhmm.equals("Y"))
{
	out.println("����δ����Ȩ�һ�����");
	return;
}
%>



<body bgcolor="#FFFFFF">
<form method="post" action="sAveWjmM.jsp" name="insertform" >
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF"> 
	  <td colspan="2" height="89" align="center"> 
		<p>�һ��û�����</p>
		
	 </td>
	</tr>

	<tr bgcolor="#FFFFFF">
	  <td height="27" align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font><font color="#0000FF">�û���¼��</font></td>
	  <td bgcolor="#CCFFFF"><input name="yhdlm" type="text" value="<%=yhdlm%>" size="20" maxlength="20" readonly></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td width="48%" height="27" align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font><font color="#0000FF">������˾</font></td>
	  <td width="52%" bgcolor="#CCFFFF">
	  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		%>
      </select>	  </td>
    </tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font><font color="#0000FF">��������</font></td>
	  <td bgcolor="#CCFFFF">
	  <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
		%>
      </select></td>
    </tr>
	
	<tr bgcolor="#FFFFFF"> 
	  <td align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font>Ա������</td>
	  <td bgcolor="#CCFFFF"><input name="yhmc" type="text" value="" size="20" maxlength="20"></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font>���֤����</td>
	  <td bgcolor="#CCFFFF"><input type="text" name="sfzh" value="" maxlength="18" size="20"></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font>��������</td>
	  <td bgcolor="#CCFFFF"><input type="text" name="wenti" value="" maxlength="50" size="50"></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font>��</td>
	  <td bgcolor="#CCFFFF"><input type="text" name="daan" value="" maxlength="50" size="50"></td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
	  <td colspan="2" height="46" align="center"> 
		<input type="button" value="��ȡ����" onClick="submit_onclick(insertform)">			  </td>
	</tr>
  </table>


</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function submit_onclick(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��������]��");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sfzh)=="") {
		alert("������[���֤]��");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[���֤]����ֻ����15λ��18λ");
		FormName.sfzh.focus();
		return false;
	}

	if(	javaTrim(FormName.wenti)=="") {
		alert("������[����]��");
		FormName.wenti.select();
		return false;
	}

	if(	javaTrim(FormName.daan)=="") {
		alert("������[��]��");
		FormName.daan.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
