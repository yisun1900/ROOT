<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_jgmxCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ֹ�˾</td>
      <td width="31%"> 
        <select name="cl_jgmx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("	<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>      </td>
      <td align="right" width="19%">���ϱ���</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_clbm" size="20" maxlength="4" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_cj" size="20" maxlength="17" >      </td>
      <td align="right" width="19%">�볧�ҽ����</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_cjjsj" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ֹ�˾���ϵ���</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_fgsdj" size="20" maxlength="17" >      </td>
      <td align="right" width="19%">���Ӽ�</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_gdj" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ֿ�����</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_ckmc" size="20" maxlength="50" >      </td>
      <td align="right" width="19%">�Ƿ����</td>
      <td width="31%"> <%
	cf.radioToken(out, "cl_jgmx_sfrk","Y+��&N+��","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��������</td>
      <td width="31%"> 
        <input type="text" name="cl_clbm_clmc" size="20" maxlength="100" >      </td>
      <td align="right" width="19%">���Ϲ��</td>
      <td width="31%"> 
        <input type="text" name="cl_clbm_clgg" size="20" maxlength="100" >      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ǩԼ�ٷֱ�</td>
      <td width="31%"> 
        <input type="text" name="cl_clbm_qybfb" size="20" maxlength="17" >      </td>
      <td align="right" width="19%">������㷽ʽ</td>
      <td width="31%"> <%
	cf.radioToken(out, "cl_clbm_lrjsfs","1+��۷�ʽ&2+�ٷֱȷ�ʽ","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����ٷֱ�</td>
      <td width="31%"> 
        <input type="text" name="cl_clbm_lrbfb" size="20" maxlength="9" >      </td>
      <td align="right" width="19%">���ϴ���</td>
      <td width="31%"> 
        <select name="cl_clbm_cldlmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%">�¼۸��Ƿ����</td>
      <td width="31%">
        <input type="radio" name="xjgsfgx" value="1">
        δ���� 
        <input type="radio" name="xjgsfgx" value="2">
        �Ѹ��� </td>
      <td align="right" width="19%">�Ƿ��д���</td>
      <td width="31%">
        <input type="radio" name="sfycx" value="N">
        û���� 
        <input type="radio" name="sfycx" value="Y">
        �д��� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ά����</td>
      <td width="31%">
        <input type="text" name="wxr" size="20" maxlength="20" value="">
	</td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">      </td>
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
	if(!(isFloat(FormName.cl_jgmx_cj, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_jgmx_cjjsj, "�볧�ҽ����"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_jgmx_fgsdj, "�ֹ�˾���ϵ���"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_jgmx_gdj, "���Ӽ�"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_clbm_qybfb, "ǩԼ�ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_clbm_lrbfb, "����ٷֱ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
