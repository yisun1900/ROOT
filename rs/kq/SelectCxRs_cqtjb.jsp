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
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Rs_cqtjbCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">��</td>
  <td><input type="text" name="rs_cqtjb_nian" size="20" maxlength="4"  value="<%=cf.getDataStr(cf.addMonth(-1),"YYYY")%>"></td>
  <td align="right">��</td>
  <td><input type="text" name="rs_cqtjb_yue" size="20" maxlength="2" value="<%=cf.getDataStr(cf.addMonth(-1),"MM")%>"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����ֹ�˾</td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
  </select></td>
  <td align="right">��������</td>
  <td><select name="rs_cqtjb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right">Ա�����</td>
  <td width="35%"><input type="text" name="rs_cqtjb_ygbh" size="20" maxlength="8" ></td>
  <td width="15%" align="right">���� </td>
  <td width="35%"><input type="text" name="rs_cqtjb_bianhao" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right">Ա������ </td>
  <td width="35%"><input type="text" name="rs_cqtjb_yhmc" size="20" maxlength="50" ></td>
  <td width="15%">&nbsp;    </td>
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ȫ������</td>
  <td><input type="text" name="rs_cqtjb_qqts" size="20" maxlength="8" ></td>
  <td align="right">��������</td>
  <td><input type="text" name="rs_cqtjb_cqts" size="20" maxlength="8" ></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.rs_cqtjb_ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_cqtjb_qqts, "ȫ������"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_cqtjb_cqts, "��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
