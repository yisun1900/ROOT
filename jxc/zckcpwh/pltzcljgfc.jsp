<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] clbm =request.getParameterValues("clbm");
	String dqbm =request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%"> 
      <div align="center"> ������۸������޸Ĺ�ʽ(<font color="#FF0000">ע�⣺�˴β������޸�����ѡ�в��ϼ۸�</font>)</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="SavePltzcljgfc.jsp" name="selectform">
          <table width="100%" >
            <tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
              <td width="57%" bgcolor="#FFFFFF"> 

	<input type="hidden" name="dqbm" value="<%=dqbm%>" >
<%
for (int i=0;i<clbm.length ;i++ )
{
	%>
	<input type="hidden" name="clbm" value="<%=clbm[i]%>" >
	<%
}

%>
              </td>
            </tr>
			<tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right">����С��λ�����������룩</td>
              <td width="57%" bgcolor="#FFFFFF"> 
                <select name="xsws" style="FONT-SIZE:12px;WIDTH:152px">
				<option value=""></option>
				<option value="2">С����2λ��88888.88��</option>
				<option value="1">С����1λ��88888.9��</option>
				<option value="0">����������88889��</option>
				<option value="-1">����ʮλ��88890��</option>
				<option value="-2">������λ��88900��</option>
				<option value="-3">����ǧλ��89000��</option>
              </select>
              </td>
            </tr>
			<tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right"><font color="red"><b>ѡ����Ҫ�����ļ۸�:</b></font></td>
              <td width="57%" bgcolor="#FFFFFF"> 
                <select name="jgmc" style="FONT-SIZE:12px;WIDTH:152px">
				<option value="">��ѡ��Ҫ�����ļ۸�</option>
				<option value="dfgsjg">�Էֹ�˾�۸�</option>
				<option value="dgzjg">�Թ����۸�</option>
				</select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="43%" align="right">�۸��޸Ĺ�ʽ��</td>
              <td width="57%"> 
                <select name="fh" style="FONT-SIZE:12px;WIDTH:152px">
				<option value=""></option>
				<option value="(">(</option>
				<option value=")">)</option>
				<option value="*">��</option>
				<option value="/">��</option>
				<option value="+">+</option>
				<option value="-">-</option>
				<option value="dfgsjg">�Էֹ�˾�۸�</option>
				<option value="dgzjg">�Թ����۸�</option>
                </select>
                <input type="text" name="xs" size="14">
                <input type="button"  value="����" onClick="gs.value+=fh.value+xs.value" name="button">
              </td>
            </tr>
            <tr> 
              <td width="43%" height="2" bgcolor="#FFFFFF" align="right"><font color="blue"><b>�۸�ʽ��</b></font> 
              </td>
              <td width="57%" height="2" bgcolor="#FFFFFF"> 
                <input type="text" name="gs" size="30" readonly="true">
              </td>
            </tr>
            <tr> 
              <td width="43%" height="73" bgcolor="#FFFFFF"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="57%" height="73" bgcolor="#FFFFFF"> 
                <input type="button"  value="���������۸�" onClick="submit_onclick(selectform)">
                <input type="reset" name="Reset" value="����">
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function submit_onclick(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsws)=="") {
		alert("��ѡ����Ҫ������С��λ����");
		FormName.xsws.focus();
		return false;
	}if(	javaTrim(FormName.jgmc)=="") {
		alert("��ѡ����Ҫ�����ļ۸�");
		FormName.jgmc.focus();
		return false;
	}if(	javaTrim(FormName.gs)=="") {
		alert("������[�۸�ʽ]��");
		FormName.gs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
