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

      <div align="center"> ������۸������޸Ĺ�ʽ(<font color="#FF0000">ע�⣺�˴β������޸�����ѡ�в��ϼ۸�</font>)</div>

		<form method="post" action="SaveEnterPlJg.jsp" name="selectform">
          <table width="100%" >
            <tr>

<%
for (int i=0;i<clbm.length ;i++ )
{
	%>
	<input type="hidden" name="clbm" value="<%=clbm[i]%>" >
	<%
}


%>              <td colspan="4" align="center"  >
				<input name="button" type="button" onClick="f_do(selectform)"  value="���������۸�">
				<input type="reset" name="Reset" value="����">
				</td>
            </tr>

            <tr bgcolor="#FFFFCC">
              <td width="48%" height="15" align="right"><font color="#FF0000" size="5"><strong>�����¼۸�</strong></font></td>
              <td>&nbsp;</td>
              <td height="15"><font color="#FF0000" size="5"><strong>ѡ������۵���</strong></font></td>
            </tr>
            

            <tr> 
			  <td height="73" valign="top">
          <table width="100%" >
				  <td width="43%" height="2" bgcolor="#FFFFFF" align="right">�ɱ���
				  <input name="cbj" type="text" size="20" maxlength="20"></td>
				</tr>
				<tr>
				  <td height="15" align="right" bgcolor="#FFFFFF">�Էֹ�˾�۸�
				  <input name="dfgsjg" type="text" size="20" maxlength="20"></td>
				</tr>
				<tr>
				  <td height="15" align="right" bgcolor="#FFFFFF">�Թ����۸�
				  <input name="dgzjg" type="text" size="20" maxlength="20"></td>
				</tr>
				<tr>
				  <td height="15" align="right" bgcolor="#FFFFFF">���ۼ�              
				  <input name="xsj" type="text" size="20" maxlength="20"></td>
				</tr>
          </table>			  </td>
              <td width="4%" rowspan="2" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="48%" rowspan="2" bgcolor="#FFFFFF">
			  <select name="dqbm" size="25" multiple style="FONT-SIZE:12PX;WIDTH:152PX" >
                <%
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
			%>
              </select></td>
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
	if(	javaTrim(FormName.cbj)=="") {
		alert("������[�ɱ���]��");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "�ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dfgsjg)=="") {
		alert("������[�Էֹ�˾�۸�]��");
		FormName.dfgsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dfgsjg, "�Էֹ�˾�۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgzjg)=="") {
		alert("������[�Թ����۸�]��");
		FormName.dgzjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzjg, "�Թ����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.cbj)=="") {
		alert("������[�ɱ���]��");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "�ɱ���"))) {
		return false;
	}

	if(	!selectChecked(FormName.dqbm)) {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
