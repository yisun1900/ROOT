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
<form method="post" action="Crm_qyexgjlCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸ļ�¼��</td>
      <td width="31%"> 
        <input type="text" name="xgjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">�ͻ����</td>
      <td width="30%"> 
        <input type="text" name="khbh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ͬ��</td>
      <td width="31%"> 
        <input type="text" name="hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">�ͻ�����</td>
      <td width="30%"> 
        <input type="text" name="khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ݵ�ַ</td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="74" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ�ֹ�˾</td>
      <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssdw,dwbh");
        out.println("        <select name=\"xgqfgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xgqfgsbh,xgqdwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",ssfgs);
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"xgqfgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="20%">�޸ĺ�ֹ�˾</td>
      <td width="30%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssdw,dwbh");
        out.println("        <select name=\"xghfgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xghfgsbh,xghdwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",ssfgs);
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"xghfgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰǩԼ����</td>
      <td width="31%"> 
        <select name="xgqdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
        </select>
      </td>
      <td align="right" width="20%">�޸ĺ�ǩԼ����</td>
      <td width="30%"> 
        <select name="xghdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ���ʦ</td>
      <td width="31%"> 
        <input type="text" name="xgqsjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">�޸ĺ����ʦ</td>
      <td width="30%"> 
        <input type="text" name="xghsjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ���ʦ����</td>
      <td width="31%"> 
        <input type="text" name="xgqsjsgh" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">�޸ĺ����ʦ����</td>
      <td width="30%"> 
        <input type="text" name="xghsjsgh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ����ԭ����</td>
      <td width="31%"> 
        <input type="text" name="xgqwdzgce" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">�޸ĺ󹤳�ԭ����</td>
      <td width="30%"> 
        <input type="text" name="xghwdzgce" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ�ۿ���</td>
      <td width="31%"> 
        <input type="text" name="xgqzkl" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">�޸ĺ��ۿ���</td>
      <td width="30%"> 
        <input type="text" name="xghzkl" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰǩԼ��</td>
      <td width="31%"> 
        <input type="text" name="xgqqye" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">�޸ĺ�ǩԼ��</td>
      <td width="30%"> 
        <input type="text" name="xghqye" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ˰��ٷֱ�</td>
      <td width="31%"> 
        <input type="text" name="xgqsuijinbfb" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">�޸ĺ�˰��ٷֱ�</td>
      <td width="30%"> 
        <input type="text" name="xghsuijinbfb" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ˰��</td>
      <td width="31%"> 
        <input type="text" name="xgqsuijin" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">�޸ĺ�˰��</td>
      <td width="30%"> 
        <input type="text" name="xghsuijin" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ��Ʒ�</td>
      <td width="31%"> 
        <input type="text" name="xgqsjf" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">�޸ĺ���Ʒ�</td>
      <td width="30%"> 
        <input type="text" name="xghsjf" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ�����</td>
      <td width="31%"> 
        <input type="text" name="xgqglf" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">�޸ĺ�����</td>
      <td width="30%"> 
        <input type="text" name="xghglf" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�޸�ǰ�����</td>
      <td width="31%"> 
        <select name="xgqcxhd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'��'||DECODE(jsbz,'N','δ����','Y','����')||'��' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
        </select>
      </td>
      <td align="right" width="20%">�޸ĺ�����</td>
      <td width="30%"> 
        <select name="xghcxhd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'��'||DECODE(jsbz,'N','δ����','Y','����')||'��' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%">�޸�ǰ�����</td>
      <td width="31%">
        <input type="text" name="xgqcxhd2" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">�޸ĺ�����</td>
      <td width="30%">
        <input type="text" name="xghcxhd2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼��ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼����</td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">¼�벿��</td>
      <td width="30%"> 
        <input type="text" name="lrbm" size="20" maxlength="5" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ɾ����־</td>
      <td width="31%"><%
	cf.radioToken(out, "scbz","N+δɾ��&Y+ɾ��","");
%> </td>
      <td align="right" width="20%">ɾ����</td>
      <td width="30%"> 
        <input type="text" name="scr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ɾ��ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="scsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="scsj2" size="20" maxlength="10" >
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
	if(!(isFloat(FormName.xgqwdzgce, "�޸�ǰ����ԭ����"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqqye, "�޸�ǰǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqsuijin, "�޸�ǰ˰��"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqsuijinbfb, "�޸�ǰ˰��ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqsjf, "�޸�ǰ��Ʒ�"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqglf, "�޸�ǰ�����"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqzkl, "�޸�ǰ�ۿ���"))) {
		return false;
	}
	if(!(isFloat(FormName.xghwdzgce, "�޸ĺ󹤳�ԭ����"))) {
		return false;
	}
	if(!(isFloat(FormName.xghqye, "�޸ĺ�ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.xghsuijin, "�޸ĺ�˰��"))) {
		return false;
	}
	if(!(isFloat(FormName.xghsuijinbfb, "�޸ĺ�˰��ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.xghsjf, "�޸ĺ���Ʒ�"))) {
		return false;
	}
	if(!(isFloat(FormName.xghglf, "�޸ĺ�����"))) {
		return false;
	}
	if(!(isFloat(FormName.xghzkl, "�޸ĺ��ۿ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.scsj, "ɾ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.scsj2, "ɾ��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
