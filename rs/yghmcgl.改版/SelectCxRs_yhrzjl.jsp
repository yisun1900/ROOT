<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_yhrzjlCxList.jsp" name="selectform">
  <div align="center">��ѯ��ְ��Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">�ֹ�˾</td>
      <td width="30%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td width="19%" align="right">������λ</td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">���</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_xh" size="20" maxlength="8" >
      </td>
      <td align="right" width="19%">Ա�����</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">Ա������</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="19%">Ա�����</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">���֤��</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">����ְ��</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_xzzwbm" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ְ���� ��</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_rzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_rzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">¼����</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">��ְ����</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_rzcs" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">¼��ʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ְ����</td>
      <td width="30%"> 
        <input type="radio" name="lx" value="1">��Ա����ְ
        <input type="radio" name="lx" value="2">��ְԱ��������ְ
      </td>
      <td align="right" width="19%">������ְ�������</td>
      <td width="31%"> 
        <input type="text" name="sqxh" size="20" maxlength="10" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.rs_yhrzjl_xh, "���"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_yhrzjl_ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhrzjl_rzsj, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhrzjl_rzsj2, "��ְ����"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_yhrzjl_rzcs, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhrzjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhrzjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
