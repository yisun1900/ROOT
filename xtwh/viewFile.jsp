<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴�ļ���Ŀ¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String path2=cf.GB2Uni(request.getParameter("path2"));

String[] filename=null;//���ݵ�ɾ���ļ���

java.io.File dir=new java.io.File(path2);
java.io.File lsFile=null;
%>

<body bgcolor="#FFFFFF">
<CENTER><B>�ļ���Ŀ¼��<%=path2%></B><BR><HR>
<%
String type=null;
long cd=0;
long sj=0;

if (dir.isDirectory())
{
%>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
      <td width="39%"> 
        <div align="center"><font color="#000099">����</font></div>
      </td>
      <td width="17%"> 
        <div align="center"><font color="#000099">����</font></div>
      </td>
      <td width="20%">��С</td>
      <td width="24%">�޸�ʱ��</td>
    </tr>

<%	
	filename=dir.list();
	for (int i=0;i<filename.length ;i++ )
	{
		lsFile=new java.io.File(path2+"\\"+filename[i]);
		cd=lsFile.length();
		sj=lsFile.lastModified();
		if (lsFile.isFile())
		{
			type="�ļ�";
		}
		else if (lsFile.isDirectory())
		{
			type="Ŀ¼";
		}
		
		%> 
    <tr bgcolor="#FFFFFF" align="center"> 
      <td width="39%"> 
        <div align="center"><%=filename[i]%></div>
      </td>
      <td width="17%"> 
        <div align="center"><%=type%></div>
      </td>
      <td width="20%"><%=cd%></td>
      <td width="24%"><%=new java.sql.Date(sj)%>&nbsp;&nbsp;<%=new java.sql.Time(sj)%></td>
    </tr>
    <%
	}
%>
  
  </table>
<%
}
else{
	byte[] b=new byte[1024];
	int len=0;
	java.io.FileInputStream fi=new java.io.FileInputStream(dir);

	while ((len=fi.read(b))>0)
	{
		out.print(new String(b,0,len));
	}
}
%> 
</CENTER>
</body>
</html>

