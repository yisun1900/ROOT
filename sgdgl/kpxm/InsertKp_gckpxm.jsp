<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">¼�룭ʩ����Υ����Ŀ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>Υ����Ŀ����</td>
              <td width="32%"> 
                <input type="text" name="kpxmbm" value="" size="20" maxlength="10" >              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>��Ŀ���� </td>
              <td width="32%"><select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>Υ����Ŀ����</td>
              <td colspan="3"><input type="text" name="kpxmmc" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>Υ��ּ�</td>
              <td width="32%"><select name="kpjg" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select yzcdbm,ydcdmc from kp_sgdyzcdbm order by yzcdbm","");
%>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">Υ��ּ�����</td>
              <td colspan="3"><textarea name="kpjgdy" cols="71" rows="5"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td><select name="kpcfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select kpcfbm,kpcfmc from kp_kpcfbm order by kpcfbm","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������׼</td>
              <td colspan="3"><textarea name="cfbz" cols="71" rows="5"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>�۷�              </td>
              <td width="32%"> 
                <input type="text" name="kf" value="" size="20" maxlength="16" >              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>����              </td>
              <td width="32%"> 
                <input type="text" name="sgdfk" value="" size="20" maxlength="16" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>�۳��ӵ���ٷֱ�</td>
              <td width="32%"> 
                <input type="text" name="kcjdebl" value="" size="10" maxlength="16" >
              % </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">             
				<P>
				<A HREF="ʩ����Υ����Ŀ.xls"><B>����Ҽ����Ϊ������Excelģ��</B></A>&nbsp;&nbsp;&nbsp;
				<input type="button" onClick="LoadExc(insertform)"  value="����-Excel"></td>
            </tr>
        </table>
</form>
	  
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
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("������[Υ����Ŀ����]��");
		FormName.kpxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpxmmc)=="") {
		alert("������[Υ����Ŀ����]��");
		FormName.kpxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("��ѡ��[Υ��ּ�]��");
		FormName.kpjg.focus();
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("��ѡ��[�۷�]��");
		FormName.kf.focus();
		return false;
	}
	if(!(isFloat(FormName.kf, "�۷�"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("��ѡ��[����]��");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.kcjdebl)=="") {
		alert("��ѡ��[�۳��ӵ���ٷֱ�]��");
		FormName.kcjdebl.focus();
		return false;
	}
	if(!(isFloat(FormName.kcjdebl, "�۳��ӵ���ٷֱ�"))) {
		return false;
	}
	if (FormName.kcjdebl.value<0 || FormName.kcjdebl.value>100)
	{
		alert("����[�۳��ӵ���ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.kcjdebl.select();
		return false;
	}

	FormName.action="SaveInsertKp_gckpxm.jsp";
	FormName.submit();
	return true;
}

function LoadExc(FormName)//����FormName:Form������
{

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
