<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String) session.getAttribute("yhjs");
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" > 
      <div align="center"> 
        <form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">���۵�λ</td>
              <td width="35%">
                <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px">
                  <%
	if (yhjs.equals("00"))//00���ܹ�˾
	{
//		out.println("<option value=''></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx not in('5','6') order by dwbh","");
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
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ա���</div>
              </td>
              <td width="35%">
                <input type="text" name="hybh" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">ˮ�ʷ�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hykh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">�������� ��</td>
              <td width="35%"> 
                <input type="text" name="xsrq" size="20" maxlength="10"  onKeyUp="cpbmKey(selectform)">
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="xsrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="��ѯ��ϸ" onClick="f_mxb(selectform)">
                <input type="button"  value="��ӡ��ϸ" onClick="f_dymx(selectform)" >
                <input type="button"  value="����ͳ��" onClick="f_xstj(selectform)" >
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

	FormName.action="Dm_xsjlCxList.jsp";
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


	FormName.action="Dm_xsjlDyList.jsp";
	FormName.submit();
	return true;
}

function f_xstj(FormName)//����FormName:Form������
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


	FormName.action="xstj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
