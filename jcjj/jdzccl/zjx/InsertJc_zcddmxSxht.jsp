<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
	String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));

	
	String clzt=cf.executeQuery("select clzt from jc_zczjx where zjxbh='"+zjxbh+"'");
	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ�����������");
		return;
	}
%>

<html>
<head>
<title>��д��ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���� ��д��Ŀ���������ţ�<%=zjxbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_zcddmxSxht.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#000099">���Ĵ���</font></td>
              <td width="33%"> 
                <input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#000099">����С��</font></td>
              <td width="33%"> 
                <input type="text" name="zcxlbm" value="<%=zcxlbm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>Ʒ�ƹ�Ӧ��</td>
              <td width="33%"> 
                <input type="text" name="dwbh" value="<%=ppbm%>" readonly>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>������λ</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>��������</td>
              <td colspan="3"> 
                <input type="text" name="zcmc" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">���/ϵ��</td>
              <td colspan="3"> 
                <input type="text" name="zclbbm" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�ͺ�</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">���</td>
              <td colspan="3"> 
                <input type="text" name="gg" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>�Ƿ��д���</td>
              <td width="33%"> 
                <input type="radio" name="sfycx" value="N" checked>
                û���� 
                <input type="radio" name="sfycx" value="Y">
                �д��� </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>ʵ������</td>
              <td width="33%"> 
                <input type="text" name="dj" size="17" maxlength="9"  onChange="f_jsjg(editform)">
                Ԫ </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="zcysbm" size="20" maxlength="50"  value="" onKeyUp="keyGo(zcpzwzbm)" >
              </td>
              <td width="17%"> 
                <div align="right">��װλ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="zcpzwzbm" size="20" maxlength="20"  value="" onKeyUp="keyGo(sl)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="33%"> 
                <input type="text" name="sl" size="20" maxlength="8"  value="" onChange="f_jsjg(editform)" onKeyUp="keyGo(ycf)">
              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">���Ϸ�</font></td>
              <td width="33%"> 
                <input type="text" name="je" size="17" maxlength="9"  value="" readonly>
                Ԫ </td>
              <td width="17%" align="right">Զ�̷�</td>
              <td width="33%"> 
                <input type="text" name="ycf" size="17" maxlength="9"  value="0" onKeyUp="keyTo(qtfy[0])">
                Ԫ </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="33%"> <%
	cf.radioToken(out, "qtfy","1+��װ��&2+�ӹ���&3+�����շ�&W+��","W");
%> </td>
              <td width="17%" align="right">�����ѽ��</td>
              <td width="33%"> 
                <input type="text" name="qtfyje" size="17" maxlength="9"  value="" onKeyUp="keyTo(cxhdbz[0])">
                Ԫ </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>�μӴ������־</td>
              <td width="33%"><%
	cf.radioToken(out, "cxhdbz","Y+�μ�&N+���μ�","");
%></td>
              <td width="17%" align="right"><font color="#FF0000">*</font>��д��ͬԭ��</td>
              <td width="33%"> 
                <select name="sxhtyy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sxhtyy c1,sxhtyy c2 from jdm_sxhtyybm order by sxhtyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">������������</td>
              <td width="33%"> 
                <input type="text" name="cxhdbl" size="14" maxlength="9"  value="" onChange="f_jsjg(editform)" onKeyUp="keyGo(bz)">
                % </td>
              <td width="17%" align="right"><font color="#0000CC">�����������</font></td>
              <td width="33%"> 
                <input type="text" name="cxhdje" size="17" maxlength="9"  value="" readonly>
                Ԫ </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="68" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="zjxbh" value="<%=zjxbh%>">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
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
function f_jsjg(FormName)//����FormName:Form������
{
	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);

	FormName.je.value=je;

	je=FormName.dj.value*FormName.sl.value*FormName.cxhdbl.value/100;
	je=round(je,2);

	FormName.cxhdje.value=je;
}
function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[Ʒ�ƹ�Ӧ��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcmc)=="") {
		alert("������[��������]��");
		FormName.zcmc.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("��ѡ��[�Ƿ��д���]��");
		FormName.sfycx[0].focus();
		return false;
	}



	if(	javaTrim(FormName.dj)=="") {
		alert("������[ʵ������]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "ʵ������"))) {
		return false;
	}

	if (FormName.dj.value=="0")
	{
		alert("[ʵ������]����Ϊ0��");
		FormName.dj.select();
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("[��������]����<=0��");
		FormName.sl.select();
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[���Ϸ�]��");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("������[Զ�̷�]��");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
		return false;
	}

	if(	!radioChecked(FormName.qtfy)) {
		alert("��ѡ��[��������]��");
		FormName.qtfy[0].focus();
		return false;
	}
	if(FormName.qtfy[0].checked || FormName.qtfy[1].checked || FormName.qtfy[2].checked) 
	{
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("������[�����ѽ��]��");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "�����ѽ��"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[�����ѽ��]����Ϊ0��");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}

	if(	!radioChecked(FormName.cxhdbz)) {
		alert("��ѡ��[�μӴ������־]��");
		FormName.cxhdbz[0].focus();
		return false;
	}
	if (FormName.cxhdbz[0].checked)
	{
		if(	javaTrim(FormName.cxhdbl)=="") {
			alert("������[������������]��");
			FormName.cxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.cxhdbl, "������������"))) {
			return false;
		}
		if (FormName.cxhdbl.value<=0 || FormName.cxhdbl.value>300)
		{
			alert("[������������]Ӧ��0����300��֮�䣡");
			FormName.cxhdbl.select();
			return false;
		}
	}
	else{
		FormName.cxhdbl.value="";
		FormName.cxhdje.value="0";
	}

	if(	javaTrim(FormName.sxhtyy)=="") {
		alert("������[��д��ͬԭ��]��");
		FormName.sxhtyy.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
