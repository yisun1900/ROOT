<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�鿴��Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ygbh=request.getParameter("ygbh");
String[] filename=request.getParameterValues("filename");//���ݵ�ɾ���ļ���
String ls=getServletContext().getRealPath("")+"/rs/yghmcgl/images";

java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

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
				out.println("<BR>����ɾ��ͼƬ����ͼƬ�����ڣ�"+filename[i]);
			}
		}
	}
%>
<body bgcolor="#FFFFFF">
<CENTER><B>Ա����ţ�<%=ygbh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="ygbh" value="<%=ygbh%>" >
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

	String bianhao=null;
	ls_sql="SELECT bianhao";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bianhao=rs.getString(1);

		%>
			<tr bgcolor="#FFFFFF"> 
			  <td width="15%"> 
				<div align="center"><input name="filename" type=checkbox value="<%=bianhao%>.JPG"></div>
			  </td>
			  <td width="25%"> 
				<div align="center"><%=bianhao%>.JPG</div>
			  </td>
			  <td width="60%"> 
				<div align="center"><img src="/rs/yghmcgl/images/<%=bianhao%>.JPG"></div>
			  </td>
			</tr>
		<%
	}
	rs.close();
	ps.close();
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

<%
}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>

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