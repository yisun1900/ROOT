<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��ѯʩ������ʩ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khxxSgdList.jsp" name="insertform">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2" height="75"> 
        <div align="center">��ѯʩ������ʩ����</div>
      </td>
    </tr>
    <tr> 
      <td width="43%" align="right" height="34">����</td>
      <td width="57%" height="34"> 
        <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="43%" align="right" height="42">���ݵ�ַ</td>
      <td width="57%" height="42"><font color="#0000CC"> 
        <input type="text" name="fwdz" size="20" maxlength="100"  value="" >
        </font></td>
    </tr>
    <tr> 
      <td width="43%" align="right" height="40">ʩ����</td>
      <td width="57%" height="40"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc||'��'||dwdh||'��' from sq_dwxx where dwlx='3' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td colspan="2" align="right" height="81"> 
        <div align="center">
          <input type="button" value="�鿴" onClick="f_do(insertform)">
          <input type="reset"  value="����">
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

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
