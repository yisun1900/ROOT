<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �ó�����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_pcsq.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <span class="STYLE1">*</span>���벿��              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else  
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
              </select>              </td>
              <td width="18%" align="right"> 
              <span class="STYLE1">*</span>��������              </td>
              <td width="32%"> 
              <input type="text" name="sqrq"  size="20" value=<%=cf.today()%> maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">*</span>������</td>
              <td width="32%"> 
              <input type="text" name="sqr" value="<%=lrr%>" size="20" maxlength="8" >              </td>
              <td width="18%" align="right"><span class="STYLE1">*</span>��ϵ��ʽ</td>
              <td width="32%"> 
              <input type="text" name="lxfs" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <p align="right"><span class="STYLE1">*</span>�ó�����              </td>
              <td colspan="3"> 
                <textarea name="ycsy" cols="71" rows="3"></textarea>
              �� �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <span class="STYLE1">*</span>Ŀ�ĵ�              </td>
              <td width="32%"> 
              <input type="text" name="mdd" value="" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
              ������              </td>
              <td width="32%"> 
              <input type="text" name="gls" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <span class="STYLE1">*</span>�ó�ʱ��              </td>
              <td colspan="3"> ���ڣ� 
                <input type="text" name="ycsj" value=<%=cf.today()%> size="10" maxlength="10" onDblClick="JSCalendar(this)">
                Сʱ�� 
                <select name="ycsj1" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
                  <option value="08">8ʱ</option>
                  <option value="09">9ʱ</option>
                  <option value="10">10ʱ</option>
                  <option value="11">11ʱ</option>
                  <option value="12">12ʱ</option>
                  <option value="13">13ʱ</option>
                  <option value="14">14ʱ</option>
                  <option value="15">15ʱ</option>
                  <option value="16">16ʱ</option>
                  <option value="17">17ʱ</option>
                  <option value="18">18ʱ</option>
                  <option value="19">19ʱ</option>
                  <option value="20">20ʱ</option>
                  <option value="21">21ʱ</option>
                  <option value="22">22ʱ</option>
                  <option value="23">23ʱ</option>
                  <option value="00">0ʱ</option>
                  <option value="01">1ʱ</option>
                  <option value="02">2ʱ</option>
                  <option value="03">3ʱ</option>
                  <option value="04">4ʱ</option>
                  <option value="05">5ʱ</option>
                  <option value="06">6ʱ</option>
                  <option value="07">7ʱ</option>
                </select>
                ���ӣ� 
                <select name="ycsj2" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
                  <option value="00" selected>00��</option>
                  <option value="10">10��</option>
                  <option value="20">20��</option>
                  <option value="30">30��</option>
                  <option value="40">40��</option>
                  <option value="50">50��</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <p align="right"><span class="STYLE1">*</span>����ʱ��              </td>
              <td colspan="3">���ڣ� 
                <input type="text" name="fhsj" value=<%=cf.today()%> size="10" maxlength="10" onDblClick="JSCalendar(this)">
                Сʱ�� 
                <select name="fhsj1" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
                  <option value="08">8ʱ</option>
                  <option value="09">9ʱ</option>
                  <option value="10">10ʱ</option>
                  <option value="11">11ʱ</option>
                  <option value="12">12ʱ</option>
                  <option value="13">13ʱ</option>
                  <option value="14">14ʱ</option>
                  <option value="15">15ʱ</option>
                  <option value="16">16ʱ</option>
                  <option value="17">17ʱ</option>
                  <option value="18">18ʱ</option>
                  <option value="19">19ʱ</option>
                  <option value="20">20ʱ</option>
                  <option value="21">21ʱ</option>
                  <option value="22">22ʱ</option>
                  <option value="23">23ʱ</option>
                  <option value="00">0ʱ</option>
                  <option value="01">1ʱ</option>
                  <option value="02">2ʱ</option>
                  <option value="03">3ʱ</option>
                  <option value="04">4ʱ</option>
                  <option value="05">5ʱ</option>
                  <option value="06">6ʱ</option>
                  <option value="07">7ʱ</option>
                </select>
                ���ӣ� 
                <select name="fhsj2" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
                  <option value="00" selected>00��</option>
                  <option value="10">10��</option>
                  <option value="20">20��</option>
                  <option value="30">30��</option>
                  <option value="40">40��</option>
                  <option value="50">50��</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF"><span class="STYLE1">*</span>¼����</font></td>
              <td width="32%"> 
              <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>              </td>
              <td align="right" width="18%"><font color="#0000FF"><span class="STYLE1">*</span>¼��ʱ��</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button" name="bc"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[���벿��]��");
		FormName.dwbh.focus();
		return false;
	}
		if(	javaTrim(FormName.sqr)=="") {
		alert("������[������]��");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.mdd)=="") {
		alert("������[Ŀ�ĵ�]��");
		FormName.mdd.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.ycsy)=="") {
		alert("������[�ó����� ]��");
		FormName.ycsy.focus();
		return false;
	}

	if(	javaTrim(FormName.sqrq)=="") {
		alert("������[��������]��");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.mdd)=="") {
		alert("������[Ŀ�ĵ�]��");
		FormName.mdd.focus();
		return false;
	}

	if(	javaTrim(FormName.ycsj)=="") {
		alert("������[�ó�����]��");
		FormName.ycsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ycsj, "�ó�����"))) {
		return false;
	}
 	if(	javaTrim(FormName.ycsj1)=="") {
		alert("������[�ó�Сʱ]��");
		FormName.ycsj1.focus();
		return false;
	}
 	if(	javaTrim(FormName.ycsj2)=="") {
		alert("������[�ó�����]��");
		FormName.ycsj2.focus();
		return false;
	}


	if(	javaTrim(FormName.fhsj)=="") {
		alert("������[����ʱ��]��");
		FormName.fhsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fhsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.fhsj1)=="") {
		alert("������[����Сʱ]��");
		FormName.fhsj1.focus();
		return false;
	}
	if(	javaTrim(FormName.fhsj2)=="") {
		alert("������[���ط���]��");
		FormName.fhsj2.focus();
		return false;
	}



	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
