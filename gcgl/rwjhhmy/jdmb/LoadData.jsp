<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String mbbm=request.getParameter("mbbm");
String count=cf.executeQuery("select count(*) from gdm_mbsjjd where mbbm='"+mbbm+"'");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>ģ��ʱ��ڵ�</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ������EXECEL�ļ�</b></td>
      </tr>
      <tr align="center">
        <td height="33" align="right">��ģ���Ѵ��ڡ�<%=count%>������</td>
        <td height="33" align="left"><input type="button" onClick="f_delete(loadform)"  value="ɾ��"></td>
      </tr>
      <tr align="center"> 
        <td width="48%" height="33" align="right">ģ��</td>
        <td width="52%" height="33" align="left">
          <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
	cf.selectItem(out,"select mbbm,mbmc from gdm_sgjdmb where mbbm='"+mbbm+"'",mbbm);
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
	if(	javaTrim(FormName.mbbm)=="") {
		alert("��ѡ��[ģ��]��");
		FormName.mbbm.focus();
		return false;
	}

	if (!confirm("ע�⣺ɾ���󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	FormName.target="_blank";
	FormName.action="deleteBjxm.jsp";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	if(	javaTrim(FormName.mbbm)=="") {
		alert("��ѡ��[ģ��]��");
		FormName.mbbm.focus();
		return false;
	}

	if(	javaTrim(FormName.loadName)=="") {
		alert("��ѡ��[�����ļ�]��");
		FormName.loadName.focus();
		return false;
	}

	FormName.target="";
	FormName.action="DisData.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>