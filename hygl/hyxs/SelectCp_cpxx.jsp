<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String) session.getAttribute("yhjs");
String tjxz=request.getParameter("tjxz");
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="94%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr> 
    <td width="94%" height="438"> 
      <div align="center"> 
        <form method="post" action="Cp_cpxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">���۵�λ</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="szdw" style="FONT-SIZE:12px;WIDTH:152px">
<%
	if (yhjs.equals("00"))//00���ܹ�˾
	{
//		out.println("<option value=''></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2','3','4','7','8') order by dwbh","");
	}
	else if (yhjs.equals("02"))//02���ֹ�˾
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('2','3') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("01"))//01��ר����
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
	else if (yhjs.equals("03"))//03��������
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4','8') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("04"))//04������ר����
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">����</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="jldm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yldm,ylmc from yl_jldmb","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�������� ��</td>
              <td width="35%"> 
                <input type="text" name="xsrq" size="20" maxlength="10"  onKeyUp="cpbmKey(selectform)">
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="xsrq2" size="20" maxlength="10" >
                <input type="hidden" name="tjxz" value="<%=tjxz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������</td>
              <td>
                <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='5' order by dwbh","");
%>
                </select>
              </td>
              <td align="right">��������</td>
              <td>
                <select name="gkbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="0">������</option>
                  <option value="1">�Ŀ��</option>
                  <option value="2">������</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ʵ���� ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxj" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">��Ʒ����</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="cpbm" size="20" maxlength="13"  onKeyUp="singleAdd(selectform)">
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">֤����</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="zsh" size="20" maxlength="16" >
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">�����</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="bkbh" size="20" maxlength="11" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">�������</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="gckh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">Ʒ��(5λ)</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="plbm" size="20" maxlength="5" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">Ʒ��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="pmbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select pmbm,pmmc from xt_pmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">��Ʒ���</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="cplb" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="A">��Ƕ��</option>
                  <option value="B">�ؽ���</option>
                </select>
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">��Ʒ����</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="hplx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bkdlbm,bkdlmc from xt_bkdlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">�������</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="rkph" size="20" maxlength="16" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">���������</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="bkflbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bkflbm,bkflmc from xt_bkflbm order by bkflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC" align="right">��Ȧ�� ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zqh" size="20" maxlength="10" >
              </td>
              <td width="15%" bgcolor="#FFFFCC" align="right">&nbsp;</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zqh2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������(��) ��</td>
              <td width="35%"> 
                <input type="text" name="zzl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="zzl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">����(��) ��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="jlzl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="jlzl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC">��ʯ���� ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">��ʯ���� ��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">���ۼ�(Ԫ) ��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="lsj" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="lsj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC">��ǩ��(Ԫ) ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">������� ��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="rkrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="rkrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">�������� ��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="yrkrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="yrkrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <p>
                  <input type="button"  value="��ѯ��ϸ" onClick="f_mxb(selectform)">
                  <input type="button"  value="��ӡ��ϸ" onClick="f_dymx(selectform)" >
                  <input type="reset"  value="����">
                </p>
                <p>
                  <input type="button"  value="Ʒ��ͳ��" onClick="f_pltjb(selectform)" name="button21">
				  <input type="button"  value="Ʒ����λͳ��" onClick="f_pmjwtjb(selectform)" name="button22">
                  <input type="button"  value="Ʒ��ͳ��" onClick="f_pmtjb(selectform)" name="button3" >
                  <input type="button"  value="��λͳ��" onClick="f_jwtjb(selectform)" name="button2" >
                  <input type="button"  value="���ͳ�Ʊ�" onClick="f_khtjb(selectform)" name="button" >
                </p>
              </td>
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
function cpbmKey(FormName)
{
//	alert(event.keyCode);
	if (event.keyCode==13)	
	{
		FormName.xsrq2.select();
	}
}
function f_mxb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("������[��������]��");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "��Ȧ��"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "��Ȧ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "��������"))) {
		return false;
	}
	FormName.action="Cp_cpxxList.jsp";
	FormName.submit();
	return true;
}

function f_dymx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("������[��������]��");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "��Ȧ��"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "��Ȧ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "��������"))) {
		return false;
	}
	FormName.action="Cp_cpxxDyList.jsp";
	FormName.submit();
	return true;
}
function f_pltjb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("������[��������]��");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "��Ȧ��"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "��Ȧ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "��������"))) {
		return false;
	}
	FormName.action="pltjb.jsp";
	FormName.submit();
	return true;
}
function f_pmjwtjb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("������[��������]��");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "��Ȧ��"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "��Ȧ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "��������"))) {
		return false;
	}
	FormName.action="pmjwtjb.jsp";
	FormName.submit();
	return true;
}

function f_pmtjb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("������[��������]��");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "��Ȧ��"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "��Ȧ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "��������"))) {
		return false;
	}
	FormName.action="pmtjb.jsp";
	FormName.submit();
	return true;
}

function f_khtjb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("������[��������]��");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "��Ȧ��"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "��Ȧ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "��������"))) {
		return false;
	}
	FormName.action="khtjb.jsp";
	FormName.submit();
	return true;
}

function f_jwtjb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("������[��������]��");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "��ʯ����"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "��Ȧ��"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "��Ȧ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "��������"))) {
		return false;
	}
	FormName.action="jwtjb.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
