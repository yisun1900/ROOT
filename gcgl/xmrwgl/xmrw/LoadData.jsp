<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");
String count=cf.executeQuery("select count(*) from crm_xmrwgl where khbh='"+khbh+"'");
String jjrksg=cf.executeQuery("select jjrksg from crm_khxx where khbh='"+khbh+"'");
if (jjrksg==null)
{
	jjrksg="1";//1���ڡ����ղ���ʩ����2�����ղ���ʩ���� 9��������
}
%>


<body bgcolor="#FFFFFF">
<CENTER><B>������Ŀ�ƻ����ͻ���ţ�<%=khbh%>��</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" >
			<A HREF="CSH15-������Ŀ�ƻ�.xls"><B>���ء���׼��ģ��</B></A>
			<BR>
			<BR>
			<A HREF="boloni���ȵ���ģ��.xls"><B>���ء�boloni��ģ��</B></A>
			<BR>
			<BR>
			<A HREF="����ս��ȵ���ģ��.xls"><B>���ء�����ա�ģ��</B></A>
			<BR>
			<BR> 
			<b>��ѡ������EXECEL�ļ�</b>
			<BR>
			<BR> 
		
		</td>
      </tr>
      <tr align="center">
        <td width="48%" height="33" align="right">��ѡ������<%=count%>������</td>
        <td width="52%" height="33" align="left"><input name="button" type="button" onClick="f_delete(loadform)"  value="ɾ��"></td>
      </tr>
      <tr align="center">
        <td height="33" align="right"><span class="STYLE1">*</span>ѡ��ڼ��տ�ʩ��</td>
        <td height="33" align="left">
          <INPUT type="radio" name="jjrksg" value="1" <%if (jjrksg.equals("1")) out.println("CHECKED");%> >
          �ڡ����ղ���ʩ��
		  <BR>
          <INPUT type="radio" name="jjrksg" value="2" <%if (jjrksg.equals("2")) out.println("CHECKED");%>  >
          ���ղ���ʩ��
 		  <BR>
         <INPUT type="radio" name="jjrksg" value="9" <%if (jjrksg.equals("9")) out.println("CHECKED");%> >
          ������</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="71"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
		<input type="hidden" name="khbh" value="<%=khbh%>">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("��ѡ��[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}


	if (!confirm("ע�⣺ɾ���󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	FormName.target="_blank";
	FormName.action="deleteXm.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("��ѡ��[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjrksg)) {
		alert("��ѡ��[�ڼ��տ�ʩ��]��");
		FormName.jjrksg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.loadName)=="") {
		alert("��ѡ��[����EXECEL�ļ�]��");
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