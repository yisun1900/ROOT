<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssbm=(String)session.getAttribute("dwbh");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String zqs=cf.executeQuery("select zqs FROM yy_rqsd  order by yy_rqsd_bzs desc");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yy_jjbList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�����ֹ�˾</td>
  <td><select name="yy_jjb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
  </select></td>
  <td align="right">��������</td>
  <td><select name="yy_jjb_ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'","");
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">������</td> 
  <td width="30%"> 
	<select name="yy_jjb_zqs" style="FONT-SIZE:12PX;WIDTH:202PX" >
	<%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select zqs,'����'||zqs||'��'||TO_CHAR(yy_rqsd_bzs,'YYYY-MM-DD')||'��'||TO_CHAR(yy_rqsd_bze,'YYYY-MM-DD')||'��' from YY_RQSD  order by yy_rqsd_bzs desc","");
		}
		else{
			cf.selectItem(out,"select zqs,'����'||zqs||'��'||TO_CHAR(yy_rqsd_bzs,'YYYY-MM-DD')||'��'||TO_CHAR(yy_rqsd_bze,'YYYY-MM-DD')||'��' from YY_RQSD where zqs='"+zqs+"' order by yy_rqsd_bzs desc","");
		}
	%>
	</select>
  </td>
  <td align="right" width="20%">�ҾӲ�Ա������</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjb_ygmc" size="20" maxlength="20" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">ȥ��ͬ���¶����Ĳ�ֵ</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjbqntq" size="20" maxlength="17" >  </td>
  <td align="right" width="20%">���¼ƻ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjbbyjh" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�����ۼ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjbylj" size="20" maxlength="17" >  </td>
  <td align="right" width="20%">�������汾���ۼƹ��̲�ֵ</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjbdmbylj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">���ܼƻ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjbszjh" size="20" maxlength="17" >  </td>
  <td align="right" width="20%">�������</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjbszwc" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">����Ԥ��</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjbbzyj" size="20" maxlength="17" >  </td>
  <td align="right" width="20%">&nbsp;</td> 
  <td width="30%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="yy_jjb_yy_jjb_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="yy_jjb_yy_jjb_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">¼����</td> 
  <td width="30%"> 
    <input type="text" name="yy_jjb_yy_jjb_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="20%">&nbsp;  </td>
  <td width="30%">&nbsp;  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isNumber(FormName.yy_jjb_zqs, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_jjb_yy_jjbqntq, "ȥ��ͬ���¶����Ĳ�ֵ"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_jjb_yy_jjbbyjh, "���¼ƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_jjb_yy_jjbylj, "�����ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_jjb_yy_jjbdmbylj, "�������汾���ۼƹ��̲�ֵ"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_jjb_yy_jjbszjh, "���ܼƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_jjb_yy_jjbszwc, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_jjb_yy_jjbbzyj, "����Ԥ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_jjb_yy_jjb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_jjb_yy_jjb_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
