<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ydqbm=request.getParameter("dqbm");
	String[] clbm = request.getParameterValues("clbm");
%>

<html>
<head>
<title>�������ϳ�ʼ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 18px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>�������ϳ�ʼ��</p>
        <p class="STYLE1">ע�⣺ϵͳ��ʼ���������ϣ�ͬʱ���Ƽ۸���Ϣ���磺���ۼۡ�����۵ȣ�</p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="44%" align="right">��������</td>
              <td width="56%">
			<select name="dqbm" size="25" multiple style="FONT-SIZE:12PX;WIDTH:152PX" >
			<%
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
			%>
              </select>			  
			  </td>
            </tr>
            <tr> 
              <td height="2" colspan="2" align="center">
 <%
	for (int i=0;i<clbm.length ;i++ )
	{
		out.println("<input type=\"hidden\" name=\"clbm\"  value=\""+clbm[i]+"\">");
	}
%> 
					<input type="hidden" name="ydqbm"  value="<%=ydqbm%>">
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">              </td>
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
function f_do(FormName)//����FormName:Form������
{
	if(	!selectChecked(FormName.dqbm)) {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	
	FormName.action="SaveChooseDqbm.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
