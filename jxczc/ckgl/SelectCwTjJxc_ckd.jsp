<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">���ⵥ������ͳ��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFCC">
    <td width="18%" align="right"> �ֹ�˾ </td>
    <td width="32%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
				%>
      </select>    </td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ʱ�� ��</td>
    <td><input type="text" name="cksj" size="20" maxlength="10" value="<%=cf.firstDay()%>" onDblClick="JSCalendar(this)"></td>
    <td align="right">��</td>
    <td><input type="text" name="cksj2" size="20" maxlength="10" value="<%=cf.lastDay()%>" onDblClick="JSCalendar(this)"></td>
  </tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button" onClick="f_do(selectform,'qbcltj')"  value="ȫ�����Ϸ���ͳ��" >
    <input name="button" type="button" onClick="f_do(selectform,'fgscltj')"  value="�ֹ�˾���Ϸ���ͳ��" >
    <input  type="button" onClick="f_do(selectform,'khtj')"  value="�ͻ�����ͳ��" >
    <input  type="button" onClick="f_do(selectform,'khtj1')"  value="�ͻ���׼����ͳ��" >
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

function f_do(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.cksj)=="") {
		alert("������[����ʱ��]��");
		FormName.cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.cksj2)=="") {
		alert("������[����ʱ��]��");
		FormName.cksj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj2, "����ʱ��"))) {
		return false;
	}

	if (lx=="qbcltj")
	{

		FormName.action="Jxc_ckmxAllClTjList.jsp";
	}
	else if (lx=="fgscltj")
	{

		FormName.action="Jxc_ckmxFgsClTjList.jsp";
	}
	else if (lx=="khtj")
	{
		if(	javaTrim(FormName.fgs)=="") {
			alert("������[�ֹ�˾]��");
			FormName.fgs.focus();
			return false;
		}

		FormName.action="Jxc_ckmxKhTjList.jsp";
	}
	else if (lx=="khtj1")
	{
		if(	javaTrim(FormName.fgs)=="") {
			alert("������[�ֹ�˾]��");
			FormName.fgs.focus();
			return false;
		}

		FormName.action="Jxc_ckmxKhTjList1.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
