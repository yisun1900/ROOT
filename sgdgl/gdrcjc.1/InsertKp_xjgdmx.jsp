<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String xjjlh=request.getParameter("xjjlh");
String xmstr=cf.getItemData("select distinct kpxmbm,kpxmmc,kpdlbm from kp_gckpxm  order by kpdlbm,kpxmbm");
%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%" height="4"> 
      <div align="center">¼��ʩ���Ӽ����ϸ��<font color="#0000CC">��¼�ţ�<%=xjjlh%></font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_xjgdmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="16%"><font color="#CC0000">*</font>��Ŀ����</td>
              <td width="34%"> 
                <select name="kpdlbm" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpxm(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm","");
%> 
                </select>
                <input type="hidden" name="xjjlh" value="<%=xjjlh%>" size="27" maxlength="8" readonly>
              </td>
              <td align="right" width="17%"><font color="#CC0000">*</font>�����Ŀ</td>
              <td width="33%"> 
                <select name="kpxmbm" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpjg(insertform)">
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" ><font color="#CC0000">*</font>Υ��ּ�</td>
              <td width="34%" height="2" valign="top"> 
                <select name="kpjg" style="FONT-SIZE:14PX;WIDTH:200PX" onChange="getKpcf(insertform)">
                </select>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>Υ�´���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="wzcs" value="" size="27" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#CC0000">*</font><font color="#0000CC">�۷�</font></td>
              <td width="34%"> 
                <input type="text" name="kf" value="" size="27" maxlength="16" readonly>
              </td>
              <td width="17%" align="right"><font color="#CC0000">*</font><font color="#0000CC">����</font></td>
              <td width="33%"> 
                <input type="text" name="sgdfk" value="" size="27" maxlength="16" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">�۳��ӵ���ٷֱ�</font></div>
              </td>
              <td width="34%"> 
                <input type="text" name="kcjdebl" value="" size="10" maxlength="16" readonly>
                % </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">��������</font></div>
              </td>
              <td width="33%"> 
                <select name="kpcfbm" style="FONT-SIZE:14PX;WIDTH:200PX">
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFFF" align="right" width="16%">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="79" rows="3" ></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function getKpxm(FormName)
{               
	FormName.kpxmbm.length=0;  
	FormName.kpjg.length=0;  


	if(	javaTrim(FormName.kpdlbm)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpdlbm="+FormName.kpdlbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpjg(FormName)
{               
	FormName.kpjg.length=0;  


	if(	javaTrim(FormName.kpxmbm)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpxmbm="+FormName.kpxmbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpcf(FormName)
{               


	if(	javaTrim(FormName.kpjg)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpxmbm="+FormName.kpxmbm.value+"&kpjg="+FormName.kpjg.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("������[����¼��]��");
		FormName.xjjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.xjjlh, "����¼��"))) {
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("��ѡ��[�����Ŀ]��");
		FormName.kpxmbm.focus();
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

	if(	javaTrim(FormName.wzcs)=="") {
		alert("��ѡ��[Υ�´���]��");
		FormName.wzcs.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcs, "Υ�´���"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
