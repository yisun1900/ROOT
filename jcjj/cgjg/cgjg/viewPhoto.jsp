<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴�����Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String cgbm=request.getParameter("cgbm");
String zp=request.getParameter("zp");
String[] filename=request.getParameterValues("filename");//���ݵ�ɾ���ļ���
String ls=getServletContext().getRealPath("")+"/jcjj/cgjg/cgjg/images";
if (zp.indexOf(".")==-1)
{
	out.println("��Ƭ�������벻��ȷ��ȱ���ļ���׹!");
	return;
}

java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;
if ((dir.isDirectory())&&(filename!=null))//ִ��ɾ������
{
	for (int i=0;i<filename.length ;i++ )
	{
//		out.println("filename="+ls+"\\"+filename[i]);
		lsFile=new java.io.File(ls+"/"+filename[i]);
		if (lsFile.delete())
		{
			out.println("�ɹ�ɾ��ͼƬ��"+filename[i]);
		}
		else{
			out.println("<BR>����ɾ��ͼƬ��"+filename[i]);
		}
	}
}
%>
<body bgcolor="#FFFFFF">
<CENTER><B>������룺<%=cgbm%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="cgbm" value="<%=cgbm%>" >
<input type="hidden" name="zp" value="<%=zp%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
  <td width="15%"> 
	<div align="center"><font color="#000099">ѡ���ļ�</font></div>
  </td>
  <td width="25%"> 
	<div align="center"><font color="#000099">�ļ�����</font></div>
  </td>
  <td width="60%"> 
	<div align="center"><font color="#000099">��Ƭ</font></div>
  </td>
</tr>
<%
if (dir.isDirectory())
{
	filename=dir.list();
	for (int i=0;i<filename.length ;i++ )
	{
		if (filename[i].equals(zp.toUpperCase()))
		{
%>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> 
		<div align="center"><input name="filename" type=checkbox value="<%=filename[i]%>"></div>
	  </td>
	  <td width="25%"> 
		<div align="center"><%=filename[i]%></div>
	  </td>
	  <td width="60%"> 
		<div align="center"><img src="/jcjj/cgjg/cgjg/images/<%=filename[i].toUpperCase() %>"></div>
	  </td>
	</tr>
<%
		}
	}
}
else{
	out.println(dir+"����Ŀ¼");
}
%>
	<tr bgcolor="#FFFFFF">
	<td colspan="3" height="2"> 
	<input type=button value='ɾ��ѡ�е���Ϣ' onclick="f_onclick(editform)">
	</td>
	</tr>
</table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if ( confirm("ȷʵҪ������?") )	{
		FormName.submit();
		return true;
	}
} 
//-->
</script>