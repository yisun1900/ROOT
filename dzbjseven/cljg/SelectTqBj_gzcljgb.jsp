<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_bjmbTqList.jsp" name="selectform">
  <div align="center">ά������Ȩ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" height="2" align="right">����</td>
      <td width="35%" height="2"> 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
        </select>
      </td>
      <td align="right" width="16%" height="2">�������</td>
      <td width="34%" height="2"> 
        <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
			cf.selectItem(out,"select cldlbm,cldlmc from bdm_cldlbm order by cldlmc","");
		  %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" height="2" align="right">��������</td>
      <td colspan="3" height="2"> 
        <input type="text" name="glmc" size="73" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" height="2" align="right">�������ϱ���</td>
      <td width="35%" height="2"> 
        <input type="text" name="wlbm" size="20" maxlength="16" >
      </td>
      <td align="right" width="16%" height="2">������ϱ���</td>
      <td width="34%" height="2"> 
        <input type="text" name="jswlbm" size="20" maxlength="16" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" height="2" align="right">ȷ�ϱ�־</td>
      <td width="35%" height="2"> 
        <input type="radio" name="qrbz" value="N">
        δȷ�� 
        <input type="radio" name="qrbz" value="Y">
        ȷ�� </td>
      <td align="right" width="16%" height="2">&nbsp;</td>
      <td width="34%" height="2">&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">
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
   if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
