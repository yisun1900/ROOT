<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String) session.getAttribute("yhjs");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="95%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr> 
    <td width="95%" height="353"> 
      <div align="center"> 
        <form method="post" action="Dm_thjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">�˻���λ</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="thdw" style="FONT-SIZE:12px;WIDTH:152px">
                  <%
	if (yhjs.equals("02"))//02���ֹ�˾
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2','3') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("00"))//00���ܹ�˾
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2','3','4','8') order by dwbh","");
	}
	else if (yhjs.equals("01"))//01��ר����
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
	else if (yhjs.equals("03"))//03��������
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4','8') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("04"))//03��������
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
%> 
                </select>
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">�˻���¼��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="thjlh" size="20" maxlength="10" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFCC">�˻����� ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="thrq" size="20" maxlength="10" onKeyUp="cpbmKey(selectform)">
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="thrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr>
              <td width="15%" bgcolor="#FFFFFF" align="right">��Ա���</td>
              <td width="35%" bgcolor="#FFFFFF">
                <input type="text" name="khbh" size="20" maxlength="50" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">�ͻ�����</td>
              <td width="35%" bgcolor="#FFFFFF">
                <select name="khlx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="1">��Ա</option>
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="cpbm" size="20" maxlength="13" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�˻����</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="thj" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�˻�ԭ��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="thyy" size="20" maxlength="100" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�˻�����</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="thbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="0">�����˻�</option>
                  <option value="1">��껻��</option>
                  <option value="2">����˻�</option>
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">Ʒ������</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="plbm" size="20" maxlength="5" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">Ʒ�����</div>
              </td>
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
              <td width="15%" align="right" bgcolor="#FFFFFF">�����</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="bkbh" size="20" maxlength="11" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">��Ʒ���</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="cplb" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"B+�ؽ�&A+��Ƕ","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFCC">��ʯ���� ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">��ʯ���� ��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">��</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFCC">����(��) ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="jlzl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="jlzl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF"> 
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
              <td width="15%" align="right" bgcolor="#FFFFCC">��ǩ��(Ԫ) ��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">��</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">ʵ���� ��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="sxj" size="20" maxlength="17" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">��</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="sxj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�������</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="ywxh" size="20" maxlength="10" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�˻�������</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="czy" size="20" maxlength="16" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">���۵�λ</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="xsdw" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx","");
%> 
                </select>
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right"></div>
              </td>
              <td width="35%" bgcolor="#FFFFFF">&nbsp; </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">����˻����</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="shbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+��ͬ��&1+ͬ��&2+δ���&3+���۵������","");
%> 
                </select>
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�����</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="shr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�������</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="shrq" size="20" maxlength="10" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">�Ƿ����</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="sfjs" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δ����&1+����","");
%> 
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="��ѯ��ϸ" onClick="f_cxmx(selectform)">
                <input type="button"  value="��ӡ��ϸ" onClick="f_dymx(selectform)" >
                <input type="button"  value="��ӡͳ�Ʊ�" onClick="f_dytj(selectform)" >
                <input type="reset"  value="����">
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
		FormName.thrq2.select();
	}
}
function f_cxmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.thrq)=="") {
		alert("������[�˻�����]��");
		FormName.thrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq, "�˻�����"))) {
		return false;
	}
	if(	javaTrim(FormName.thrq2)=="") {
		alert("������[�˻�����]��");
		FormName.thrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq2, "�˻�����"))) {
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
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.thj, "�˻����"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "�Ƿ����"))) {
		return false;
	}
	FormName.action="Dm_thjlCxList.jsp";
	FormName.submit();
	return true;
}
function f_dymx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.thrq)=="") {
		alert("������[�˻�����]��");
		FormName.thrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq, "�˻�����"))) {
		return false;
	}
	if(	javaTrim(FormName.thrq2)=="") {
		alert("������[�˻�����]��");
		FormName.thrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq2, "�˻�����"))) {
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
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.thj, "�˻����"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "�Ƿ����"))) {
		return false;
	}
	FormName.action="dythmx.jsp";
	FormName.submit();
	return true;
}
function f_dytj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.thrq)=="") {
		alert("������[�˻�����]��");
		FormName.thrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq, "�˻�����"))) {
		return false;
	}
	if(	javaTrim(FormName.thrq2)=="") {
		alert("������[�˻�����]��");
		FormName.thrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq2, "�˻�����"))) {
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
	if(!(isFloat(FormName.bqj, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "��ǩ��"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "ʵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.thj, "�˻����"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "�Ƿ����"))) {
		return false;
	}
	FormName.action="Dm_thjlTjbList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
