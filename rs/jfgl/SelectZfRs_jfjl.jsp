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
<form method="post" action="Rs_jfjlZfList.jsp" name="selectform">
<div align="center">����֧��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">�����ֹ�˾</td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
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
%> </td>
      <td align="right" width="18%">��������</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������¼��</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_jfjlh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">Ա�����</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">Ա������</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="18%">Ա�����</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���֤��</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">����ְ��</td>
      <td width="32%"> 
        <select name="rs_jfjl_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">��ְ���� ��</td>
      <td width="32%">
        <input type="text" name="rs_jfjl_rzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%">
        <input type="text" name="rs_jfjl_rzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����</td>
      <td width="32%"><%
	cf.radioToken(out, "rs_jfjl_lx","1+����&2+����","");
%> </td>
      <td align="right" width="18%">��������</td>
      <td width="32%">
        <select name="rs_jfjl_jflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jflxbm,jflxmc from dm_jflxbm order by lx,jflxbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�������</td>
      <td width="32%">
        <input type="text" name="rs_jfjl_jfje" size="20" maxlength="17" >
      </td>
      <td align="right" width="18%">״̬</td>
      <td width="32%"><input name="zt" type="radio" value="1" checked>
      δ֧�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�������� ��</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_jfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_jfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����֧������ ��</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_jfzfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_jfzfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼����</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">¼�벿��</td>
      <td width="32%"> 
        <select name="rs_jfjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_jfjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
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
	if(!(isNumber(FormName.rs_jfjl_jfjlh, "������¼��"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_jfjl_ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_jfjl_rzsj, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_jfjl_rzsj2, "��ְ����"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_jfjl_jfje, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_jfjl_jfrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_jfjl_jfrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_jfjl_jfzfrq, "����֧������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_jfjl_jfzfrq2, "����֧������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_jfjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_jfjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
