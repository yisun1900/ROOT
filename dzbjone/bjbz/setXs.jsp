<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String dqbm=request.getParameter("bj_jzbjb_dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

%>

<body bgcolor="#FFFFFF">
<div align="center">���ñ���ϵ��</div>
<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���۰汾��</td>
              <td colspan="3">
                <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:515PX">
                  <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb where bjbbh='"+bjbbh+"'","");
%> 
                </select>				</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>����</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%> 
              </select>              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>���ۼ���</td>
              <td width="31%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm='"+bjjbbm+"' order by bjjbbm","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���̻�������ϵ��</td>
              <td><input type="text" name="gcjcbjxs" size="20" maxlength="8" > </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>ʩ���ɱ�����ϵ��</td>
              <td><input type="text" name="sgcbbjxs" size="20" maxlength="8" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�ͻ�����ϵ��</td>
              <td><input type="text" name="khbjxs" size="20" maxlength="8" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                    <BR>
                  <input type="button" onClick="f_do(insertform)"  value="����">
                  <BR>
                <BR></td>
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

	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjcbjxs)=="") {
		alert("������[���̻�������ϵ��]��");
		FormName.gcjcbjxs.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjcbjxs, "���̻�������ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbbjxs)=="") {
		alert("������[ʩ���ɱ�����ϵ��]��");
		FormName.sgcbbjxs.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbbjxs, "ʩ���ɱ�����ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.khbjxs)=="") {
		alert("������[�ͻ�����ϵ��]��");
		FormName.khbjxs.focus();
		return false;
	}
	if(!(isFloat(FormName.khbjxs, "�ͻ�����ϵ��"))) {
		return false;
	}

	FormName.action="SaveSetXs.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
