<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_rkdCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�������</td>
      <td width="35%"> 
        <input type="text" name="rkph" size="20" maxlength="11" >
      </td>
      <td align="right" width="15%">�ֹ�˾</td>
      <td width="35%"> <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
			out.println("        </select>");
		}
		else{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
			out.println("        </select>");
		}
		%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��Ӧ��</td>
      <td width="35%"> 
        <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select gysmc,gysmc from cl_gysbm order by gysbm","");
		%> 
        </select>
      </td>
      <td align="right" width="15%">���״̬</td>
      <td width="35%"> 
        <select name="rkzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">δ�ύ</option>
          <option value="2">���ύ</option>
          <option value="3">�����</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">���ʱ�� �� </td>
      <td> 
        <input type="text" name="rksj" size="20" maxlength="10" >
      </td>
      <td align="right">��</td>
      <td> 
        <input type="text" name="rksj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��������� ��</td>
      <td width="35%"> 
        <input type="text" name="rkzsl" size="20" maxlength="17" >
        <BR>
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="rkzsl2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">����ܽ�� ��</td>
      <td> 
        <input type="text" name="rkzje" size="20" maxlength="17" >
      </td>
      <td align="right">�� </td>
      <td> 
        <input type="text" name="rkzje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">¼��ʱ�� ��</td>
      <td width="35%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">¼����</td>
      <td width="35%"> 
        <input type="text" name="lrr" size="20" maxlength="20" >
        <BR>
      </td>
      <td align="right" width="15%">�����</td>
      <td width="35%"> 
        <input type="text" name="rkr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�������</td>
      <td width="35%"> 
        <input type="radio" name="rklx" value="1">
        �»� 
        <input type="radio" name="rklx" value="2">
        �˻� </td>
      <td align="right" width="15%">�˻�ʩ����</td>
      <td width="35%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�깺����</td>
      <td width="35%"> 
        <input type="text" name="sgph" size="20" maxlength="11" >
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
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
	if(!(isDatetime(FormName.rksj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rksj2, "���ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.rkzsl, "���������"))) {
		return false;
	}
	if(!(isFloat(FormName.rkzsl2, "���������"))) {
		return false;
	}
	if(!(isFloat(FormName.rkzje, "����ܽ��"))) {
		return false;
	}
	if(!(isFloat(FormName.rkzje2, "����ܽ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
