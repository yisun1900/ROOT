<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ysjlh=request.getParameter("ysjlh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼����Ͻ�����ϸ�����ռ�¼�ţ�<%=ysjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_cljcmx.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���Ϸ���</div>
              </td>
              <td width="35%"> 
                <select name="clflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clflbm,clflmc from dm_clflbm order by clflmc","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">Ʒ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pp" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">���</td>
              <td colspan="3"> 
                <input type="text" name="gg" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" value="" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">������λ</div>
              </td>
              <td width="35%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="hidden" name="clmc" value="" size="20" maxlength="50" >
                <input type="hidden" name="clbm" value="" size="20" maxlength="8" >
                <input type="hidden" name="ysjlh" value="<%=ysjlh%>" size="20" maxlength="10" >
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.clflbm)=="") {
		alert("��ѡ��[���Ϸ���]��");
		FormName.clflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pp)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.pp.focus();
		return false;
	}
	if(	javaTrim(FormName.gg)=="") {
		alert("��ѡ��[���]��");
		FormName.gg.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
