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
<form method="post" action="Cw_impjdpzCxList.jsp" name="selectform">
  <div align="center">ƾ֤�������ѯ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">�ֹ�˾</td>
      <td width="31%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td align="right" width="19%">ǩԼ����</td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
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
      <td width="19%" align="right">��ͬ��</td>
      <td width="31%"> 
        <input type="text" name="hth" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">
      </td>
      <td width="19%" align="right">�ͻ����</td>
      <td width="31%"> 
        <input type="text" name="khbh" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right">�ͻ�����</div>
      </td>
      <td width="31%"> 
        <input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)">
      </td>
      <td width="19%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="31%"> 
        <input type="text" name="lxfs" size="20" maxlength="50"  onKeyUp="keyGo(fwdz)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right">���ݵ�ַ</div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="73" maxlength="100" onKeyUp="keyGo(butt)" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���</td>
      <td width="31%"> 
        <input type="text" name="xuhao" size="20" maxlength="8" >
      </td>
      <td align="right" width="19%">ƾ֤����</td>
      <td width="31%"> 
        <input type="text" name="fdate" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ҵ������</td>
      <td width="31%"> 
        <input type="text" name="ftransdate" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">����ڼ�</td>
      <td width="31%"> 
        <input type="text" name="fperiod" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ƾ֤��</td>
      <td width="31%"> 
        <input type="text" name="fgroup" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">ƾ֤��</td>
      <td width="31%"> 
        <input type="text" name="fnum" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��¼��</td>
      <td width="31%"> 
        <input type="text" name="fentryid" size="20" maxlength="8" >
      </td>
      <td align="right" width="19%">ƾ֤ժҪ</td>
      <td width="31%"> 
        <input type="text" name="fexp" size="20" maxlength="254" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ��</td>
      <td width="31%"> 
        <input type="text" name="facctid" size="20" maxlength="40" >
      </td>
      <td align="right" width="19%">��Ŀ�������1</td>
      <td width="31%"> 
        <input type="text" name="fclsname1" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ĿID1</td>
      <td width="31%"> 
        <input type="text" name="fobjid1" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��Ŀ����1</td>
      <td width="31%"> 
        <input type="text" name="fobjname1" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ�������2</td>
      <td width="31%"> 
        <input type="text" name="fclsname2" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��ĿID2</td>
      <td width="31%"> 
        <input type="text" name="fobjid2" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ����2</td>
      <td width="31%"> 
        <input type="text" name="fobjname2" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��Ŀ�������3</td>
      <td width="31%"> 
        <input type="text" name="fclsname3" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ĿID3</td>
      <td width="31%"> 
        <input type="text" name="fobjid3" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��Ŀ����3</td>
      <td width="31%"> 
        <input type="text" name="fobjname3" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ�������4</td>
      <td width="31%"> 
        <input type="text" name="fclsname4" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��ĿID4</td>
      <td width="31%"> 
        <input type="text" name="fobjid4" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ����4</td>
      <td width="31%"> 
        <input type="text" name="fobjname4" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��Ŀ�������5</td>
      <td width="31%"> 
        <input type="text" name="fclsname5" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ĿID5</td>
      <td width="31%"> 
        <input type="text" name="fobjid5" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��Ŀ����5</td>
      <td width="31%"> 
        <input type="text" name="fobjname5" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ�������6</td>
      <td width="31%"> 
        <input type="text" name="fclsname6" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��ĿID6</td>
      <td width="31%"> 
        <input type="text" name="fobjid6" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ����6</td>
      <td width="31%"> 
        <input type="text" name="fobjname6" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��Ŀ�������7</td>
      <td width="31%"> 
        <input type="text" name="fclsname7" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ĿID7</td>
      <td width="31%"> 
        <input type="text" name="fobjid7" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��Ŀ����7</td>
      <td width="31%"> 
        <input type="text" name="fobjname7" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ�������8</td>
      <td width="31%"> 
        <input type="text" name="fclsname8" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��ĿID8</td>
      <td width="31%"> 
        <input type="text" name="fobjid8" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ŀ����8</td>
      <td width="31%"> 
        <input type="text" name="fobjname8" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">ҵ����</td>
      <td width="31%"> 
        <input type="text" name="ftransid" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����</td>
      <td width="31%"> 
        <input type="text" name="fcyid" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">����</td>
      <td width="31%"> 
        <input type="text" name="fexchrate" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�����־</td>
      <td width="31%"> 
        <input type="text" name="fdc" size="20" maxlength="1" >
      </td>
      <td align="right" width="19%">ԭ�ҽ��</td>
      <td width="31%"> 
        <input type="text" name="ffcyamt" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����</td>
      <td width="31%"> 
        <input type="text" name="fqty" size="20" maxlength="17" >
      </td>
      <td align="right" width="19%">����</td>
      <td width="31%"> 
        <input type="text" name="fprice" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�跽������</td>
      <td width="31%"> 
        <input type="text" name="fdebit" size="20" maxlength="17" >
      </td>
      <td align="right" width="19%">����������</td>
      <td width="31%"> 
        <input type="text" name="fcredit" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���㷽ʽ����</td>
      <td width="31%"> 
        <input type="text" name="fsettlcode" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">�����</td>
      <td width="31%"> 
        <input type="text" name="fsettleno" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƶ���</td>
      <td width="31%"> 
        <input type="text" name="fprepare" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">δʹ��1</td>
      <td width="31%"> 
        <input type="text" name="fpay" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">δʹ��2</td>
      <td width="31%"> 
        <input type="text" name="fcash" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">������</td>
      <td width="31%"> 
        <input type="text" name="fposter" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�����</td>
      <td width="31%"> 
        <input type="text" name="fchecker" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">��������</td>
      <td width="31%"> 
        <input type="text" name="fattchment" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���˱��</td>
      <td width="31%"> 
        <input type="text" name="fposted" size="20" maxlength="1" >
      </td>
      <td align="right" width="19%">����ƾ֤ģ���ʶ</td>
      <td width="31%"> 
        <input type="text" name="fmodule" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ɾ�����</td>
      <td width="31%"> 
        <input type="text" name="fdeleted" size="20" maxlength="1" >
      </td>
      <td align="right" width="19%">ƾ֤���</td>
      <td width="31%"> 
        <input type="text" name="fserialno" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��λ</td>
      <td width="31%"> 
        <input type="text" name="funitname" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">�ο���Ϣ</td>
      <td width="31%"> 
        <input type="text" name="freference" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƿ���ָ���ֽ�����</td>
      <td width="31%"> 
        <input type="text" name="fcashflow" size="20" maxlength="8" >
      </td>
      <td align="right" width="19%">����ʱ��</td>
      <td width="31%"> 
        <input type="text" name="drsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������</td>
      <td width="31%"> 
        <input type="text" name="drr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">��ע</td>
      <td width="31%"> 
        <input type="text" name="bz" size="20" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ɾ����־</td>
      <td width="31%"> 
        <INPUT type="radio" name="scbz" value="N">
        δɾ�� 
        <INPUT type="radio" name="scbz" value="Y">
        ��ɾ�� </td>
      <td align="right" width="19%">ɾ����</td>
      <td width="31%"> 
        <input type="text" name="scr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ɾ��ʱ��</td>
      <td width="31%"> 
        <input type="text" name="scsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">&nbsp; </td>
      <td width="31%">&nbsp; </td>
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
	if(!(isNumber(FormName.xuhao, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.fdate, "ƾ֤����"))) {
		return false;
	}
	if(!(isDatetime(FormName.ftransdate, "ҵ������"))) {
		return false;
	}
	if(!(isNumber(FormName.fperiod, "����ڼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.fnum, "ƾ֤��"))) {
		return false;
	}
	if(!(isNumber(FormName.fentryid, "��¼��"))) {
		return false;
	}
	if(!(isFloat(FormName.fexchrate, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.ffcyamt, "ԭ�ҽ��"))) {
		return false;
	}
	if(!(isFloat(FormName.fqty, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.fprice, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.fdebit, "�跽������"))) {
		return false;
	}
	if(!(isFloat(FormName.fcredit, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.fattchment, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.fserialno, "ƾ֤���"))) {
		return false;
	}
	if(!(isNumber(FormName.fcashflow, "�Ƿ���ָ���ֽ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.drsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.scsj, "ɾ��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
