<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴�����Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String cpjjbh=request.getParameter("cpjjbh");
String cktp=cf.executeQuery("select cktp from jc_cpjjbj where cpjjbh='"+cpjjbh+"'");
String cptp=cf.executeQuery("select cptp from jc_cpjjbj where cpjjbh='"+cpjjbh+"'");

String[] filename=request.getParameterValues("filename");//���ݵ�ɾ���ļ���
String ls=getServletContext().getRealPath("")+"/jcjj/jjbj/cpjjbj/images";


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;
if ((dir.isDirectory())&&(filename!=null))//ִ��ɾ������
{
	for (int i=0;i<filename.length ;i++ )
	{
		lsFile=new java.io.File(ls+"/"+filename[i]);
		if (lsFile.delete())
		{
			out.println("�ɹ�ɾ��ͼƬ��"+filename[i]);
		}
		else{
			out.println("<BR>ɾ��ͼƬʧ�ܣ�"+filename[i]);
		}
	}
}
%>
<body bgcolor="#FFFFFF">
<CENTER><B>��Ʒ�Ҿ߱�ţ�<%=cpjjbh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="cpjjbh" value="<%=cpjjbh%>" >
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
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> 
		<div align="center"><input name="filename" type=checkbox value="<%=cktp.toUpperCase()%>"></div>
	  </td>
	  <td width="25%"> 
		<div align="center"><%=cktp.toUpperCase()%></div>
	  </td>
	  <td width="60%"> 
		<div align="center"><img src="/jcjj/jjbj/cpjjbj/images/<%=cktp.toUpperCase() %>"></div>
	  </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> 
		<div align="center"><input name="filename" type=checkbox value="<%=cptp.toUpperCase()%>"></div>
	  </td>
	  <td width="25%"> 
		<div align="center"><%=cptp.toUpperCase()%></div>
	  </td>
	  <td width="60%"> 
		<div align="center"><img src="/jcjj/jjbj/cpjjbj/images/<%=cptp.toUpperCase() %>"></div>
	  </td>
	</tr>

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