<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String leixing=cf.GB2Uni(request.getParameter("leixing"));
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_clbmCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��������</td>
      <td width="35%"> 
        <input type="text" name="clmc" size="20" maxlength="100" >
        <input type="hidden" name="ckph" value="<%=ckph%>" >
        <input type="hidden" name="khbh" value="<%=khbh%>" >
		 <input type="hidden" name="dwbh" value="<%=dwbh%>" > 
		 <input type="hidden" name="leixing" value="<%=leixing%>" > 
      </td>
      <td align="right" width="15%">���Ϲ��</td>
      <td width="35%"> 
        <input type="text" name="clgg" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%"> 
        <div align="right">���ϴ���</div>
      </td>
      <td width="35%"> 
        <select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
		cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
		%> 
        </select>
      </td>
      <td width="15%">&nbsp; </td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������㷽ʽ</td>
      <td width="35%"> 
        <select name="lrjsfs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">��۷�ʽ</option>
          <option value="2">�ٷֱȷ�ʽ</option>
        </select>
      </td>
      <td width="15%"> 
        <div align="right">������λ</div>
      </td>
      <td width="35%"> 
        <select name="jldwmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
				cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
				%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����ٷֱ� ��</td>
      <td width="35%"> 
        <input type="text" name="lrbfb" size="20" maxlength="9" >
        % </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="lrbfb2" size="20" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���ϵ��� ��</td>
      <td width="35%"> 
        <input type="text" name="cldj" size="20" maxlength="9" >
      </td>
      <td align="right" width="15%">��</td>
      <td width="35%"> 
        <input type="text" name="cldj2" size="20" maxlength="9" >
      </td>
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
	if(!(isFloat(FormName.lrbfb, "����ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lrbfb2, "����ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.cldj, "���ϵ���"))) {
		return false;
	}
	if(!(isFloat(FormName.cldj2, "���ϵ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>