<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=request.getParameter("dqbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String count=cf.executeQuery("select count(*) from bj_tcjgb where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>�����ײͼ۸�</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ������EXECEL�ļ�</b></td>
      </tr>
      <tr align="center">
        <td height="33" align="right">�ü��𱨼���Ŀ�Ѵ��ڡ�<%=count%>������</td>
        <td height="33" align="left"><input name="button" type="button" onClick="f_delete(loadform)"  value="ɾ��������Ŀ"></td>
      </tr>
      <tr align="center"> 
        <td width="48%" height="33" align="right">���۰汾��</td>
        <td width="52%" height="33" align="left">
		  <input type="text" name="bjbbh" value="<%=bjbbh%>" size="40" maxlength="50" readonly>
		</td>
      </tr>
      <tr align="center"> 
        <td height="34" align="right" width="48%">������</td>
        <td height="34" align="left" width="52%"> 
          <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
	FormName.action="deleteBjxmTc.jsp";
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
	FormName.action="DisDataTc.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>