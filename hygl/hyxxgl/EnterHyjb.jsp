<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����Ǽ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String[] hybh=request.getParameterValues("hybh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEnterHyjb.jsp" name="insertform">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2" height="43"> 
        <div align="center">
          <p>�����µĻ�Ա����</p>
          <p><font color="#FF3333">ע�⣺���ֲ�����ʽ�����ڲ���ı�ˮ�ʷ�������</font></p>
        </div>
        <%
	for (int i=0;i<hybh.length ;i++ )
	{
		out.print("<input type='hidden' name='hybh' value='"+hybh[i]+"'>");
	}
%> </td>
    </tr>
    <tr> 
      <td width="43%" align="right" height="36">��Ա����</td>
      <td width="57%" height="36"> 
        <select name="hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
<%
			cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
		</select>
      </td>
    </tr>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(insertform)">
        </div>
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
	if(	javaTrim(FormName.hyjb)=="") {
		alert("��ѡ��[��Ա����]��");
		FormName.hyjb.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
