<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String count=cf.executeQuery("select count(*) from bj_jzglfxb where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'");
%>

<body bgcolor="#FFFFFF">
<CENTER><B>���빤�Ϸ���</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ������EXECEL�ļ�</b></td>
      </tr>
      <tr align="center">
        <td width="48%" height="33" align="right">�������ݡ�<%=count%>������</td>
        <td width="52%" height="33" align="left"><input name="button" type="button" onClick="f_delete(loadform)"  value="ɾ�����Ϸ���"></td>
      </tr>
      <tr align="center">
        <td height="33" align="right">���۰汾��</td>
        <td height="33" align="left"><input type="text" name="bjbbh" value="<%=bjbbh%>" size="40" maxlength="50" readonly>        </td>
      </tr>
      <tr align="center">
        <td height="33" align="right">���ۼ���</td>
        <td height="33" align="left"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'","");
%>
          </select>        </td>
      </tr>
      <tr align="center">
        <td height="34" align="right">������</td>
        <td height="34" align="left"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%>
          </select>        </td>
      </tr>
      
      <tr align="center"> 
        <td colspan="2" height="2"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="����" onClick="f_onclick(loadform)">
          </p>        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_delete(FormName)
{

	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	if (!confirm("ע�⣺ɾ���󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	FormName.target="_blank";
	FormName.action="deleteGlfx.jsp";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.loadName)=="") {
		alert("��ѡ��[�����ļ�]��");
		FormName.loadName.focus();
		return false;
	}

	FormName.target="";
	FormName.action="DisGlfx.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>