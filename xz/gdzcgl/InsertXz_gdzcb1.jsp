<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");

%>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �̶��ʲ��Ǽ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_gdzcb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>�̶��ʲ����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="gsbh" value="" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">�����ڲ����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="bmbh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�̶��ʲ�����</td>
              <td colspan="3"> 
                <input type="text" name="gdzcmc" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�̶��ʲ�����</td>
              <td width="30%"> 
                <select name="gdzcflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
			cf.selectItem(out,"select gdzcflbm,gdzcflmc from xz_gdzcflbm order by gdzcflbm","");
%> 
                </select>
              </td>
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ��ѱ���</td>
              <td width="30%"> 
                <select name="sfybf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="Y">��</option>
                  <option selected value="N">��</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����(CPU)</td>
              <td width="30%"> 
                <input type="text" name="pz1" value="" size="20" maxlength="50">
              </td>
              <td width="20%" align="right">����(�ڴ�)</td>
              <td width="30%"> 
                <input type="text" name="pz2" value="" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����(Ӳ��)</td>
              <td width="30%"> 
                <input type="text" name="pz3" value="" size="20" maxlength="50">
              </td>
              <td width="20%" align="right">����(����)</td>
              <td width="30%"> 
                <input type="text" name="pz4" value="" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����(�Կ�)</td>
              <td width="30%"> 
                <input type="text" name="pz5" value="" size="20" maxlength="50">
              </td>
              <td width="20%" align="right">����(��ʾ��)</td>
              <td width="30%">
                <input type="text" name="pz6" value="" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>Ʒ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="pp" value="" size="20" maxlength="50" >
              </td>
              <td rowspan="6"> 
                <div align="right"><font color="#CC0000">*</font>�ʲ������ֹ�˾</div>
              </td>
              <td rowspan="6"> 
                <select name="ssfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' OR dwlx in('A0')","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�ͺ�</td>
              <td width="30%"> 
                <input type="text" name="xh" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>����</td>
              <td width="30%"> 
                <input type="text" name="sl" value="1" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����ʱ��</td>
              <td width="30%"> 
                <input type="text" name="grsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���õ�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="gzd" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�����</td>
              <td width="30%"> 
                <input type="text" name="grj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>��ǰ���ֹܷ�˾</div>
              </td>
              <td width="30%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(insertform)">
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
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>��ǰ���ܲ���</div>
              </td>
              <td width="30%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changebm(insertform)">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where   dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>������</div>
              </td>
              <td width="30%"> 
                <select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="bgr.value=ygbh.options[ygbh.selectedIndex].text">
                  <%
		out.println("<option value=\"\"></option>");
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>�ƽ�������ʱ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yjsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="30" readonly >
              </td>
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
              <td width="30%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0033">*</font><font color="#0000CC">¼�벿��</font></td>
              <td width="30%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="bgr" value="" >
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

//��ѯҳ��ʹ�ã���������������
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	field.add(op1);
}

function changefgs(FormName)
{
	if(	javaTrim(FormName.fgsbh)=="") 
	{
		return false;
	}
	
	FormName.dwbh.length=1;
	FormName.ygbh.length=1;
	
	var str="InsertXz_gdzcbCx.jsp?fgsbh="+FormName.fgsbh.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function changebm(FormName)
{
	if(	javaTrim(FormName.dwbh)=="") 
	{
		return false;
	}

	
	FormName.ygbh.length=1;
	
	var str="InsertXz_gdzcbCx.jsp?dwbh="+FormName.dwbh.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gsbh)=="") {
		alert("������[�̶��ʲ����]��");
		FormName.gsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gdzcmc)=="") {
		alert("������[�̶��ʲ�����]��");
		FormName.gdzcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gdzcflbm)=="") {
		alert("������[�̶��ʲ�����]��");
		FormName.gdzcflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pp)=="") {
		alert("������[Ʒ��]��");
		FormName.pp.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.grsj, "����ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.grj, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[��ǰ���ֹܷ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��ǰ���ܲ���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[������]��");
		FormName.ygbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("��ѡ��[�ƽ�������ʱ��]��");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "�ƽ�������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sfybf)=="") {
		alert("������[�Ƿ��ѱ���]��");
		FormName.sfybf.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("��ѡ��[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("��ѡ��[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	!selectChecked(FormName.ssfgsbh)) {
		alert("������[�ʲ������ֹ�˾]��");
		FormName.ssfgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
